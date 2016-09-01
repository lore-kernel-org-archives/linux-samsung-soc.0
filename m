From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/6] pinctrl: dt-bindings: samsung: Add macros for S3C64xx pin
 configuration
Date: Thu, 01 Sep 2016 11:21:51 +0200
Message-ID: <1472721715-2833-3-git-send-email-k.kozlowski@samsung.com>
References: <1472721715-2833-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1472721715-2833-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>
Cc: javier@osg.samsung.com, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add macros for configuring pins pull up/down on S3C64xx and S5PV210.
They differ from Exynos SoC family.  Also add pin function with value of 6.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 include/dt-bindings/pinctrl/samsung.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/pinctrl/samsung.h b/include/dt-bindings/pinctrl/samsung.h
index b2132f3fe1ac..8ba07a6de003 100644
--- a/include/dt-bindings/pinctrl/samsung.h
+++ b/include/dt-bindings/pinctrl/samsung.h
@@ -17,6 +17,10 @@
 #define EXYNOS_PIN_PULL_DOWN		1
 #define EXYNOS_PIN_PULL_UP		3
 
+#define S3C64XX_PIN_PULL_NONE		0
+#define S3C64XX_PIN_PULL_DOWN		1
+#define S3C64XX_PIN_PULL_UP		2
+
 /* Pin function in power down mode */
 #define EXYNOS_PIN_PDN_OUT0		0
 #define EXYNOS_PIN_PDN_OUT1		1
@@ -47,6 +51,7 @@
 #define EXYNOS_PIN_FUNC_3		3
 #define EXYNOS_PIN_FUNC_4		4
 #define EXYNOS_PIN_FUNC_5		5
+#define EXYNOS_PIN_FUNC_6		6
 #define EXYNOS_PIN_FUNC_F		0xf
 
 #endif /* __DT_BINDINGS_PINCTRL_EXYNOS_H__ */
-- 
1.9.1
