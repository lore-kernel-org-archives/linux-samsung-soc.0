From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] gpio/samsung: fix the typo 'exynos5_xxx' instead of
 'exonys5_xxx'
Date: Mon, 04 Jun 2012 13:07:07 +0900
Message-ID: <088d01cd4207$823ecb10$86bc6130$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:58301 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751735Ab2FDEHN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jun 2012 00:07:13 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5200MUVRFYDI90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jun 2012 13:07:12 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5200MRORFV1730@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jun 2012 13:07:12 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus' <torvalds@linux-foundation.org>, linux-samsung-soc@vger.kernel.org
Cc: grant.likely@secretlab.ca, 'Linus Walleij' <linus.walleij@linaro.org>


Should be 'exynos5_xxx' instead of 'exonys5_xxx'.

It happened at the commit 30b842889eea ("Merge tag 'soc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc")
during v3.5 merge window.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/gpio/gpio-samsung.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index 7bb0044..b6453d0 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -2833,7 +2833,7 @@ static __init void exynos5_gpiolib_init(void)
 	}
 
 	/* need to set base address for gpc4 */
-	exonys5_gpios_1[11].base = gpio_base1 + 0x2E0;
+	exynos5_gpios_1[11].base = gpio_base1 + 0x2E0;
 
 	/* need to set base address for gpx */
 	chip = &exynos5_gpios_1[21];
-- 
1.7.1
