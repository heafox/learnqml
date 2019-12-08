#ifndef COLLAGEGROUP_H
#define COLLAGEGROUP_H

#include <QObject>
#include <QJsonObject>
#include <QList>
#include <QMap>

class CollageGroup
{
    Q_GADGET
    Q_PROPERTY(int id READ id WRITE setId)
    Q_PROPERTY(QString name READ name WRITE setName)
    Q_PROPERTY(Types type READ type WRITE setType)
    Q_PROPERTY(int physicalColumns READ physicalColumns WRITE setPhysicalColumns)
    Q_PROPERTY(int physicalRows READ physicalRows WRITE setPhysicalRows)
    Q_PROPERTY(int logicalColumns READ logicalColumns WRITE setLogicalColumns)
    Q_PROPERTY(int logicalRows READ logicalRows WRITE setLogicalRows)
    Q_PROPERTY(int edgeColumnSpacing READ edgeColumnSpacing WRITE setEdgeColumnSpacing)
    Q_PROPERTY(int edgeRowSpacing READ edgeRowSpacing WRITE setEdgeRowSpacing)
    Q_PROPERTY(int screenParameterId READ screenParameterId WRITE setScreenParameterId)

public:
    enum Types {
        UnknownType,
        LcdType,
        LedType
    };
    Q_ENUM(Types)

    CollageGroup();
    CollageGroup(const QJsonObject &dict);

    inline int id() const { return m_id; }
    inline QString name() const { return m_name; }
    inline Types type() const { return m_type; }
    inline int physicalColumns() const { return m_physicalColumns; }
    inline int physicalRows() const { return m_physicalRows; }
    inline int logicalColumns() const { return m_logicalColumns; }
    inline int logicalRows() const { return m_logicalRows; }
    inline int edgeColumnSpacing() const { return m_edgeColumnSpacing; }
    inline int edgeRowSpacing() const { return m_edgeRowSpacing; }
    inline int screenParameterId() const { return m_screenParameterId; }

    inline void setId(int id) { m_id = id; }
    inline void setName(const QString &name) { m_name = name; }
    inline void setType(Types type) { m_type = type; }
    inline void setPhysicalColumns(int columns) { m_physicalColumns = columns; }
    inline void setPhysicalRows(int rows) { m_physicalRows = rows; }
    inline void setLogicalColumns(int columns) { m_logicalColumns = columns; }
    inline void setLogicalRows(int rows) { m_logicalRows = rows; }
    inline void setEdgeColumnSpacing(int spacing) { m_edgeColumnSpacing = spacing; }
    inline void setEdgeRowSpacing(int spacing) { m_edgeRowSpacing = spacing; }
    inline void setScreenParameterId(int id) { m_screenParameterId = id; }

    void loadJsonObject(const QJsonObject &dict);
    QJsonObject toJsonObject() const;

private:
    int m_id = 0;
    QString m_name;
    Types m_type = UnknownType;
    int m_physicalColumns = 0;
    int m_physicalRows = 0;
    int m_logicalColumns = 0;
    int m_logicalRows = 0;
    int m_edgeColumnSpacing = 0;
    int m_edgeRowSpacing = 0;
    int m_screenParameterId = 0;
};

typedef QList<CollageGroup> CollageGroupList;
typedef QMap<int, CollageGroup> CollageGroupMap;

Q_DECLARE_METATYPE(CollageGroup)

#endif // COLLAGEGROUP_H
