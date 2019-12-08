#ifndef COLLAGEGROUPLISTMODEL_H
#define COLLAGEGROUPLISTMODEL_H

#include <QAbstractListModel>
#include "CollageGroup.h"

class CollageGroupListModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int count READ rowCount NOTIFY rowCountChanged)

public:
    enum Roles {
        IdRole = Qt::UserRole + 1,
        NameRole,
        TypeRole,
        PhysicalColumnsRole,
        PhysicalRowsRole,
        LogicalColumnsRole,
        LogicalRowsRole,
        EdgeColumnSpacingRole,
        EdgeRowSpacingRole,
        ScreenParameterIdRole
    };

    explicit CollageGroupListModel(QObject *parent = nullptr);

    inline QHash<int, QByteArray> roleNames() const override;
    inline int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

    void setContents(const CollageGroupList &list);
    inline const CollageGroupList &contents() const { return m_contents; }

    Q_INVOKABLE int indexRow(int id) const;
    Q_INVOKABLE void insert(int i, const CollageGroup &model);
    Q_INVOKABLE void insert(int i, const QJsonObject &dict);
    Q_INVOKABLE void remove(int i, int count = 1);
    Q_INVOKABLE void clear();

    Q_INVOKABLE inline const CollageGroup &get(int i) const;
    Q_INVOKABLE inline const CollageGroup &getById(int id) const;
    Q_INVOKABLE inline void append(const CollageGroup &model);
    Q_INVOKABLE inline void append(const QJsonObject &dict);
    Q_INVOKABLE inline bool setProperty(int i, const QString &property, const QVariant &value);
    Q_INVOKABLE inline QVariant getProperty(int i, const QString &property);

signals:
    void rowCountChanged(int count);
    void inserted(int i, const CollageGroup &model);
    void modified(int id, int role, const QVariant &value);
    void removed(int id);

private:
    QHash<int, QByteArray> m_roles;
    CollageGroupList m_contents;
};

QHash<int, QByteArray> CollageGroupListModel::roleNames() const
{
    return m_roles;
}

int CollageGroupListModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    return m_contents.count();
}

const CollageGroup &CollageGroupListModel::get(int i) const
{
    Q_ASSERT(0 <= i && i < m_contents.count());

    return m_contents[i];
}

const CollageGroup &CollageGroupListModel::getById(int id) const
{
    return get(indexRow(id));
}

void CollageGroupListModel::append(const CollageGroup &model)
{
    insert(m_contents.length(), model);
}

void CollageGroupListModel::append(const QJsonObject &dict)
{
    insert(m_contents.length(), dict);
}

bool CollageGroupListModel::setProperty(int i, const QString &property, const QVariant &value)
{
    return setData(index(i), value, m_roles.key(property.toUtf8()));
}

QVariant CollageGroupListModel::getProperty(int i, const QString &property)
{
    return data(index(i), m_roles.key(property.toUtf8()));
}

#endif // COLLAGEGROUPLISTMODEL_H
