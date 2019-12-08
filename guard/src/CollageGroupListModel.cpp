#include "CollageGroupListModel.h"
#include <QDebug>

CollageGroupListModel::CollageGroupListModel(QObject *parent)
    : QAbstractListModel(parent)
{
    m_roles.insert(IdRole, "id");
    m_roles.insert(NameRole, "name");
    m_roles.insert(TypeRole, "type");
    m_roles.insert(PhysicalColumnsRole, "physicalColumns");
    m_roles.insert(PhysicalRowsRole, "physicalRows");
    m_roles.insert(LogicalColumnsRole, "logicalColumns");
    m_roles.insert(LogicalRowsRole, "logicalRows");
    m_roles.insert(EdgeColumnSpacingRole, "edgeColumnSpacing");
    m_roles.insert(EdgeRowSpacingRole, "edgeRowSpacing");
    m_roles.insert(ScreenParameterIdRole, "screenParameterId");
}

QVariant CollageGroupListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    switch (role) {
    default:
        break;
    case IdRole:
        return m_contents[index.row()].id();
    case NameRole:
        return m_contents[index.row()].name();
    case TypeRole:
        return m_contents[index.row()].type();
    case PhysicalColumnsRole:
        return m_contents[index.row()].physicalColumns();
    case PhysicalRowsRole:
        return m_contents[index.row()].physicalRows();
    case LogicalColumnsRole:
        return m_contents[index.row()].logicalColumns();
    case LogicalRowsRole:
        return m_contents[index.row()].logicalRows();
    case EdgeColumnSpacingRole:
        return m_contents[index.row()].edgeColumnSpacing();
    case EdgeRowSpacingRole:
        return m_contents[index.row()].edgeRowSpacing();
    case ScreenParameterIdRole:
        return m_contents[index.row()].screenParameterId();
    }

    return QVariant();
}

bool CollageGroupListModel::setData(const QModelIndex &index, const QVariant &value,
                                int role)
{
    if (!index.isValid() || !value.isValid())
        return false;
    if (0 > index.row() || index.row() >= m_contents.length())
        return false;
    if (data(index, role) == value)
        return false;

    switch (role) {
    default:
        break;
    case IdRole:
        m_contents[index.row()].setId(value.toInt());
        break;
    case NameRole:
        m_contents[index.row()].setName(value.toString());
        break;
    case TypeRole:
        m_contents[index.row()].setType(static_cast<CollageGroup::Types>(value.toInt()));
        break;
    case PhysicalColumnsRole:
        m_contents[index.row()].setPhysicalColumns(value.toInt());
        break;
    case PhysicalRowsRole:
        m_contents[index.row()].setPhysicalRows(value.toInt());
        break;
    case LogicalColumnsRole:
        m_contents[index.row()].setLogicalColumns(value.toInt());
        break;
    case LogicalRowsRole:
        m_contents[index.row()].setLogicalRows(value.toInt());
        break;
    case EdgeColumnSpacingRole:
        m_contents[index.row()].setEdgeColumnSpacing(value.toInt());
        break;
    case EdgeRowSpacingRole:
        m_contents[index.row()].setEdgeRowSpacing(value.toInt());
        break;
    case ScreenParameterIdRole:
        m_contents[index.row()].setScreenParameterId(value.toInt());
        break;
    }

    emit dataChanged(index, index, QVector<int>() << role);
    emit modified(m_contents[index.row()].id(), role, value);

    return true;
}

Qt::ItemFlags CollageGroupListModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable;
}

void CollageGroupListModel::setContents(const CollageGroupList &list)
{
    beginResetModel();

    m_contents = list;

    emit rowCountChanged(m_contents.count());

    endResetModel();
}

int CollageGroupListModel::indexRow(int id) const
{
    for (int i = 0; i < m_contents.count(); i++)
    {
        if (id == m_contents[i].id())
            return i;
    }

    return -1;
}

void CollageGroupListModel::insert(int i, const CollageGroup &model)
{
    Q_ASSERT(0 <= i && i <= m_contents.count());

    beginInsertRows(QModelIndex(), i, i);

    m_contents.insert(i, model);

    emit rowCountChanged(m_contents.count());
    emit inserted(i, model);

    endInsertRows();
}

void CollageGroupListModel::insert(int i, const QJsonObject &dict)
{
    insert(i, CollageGroup(dict));
}

void CollageGroupListModel::remove(int i, int count)
{
    if (i < 0 || i >= m_contents.count())
        return ;
    if (i + count - 1 >= m_contents.count())
        return ;

    beginRemoveRows(QModelIndex(), i, i + count - 1);

    while (--count >= 0) {
        auto model = m_contents.takeAt(i);

        emit removed(model.id());
    }

    emit rowCountChanged(m_contents.count());

    endRemoveRows();
}

void CollageGroupListModel::clear()
{
    beginResetModel();

    m_contents.clear();

    emit rowCountChanged(m_contents.count());

    endResetModel();
}
