From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH 2/3] clocksource: exynos_mct: cache mct upper count
Date: Wed,  4 Jun 2014 10:30:33 -0700
Message-ID: <1401903034-20074-2-git-send-email-dianders@chromium.org>
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
Cc: linux-samsung-soc@vger.kernel.org, David Riley <davidriley@chromium.org>, Chirantan Ekbote <chirantan@chromium.org>, Mandeep Singh Baines <msb@chromium.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, olof@lixom.net, Vincent Guittot <vincent.guittot@linaro.org>, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Mandeep Singh Baines <msb@chromium.org>

Saves one register read.  Note that the upper count only changes every
~178 seconds with a 24MHz source clock, so it's likely it hasn't
changed from call to call.

Before: 1323852 us for 1000000 gettimeofday in userspace
After:  1173084 us for 1000000 gettimeofday in userspace

Note that even with this change the CPU is in exynos_frc_read() more
than 2% of the time in real world profiles of ChromeOS.  That
indicates that it's important to optimize.

Signed-off-by: Mandeep Singh Baines <msb@chromium.org>
Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 drivers/clocksource/exynos_mct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index ba3a683..7cbe4aa 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -167,8 +167,8 @@ static void exynos4_mct_frc_start(u32 hi, u32 lo)
 
 static inline cycle_t notrace _exynos4_frc_read(void)
 {
-	unsigned int lo, hi;
-	u32 hi2 = __raw_readl(reg_base + EXYNOS4_MCT_G_CNT_U);
+	u32 lo, hi;
+	static u32 hi2;
 
 	do {
 		hi = hi2;
-- 
2.0.0.526.g5318336
