From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [RFC PATCH v3 1/2] clk: samsung: Add a clock lookup function
Date: Mon, 30 Mar 2015 17:53:21 +0200
Message-ID: <1427730803-28635-2-git-send-email-javier.martinez@collabora.co.uk>
References: <1427730803-28635-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:43194 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752788AbbC3Pxj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 11:53:39 -0400
In-Reply-To: <1427730803-28635-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

The Samsung helpers functions to register clocks, add the clock instance
returned by the common clock framework to a lookup table that is used by
OF to lookup the clocks.

But this table could also be useful to clock drivers if they need to get
a clock instance since the helper functions don't return them.

The common clock framework __clk_lookup() function from the clk provider
API could be used by drivers as well. But it's more efficient to use the
Samsung specific lookup table that returns the clock instance in constant
time, than using the __clk_lookup() function that uses the clock name as
an index so it has a linear search time.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/clk/samsung/clk.c | 6 ++++++
 drivers/clk/samsung/clk.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 9e1f88c04fd4..3b2868a70774 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -96,6 +96,12 @@ void samsung_clk_add_lookup(struct samsung_clk_provider *ctx, struct clk *clk,
 		ctx->clk_data.clks[id] = clk;
 }
 
+struct clk *samsung_clk_lookup(struct samsung_clk_provider *ctx,
+				unsigned int id)
+{
+	return ctx->clk_data.clks ? ctx->clk_data.clks[id] : NULL;
+}
+
 /* register a list of aliases */
 void __init samsung_clk_register_alias(struct samsung_clk_provider *ctx,
 				struct samsung_clock_alias *list,
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index e4c75383cea7..ad04220bd733 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -368,6 +368,9 @@ extern void __init samsung_clk_of_register_fixed_ext(
 extern void samsung_clk_add_lookup(struct samsung_clk_provider *ctx,
 			struct clk *clk, unsigned int id);
 
+extern struct clk *samsung_clk_lookup(struct samsung_clk_provider *ctx,
+			unsigned int id);
+
 extern void samsung_clk_register_alias(struct samsung_clk_provider *ctx,
 			struct samsung_clock_alias *list,
 			unsigned int nr_clk);
-- 
2.1.4
