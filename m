From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: exynos4: Use drive strength 3 for SD pins
Date: Tue, 20 Nov 2012 18:18:44 +0900
Message-ID: <0c2f01cdc700$09c204d0$1d460e70$%kim@samsung.com>
References: <21831256.UCkQ5RyKd5@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:41754 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753086Ab2KTJSp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 04:18:45 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDS00J114IJT3T0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 18:18:44 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDS00E2Q4J74J80@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 18:18:44 +0900 (KST)
In-reply-to: <21831256.UCkQ5RyKd5@amdc1227>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>
Cc: 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Tomasz Figa wrote:
> 
> This patch modifies pin control groups of SD pins on Exynos4210 and
> Exynos4x12 to use drive strength 3, which corresponds to
> S5P_GPIO_DRVSTR_LV4 in legacy non-DT code.
> 
Well, the value of drive strength depends on board not SoC. So if required,
it should be moved to board DT stuff.

BTW, we can use the value as a default...I need to think about that again
for exynos4210 and 4x12.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


> This is needed at least on Origen board for sdhci2 to work.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-pinctrl.dtsi | 56 +++++++++++++++-----------
> -----
>  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi | 56 +++++++++++++++-----------
> -----
>  2 files changed, 56 insertions(+), 56 deletions(-)
