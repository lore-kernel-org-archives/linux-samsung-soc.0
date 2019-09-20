From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 03/10] ASoC: wm8994: Add support for setting MCLK clock rate
Date: Fri, 20 Sep 2019 15:02:12 +0200
Message-ID: <20190920130218.32690-4-s.nawrocki@samsung.com>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130316eucas1p2de713006a13c62c0b895c2e33e0d14c7@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190920130218.32690-1-s.nawrocki@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: broonie@kernel.org, krzk@kernel.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Extend the set_sysclk() handler so we also set frequency of the MCLK1,
MCLK2 clocks through clk API when those clocks are specified in DT.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - getting of clocks moved from MFD to the CODEC's driver probe()
---
 sound/soc/codecs/wm8994.c | 48 +++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/wm8994.h | 10 +++++++-
 2 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index d5fb7f5dd551..f69545dced25 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -167,12 +167,12 @@ static int configure_aif_clock(struct snd_soc_component *component, int aif)
 
 	switch (wm8994->sysclk[aif]) {
 	case WM8994_SYSCLK_MCLK1:
-		rate = wm8994->mclk[0];
+		rate = wm8994->mclk_rate[0];
 		break;
 
 	case WM8994_SYSCLK_MCLK2:
 		reg1 |= 0x8;
-		rate = wm8994->mclk[1];
+		rate = wm8994->mclk_rate[1];
 		break;
 
 	case WM8994_SYSCLK_FLL1:
@@ -2372,12 +2372,29 @@ static int wm8994_set_fll(struct snd_soc_dai *dai, int id, int src,
 	return _wm8994_set_fll(dai->component, id, src, freq_in, freq_out);
 }
 
+static int wm8994_set_mclk_rate(struct wm8994_priv *wm8994, unsigned int id,
+				unsigned int *freq)
+{
+	int ret;
+
+	if (!wm8994->mclk[id].clk || *freq == wm8994->mclk_rate[id])
+		return 0;
+
+	ret = clk_set_rate(wm8994->mclk[id].clk, *freq);
+	if (ret < 0)
+		return ret;
+
+	*freq = clk_get_rate(wm8994->mclk[id].clk);
+
+	return 0;
+}
+
 static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 		int clk_id, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
-	int i;
+	int ret, i;
 
 	switch (dai->id) {
 	case 1:
@@ -2392,7 +2409,12 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 	switch (clk_id) {
 	case WM8994_SYSCLK_MCLK1:
 		wm8994->sysclk[dai->id - 1] = WM8994_SYSCLK_MCLK1;
-		wm8994->mclk[0] = freq;
+
+		ret = wm8994_set_mclk_rate(wm8994, dai->id - 1, &freq);
+		if (ret < 0)
+			return ret;
+
+		wm8994->mclk_rate[0] = freq;
 		dev_dbg(dai->dev, "AIF%d using MCLK1 at %uHz\n",
 			dai->id, freq);
 		break;
@@ -2400,7 +2422,12 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 	case WM8994_SYSCLK_MCLK2:
 		/* TODO: Set GPIO AF */
 		wm8994->sysclk[dai->id - 1] = WM8994_SYSCLK_MCLK2;
-		wm8994->mclk[1] = freq;
+
+		ret = wm8994_set_mclk_rate(wm8994, dai->id - 1, &freq);
+		if (ret < 0)
+			return ret;
+
+		wm8994->mclk_rate[1] = freq;
 		dev_dbg(dai->dev, "AIF%d using MCLK2 at %uHz\n",
 			dai->id, freq);
 		break;
@@ -4456,6 +4483,7 @@ static const struct snd_soc_component_driver soc_component_dev_wm8994 = {
 static int wm8994_probe(struct platform_device *pdev)
 {
 	struct wm8994_priv *wm8994;
+	int ret;
 
 	wm8994 = devm_kzalloc(&pdev->dev, sizeof(struct wm8994_priv),
 			      GFP_KERNEL);
@@ -4467,6 +4495,16 @@ static int wm8994_probe(struct platform_device *pdev)
 
 	wm8994->wm8994 = dev_get_drvdata(pdev->dev.parent);
 
+	wm8994->mclk[WM8994_MCLK1].id = "MCLK1";
+	wm8994->mclk[WM8994_MCLK2].id = "MCLK2";
+
+	ret = devm_clk_bulk_get_optional(pdev->dev.parent, ARRAY_SIZE(wm8994->mclk),
+					 wm8994->mclk);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get clocks: %d\n", ret);
+		return ret;
+	}
+
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_idle(&pdev->dev);
 
diff --git a/sound/soc/codecs/wm8994.h b/sound/soc/codecs/wm8994.h
index 1d6f2abe1c11..41c4b126114d 100644
--- a/sound/soc/codecs/wm8994.h
+++ b/sound/soc/codecs/wm8994.h
@@ -6,6 +6,7 @@
 #ifndef _WM8994_H
 #define _WM8994_H
 
+#include <linux/clk.h>
 #include <sound/soc.h>
 #include <linux/firmware.h>
 #include <linux/completion.h>
@@ -14,6 +15,12 @@
 
 #include "wm_hubs.h"
 
+enum {
+	WM8994_MCLK1,
+	WM8994_MCLK2,
+	WM8994_NUM_MCLK
+};
+
 /* Sources for AIF1/2 SYSCLK - use with set_dai_sysclk() */
 #define WM8994_SYSCLK_MCLK1 1
 #define WM8994_SYSCLK_MCLK2 2
@@ -73,9 +80,10 @@ struct wm8994;
 struct wm8994_priv {
 	struct wm_hubs_data hubs;
 	struct wm8994 *wm8994;
+	struct clk_bulk_data mclk[WM8994_NUM_MCLK];
 	int sysclk[2];
 	int sysclk_rate[2];
-	int mclk[2];
+	int mclk_rate[2];
 	int aifclk[2];
 	int aifdiv[2];
 	int channels[2];
-- 
2.17.1
