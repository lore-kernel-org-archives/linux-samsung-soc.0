From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 0/6] ARM: EXYNOS4: NURI Board Configuration Update
Date: Sat, 16 Jul 2011 16:15:16 +0900
Message-ID: <037b01cc4388$1f1b7c50$5d5274f0$%kim@samsung.com>
References: <1309421729-11172-1-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:10076 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751230Ab1GPHPV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Jul 2011 03:15:21 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOF008EW05E5M30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 16:15:20 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOF0069105K9G@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 16:15:20 +0900 (KST)
In-reply-to: <1309421729-11172-1-git-send-email-myungjoo.ham@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Changhwan Youn' <chaos.youn@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, myungjoo.ham@gmail.com, tushar.behera@linaro.org

MyungJoo Ham wrote:
> 
> 1/6: Increase NR_IRQS for MAX8997
> 2/6: Add MAX8997 PMIC
> 3/6: Add MAX17042 Fuel Gauge
> 4/6: Add ADC
> 5/6: Add MAX8903 Secondary Charger
> 6/6: Add RTC-S3C
> 
> ps. Tushar, I didn't seperated MAX8997 support code out of mach-nuri.c,
yet
> because I still have no idea about how similar the Origen board is with
NURI board.
> 
> MyungJoo Ham (6):
>   ARM: EXYNOS4: Increase NR_IRQS for devices with more IRQs
>   Exynos4 NURI: configure regulators and PMIC (MAX8997)
>   Exynos4 NURI: configure MAX17042 fuel gauge
>   Exynos4 NURI: configure ADC.
>   Exynos4 NURI: configure MAX8903 secondary charger
>   Exynos4 NURI: configure rtc-s3c.
> 
>  arch/arm/mach-exynos4/include/mach/irqs.h |    2 +-
>  arch/arm/mach-exynos4/mach-nuri.c         |  739
> ++++++++++++++++++++++++++++-
>  2 files changed, 739 insertions(+), 2 deletions(-)
> 
> --
> 1.7.4.1

Hi MyungJoo Ham,

Sorry for late response.
I will be back on this next Monday.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
