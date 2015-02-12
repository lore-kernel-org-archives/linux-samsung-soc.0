From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v2 2/3] clk: Add __clk_hw_set_clk helper function
Date: Thu, 12 Feb 2015 14:58:29 +0100
Message-ID: <1423749510-14525-3-git-send-email-javier.martinez@collabora.co.uk>
References: <1423749510-14525-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423749510-14525-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>, Peter De Schrijver <pdeschrijver@nvidia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

After the clk API change to return a per-user clock instance, both the
struct clk_core and struct clk pointers from the hw clock needs to be
assigned to clock that share the same state.

In the future the struct clk_core will be removed and this is going to
change again so to avoid having to change the assignments twice in all
the drivers, add a helper function to have an indirection level.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

Changes since v1: None, new patch.
---
 include/linux/clk-provider.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 17dd6e9439d1..5591ea71a8d1 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -590,6 +590,12 @@ long __clk_mux_determine_rate_closest(struct clk_hw *hw, unsigned long rate,
 			      unsigned long *best_parent_rate,
 			      struct clk_hw **best_parent_p);
 
+static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
+{
+	dst->clk = src->clk;
+	dst->core = src->core;
+}
+
 /*
  * FIXME clock api without lock protection
  */
-- 
2.1.3
