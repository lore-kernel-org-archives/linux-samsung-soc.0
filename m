From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v3 6/6] Exynos4 NURI: configure rtc-s3c.
Date: Thu, 30 Jun 2011 17:15:29 +0900
Message-ID: <1309421729-11172-7-git-send-email-myungjoo.ham@samsung.com>
References: <1309421729-11172-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60127 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758530Ab1F3IPb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 04:15:31 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNL00H35G96UJI0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 17:15:30 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNL002QFG9UC8@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 17:15:30 +0900 (KST)
In-reply-to: <1309421729-11172-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Changhwan Youn <chaos.youn@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, myungjoo.ham@gmail.com, tushar.behera@linaro.org

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/mach-nuri.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-nuri.c b/arch/arm/mach-exynos4/mach-nuri.c
index 0c9401c..bdf7a5c 100644
--- a/arch/arm/mach-exynos4/mach-nuri.c
+++ b/arch/arm/mach-exynos4/mach-nuri.c
@@ -1098,6 +1098,7 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&s3c_device_i2c3,
 	&i2c9_gpio,
 	&s3c_device_adc,
+	&s3c_device_rtc,
 
 	/* NURI Devices */
 	&nuri_gpio_keys,
-- 
1.7.4.1
