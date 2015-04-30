From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/3] clocksource: exynos_mct: Staticize struct clocksource
Date: Thu, 30 Apr 2015 13:42:52 +0900
Message-ID: <1430368973-23786-2-git-send-email-k.kozlowski@samsung.com>
References: <1430368973-23786-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1430368973-23786-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The struct clocksource 'mct_frc' is not exported and used outside so
make it static.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clocksource/exynos_mct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 87c2e558c465..8b2a9fc66dcc 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -209,7 +209,7 @@ static void exynos4_frc_resume(struct clocksource *cs)
 	exynos4_mct_frc_start();
 }
 
-struct clocksource mct_frc = {
+static struct clocksource mct_frc = {
 	.name		= "mct-frc",
 	.rating		= 400,
 	.read		= exynos4_frc_read,
-- 
1.9.1
