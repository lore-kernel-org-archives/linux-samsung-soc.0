From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 5/5] exynos/drm: add DT bindings for super device node
Date: Fri, 18 Apr 2014 15:41:10 +0900
Message-ID: <1397803270-5377-6-git-send-email-inki.dae@samsung.com>
References: <1397803270-5377-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1397803270-5377-1-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds bindings for Exynos drm display subsystem.
The bindings describes ports containing a list of phandles
pointing to display controller, image enhancer, and display
interfaces nodes.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../bindings/drm/exynos/samsung-exynos-drm.txt     |   32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/samsung-exynos-drm.txt

diff --git a/Documentation/devicetree/bindings/drm/exynos/samsung-exynos-drm.txt b/Documentation/devicetree/bindings/drm/exynos/samsung-exynos-drm.txt
new file mode 100644
index 0000000..6f7fae0
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/exynos/samsung-exynos-drm.txt
@@ -0,0 +1,32 @@
+Samsung Exynos DRM master device
+================================
+
+The Samsung Exynos DRM master device is a virtual device needed to list all
+display controller, image enhancer, and display interface nodes that comprise
+the graphics subsystem.
+
+Required properties:
+- compatible: Should be "samsung,exynos-display-subsystem"
+- ports: Should contain a list of phandles pointing to display controller,
+  image enhancer, and display interface ports.
+
+Examples:
+
+In case of using MIPI-DSI,
+display-subsystem {
+	compatible = "samsung,exynos-display-subsystem";
+	ports = <&fimd>, <&dsi>;
+};
+
+
+In case of using DisplayPort,
+display-subsystem {
+	compatible = "samsung,exynos-display-subsystem";
+	ports = <&fimd>, <&dp>;
+};
+
+In case of using parallel panel,
+display-subsystem {
+	compatible = "samsung,exynos-display-subsystem";
+	ports = <&fimd>;
+};
-- 
1.7.9.5
