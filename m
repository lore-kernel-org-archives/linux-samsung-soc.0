From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH/RFC 01/14] ASoC: samsung: i2s: Remove unused gpios field from
 struct i2s
Date: Thu, 11 Dec 2014 18:45:39 +0100
Message-ID: <1418319952-10163-2-git-send-email-s.nawrocki@samsung.com>
References: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24358 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932412AbaLKRq2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Dec 2014 12:46:28 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NGF00512IPESN50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Dec 2014 02:46:26 +0900 (KST)
In-reply-to: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: broonie@kernel.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

The 'gpios' field in 'struct i2s' is now unused, this change
seems to be missing in commit 0429ffeff460c4302bd1520e6
("ASoC: samsung: Remove obsolete GPIO based DT pinmuxing").

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index c1f70fe..2c07592 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -95,7 +95,6 @@ struct i2s_dai {
 	u32	suspend_i2smod;
 	u32	suspend_i2scon;
 	u32	suspend_i2spsr;
-	unsigned long gpios[7];	/* i2s gpio line numbers */
 	const struct samsung_i2s_variant_regs *variant_regs;
 };
 
-- 
1.7.9.5
