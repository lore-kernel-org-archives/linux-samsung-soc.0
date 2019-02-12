From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/4] dt-bindings: clock: exynos: Put CLK_UART3 in order
Date: Tue, 12 Feb 2019 18:50:49 +0100
Message-ID: <20190212175052.6310-2-krzk@kernel.org>
References: <20190212175052.6310-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190212175052.6310-1-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Order the CLK_UART3 by ID.  No change in functionality.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 include/dt-bindings/clock/exynos5410.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/exynos5410.h b/include/dt-bindings/clock/exynos5410.h
index f179eabbcdb7..5b911ede0534 100644
--- a/include/dt-bindings/clock/exynos5410.h
+++ b/include/dt-bindings/clock/exynos5410.h
@@ -36,6 +36,7 @@
 #define CLK_UART0		257
 #define CLK_UART1		258
 #define CLK_UART2		259
+#define CLK_UART3		260
 #define CLK_I2C0		261
 #define CLK_I2C1		262
 #define CLK_I2C2		263
@@ -44,7 +45,6 @@
 #define CLK_USI1		266
 #define CLK_USI2		267
 #define CLK_USI3		268
-#define CLK_UART3		260
 #define CLK_PWM			279
 #define CLK_MCT			315
 #define CLK_WDT			316
-- 
2.17.1
