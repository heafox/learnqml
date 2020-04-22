#include "palette.h"
#include <QRgb>

static const QRgb colors[][14] = {
    // Red
    {
        0xFFFFEBEE, // Shade50
        0xFFFFCDD2, // Shade100
        0xFFEF9A9A, // Shade200
        0xFFE57373, // Shade300
        0xFFEF5350, // Shade400
        0xFFF44336, // Shade500
        0xFFE53935, // Shade600
        0xFFD32F2F, // Shade700
        0xFFC62828, // Shade800
        0xFFB71C1C, // Shade900
        0xFFFF8A80, // ShadeA100
        0xFFFF5252, // ShadeA200
        0xFFFF1744, // ShadeA400
        0xFFD50000  // ShadeA700
    },
    // Pink
    {
        0xFFFCE4EC, // Shade50
        0xFFF8BBD0, // Shade100
        0xFFF48FB1, // Shade200
        0xFFF06292, // Shade300
        0xFFEC407A, // Shade400
        0xFFE91E63, // Shade500
        0xFFD81B60, // Shade600
        0xFFC2185B, // Shade700
        0xFFAD1457, // Shade800
        0xFF880E4F, // Shade900
        0xFFFF80AB, // ShadeA100
        0xFFFF4081, // ShadeA200
        0xFFF50057, // ShadeA400
        0xFFC51162  // ShadeA700
    },
    // Purple
    {
        0xFFF3E5F5, // Shade50
        0xFFE1BEE7, // Shade100
        0xFFCE93D8, // Shade200
        0xFFBA68C8, // Shade300
        0xFFAB47BC, // Shade400
        0xFF9C27B0, // Shade500
        0xFF8E24AA, // Shade600
        0xFF7B1FA2, // Shade700
        0xFF6A1B9A, // Shade800
        0xFF4A148C, // Shade900
        0xFFEA80FC, // ShadeA100
        0xFFE040FB, // ShadeA200
        0xFFD500F9, // ShadeA400
        0xFFAA00FF  // ShadeA700
    },
    // DeepPurple
    {
        0xFFEDE7F6, // Shade50
        0xFFD1C4E9, // Shade100
        0xFFB39DDB, // Shade200
        0xFF9575CD, // Shade300
        0xFF7E57C2, // Shade400
        0xFF673AB7, // Shade500
        0xFF5E35B1, // Shade600
        0xFF512DA8, // Shade700
        0xFF4527A0, // Shade800
        0xFF311B92, // Shade900
        0xFFB388FF, // ShadeA100
        0xFF7C4DFF, // ShadeA200
        0xFF651FFF, // ShadeA400
        0xFF6200EA  // ShadeA700
    },
    // Indigo
    {
        0xFFE8EAF6, // Shade50
        0xFFC5CAE9, // Shade100
        0xFF9FA8DA, // Shade200
        0xFF7986CB, // Shade300
        0xFF5C6BC0, // Shade400
        0xFF3F51B5, // Shade500
        0xFF3949AB, // Shade600
        0xFF303F9F, // Shade700
        0xFF283593, // Shade800
        0xFF1A237E, // Shade900
        0xFF8C9EFF, // ShadeA100
        0xFF536DFE, // ShadeA200
        0xFF3D5AFE, // ShadeA400
        0xFF304FFE  // ShadeA700
    },
    // Blue
    {
        0xFFE3F2FD, // Shade50
        0xFFBBDEFB, // Shade100
        0xFF90CAF9, // Shade200
        0xFF64B5F6, // Shade300
        0xFF42A5F5, // Shade400
        0xFF2196F3, // Shade500
        0xFF1E88E5, // Shade600
        0xFF1976D2, // Shade700
        0xFF1565C0, // Shade800
        0xFF0D47A1, // Shade900
        0xFF82B1FF, // ShadeA100
        0xFF448AFF, // ShadeA200
        0xFF2979FF, // ShadeA400
        0xFF2962FF  // ShadeA700
    },
    // LightBlue
    {
        0xFFE1F5FE, // Shade50
        0xFFB3E5FC, // Shade100
        0xFF81D4FA, // Shade200
        0xFF4FC3F7, // Shade300
        0xFF29B6F6, // Shade400
        0xFF03A9F4, // Shade500
        0xFF039BE5, // Shade600
        0xFF0288D1, // Shade700
        0xFF0277BD, // Shade800
        0xFF01579B, // Shade900
        0xFF80D8FF, // ShadeA100
        0xFF40C4FF, // ShadeA200
        0xFF00B0FF, // ShadeA400
        0xFF0091EA  // ShadeA700
    },
    // Cyan
    {
        0xFFE0F7FA, // Shade50
        0xFFB2EBF2, // Shade100
        0xFF80DEEA, // Shade200
        0xFF4DD0E1, // Shade300
        0xFF26C6DA, // Shade400
        0xFF00BCD4, // Shade500
        0xFF00ACC1, // Shade600
        0xFF0097A7, // Shade700
        0xFF00838F, // Shade800
        0xFF006064, // Shade900
        0xFF84FFFF, // ShadeA100
        0xFF18FFFF, // ShadeA200
        0xFF00E5FF, // ShadeA400
        0xFF00B8D4  // ShadeA700
    },
    // Teal
    {
        0xFFE0F2F1, // Shade50
        0xFFB2DFDB, // Shade100
        0xFF80CBC4, // Shade200
        0xFF4DB6AC, // Shade300
        0xFF26A69A, // Shade400
        0xFF009688, // Shade500
        0xFF00897B, // Shade600
        0xFF00796B, // Shade700
        0xFF00695C, // Shade800
        0xFF004D40, // Shade900
        0xFFA7FFEB, // ShadeA100
        0xFF64FFDA, // ShadeA200
        0xFF1DE9B6, // ShadeA400
        0xFF00BFA5  // ShadeA700
    },
    // Green
    {
        0xFFE8F5E9, // Shade50
        0xFFC8E6C9, // Shade100
        0xFFA5D6A7, // Shade200
        0xFF81C784, // Shade300
        0xFF66BB6A, // Shade400
        0xFF4CAF50, // Shade500
        0xFF43A047, // Shade600
        0xFF388E3C, // Shade700
        0xFF2E7D32, // Shade800
        0xFF1B5E20, // Shade900
        0xFFB9F6CA, // ShadeA100
        0xFF69F0AE, // ShadeA200
        0xFF00E676, // ShadeA400
        0xFF00C853  // ShadeA700
    },
    // LightGreen
    {
        0xFFF1F8E9, // Shade50
        0xFFDCEDC8, // Shade100
        0xFFC5E1A5, // Shade200
        0xFFAED581, // Shade300
        0xFF9CCC65, // Shade400
        0xFF8BC34A, // Shade500
        0xFF7CB342, // Shade600
        0xFF689F38, // Shade700
        0xFF558B2F, // Shade800
        0xFF33691E, // Shade900
        0xFFCCFF90, // ShadeA100
        0xFFB2FF59, // ShadeA200
        0xFF76FF03, // ShadeA400
        0xFF64DD17  // ShadeA700
    },
    // Lime
    {
        0xFFF9FBE7, // Shade50
        0xFFF0F4C3, // Shade100
        0xFFE6EE9C, // Shade200
        0xFFDCE775, // Shade300
        0xFFD4E157, // Shade400
        0xFFCDDC39, // Shade500
        0xFFC0CA33, // Shade600
        0xFFAFB42B, // Shade700
        0xFF9E9D24, // Shade800
        0xFF827717, // Shade900
        0xFFF4FF81, // ShadeA100
        0xFFEEFF41, // ShadeA200
        0xFFC6FF00, // ShadeA400
        0xFFAEEA00  // ShadeA700
    },
    // Yellow
    {
        0xFFFFFDE7, // Shade50
        0xFFFFF9C4, // Shade100
        0xFFFFF59D, // Shade200
        0xFFFFF176, // Shade300
        0xFFFFEE58, // Shade400
        0xFFFFEB3B, // Shade500
        0xFFFDD835, // Shade600
        0xFFFBC02D, // Shade700
        0xFFF9A825, // Shade800
        0xFFF57F17, // Shade900
        0xFFFFFF8D, // ShadeA100
        0xFFFFFF00, // ShadeA200
        0xFFFFEA00, // ShadeA400
        0xFFFFD600  // ShadeA700
    },
    // Amber
    {
        0xFFFFF8E1, // Shade50
        0xFFFFECB3, // Shade100
        0xFFFFE082, // Shade200
        0xFFFFD54F, // Shade300
        0xFFFFCA28, // Shade400
        0xFFFFC107, // Shade500
        0xFFFFB300, // Shade600
        0xFFFFA000, // Shade700
        0xFFFF8F00, // Shade800
        0xFFFF6F00, // Shade900
        0xFFFFE57F, // ShadeA100
        0xFFFFD740, // ShadeA200
        0xFFFFC400, // ShadeA400
        0xFFFFAB00  // ShadeA700
    },
    // Orange
    {
        0xFFFFF3E0, // Shade50
        0xFFFFE0B2, // Shade100
        0xFFFFCC80, // Shade200
        0xFFFFB74D, // Shade300
        0xFFFFA726, // Shade400
        0xFFFF9800, // Shade500
        0xFFFB8C00, // Shade600
        0xFFF57C00, // Shade700
        0xFFEF6C00, // Shade800
        0xFFE65100, // Shade900
        0xFFFFD180, // ShadeA100
        0xFFFFAB40, // ShadeA200
        0xFFFF9100, // ShadeA400
        0xFFFF6D00  // ShadeA700
    },
    // DeepOrange
    {
        0xFFFBE9E7, // Shade50
        0xFFFFCCBC, // Shade100
        0xFFFFAB91, // Shade200
        0xFFFF8A65, // Shade300
        0xFFFF7043, // Shade400
        0xFFFF5722, // Shade500
        0xFFF4511E, // Shade600
        0xFFE64A19, // Shade700
        0xFFD84315, // Shade800
        0xFFBF360C, // Shade900
        0xFFFF9E80, // ShadeA100
        0xFFFF6E40, // ShadeA200
        0xFFFF3D00, // ShadeA400
        0xFFDD2C00  // ShadeA700
    },
    // Brown
    {
        0xFFEFEBE9, // Shade50
        0xFFD7CCC8, // Shade100
        0xFFBCAAA4, // Shade200
        0xFFA1887F, // Shade300
        0xFF8D6E63, // Shade400
        0xFF795548, // Shade500
        0xFF6D4C41, // Shade600
        0xFF5D4037, // Shade700
        0xFF4E342E, // Shade800
        0xFF3E2723, // Shade900
        0xFF000000, // ShadeA100
        0xFF000000, // ShadeA200
        0xFF000000, // ShadeA400
        0xFF000000  // ShadeA700
    },
    // Grey
    {
        0xFFFAFAFA, // Shade50
        0xFFF5F5F5, // Shade100
        0xFFEEEEEE, // Shade200
        0xFFE0E0E0, // Shade300
        0xFFBDBDBD, // Shade400
        0xFF9E9E9E, // Shade500
        0xFF757575, // Shade600
        0xFF616161, // Shade700
        0xFF424242, // Shade800
        0xFF212121, // Shade900
        0xFF000000, // ShadeA100
        0xFF000000, // ShadeA200
        0xFF000000, // ShadeA400
        0xFF000000  // ShadeA700
    },
    // BlueGrey
    {
        0xFFECEFF1, // Shade50
        0xFFCFD8DC, // Shade100
        0xFFB0BEC5, // Shade200
        0xFF90A4AE, // Shade300
        0xFF78909C, // Shade400
        0xFF607D8B, // Shade500
        0xFF546E7A, // Shade600
        0xFF455A64, // Shade700
        0xFF37474F, // Shade800
        0xFF263238, // Shade900
        0xFF000000, // ShadeA100
        0xFF000000, // ShadeA200
        0xFF000000, // ShadeA400
        0xFF000000  // ShadeA700
    }
};

Palette::Palette(QObject *parent)
    : QObject(parent)
{

}

QColor Palette::color(Palette::Color color, Palette::Shade shade)
{
    return QColor::fromRgba(colors[color][shade]);
}

QColor Palette::color(Palette::Color color, Palette::Shade shade, qreal opacity)
{
    QRgb a = static_cast<QRgb>(qBound(0.0, opacity, 1.0) * 255);
    return QColor::fromRgba(colors[color][shade] | (a << 24 | 0xFFFFFF));
}

QColor Palette::transparent(const QColor &color, qreal opacity) const
{
    return QColor(color.red(), color.green(), color.blue(),
                  static_cast<int>(qBound(0.0, opacity, 1.0) * 255));
}

QColor Palette::blend(const QColor &a, const QColor &b, qreal factor) const
{
    if (factor <= 0.0)
        return a;
    if (factor >= 1.0)
        return b;

    QColor color;
    color.setRedF(a.redF() * (1.0 - factor) + b.redF() * factor);
    color.setGreenF(a.greenF() * (1.0 - factor) + b.greenF() * factor);
    color.setBlueF(a.blueF() * (1.0 - factor) + b.blueF() * factor);
    return color;
}
