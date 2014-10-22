From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH] clocksource: exynos_mct: fix exynos4_mct_write
Date: Wed, 22 Oct 2014 03:37:08 +0200
Message-ID: <1413941828-5547-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:52204 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752810AbaJVBoD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Oct 2014 21:44:03 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dianders@chromium.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

EXYNOS4_MCT_L_MASK is defined as 0xffffff00, so applying this bitmask
produces a number outside the range 0x00 to 0xff, which always results
in execution of the default switch statement.

Obviously this is wrong and git history shows that the bitmask inversion
was incorrectly set during a refactoring of the MCT code.

Fix this by putting the inversion at the correct position again.

Reported-by: GP Orcullo <kinsamanka@gmail.com>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/clocksource/exynos_mct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 9403061..83564c9 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -97,8 +97,8 @@ static void exynos4_mct_write(unsigned int value, unsigned long offset)
 	writel_relaxed(value, reg_base + offset);
 
 	if (likely(offset >= EXYNOS4_MCT_L_BASE(0))) {
-		stat_addr = (offset & ~EXYNOS4_MCT_L_MASK) + MCT_L_WSTAT_OFFSET;
-		switch (offset & EXYNOS4_MCT_L_MASK) {
+		stat_addr = (offset & EXYNOS4_MCT_L_MASK) + MCT_L_WSTAT_OFFSET;
+		switch (offset & ~EXYNOS4_MCT_L_MASK) {
 		case MCT_L_TCON_OFFSET:
 			mask = 1 << 3;		/* L_TCON write status */
 			break;
-- 
2.0.4
