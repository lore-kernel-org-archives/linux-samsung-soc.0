From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RFC 07/17] clk: mux: Switch to new clock controller API
Date: Tue, 16 Aug 2016 15:35:04 +0200
Message-ID: <1471354514-24224-8-git-send-email-k.kozlowski@samsung.com>
References: <1471354514-24224-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1471354514-24224-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org
Cc: a.hajda@samsung.com, Javier Martinez Canillas <javier@osg.samsung.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Allocate a clock controller and use new clk_register_with_ctrl() API.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/clk-mux.c        | 32 ++++++++++++++++++--------------
 drivers/clk/samsung/clk.c    |  4 ++--
 include/linux/clk-provider.h | 12 ++++++++----
 3 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index 16a3d5717f4e..a85bbef1992b 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -113,7 +113,8 @@ const struct clk_ops clk_mux_ro_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_mux_ro_ops);
 
-struct clk_hw *clk_hw_register_mux_table(struct device *dev, const char *name,
+struct clk_hw *clk_hw_register_mux_table(struct device *dev,
+		struct clk_ctrl *ctrl, const char *name,
 		const char * const *parent_names, u8 num_parents,
 		unsigned long flags,
 		void __iomem *reg, u8 shift, u32 mask,
@@ -159,7 +160,7 @@ struct clk_hw *clk_hw_register_mux_table(struct device *dev, const char *name,
 	mux->hw.init = &init;
 
 	hw = &mux->hw;
-	ret = clk_hw_register(dev, hw);
+	ret = clk_hw_register_with_ctrl(dev, ctrl, hw);
 	if (ret) {
 		kfree(mux);
 		hw = ERR_PTR(ret);
@@ -169,7 +170,8 @@ struct clk_hw *clk_hw_register_mux_table(struct device *dev, const char *name,
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_mux_table);
 
-struct clk *clk_register_mux_table(struct device *dev, const char *name,
+struct clk *clk_register_mux_table(struct device *dev, struct clk_ctrl *ctrl,
+		const char *name,
 		const char * const *parent_names, u8 num_parents,
 		unsigned long flags,
 		void __iomem *reg, u8 shift, u32 mask,
@@ -177,16 +179,17 @@ struct clk *clk_register_mux_table(struct device *dev, const char *name,
 {
 	struct clk_hw *hw;
 
-	hw = clk_hw_register_mux_table(dev, name, parent_names, num_parents,
-				       flags, reg, shift, mask, clk_mux_flags,
-				       table, lock);
+	hw = clk_hw_register_mux_table(dev, ctrl, name, parent_names,
+				       num_parents, flags, reg, shift, mask,
+				       clk_mux_flags, table, lock);
 	if (IS_ERR(hw))
 		return ERR_CAST(hw);
 	return hw->clk;
 }
 EXPORT_SYMBOL_GPL(clk_register_mux_table);
 
-struct clk *clk_register_mux(struct device *dev, const char *name,
+struct clk *clk_register_mux(struct device *dev, struct clk_ctrl *ctrl,
+		const char *name,
 		const char * const *parent_names, u8 num_parents,
 		unsigned long flags,
 		void __iomem *reg, u8 shift, u8 width,
@@ -194,13 +197,14 @@ struct clk *clk_register_mux(struct device *dev, const char *name,
 {
 	u32 mask = BIT(width) - 1;
 
-	return clk_register_mux_table(dev, name, parent_names, num_parents,
-				      flags, reg, shift, mask, clk_mux_flags,
-				      NULL, lock);
+	return clk_register_mux_table(dev, ctrl, name, parent_names,
+				      num_parents, flags, reg, shift, mask,
+				      clk_mux_flags, NULL, lock);
 }
 EXPORT_SYMBOL_GPL(clk_register_mux);
 
-struct clk_hw *clk_hw_register_mux(struct device *dev, const char *name,
+struct clk_hw *clk_hw_register_mux(struct device *dev, struct clk_ctrl *ctrl,
+		const char *name,
 		const char * const *parent_names, u8 num_parents,
 		unsigned long flags,
 		void __iomem *reg, u8 shift, u8 width,
@@ -208,9 +212,9 @@ struct clk_hw *clk_hw_register_mux(struct device *dev, const char *name,
 {
 	u32 mask = BIT(width) - 1;
 
-	return clk_hw_register_mux_table(dev, name, parent_names, num_parents,
-				      flags, reg, shift, mask, clk_mux_flags,
-				      NULL, lock);
+	return clk_hw_register_mux_table(dev, ctrl, name, parent_names,
+					 num_parents, flags, reg, shift, mask,
+					 clk_mux_flags, NULL, lock);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_mux);
 
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 79332011f258..1a296bbabd47 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -197,8 +197,8 @@ void __init samsung_clk_register_mux(struct samsung_clk_provider *ctx,
 	unsigned int idx, ret;
 
 	for (idx = 0; idx < nr_clk; idx++, list++) {
-		clk = clk_register_mux(NULL, list->name, list->parent_names,
-			list->num_parents, list->flags,
+		clk = clk_register_mux(NULL, ctx->clk_ctrl, list->name,
+			list->parent_names, list->num_parents, list->flags,
 			ctx->reg_base + list->offset,
 			list->shift, list->width, list->mux_flags, &ctx->lock);
 		if (IS_ERR(clk)) {
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 289290655283..f5f062d267a9 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -493,23 +493,27 @@ struct clk_mux {
 extern const struct clk_ops clk_mux_ops;
 extern const struct clk_ops clk_mux_ro_ops;
 
-struct clk *clk_register_mux(struct device *dev, const char *name,
+struct clk *clk_register_mux(struct device *dev, struct clk_ctrl *ctrl,
+		const char *name,
 		const char * const *parent_names, u8 num_parents,
 		unsigned long flags,
 		void __iomem *reg, u8 shift, u8 width,
 		u8 clk_mux_flags, spinlock_t *lock);
-struct clk_hw *clk_hw_register_mux(struct device *dev, const char *name,
+struct clk_hw *clk_hw_register_mux(struct device *dev, struct clk_ctrl *ctrl,
+		const char *name,
 		const char * const *parent_names, u8 num_parents,
 		unsigned long flags,
 		void __iomem *reg, u8 shift, u8 width,
 		u8 clk_mux_flags, spinlock_t *lock);
 
-struct clk *clk_register_mux_table(struct device *dev, const char *name,
+struct clk *clk_register_mux_table(struct device *dev, struct clk_ctrl *ctrl,
+		const char *name,
 		const char * const *parent_names, u8 num_parents,
 		unsigned long flags,
 		void __iomem *reg, u8 shift, u32 mask,
 		u8 clk_mux_flags, u32 *table, spinlock_t *lock);
-struct clk_hw *clk_hw_register_mux_table(struct device *dev, const char *name,
+struct clk_hw *clk_hw_register_mux_table(struct device *dev,
+		struct clk_ctrl *ctrl, const char *name,
 		const char * const *parent_names, u8 num_parents,
 		unsigned long flags,
 		void __iomem *reg, u8 shift, u32 mask,
-- 
1.9.1
