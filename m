From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 2/5] s3c-adc: Fix mux bit modification in s3c_adc_select
Date: Mon, 10 Oct 2011 21:48:50 +0200
Message-ID: <201110102148.50392.heiko@sntech.de>
References: <201110102146.51694.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:58063 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754629Ab1JJTsz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 15:48:55 -0400
In-Reply-To: <201110102146.51694.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

The mux bits in the adccon register should be cleared only
if muxing is really done in ADCCON and not another register.

This patch introduces a conditional for this.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/plat-samsung/adc.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index ee8deef..7821055a 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -98,7 +98,8 @@ static inline void s3c_adc_select(struct adc_device *adc,
 
 	client->select_cb(client, 1);
 
-	con &= ~S3C2410_ADCCON_MUXMASK;
+	if (cpu == TYPE_ADCV1 || cpu == TYPE_ADCV2)
+		con &= ~S3C2410_ADCCON_MUXMASK;
 	con &= ~S3C2410_ADCCON_STDBM;
 	con &= ~S3C2410_ADCCON_STARTMASK;
 
-- 
1.7.2.3
