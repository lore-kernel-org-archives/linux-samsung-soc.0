From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/5] ARM: dts: exynos4210-trats: Device tree extension
Date: Tue, 20 Nov 2012 18:19:06 +0900
Message-ID: <0c3101cdc700$1736b0c0$45a41240$%kim@samsung.com>
References: <1353336329-20818-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35399 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752918Ab2KTJTH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 04:19:07 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDS001O44J9OAW0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 18:19:06 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDS00D2H4JUY880@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 18:19:06 +0900 (KST)
In-reply-to: <1353336329-20818-1-git-send-email-t.figa@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, thomas.abraham@linaro.org, m.szyprowski@samsung.com, tomasz.figa@gmail.com

Tomasz Figa wrote:
> 
> This patch series extends device tree support for Trats board.
> 
> It adds support for pinctrl, GPIO keys and touchscreen to Trats dts file.
> 
> Tested on Trats board.
> 
> Depends on:
> [PATCH] i2c: i2c-s3c2410: Add support for pinctrl
> [PATCH v2 0/2] mmc: host: sdhci-s3c: Add support for pinctrl interface
> 
> Tomasz Figa (5):
>   ARM: dts: exynos4210-trats: Update for pinctrl-samsung driver
>   ARM: dts: exynos4210-trats: Add nodes for GPIO keys available on
>     Trats
>   ARM: dts: exynos4210-trats: Add node for i2c3 bus
>   ARM: dts: exynos4210-trats: Add node for touchscreen voltage
>     regulator
>   ARM: dts: exynos4210-trats: Add node for touchscreen
> 
>  arch/arm/boot/dts/exynos4210-trats.dts | 86 +++++++++++++++++++++++++++--
> -----
>  1 file changed, 70 insertions(+), 16 deletions(-)
> 
> --
> 1.8.0

Looks good to me, applied this whole series.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
