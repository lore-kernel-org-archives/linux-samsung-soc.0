From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 3/6] clk: exynos5250: add clock ID for div_pcm0
Date: Fri, 20 Sep 2013 14:13:54 -0700
Message-ID: <1379711637-5226-3-git-send-email-abrestic@chromium.org>
References: <1379711637-5226-1-git-send-email-abrestic@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379711637-5226-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yadwinder Singh Brar <yadi.brar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.orglinu
List-Id: linux-samsung-soc@vger.kernel.org

There is no gate for the PCM clock input to the AudioSS block, so
the parent of sclk_pcm is div_pcm0.  Add a clock ID for it so that
we can reference it in device trees.

Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/exynos5250-clock.txt | 1 +
 drivers/clk/samsung/clk-exynos5250.c                         | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
index 24765c1..67e9a47 100644
--- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
@@ -62,6 +62,7 @@ clock which they consume.
   div_i2s1		157
   div_i2s2		158
   sclk_hdmiphy		159
+  div_pcm0		160
 
 
    [Peripheral Clock Gates]
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index adf3234..dec5376 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -108,7 +108,7 @@ enum exynos5250_clks {
 	sclk_mmc0, sclk_mmc1, sclk_mmc2, sclk_mmc3, sclk_sata, sclk_usb3,
 	sclk_jpeg, sclk_uart0, sclk_uart1, sclk_uart2, sclk_uart3, sclk_pwm,
 	sclk_audio1, sclk_audio2, sclk_spdif, sclk_spi0, sclk_spi1, sclk_spi2,
-	div_i2s1, div_i2s2, sclk_hdmiphy,
+	div_i2s1, div_i2s2, sclk_hdmiphy, div_pcm0,
 
 	/* gate clocks */
 	gscl0 = 256, gscl1, gscl2, gscl3, gscl_wa, gscl_wb, smmu_gscl0,
@@ -301,7 +301,7 @@ static struct samsung_div_clock exynos5250_div_clks[] __initdata = {
 	DIV(none, "div_dp", "mout_dp", DIV_DISP1_0, 24, 4),
 	DIV(none, "div_jpeg", "mout_jpeg", DIV_GEN, 4, 4),
 	DIV(none, "div_audio0", "mout_audio0", DIV_MAU, 0, 4),
-	DIV(none, "div_pcm0", "sclk_audio0", DIV_MAU, 4, 8),
+	DIV(div_pcm0, "div_pcm0", "sclk_audio0", DIV_MAU, 4, 8),
 	DIV(none, "div_sata", "mout_sata", DIV_FSYS0, 20, 4),
 	DIV(none, "div_usb3", "mout_usb3", DIV_FSYS0, 24, 4),
 	DIV(none, "div_mmc0", "mout_mmc0", DIV_FSYS1, 0, 4),
-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
