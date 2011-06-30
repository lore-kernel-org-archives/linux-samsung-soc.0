From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v3 6/6] Samsung SoC: header file revised to prevent declaring
 duplicated.
Date: Thu, 30 Jun 2011 16:49:35 +0900
Message-ID: <1309420175-10301-7-git-send-email-myungjoo.ham@samsung.com>
References: <1309420175-10301-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40951 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758558Ab1F3Htl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 03:49:41 -0400
In-reply-to: <1309420175-10301-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kyungmin Park <kyungmin.park@samsung.com>, Changhwan Youn <chaos.youn@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Greg Kroah-Hartman <gregkh@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Jassi Brar <jassi.brar@samsung.com>, Seungwhan Youn <sw.youn@samsung.com>, linux-kernel@vger.kernel.org, myungjoo.ham@gmail.com

There has been no #ifndef - #define - #endif protection for this header
file. The patch adds it for Exynos4-ADC support

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
---
 arch/arm/plat-samsung/include/plat/devs.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 4af108f..3c87779 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -12,6 +12,9 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
 */
+#ifndef __PLAT_DEVS_H
+#define __PLAT_DEVS_H __FILE__
+
 #include <linux/platform_device.h>
 
 struct s3c24xx_uart_resources {
@@ -159,3 +162,5 @@ extern struct platform_device s3c_device_ac97;
  */
 extern void *s3c_set_platdata(void *pd, size_t pdsize,
 			      struct platform_device *pdev);
+
+#endif /* __PLAT_DEVS_H */
-- 
1.7.4.1
