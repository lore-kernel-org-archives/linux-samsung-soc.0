From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 2/5] PM / devfreq: exynos-bus: Add the detailed correlation for
 Exynos5433
Date: Fri, 02 Dec 2016 16:18:04 +0900
Message-ID: <1480663087-4590-3-git-send-email-cw00.choi@samsung.com>
References: <1480663087-4590-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1480663087-4590-1-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: krzk@kernel.org, javier@osg.samsung.com, kgene@kernel.org, robh+dt@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, myungjoo.ham@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds the detailed corrleation between sub-blocks and VDD_INT power
line for Exynos5433. VDD_INT provided the power source to INT (Internal) block.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 Documentation/devicetree/bindings/devfreq/exynos-bus.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/devfreq/exynos-bus.txt b/Documentation/devicetree/bindings/devfreq/exynos-bus.txt
index d3ec8e676b6b..d085ef90d27c 100644
--- a/Documentation/devicetree/bindings/devfreq/exynos-bus.txt
+++ b/Documentation/devicetree/bindings/devfreq/exynos-bus.txt
@@ -123,6 +123,20 @@ Detailed correlation between sub-blocks and power line according to Exynos SoC:
 		|--- FSYS
 		|--- FSYS2
 
+- In case of Exynos5433, there is VDD_INT power line as following:
+	VDD_INT |--- G2D (parent device)
+		|--- MSCL
+		|--- GSCL
+		|--- JPEG
+		|--- MFC
+		|--- HEVC
+		|--- BUS0
+		|--- BUS1
+		|--- BUS2
+		|--- PERIS (Fixed clock rate)
+		|--- PERIC (Fixed clock rate)
+		|--- FSYS  (Fixed clock rate)
+
 Example1:
 	Show the AXI buses of Exynos3250 SoC. Exynos3250 divides the buses to
 	power line (regulator). The MIF (Memory Interface) AXI bus is used to
-- 
1.9.1
