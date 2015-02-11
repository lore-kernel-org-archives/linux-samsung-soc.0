From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 1/2] clk: Don't dereference parent clock if is NULL
Date: Wed, 11 Feb 2015 11:13:30 +0100
Message-ID: <1423649612-31746-2-git-send-email-javier.martinez@collabora.co.uk>
References: <1423649612-31746-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:45306 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752159AbbBKKNr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Feb 2015 05:13:47 -0500
In-Reply-To: <1423649612-31746-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

The clock passed as an argument to clk_mux_determine_rate_flags() can
not have a parent clock if is either a root clock or an orphan.

In those cases parent is NULL so parent->hw shouldn't be dereferenced.

Fixes: 035a61c314eb3 ("clk: Make clk API return per-user struct clk instances")
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7f53166af5e6..7bd8893c94d6 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -799,7 +799,7 @@ clk_mux_determine_rate_flags(struct clk_hw *hw, unsigned long rate,
 	/* if NO_REPARENT flag set, pass through to current parent */
 	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
 		parent = core->parent;
-		if (core->flags & CLK_SET_RATE_PARENT)
+		if (core->flags & CLK_SET_RATE_PARENT && parent)
 			best = __clk_determine_rate(parent->hw, rate,
 						    min_rate, max_rate);
 		else if (parent)
-- 
2.1.3
