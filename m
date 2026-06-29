Received: from mail.ksb-soft.ru (mail.ksb-soft.ru [5.167.76.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9004E334374;
	Mon, 29 Jun 2026 12:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.167.76.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782737439; cv=none; b=WxP0UgXrQmqOwAUpmudJLOn7zp4g9tx7SxgDu3+Ax4WbMFmIJgdw7TnTxUq/Jg6/HyIhpxHBLWI+NPvEmLxxbSpNMSPxHkhe10b9NSTqEofCi1sP5IHGWTeNBiP6f0sGh69U2C6sWAtplJdGWct7PwRSSduchbfZrRVDK9EkZNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782737439; c=relaxed/simple;
	bh=aV65Iy4yWLQHk2QOmtXcF+yFejqD3fbiy+D++Gh+oDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XrX4CtXejZ5hVsBl6VJ+52/hZeeJmX4fIsVvXG98cyVgtkM8LrcQp93n4+PyvvhJIUguexckENzRB850f+UGOq/ktj6nIQmTht5XVGpAZgwe3kfooua+9EahQpQ1swewTL6mWhb+WrqvvUM/4tF4Xz72vsVcX7a7Px4FACK2xo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=npc-ksb.ru; spf=pass smtp.mailfrom=npc-ksb.ru; arc=none smtp.client-ip=5.167.76.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=npc-ksb.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=npc-ksb.ru
Received: from ksb-289.ksb.ksb-soft.ru (unknown [10.38.22.14])
	by mail.ksb-soft.ru (Postfix) with ESMTPA id 4gpmDw48CJz4LJWR;
	Mon, 29 Jun 2026 15:44:16 +0300 (MSK)
From: Markov Gleb <markov.gi@npc-ksb.ru>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Gleb Markov <markov.gi@npc-ksb.ru>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kukjin Kim <kgene.kim@samsung.com>,
	Changhwan Youn <chaos.youn@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] clocksource/drivers/exynos_mct: Fix an unexpected sign extension
Date: Mon, 29 Jun 2026 15:44:12 +0300
Message-ID: <20260629124415.1571-1-markov.gi@npc-ksb.ru>
X-Mailer: git-send-email 2.52.0.windows.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 197590 [Oct 29 2025]
X-KLMS-AntiSpam-Version: 6.1.1.11
X-KLMS-AntiSpam-Envelope-From: markov.gi@npc-ksb.ru
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=none
X-KLMS-AntiSpam-Info: LuaCore: 72 0.3.72 80ff96170b649fb7ebd1aa4cb544c36c109810bd, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean
X-KLMS-LinksScanning: Clean
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 10.0.0.7427, bases: 2025/10/29 20:57:00 #27800623
X-KLMS-AntiVirus-Status: Clean, skipped

From: Gleb Markov <markov.gi@npc-ksb.ru>

Due to implicit sign extension, shifting a signed iteral 1 before
converting to a wider unsigned type floods the upper bits with ones.
This produced an unexpected value (such as 0xffffffffff80000000), which
breaks subsequent calculations.

Add the UL suffix to explicitly convert to a type with a larger dimension.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 30d8bead5a30 ("ARM: EXYNOS4: Implement kernel timers using MCT")
Signed-off-by: Gleb Markov <markov.gi@npc-ksb.ru>
---
 drivers/clocksource/exynos_mct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index da09f467a6bb..ab607dc99004 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -378,7 +378,7 @@ static void exynos4_mct_tick_start(unsigned long cycles,
 
 	exynos4_mct_tick_stop(mevt);
 
-	tmp = (1 << 31) | cycles;	/* MCT_L_UPDATE_ICNTB */
+	tmp = (1UL << 31) | cycles;	/* MCT_L_UPDATE_ICNTB */
 
 	/* update interrupt count buffer */
 	exynos4_mct_write(tmp, mevt->base + MCT_L_ICNTB_OFFSET);
-- 
2.43.0

