From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v2 1/3] clk: Don't dereference parent clock if is NULL
Date: Thu, 12 Feb 2015 14:58:28 +0100
Message-ID: <1423749510-14525-2-git-send-email-javier.martinez@collabora.co.uk>
References: <1423749510-14525-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423749510-14525-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>, Peter De Schrijver <pdeschrijver@nvidia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

The clock passed as an argument to clk_mux_determine_rate_flags()
has the CLK_SET_RATE_PARENT flag set but it has no parent, then a
NULL pointer will tried to be dereferenced.

This shouldn't happen since setting that flag for a clock with no
parent is a bug but the core should be robust to handle that case.

Fixes: 035a61c314eb3 ("clk: Make clk API return per-user struct clk instances")
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

Changes since v2:
 - Pass NULL struct clk_hw argument to __clk_determine_rate() if parent is NULL.
   suggested by Stephen Boyd.
---
 drivers/clk/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7f53166af5e6..5941af7b4665 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -800,8 +800,8 @@ clk_mux_determine_rate_flags(struct clk_hw *hw, unsigned long rate,
 	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
 		parent = core->parent;
 		if (core->flags & CLK_SET_RATE_PARENT)
-			best = __clk_determine_rate(parent->hw, rate,
-						    min_rate, max_rate);
+			best = __clk_determine_rate(parent ? parent->hw : NULL,
+						    rate, min_rate, max_rate);
 		else if (parent)
 			best = clk_core_get_rate_nolock(parent);
 		else
-- 
2.1.3
