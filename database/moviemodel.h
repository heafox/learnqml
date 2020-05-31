#ifndef MOVIEMODEL_H
#define MOVIEMODEL_H

#include <QObject>
#include <QJsonObject>
#include <QJsonArray>

class MovieModel : public QObject
{
    Q_OBJECT
public:
    explicit MovieModel(QObject *parent = nullptr);

signals:

public slots:
    void create();

    bool insert(int id, const QString &title, const QString &director, double rating);

    QJsonArray get();

    QJsonObject get(int id);

    bool remove(int id);

    bool updateTitle(int id, const QString &title);
};

#endif // MOVIEMODEL_H
