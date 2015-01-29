From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH 1/3] exynos: config: Remove CONFIG_EXYNOS_THERMAL_CORE
 define (exynos_defconfig)
Date: Thu, 29 Jan 2015 18:59:09 -0400
Message-ID: <20150129225908.GH29837@developer.amazonguestwifi.org>
References: <1422458920-14555-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:44116 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758799AbbA2W7O convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jan 2015 17:59:14 -0500
Content-Disposition: inline
In-Reply-To: <1422458920-14555-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Linux PM list <linux-pm@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lukasz Majewski <l.majewski@majess.pl>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Wed, Jan 28, 2015 at 04:28:38PM +0100, Lukasz Majewski wrote:
> After Exynos TMU rework to use device tree for configuration this flag
> can be removed. It is not used anymore.
> 
> Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>

I dont see problems with this patch:

Acked-by: Eduardo Valentin <edubezval@gmail.com>

This should go, obviously, via the correct platform tree.

> ---
>  arch/arm/configs/exynos_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 3d0c5d6..3691a68 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -88,7 +88,6 @@ CONFIG_HWMON=y
>  CONFIG_SENSORS_LM90=y
>  CONFIG_THERMAL=y
>  CONFIG_EXYNOS_THERMAL=y
> -CONFIG_EXYNOS_THERMAL_CORE=y
>  CONFIG_WATCHDOG=y
>  CONFIG_S3C2410_WATCHDOG=y
>  CONFIG_MFD_CROS_EC=y
> -- 
> 2.0.0.rc2
> 
