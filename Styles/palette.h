#ifndef PALETTE_H
#define PALETTE_H

#include <QObject>
#include <QColor>

class Palette : public QObject
{
    Q_OBJECT

public:
    enum Color {
        Red,
        Pink,
        Purple,
        DeepPurple,
        Indigo,
        Blue,
        LightBlue,
        Cyan,
        Teal,
        Green,
        LightGreen,
        Lime,
        Yellow,
        Amber,
        Orange,
        DeepOrange,
        Brown,
        Grey,
        BlueGrey
    };

    enum Shade {
        Shade50,
        Shade100,
        Shade200,
        Shade300,
        Shade400,
        Shade500,
        Shade600,
        Shade700,
        Shade800,
        Shade900,
        ShadeA100,
        ShadeA200,
        ShadeA400,
        ShadeA700,
    };

    Q_ENUM(Color)
    Q_ENUM(Shade)

    explicit Palette(QObject *parent = nullptr);

    Q_INVOKABLE QColor color(Color color, Shade shade);
    Q_INVOKABLE QColor color(Color color, Shade shade, qreal opacity);

    Q_INVOKABLE QColor transparent(const QColor &color, qreal opacity) const;
    Q_INVOKABLE QColor blend(const QColor &a, const QColor &b, qreal factor) const;

signals:

public slots:
};

#endif // PALETTE_H
