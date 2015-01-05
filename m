From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH RESEND] ARM: exynos_defconfig: Enable options for display
 panel support
Date: Mon, 05 Jan 2015 09:48:11 +0100
Message-ID: <1420447691.3918.2.camel@AMDC1943>
References: <1420215089-2093-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:31520 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753283AbbAEIsU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Jan 2015 03:48:20 -0500
In-reply-to: <1420215089-2093-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Kevin Hilman <khilman@linaro.org>, Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, Vivek Gautam <gautam.vivek@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On pi=C4=85, 2015-01-02 at 17:11 +0100, Javier Martinez Canillas wrote:
> Many Exynos devices have a display panel. Most of them just have
> a simple panel while others have more complex configurations that
> requires an embedded DisplayPort (eDP) to LVDS bridges.
>=20
> This patch enables the following features to be built in the kernel
> image to support both setups:
>=20
> - Direct Rendering Manager (DRM)
> - DRM bridge registration and lookup framework
> - Parade ps8622/ps8625 eDP/LVDS bridge
> - NXP ptn3460 eDP/LVDS bridge
> - Exynos Fully Interactive Mobile Display controller (FIMD)
> - Panel registration and lookup framework
> - Simple panels
> - Backlight & LCD device support
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> Tested-by: Kevin Hilman <khilman@linaro.org>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>=20
> Hello Kukjin,
>=20
> You dropped this patch since exynos drm was causing boot hangs on som=
e
> platforms but the fix for that issue is already in linux-next (commit=
:
> f1e9203 clk: samsung: Fix Exynos 5420 pinctrl setup and clock disable
> failure due to domain being gated) so I think it makes sense to enabl=
e
> the display options again.

I think these issues were unrelated to each other. DRM was disabled
because of infinite deferred probing of DRM components. I saw Inki was
sending some patches for it but I am not sure if they were merged.

Best regards,
Krzysztof


>=20
> NOTE: Display panel is still not working since patch "arm: dts: Exyno=
s5:
> Use pmu_system_controller phandle for dp phy" is needed [0] but I thi=
nk
> we should enable display options to catch the regressions easier.
>=20
> Best regards,
> Javier
>=20
> [0]: https://lkml.org/lkml/2014/11/24/10
>=20
>  arch/arm/configs/exynos_defconfig | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exy=
nos_defconfig
> index 22beed3..27cdd52 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -111,11 +111,26 @@ CONFIG_REGULATOR_S2MPA01=3Dy
>  CONFIG_REGULATOR_S2MPS11=3Dy
>  CONFIG_REGULATOR_S5M8767=3Dy
>  CONFIG_REGULATOR_TPS65090=3Dy
> +CONFIG_DRM=3Dy
> +CONFIG_DRM_BRIDGE=3Dy
> +CONFIG_DRM_PTN3460=3Dy
> +CONFIG_DRM_PS8622=3Dy
> +CONFIG_DRM_EXYNOS=3Dy
> +CONFIG_DRM_EXYNOS_FIMD=3Dy
> +CONFIG_DRM_EXYNOS_DP=3Dy
> +CONFIG_DRM_PANEL=3Dy
> +CONFIG_DRM_PANEL_SIMPLE=3Dy
>  CONFIG_FB=3Dy
>  CONFIG_FB_MODE_HELPERS=3Dy
>  CONFIG_FB_SIMPLE=3Dy
>  CONFIG_EXYNOS_VIDEO=3Dy
>  CONFIG_EXYNOS_MIPI_DSI=3Dy
> +CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> +CONFIG_LCD_CLASS_DEVICE=3Dy
> +CONFIG_LCD_PLATFORM=3Dy
> +CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> +CONFIG_BACKLIGHT_GENERIC=3Dy
> +CONFIG_BACKLIGHT_PWM=3Dy
>  CONFIG_FRAMEBUFFER_CONSOLE=3Dy
>  CONFIG_FONTS=3Dy
>  CONFIG_FONT_7x14=3Dy
