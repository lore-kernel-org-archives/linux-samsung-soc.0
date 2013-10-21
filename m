From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [RFC 03/12] clk: exynos4: enable clk_set_parent() propagation for
	sclk_hdmi and sclk_mixer clocks
Date: Mon, 21 Oct 2013 16:18:22 +0200
Message-ID: <1382365111-6533-4-git-send-email-t.stanislaws@samsung.com>
References: <1382365111-6533-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-reply-to: <1382365111-6533-1-git-send-email-t.stanislaws@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, kgene.kim@samsung.com, mturquette@linaro.org, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, kishon@ti.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, rahul.sharma@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch enables clk_set_parent() propagation for clocks used
by s5p-tv and exynos-drm drivers.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index df79ca6..1f58b7c 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -605,7 +605,8 @@ static struct samsung_gate_clock exynos4_gate_clks[] __initdata = {
 	 * the device name and clock alias names specified below for some
 	 * of the clocks can be removed.
 	 */
-	GATE(sclk_hdmi, "sclk_hdmi", "mout_hdmi", SRC_MASK_TV, 0, 0, 0),
+	GATE(sclk_hdmi, "sclk_hdmi", "mout_hdmi", SRC_MASK_TV, 0,
+			CLK_SET_PARENT_PARENT, 0),
 	GATE(sclk_spdif, "sclk_spdif", "mout_spdif", SRC_MASK_PERIL1, 8, 0, 0),
 	GATE(jpeg, "jpeg", "aclk160", GATE_IP_CAM, 6, 0, 0),
 	GATE(mie0, "mie0", "aclk160", GATE_IP_LCD0, 1, 0, 0),
@@ -801,7 +802,8 @@ static struct samsung_gate_clock exynos4210_gate_clks[] __initdata = {
 			E4210_SRC_MASK_LCD1, 12, CLK_SET_RATE_PARENT, 0),
 	GATE(sclk_sata, "sclk_sata", "div_sata",
 			SRC_MASK_FSYS, 24, CLK_SET_RATE_PARENT, 0),
-	GATE(sclk_mixer, "sclk_mixer", "mout_mixer", SRC_MASK_TV, 4, 0, 0),
+	GATE(sclk_mixer, "sclk_mixer", "mout_mixer", SRC_MASK_TV, 4,
+			CLK_SET_PARENT_PARENT, 0),
 	GATE(sclk_dac, "sclk_dac", "mout_dac", SRC_MASK_TV, 8, 0, 0),
 	GATE(tsadc, "tsadc", "aclk100", GATE_IP_PERIL, 15,
 			0, 0),
-- 
1.7.9.5
