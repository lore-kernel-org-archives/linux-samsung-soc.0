From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [RFC 01/12] clk: propagate parent change up one level
Date: Mon, 21 Oct 2013 16:18:20 +0200
Message-ID: <1382365111-6533-2-git-send-email-t.stanislaws@samsung.com>
References: <1382365111-6533-1-git-send-email-t.stanislaws@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:11927 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752626Ab3JUOSx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Oct 2013 10:18:53 -0400
In-reply-to: <1382365111-6533-1-git-send-email-t.stanislaws@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, t.figa@samsung.com, kishon@ti.com, sw0312.kim@samsung.com, inki.dae@samsung.com, rahul.sharma@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, mturquette@linaro.org, Tomasz Stanislawski <t.stanislaws@samsung.com>

This patch adds support for propagation of setup of clock's parent one level
up.

This feature is helpful when a driver changes topology of its clocks using
clk_set_parent().  The problem occurs when on one platform/SoC driver's clock
is located at MUX output but on the other platform/SoC there is a gated proxy
clock between the MUX and driver's clock.  In such a case, driver's code has to
be modified to use one clock for enabling and the other clock for setup of a
parent.

The code updates are avoided by propagating setup of a parent up one level.

Additionally, this patch adds CLK_SET_PARENT_PARENT (sorry for naming) flag to
inform clk-core that clk_set_parent() should be propagated.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
---
 drivers/clk/clk.c            |    6 ++++++
 include/linux/clk-provider.h |    1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index a004769..14eda80 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1595,6 +1595,12 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 
 	/* try finding the new parent index */
 	if (parent) {
+		if ((clk->flags & CLK_SET_PARENT_PARENT)
+		    && clk->num_parents == 1) {
+			ret = clk_set_parent(clk->parent, parent);
+			goto out;
+		}
+
 		p_index = clk_fetch_parent_index(clk, parent);
 		p_rate = parent->rate;
 		if (p_index == clk->num_parents) {
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 73bdb69..83c98d5 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -29,6 +29,7 @@
 #define CLK_IS_BASIC		BIT(5) /* Basic clk, can't do a to_clk_foo() */
 #define CLK_GET_RATE_NOCACHE	BIT(6) /* do not use the cached clk rate */
 #define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate change */
+#define CLK_SET_PARENT_PARENT	BIT(8) /* propagate parent change up one level */
 
 struct clk_hw;
 
-- 
1.7.9.5
