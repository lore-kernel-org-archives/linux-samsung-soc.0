From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] pinctrl: samsung: remove unneeded (void *) casts in
 of_match_table
Date: Wed, 26 Apr 2017 06:34:23 +0900
Message-ID: <1493156063-8446-3-git-send-email-yamada.masahiro@socionext.com>
References: <1493156063-8446-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1493156063-8446-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

of_device_id::data is an opaque pointer.  No explicit cast is needed.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/samsung/pinctrl-samsung.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index d7aa22c..3b62283 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1192,25 +1192,25 @@ static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
 static const struct of_device_id samsung_pinctrl_dt_match[] = {
 #ifdef CONFIG_PINCTRL_EXYNOS
 	{ .compatible = "samsung,exynos3250-pinctrl",
-		.data = (void *)exynos3250_pin_ctrl },
+		.data = exynos3250_pin_ctrl },
 	{ .compatible = "samsung,exynos4210-pinctrl",
-		.data = (void *)exynos4210_pin_ctrl },
+		.data = exynos4210_pin_ctrl },
 	{ .compatible = "samsung,exynos4x12-pinctrl",
-		.data = (void *)exynos4x12_pin_ctrl },
+		.data = exynos4x12_pin_ctrl },
 	{ .compatible = "samsung,exynos5250-pinctrl",
-		.data = (void *)exynos5250_pin_ctrl },
+		.data = exynos5250_pin_ctrl },
 	{ .compatible = "samsung,exynos5260-pinctrl",
-		.data = (void *)exynos5260_pin_ctrl },
+		.data = exynos5260_pin_ctrl },
 	{ .compatible = "samsung,exynos5410-pinctrl",
-		.data = (void *)exynos5410_pin_ctrl },
+		.data = exynos5410_pin_ctrl },
 	{ .compatible = "samsung,exynos5420-pinctrl",
-		.data = (void *)exynos5420_pin_ctrl },
+		.data = exynos5420_pin_ctrl },
 	{ .compatible = "samsung,exynos5433-pinctrl",
-		.data = (void *)exynos5433_pin_ctrl },
+		.data = exynos5433_pin_ctrl },
 	{ .compatible = "samsung,s5pv210-pinctrl",
-		.data = (void *)s5pv210_pin_ctrl },
+		.data = s5pv210_pin_ctrl },
 	{ .compatible = "samsung,exynos7-pinctrl",
-		.data = (void *)exynos7_pin_ctrl },
+		.data = exynos7_pin_ctrl },
 #endif
 #ifdef CONFIG_PINCTRL_S3C64XX
 	{ .compatible = "samsung,s3c64xx-pinctrl",
-- 
2.7.4
