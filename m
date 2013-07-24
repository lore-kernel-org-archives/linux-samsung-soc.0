From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: Add basic dts for Exynos4412-based Trats 2 board
Date: Wed, 24 Jul 2013 13:38:23 +0900
Message-ID: <0e0d01ce8827$a155f430$e401dc90$%kim@samsung.com>
References: <1371653357-1389-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45128 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750792Ab3GXEiY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 00:38:24 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF00CO9BJRXOF0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 13:38:23 +0900 (KST)
In-reply-to: <1371653357-1389-1-git-send-email-t.figa@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, 'Olof Johansson' <olof@lixom.net>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Arnd Bergmann' <arnd@arndb.de>, 'Kyungmin Park' <kyungmin.park@samsung.com>

Tomasz Figa wrote:
> 
> This patch introduces device tree sources for Samsung Trats 2 board
> based on Exynos4412 SoC.
> 
> Currently support includes:
>  - eMMC,
>  - main PMIC (max77686),
>  - serial ports,
>  - GPIO keys,
>  - touchscreen.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/boot/dts/Makefile              |   1 +
>  arch/arm/boot/dts/exynos4412-trats2.dts | 456
> ++++++++++++++++++++++++++++++++
>  2 files changed, 457 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos4412-trats2.dts
> 
Looks good to me, applied.

> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 1357510..8cdc7cc 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -53,6 +53,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
>  	exynos4412-odroidx.dtb \
>  	exynos4412-smdk4412.dtb \
>  	exynos4412-origen.dtb \
> +	exynos4412-trats2.dtb \
>  	exynos5250-arndale.dtb \
>  	exynos5440-sd5v1.dtb \
>  	exynos5250-smdk5250.dtb \

BTW, I put some dtbs in wrong order :( I need to sort out...

Thanks,
Kukjin
