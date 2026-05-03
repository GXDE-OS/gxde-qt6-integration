/*
 * Copyright (C) 2016 ~ 2018 Deepin Technology Co., Ltd.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "dstyleplugin.h"
#include "style.h"

DStylePlugin::DStylePlugin(QObject *parent) :
    QStylePlugin(parent)
{
}

QStyle *DStylePlugin::create(const QString &key)
{
    // Qt6 build registers "ddark2"/"dlight2"/... so the keys don't
    // collide with the system chameleon plugin (claims "chameleon")
    // nor the Qt5 dstyleplugin-gxde (claims "ddark"/"dlight").
    if (key == "ddark2") {
        return new dstyle::Style(dstyle::StyleDark);
    } else if (key == "dlight2") {
        return new dstyle::Style(dstyle::StyleLight);
    } else if (key == "dsemidark2") {
        return new dstyle::Style(dstyle::StyleSemiDark);
    } else if (key == "dsemilight2") {
        return new dstyle::Style(dstyle::StyleSemiLight);
    }

    return nullptr;
}

#if QT_VERSION < 0x050000
Q_EXPORT_PLUGIN2(DStylePlugin, DStylePlugin)
#endif // QT_VERSION < 0x050000
