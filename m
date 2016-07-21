From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable bus frequency scaling with
 DEVFREQ/DEVFREQ-Event
Date: Thu, 21 Jul 2016 17:34:03 +0900
Message-ID: <579088FB.2000101@samsung.com>
References: <CGME20160715013357epcas1p1f7e365ac861b48a56c029e67b9461d60@epcas1p1.samsung.com>
 <1468546426-4482-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40901 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751204AbcGUIeH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 04:34:07 -0400
In-reply-to: <1468546426-4482-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: k.kozlowski@samsung.com
Cc: linux@armlinux.org.uk, kgene@kernel.org, javier@osg.samsung.com, linux.amoon@gmail.com, treding@nvidia.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Krzysztof,

Could you please pick this patch?

Regards,
Chanwoo Choi

On 2016=EB=85=84 07=EC=9B=94 15=EC=9D=BC 10:33, Chanwoo Choi wrote:
> This patch enables the bus frequency scaling driver with DEVFREQ and
> DEVFREQ-Event framework. This patches already was merged for Odroid-U=
3/XU3
> ,Trats2 and Rinato/Monk boards.
>=20
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exy=
nos_defconfig
> index a5aa44c56bfe..37052b115a40 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -219,6 +219,16 @@ CONFIG_CROS_EC_CHARDEV=3Dy
>  CONFIG_COMMON_CLK_MAX77686=3Dy
>  CONFIG_COMMON_CLK_MAX77802=3Dy
>  CONFIG_COMMON_CLK_S2MPS11=3Dy
> +CONFIG_PM_DEVFREQ=3Dy
> +CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> +CONFIG_DEVFREQ_GOV_PERFORMANCE=3Dy
> +CONFIG_DEVFREQ_GOV_POWERSAVE=3Dy
> +CONFIG_DEVFREQ_GOV_USERSPACE=3Dy
> +CONFIG_DEVFREQ_GOV_PASSIVE=3Dy
> +CONFIG_ARM_EXYNOS_BUS_DEVFREQ=3Dy
> +CONFIG_PM_DEVFREQ_EVENT=3Dy
> +CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=3Dy
> +CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=3Dy
>  CONFIG_EXTCON=3Dy
>  CONFIG_EXTCON_MAX14577=3Dy
>  CONFIG_EXTCON_MAX77693=3Dy
>=20
