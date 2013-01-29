From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] arm: exynos5: Enable PM generic domain support in
 Kconfig
Date: Mon, 28 Jan 2013 21:22:29 -0800
Message-ID: <05b901cdfde0$a373a860$ea5af920$@samsung.com>
References: <1357733733-18769-1-git-send-email-prasanna.ps@samsung.com>
 <1357733733-18769-2-git-send-email-prasanna.ps@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47143 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752023Ab3A2FWf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 00:22:35 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHD00628G9FJNM0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jan 2013 14:22:34 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHD00448G9KAS30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jan 2013 14:22:34 +0900 (KST)
In-reply-to: <1357733733-18769-2-git-send-email-prasanna.ps@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Prasanna Kumar' <prasanna.ps@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Prasanna Kumar wrote:
> 
> This patch adds support to enable PM generic domains
> under Exynos5 family
> 
> Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-
> exynos/Kconfig
> index e103c29..871be97 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -63,6 +63,7 @@ config SOC_EXYNOS5250
>  	depends on ARCH_EXYNOS5
>  	select S5P_PM if PM
>  	select S5P_SLEEP if PM
> +	select PM_GENERIC_DOMAINS if PM
>  	select S5P_DEV_MFC
>  	select SAMSUNG_DMADEV
>  	help
> --
> 1.7.5.4

Firstly, this patch can be squashed into 2nd one.
Secondly, please put the statements alphanumerically.
Finally, please use the same format for subject like following:
"ARM: EXYNOS: ..."

Thanks.

- Kukjin
