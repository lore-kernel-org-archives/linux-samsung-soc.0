From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 1/3] dt-bindings: Add the clock id for CMU_CDREX (DRAM
 Express Controller)
Date: Thu, 25 Aug 2016 15:57:16 +0900
Message-ID: <1472108238-24309-2-git-send-email-cw00.choi@samsung.com>
References: <1472108238-24309-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1472108238-24309-1-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kgene@kernel.org, chanwoo@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds the new clock id for CMU_CDRES (DRAM Express Controller)
geneates the clocks for DRAM and NoC (Network on Chip) bus clock.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 include/dt-bindings/clock/exynos5420.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/exynos5420.h b/include/dt-bindings/clock/exynos5420.h
index 17ab8394bec7..6fd21c291416 100644
--- a/include/dt-bindings/clock/exynos5420.h
+++ b/include/dt-bindings/clock/exynos5420.h
@@ -214,6 +214,9 @@
 #define CLK_MOUT_SW_ACLK400     651
 #define CLK_MOUT_USER_ACLK300_GSCL	652
 #define CLK_MOUT_SW_ACLK300_GSCL	653
+#define CLK_MOUT_MCLK_CDREX	654
+#define CLK_MOUT_BPLL		655
+#define CLK_MOUT_MX_MSPLL_CCORE	656
 
 /* divider clocks */
 #define CLK_DOUT_PIXEL		768
@@ -239,8 +242,14 @@
 #define CLK_DOUT_ACLK300_DISP1	788
 #define CLK_DOUT_ACLK300_GSCL	789
 #define CLK_DOUT_ACLK400_DISP1	790
+#define CLK_DOUT_PCLK_CDREX	791
+#define CLK_DOUT_SCLK_CDREX	792
+#define CLK_DOUT_ACLK_CDREX1	793
+#define CLK_DOUT_CCLK_DREX0	794
+#define CLK_DOUT_CLK2X_PHY0	795
+#define CLK_DOUT_PCLK_CORE_MEM	796
 
 /* must be greater than maximal clock id */
-#define CLK_NR_CLKS		791
+#define CLK_NR_CLKS		797
 
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS_5420_H */
-- 
1.9.1
