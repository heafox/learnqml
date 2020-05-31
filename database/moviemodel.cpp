#include "moviemodel.h"
#include <QSqlQuery>
#include <QVariant>

MovieModel::MovieModel(QObject *parent)
    : QObject(parent)
{

}

void MovieModel::create()
{
    QSqlQuery q;
    q.exec("drop table Movies");
    q.exec("drop table Names");
    q.exec("create table Movies (id integer primary key, Title varchar, Director varchar, Rating number)");
    insert(0, "Metropolis", "Fritz Lang", 8.4);
    insert(1, "Nosferatu, eine Symphonie des Grauens", "F.W. Murnau", 8.1);
    insert(2, "Bis ans Ende der Welt", "Wim Wenders", 6.5);
    insert(3, "Hardware", "Richard Stanley", 5.2);
    insert(4, "Mitchell", "Andrew V. McLaglen", 2.1);
}

bool MovieModel::insert(int id, const QString &title, const QString &director, double rating)
{
    QSqlQuery q;
    q.prepare("insert into Movies values (?, ?, ?, ?)");
    q.bindValue(0, id);
    q.bindValue(1, title);
    q.bindValue(2, director);
    q.bindValue(3, rating);
    return q.exec();
}

QJsonArray MovieModel::get()
{
    QSqlQuery q;

    // SELECT 列名称 FROM 表名称
    q.prepare("select * from Movies");

    QJsonArray array;

    if (!q.exec())
        return array;

    while (q.next()) {
        QJsonObject o;
        o["id"] = q.value(0).toInt();
        o["title"] = q.value(1).toString();
        o["director"] = q.value(2).toString();
        o["rating"] = q.value(3).toDouble();
        array.append(o);
    }

    return array;
}

QJsonObject MovieModel::get(int id)
{
    QSqlQuery q;
    q.prepare("select * from Movies where id = ?");
    q.bindValue(0, id);

    QJsonObject o;

    if (!q.exec())
        return o;

    while (q.next()) {
        o["id"] = q.value(0).toInt();
        o["title"] = q.value(1).toString();
        o["director"] = q.value(2).toString();
        o["rating"] = q.value(3).toDouble();
    }

    return o;
}

bool MovieModel::remove(int id)
{
    QSqlQuery q;

    // DELETE FROM 表名称 WHERE 列名称 = 值
    q.prepare("delete from Movies where id = ?");
    q.bindValue(0, id);

    return q.exec();
}

bool MovieModel::updateTitle(int id, const QString &title)
{
    QSqlQuery q;

    // UPDATE 表名称 SET 列名称 = 新值 WHERE 列名称 = 某值
    q.prepare("UPDATE Movies SET Title = ? where id = ?");
    q.bindValue(0, title);
    q.bindValue(1, id);

    return q.exec();
}
