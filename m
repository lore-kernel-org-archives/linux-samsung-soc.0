From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/3] ASoC: samsung: Remove definition of an unused data
 structure
Date: Fri, 08 Apr 2016 18:52:44 +0200
Message-ID: <1460134365-31500-2-git-send-email-s.nawrocki@samsung.com>
References: <1460134365-31500-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34935 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754625AbcDHQxZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Apr 2016 12:53:25 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O5B01946QWZDV20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Apr 2016 01:53:23 +0900 (KST)
In-reply-to: <1460134365-31500-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

samsung_dai_type_pri is not referenced anywhere so remove it.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index ededac9..7ea030e 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1477,10 +1477,6 @@ static const struct samsung_i2s_dai_data i2sv5_dai_type_i2s1 = {
 	.i2s_variant_regs = &i2sv5_i2s1_regs,
 };
 
-static const struct samsung_i2s_dai_data samsung_dai_type_pri = {
-	.dai_type = TYPE_PRI,
-};
-
 static const struct samsung_i2s_dai_data samsung_dai_type_sec = {
 	.dai_type = TYPE_SEC,
 };
-- 
1.9.1
