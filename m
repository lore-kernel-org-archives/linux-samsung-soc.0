From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 4/8] ASoC: samsung: i2s: Define the parameters list for
 SAMSUNG_I2S_OPCLK
Date: Mon, 05 Feb 2018 16:43:59 +0100
Message-ID: <20180205154403.13520-5-s.nawrocki@samsung.com>
References: <20180205154403.13520-1-s.nawrocki@samsung.com>
        <CGME20180205154520epcas1p4132421a187a4d767a2f75badfef5eec4@epcas1p4.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20180205154403.13520-1-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jcsing.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The SAMSUNG_I2S_OPCLK is not currently used by any card driver thus we can
safely change semantics of 'dir' argument of the I2S set_sysclk() callback.
Now an anumeration is exported instead of directly using register bitfield
values.

Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 sound/soc/samsung/i2s-regs.h | 11 ++++++-----
 sound/soc/samsung/i2s.c      |  2 +-
 sound/soc/samsung/i2s.h      | 11 ++++++++---
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/sound/soc/samsung/i2s-regs.h b/sound/soc/samsung/i2s-regs.h
index fe6914005494..964985ea2e80 100644
--- a/sound/soc/samsung/i2s-regs.h
+++ b/sound/soc/samsung/i2s-regs.h
@@ -65,11 +65,12 @@
 #define CON_RXDMA_ACTIVE	(1 << 1)
 #define CON_ACTIVE		(1 << 0)
 
-#define MOD_OPCLK_CDCLK_OUT	(0 << 30)
-#define MOD_OPCLK_CDCLK_IN	(1 << 30)
-#define MOD_OPCLK_BCLK_OUT	(2 << 30)
-#define MOD_OPCLK_PCLK		(3 << 30)
-#define MOD_OPCLK_MASK		(3 << 30)
+#define MOD_OPCLK_SHIFT		30
+#define MOD_OPCLK_CDCLK_OUT	(0 << MOD_OPCLK_SHIFT)
+#define MOD_OPCLK_CDCLK_IN	(1 << MOD_OPCLK_SHIFT)
+#define MOD_OPCLK_BCLK_OUT	(2 << MOD_OPCLK_SHIFT)
+#define MOD_OPCLK_PCLK		(3 << MOD_OPCLK_SHIFT)
+#define MOD_OPCLK_MASK		(3 << MOD_OPCLK_SHIFT)
 #define MOD_TXS_IDMA		(1 << 28) /* Sec_TXFIFO use I-DMA */
 
 #define MOD_BLCS_SHIFT		26
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 1c05170e4999..6d768cdb4326 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -489,7 +489,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 	switch (clk_id) {
 	case SAMSUNG_I2S_OPCLK:
 		mask = MOD_OPCLK_MASK;
-		val = dir;
+		val = (dir << MOD_OPCLK_SHIFT) & MOD_OPCLK_MASK;
 		break;
 	case SAMSUNG_I2S_CDCLK:
 		mask = 1 << i2s_regs->cdclkcon_off;
diff --git a/sound/soc/samsung/i2s.h b/sound/soc/samsung/i2s.h
index 79781de2f247..a9832a9555cb 100644
--- a/sound/soc/samsung/i2s.h
+++ b/sound/soc/samsung/i2s.h
@@ -16,11 +16,16 @@
 #define SAMSUNG_I2S_DAI        "samsung-i2s"
 #define SAMSUNG_I2S_DAI_SEC    "samsung-i2s-sec"
 
-#define SAMSUNG_I2S_DIV_BCLK	1
+#define SAMSUNG_I2S_DIV_BCLK		1
 
-#define SAMSUNG_I2S_RCLKSRC_0	0
-#define SAMSUNG_I2S_RCLKSRC_1	1
+#define SAMSUNG_I2S_RCLKSRC_0		0
+#define SAMSUNG_I2S_RCLKSRC_1		1
 #define SAMSUNG_I2S_CDCLK		2
+/* Operation clock for IIS logic */
 #define SAMSUNG_I2S_OPCLK		3
+#define  SAMSUNG_I2S_OPCLK_CDCLK_OUT	0	/* CODEC clock out */
+#define  SAMSUNG_I2S_OPCLK_CDCLK_IN	1	/* CODEC clock in */
+#define  SAMSUNG_I2S_OPCLK_BCLK_OUT	2	/* Bit clock out */
+#define  SAMSUNG_I2S_OPCLK_PCLK		3	/* Audio bus clock */
 
 #endif /* __SND_SOC_SAMSUNG_I2S_H */
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
