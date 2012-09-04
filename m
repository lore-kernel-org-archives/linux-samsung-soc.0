From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: exynos: delete redundant HAVE_SCHED_CLOCK option
 in Kconfig
Date: Wed, 05 Sep 2012 07:10:00 +0900
Message-ID: <227101cd8aea$06a06e10$13e14a30$%kim@samsung.com>
References: <1346406296-16223-1-git-send-email-Barry.Song@csr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:9107 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757772Ab2IDWKB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Sep 2012 18:10:01 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9U00E5JIWOI3A0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Sep 2012 07:10:00 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9U00FN7IWO5Z50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Sep 2012 07:10:00 +0900 (KST)
In-reply-to: <1346406296-16223-1-git-send-email-Barry.Song@csr.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Barry Song' <Barry.Song@csr.com>, olof@lixom.net, arnd@arndb.de, rob.herring@calxeda.com
Cc: workgroup.linux@csr.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Barry Song' <Baohua.Song@csr.com>

Barry Song wrote:
> 
> From: Barry Song <Baohua.Song@csr.com>
> 
> Signed-off-by: Barry Song <Baohua.Song@csr.com>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> ---
>  arch/arm/mach-exynos/Kconfig |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index b5b4c8c..3fd4ab3 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -243,7 +243,6 @@ config MACH_UNIVERSAL_C210
>  	select CPU_EXYNOS4210
>  	select S5P_HRT
>  	select CLKSRC_MMIO
> -	select HAVE_SCHED_CLOCK
>  	select S5P_GPIO_INT
>  	select S5P_DEV_FIMC0
>  	select S5P_DEV_FIMC1
> --
> 1.7.0.4
