#include "CollageGroup.h"

CollageGroup::CollageGroup()
{

}

CollageGroup::CollageGroup(const QJsonObject &dict)
{
    loadJsonObject(dict);
}

void CollageGroup::loadJsonObject(const QJsonObject &dict)
{
    m_id = dict["id"].toInt();
    m_name = dict["name"].toString();
    m_type = static_cast<Types>(dict["type"].toInt());
    m_physicalColumns = dict["physicalColumns"].toInt();
    m_physicalRows = dict["physicalRows"].toInt();
    m_logicalColumns = dict["logicalColumns"].toInt();
    m_logicalRows = dict["logicalRows"].toInt();
    m_edgeColumnSpacing = dict["edgeColumnSpacing"].toInt();
    m_edgeRowSpacing = dict["edgeRowSpacing"].toInt();
    m_screenParameterId = dict["screenParameterId"].toInt();
}

QJsonObject CollageGroup::toJsonObject() const
{
    QJsonObject obj;

    obj["id"] = m_id;
    obj["name"] = m_name;
    obj["type"] = m_type;
    obj["physicalColumns"] = m_physicalColumns;
    obj["physicalRows"] = m_physicalRows;
    obj["logicalColumns"] = m_logicalColumns;
    obj["logicalRows"] = m_logicalRows;
    obj["edgeColumnSpacing"] = m_edgeColumnSpacing;
    obj["edgeRowSpacing"] = m_edgeRowSpacing;
    obj["screenParameterId"] = m_screenParameterId;

    return obj;
}
