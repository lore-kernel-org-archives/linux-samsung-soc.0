From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH 3/3] clocksource: exynos_mct: Optimize register reads with
 ldmia
Date: Wed,  4 Jun 2014 10:30:34 -0700
Message-ID: <1401903034-20074-3-git-send-email-dianders@chromium.org>
References: <1401903034-20074-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1401903034-20074-1-git-send-email-dianders@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, David Riley <davidriley@chromium.org>, Chirantan Ekbote <chirantan@chromium.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, olof@lixom.net, Vincent Guittot <vincent.guittot@linaro.org>, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

As we saw in (clocksource: exynos_mct: cache mct upper count), the
time spent reading the MCT shows up fairly high in real-world
profiles.  That means that it's worth some optimization.

We get a roughly 10% speedup in userspace gettimeofday() by using an
ldmia to read the two halfs of the MCT.  That seems like a worthwhile
thing to do.

Before: 1173084 us for 1000000 gettimeofday in userspace
After:  1045674 us for 1000000 gettimeofday in userspace

NOTE: we could actually do better than this if we really wanted to.
Technically we could register the clocksource as a 32-bit timer and
only use the "lower" half.  Doing so brings us down to 1014429 us for
1000000 gettimeofday in userspace (and doesn't even require assembly
code).  That would be an alternative to this change.

Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 drivers/clocksource/exynos_mct.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 7cbe4aa..6e3017b 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -172,8 +172,9 @@ static inline cycle_t notrace _exynos4_frc_read(void)
 
 	do {
 		hi = hi2;
-		lo = __raw_readl(reg_base + EXYNOS4_MCT_G_CNT_L);
-		hi2 = __raw_readl(reg_base + EXYNOS4_MCT_G_CNT_U);
+		asm volatile("ldmia  %2, {%0, %1}"
+			     : "=r" (lo), "=r" (hi2)
+			     : "r" (reg_base + EXYNOS4_MCT_G_CNT_L));
 	} while (hi != hi2);
 
 	return ((cycle_t)hi << 32) | lo;
-- 
2.0.0.526.g5318336
