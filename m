From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 2/6] pinctrl: samsung: Include pinctrl-exynos driver data
 conditionally
Date: Mon, 18 Mar 2013 22:31:51 +0100
Message-ID: <1363642315-10331-3-git-send-email-tomasz.figa@gmail.com>
References: <1363642315-10331-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1363642315-10331-1-git-send-email-tomasz.figa@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linus.walleij@linaro.org, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Since pinctrl-samsung is a common part of the pin control support for
several Samsung SoCs, it can be compiled without Exynos support enabled.

This patch surrounds Exynos-specific driver data with ifdefs to include
them only when support for Exynos is enabled.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/pinctrl/pinctrl-samsung.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index b1d4ac8..f1fb562 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -968,10 +968,12 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id samsung_pinctrl_dt_match[] = {
+#ifdef CONFIG_PINCTRL_EXYNOS4
 	{ .compatible = "samsung,exynos4210-pinctrl",
 		.data = (void *)exynos4210_pin_ctrl },
 	{ .compatible = "samsung,exynos4x12-pinctrl",
 		.data = (void *)exynos4x12_pin_ctrl },
+#endif
 	{},
 };
 MODULE_DEVICE_TABLE(of, samsung_pinctrl_dt_match);
-- 
1.8.1.5
