From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 1/1] ARM: exynos_defconfig: Enable options for display
 panel support
Date: Mon, 25 Aug 2014 13:49:56 +0200
Message-ID: <53FB22E4.8040906@suse.de>
References: <1408956336-17376-1-git-send-email-javier.martinez@collabora.co.uk> <5825205.70RuHaSG5p@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5825205.70RuHaSG5p@amdc1032>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Am 25.08.2014 13:43, schrieb Bartlomiej Zolnierkiewicz:
> On Monday, August 25, 2014 10:45:36 AM Javier Martinez Canillas wrote=
:
>> Many Exynos devices have a display panel. Most of them just have
>> a simple panel while others have more complex configurations that
>> requires an embedded DisplayPort (eDP) to LVDS bridges.
>>
>> This patch enables the following features to be built in the kernel
>> image to suport both setups:
>>
>> - Direct Rendering Manager (DRM)
>> - DRM bridge registration and lookup framework
>> - Parade ps8622/ps8625 eDP/LVDS bridge
>> - NXP ptn3460 eDP/LVDS bridge
>> - Exynos Fully Interactive Mobile Display controller (FIMD)
>> - Panel registration and lookup framework
>> - Simple panels
>> - Backlight & LCD device support
>>
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.c=
o.uk>
>> Tested-by: Kevin Hilman <khilman@linaro.org>
>=20
> Could you please also do corresponding update to multi_v7_defconfig?

As was mentioned in v1 (but now below), some of these options depend on
patches yet to be respun and be accepted into drm, so I would consider
this an RFC patch and suggest to wait with multi_v7.

It could of course be split, as CONFIG_DRM_EXYNOS* and backlight parts
are certainly okay.

Regards,
Andreas

>=20
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
>=20
>> ---
>>
>> Changes since v1:
>>  - Forgot to enable ptn3460 eDP/LVDS bridge config option
>>    which is used for some boards (e.g: Exynos5250 Snow).
>>
>>  arch/arm/configs/exynos_defconfig | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/ex=
ynos_defconfig
>> index 676c744..d6d1f7c 100644
>> --- a/arch/arm/configs/exynos_defconfig
>> +++ b/arch/arm/configs/exynos_defconfig
>> @@ -101,11 +101,26 @@ CONFIG_REGULATOR_S2MPA01=3Dy
>>  CONFIG_REGULATOR_S2MPS11=3Dy
>>  CONFIG_REGULATOR_S5M8767=3Dy
>>  CONFIG_REGULATOR_TPS65090=3Dy
>> +CONFIG_DRM=3Dy
>> +CONFIG_DRM_BRIDGE=3Dy
>> +CONFIG_DRM_PTN3460=3Dy
>> +CONFIG_DRM_PS8622=3Dy
>> +CONFIG_DRM_EXYNOS=3Dy
>> +CONFIG_DRM_EXYNOS_FIMD=3Dy
>> +CONFIG_DRM_EXYNOS_DP=3Dy
>> +CONFIG_DRM_PANEL=3Dy
>> +CONFIG_DRM_PANEL_SIMPLE=3Dy
>>  CONFIG_FB=3Dy
>>  CONFIG_FB_MODE_HELPERS=3Dy
>>  CONFIG_FB_SIMPLE=3Dy
>>  CONFIG_EXYNOS_VIDEO=3Dy
>>  CONFIG_EXYNOS_MIPI_DSI=3Dy
>> +CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
>> +CONFIG_LCD_CLASS_DEVICE=3Dy
>> +CONFIG_LCD_PLATFORM=3Dy
>> +CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
>> +CONFIG_BACKLIGHT_GENERIC=3Dy
>> +CONFIG_BACKLIGHT_PWM=3Dy
>>  CONFIG_FRAMEBUFFER_CONSOLE=3Dy
>>  CONFIG_FONTS=3Dy
>>  CONFIG_FONT_7x14=3Dy
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
