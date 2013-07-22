From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v2 1/8] clk: mux: Add support for read-only muxes.
Date: Tue, 23 Jul 2013 01:49:18 +0200
Message-ID: <1374536965-3545-2-git-send-email-tomasz.figa@gmail.com>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:49368 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752717Ab3GVXth (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 19:49:37 -0400
In-Reply-To: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>

Some platforms have read-only clock muxes that are preconfigured at
reset and cannot be changed at runtime. This patch extends mux clock
driver to allow handling such read-only muxes by adding new
CLK_MUX_READ_ONLY mux flag.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/clk/clk-mux.c        | 10 +++++++++-
 include/linux/clk-provider.h |  2 ++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index 614444c..92f1a1b 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -107,6 +107,11 @@ const struct clk_ops clk_mux_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_mux_ops);
 
+const struct clk_ops clk_mux_ro_ops = {
+	.get_parent = clk_mux_get_parent,
+};
+EXPORT_SYMBOL_GPL(clk_mux_ro_ops);
+
 struct clk *clk_register_mux_table(struct device *dev, const char *name,
 		const char **parent_names, u8 num_parents, unsigned long flags,
 		void __iomem *reg, u8 shift, u32 mask,
@@ -133,7 +138,10 @@ struct clk *clk_register_mux_table(struct device *dev, const char *name,
 	}
 
 	init.name = name;
-	init.ops = &clk_mux_ops;
+	if (clk_mux_flags & CLK_MUX_READ_ONLY)
+		init.ops = &clk_mux_ro_ops;
+	else
+		init.ops = &clk_mux_ops;
 	init.flags = flags | CLK_IS_BASIC;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 1ec14a7..9487b96 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -327,8 +327,10 @@ struct clk_mux {
 #define CLK_MUX_INDEX_ONE		BIT(0)
 #define CLK_MUX_INDEX_BIT		BIT(1)
 #define CLK_MUX_HIWORD_MASK		BIT(2)
+#define CLK_MUX_READ_ONLY	BIT(3) /* mux setting cannot be changed */
 
 extern const struct clk_ops clk_mux_ops;
+extern const struct clk_ops clk_mux_ro_ops;
 
 struct clk *clk_register_mux(struct device *dev, const char *name,
 		const char **parent_names, u8 num_parents, unsigned long flags,
-- 
1.8.3.2
