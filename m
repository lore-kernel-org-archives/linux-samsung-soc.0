From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: exynos4210-trats: Remove broken-voltage property
 from sdhci node
Date: Tue, 20 Nov 2012 21:00:35 +0900
Message-ID: <0c9901cdc716$a6284f80$f278ee80$%kim@samsung.com>
References: <1604189.yDsqlPMQyl@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25150 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752616Ab2KTMAl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 07:00:41 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDS00JBEC02RQ11@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 21:00:35 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDS00M6JC0ZDQ00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 21:00:35 +0900 (KST)
In-reply-to: <1604189.yDsqlPMQyl@amdc1227>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>
Cc: 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Tomasz Figa wrote:
> 
> The broken voltage property has been replaced with auto detection based
> on voltages available on vmmc voltage regulator, so there is no use for
> it now.
> 
> This patch removes the now unused property from Trats Device Tree
> sources.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-trats.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4210-trats.dts
> b/arch/arm/boot/dts/exynos4210-trats.dts
> index a21511c..9d5d27a 100644
> --- a/arch/arm/boot/dts/exynos4210-trats.dts
> +++ b/arch/arm/boot/dts/exynos4210-trats.dts
> @@ -42,7 +42,6 @@
>  	sdhci_emmc: sdhci@12510000 {
>  		bus-width = <8>;
>  		non-removable;
> -		broken-voltage;
>  		gpios = <&gpk0 0 2 0 3>,
>  			<&gpk0 1 2 0 3>,
>  			<&gpk0 3 2 2 3>,
> --
> 1.8.0

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
