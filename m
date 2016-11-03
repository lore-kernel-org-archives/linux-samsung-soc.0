From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3 2/5] pinctrl: samsung: Add GPF support for Exynos5433
Date: Thu, 03 Nov 2016 15:39:06 +0900
Message-ID: <1478155149-28527-3-git-send-email-cw00.choi@samsung.com>
References: <1478155149-28527-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1478155149-28527-1-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: krzk@kernel.org, kgene@kernel.org, javier@osg.samsung.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: inki.dae@samsung.com, jonghwa3.lee@samsung.com, s.nawrocki@samsung.com, jy0922.shim@samsung.com, a.hajda@samsung.com, jaewon02.kim@samsung.com, Linus Walleij <linus.walleij@linaro.org>, sw0312.kim@samsung.com, Tomasz Figa <tomasz.figa@gmail.com>, andi.shyti@samsung.com, jh80.chung@samsung.com, cw00.choi@samsung.com, human.hwang@samsung.com, linux-gpio@vger.kernel.org, chanwoo@kernel.org, ingi2.kim@samsung.com, m.szyprowski@samsung.com, beomho.seo@samsung.com, ideal.song@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch add the support of GPF[1-5] pin of Exynos5433 SoC. The GPFx need
to support the multiple memory map because the registers of GPFx are located
in the different domain.

Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index d657b52dfdb5..12f7d1eb65bc 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -1339,6 +1339,11 @@ static void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
 	EXYNOS_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
 	EXYNOS_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
 	EXYNOS_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
+	EXYNOS_PIN_BANK_EINTW_EXT(8, 0x020, "gpf1", 0x1004, 1),
+	EXYNOS_PIN_BANK_EINTW_EXT(4, 0x040, "gpf2", 0x1008, 1),
+	EXYNOS_PIN_BANK_EINTW_EXT(4, 0x060, "gpf3", 0x100c, 1),
+	EXYNOS_PIN_BANK_EINTW_EXT(8, 0x080, "gpf4", 0x1010, 1),
+	EXYNOS_PIN_BANK_EINTW_EXT(8, 0x0a0, "gpf5", 0x1014, 1),
 };
 
 /* pin banks of exynos5433 pin-controller - AUD */
@@ -1420,6 +1425,7 @@ static void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
 		.eint_wkup_init = exynos_eint_wkup_init,
 		.suspend	= exynos_pinctrl_suspend,
 		.resume		= exynos_pinctrl_resume,
+		.nr_ext_resources = 1,
 	}, {
 		/* pin-controller instance 1 data */
 		.pin_banks	= exynos5433_pin_banks1,
-- 
1.9.1
