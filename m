From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v3 0/6] ARM: EXYNOS4: NURI Board Configuration Update
Date: Thu, 30 Jun 2011 17:15:23 +0900
Message-ID: <1309421729-11172-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54785 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757684Ab1F3IPb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 04:15:31 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNL00FDGG8OUVK0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 17:15:29 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNL00H32G9TNU@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 17:15:29 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Changhwan Youn <chaos.youn@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, myungjoo.ham@gmail.com, tushar.behera@linaro.org

1/6: Increase NR_IRQS for MAX8997
2/6: Add MAX8997 PMIC
3/6: Add MAX17042 Fuel Gauge
4/6: Add ADC
5/6: Add MAX8903 Secondary Charger
6/6: Add RTC-S3C

ps. Tushar, I didn't seperated MAX8997 support code out of mach-nuri.c, yet because I still have no idea about how similar the Origen board is with NURI board.

MyungJoo Ham (6):
  ARM: EXYNOS4: Increase NR_IRQS for devices with more IRQs
  Exynos4 NURI: configure regulators and PMIC (MAX8997)
  Exynos4 NURI: configure MAX17042 fuel gauge
  Exynos4 NURI: configure ADC.
  Exynos4 NURI: configure MAX8903 secondary charger
  Exynos4 NURI: configure rtc-s3c.

 arch/arm/mach-exynos4/include/mach/irqs.h |    2 +-
 arch/arm/mach-exynos4/mach-nuri.c         |  739 ++++++++++++++++++++++++++++-
 2 files changed, 739 insertions(+), 2 deletions(-)

-- 
1.7.4.1
