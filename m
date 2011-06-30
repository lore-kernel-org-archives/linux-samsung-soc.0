From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH 0/3] ARM: EXYNOS4: NURI Support NTC
Date: Thu, 30 Jun 2011 17:26:24 +0900
Message-ID: <1309422387-11546-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50429 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757677Ab1F3I0a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 04:26:30 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNL006PFGRS1CI0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 17:26:28 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNL00B3LGS4G2@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 17:26:28 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Changhwan Youn <chaos.youn@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, myungjoo.ham@gmail.com, dg77.kim@samsung.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

This series of patches require NTC thermistor support.
NTC thermistor support patch is submitted and told to be applied (lm-sensors) although it is not being found in -next branches just yet.
You can find the patch at:
http://comments.gmane.org/gmane.linux.drivers.sensors/26475

MyungJoo Ham (3):
  Samsung SoC: NTC Thermistor attached to S3C-ADC.
  Samsung SoC: ready to use NTC value inside kernel
  Exynos4 NURI: support for NTC thermistor

 arch/arm/mach-exynos4/mach-nuri.c            |    4 +
 arch/arm/plat-samsung/dev-adc.c              |  119 ++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/adc-ntc.h |   19 ++++
 arch/arm/plat-samsung/include/plat/devs.h    |    1 +
 4 files changed, 143 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-samsung/include/plat/adc-ntc.h

-- 
1.7.4.1
