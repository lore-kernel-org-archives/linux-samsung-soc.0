From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 3/5] S3C24XX: Allow overriding of adc device name
Date: Mon, 10 Oct 2011 21:49:24 +0200
Message-ID: <201110102149.24528.heiko@sntech.de>
References: <201110102146.51694.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:58086 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754629Ab1JJTta (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 15:49:30 -0400
In-Reply-To: <201110102146.51694.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The adc blocks of S3C2443 and S3C2416 contain quirks not present
in the stock S3C24xx adc. Therefore allow them to alter the
device name via s3c_adc_setname.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/plat-samsung/include/plat/adc-core.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/adc-core.h b/arch/arm/plat-samsung/include/plat/adc-core.h
index a281568..a927bee 100644
--- a/arch/arm/plat-samsung/include/plat/adc-core.h
+++ b/arch/arm/plat-samsung/include/plat/adc-core.h
@@ -20,7 +20,7 @@
 /* re-define device name depending on support. */
 static inline void s3c_adc_setname(char *name)
 {
-#ifdef CONFIG_SAMSUNG_DEV_ADC
+#if defined(CONFIG_SAMSUNG_DEV_ADC) || defined(CONFIG_PLAT_S3C24XX)
 	s3c_device_adc.name = name;
 #endif
 }
-- 
1.7.2.3
