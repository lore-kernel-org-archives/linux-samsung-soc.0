From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] Documentation: dt: Explicitly mark Samsung Exynos SoC bindings
 as unstable
Date: Fri, 16 Dec 2016 15:14:36 +0100
Message-ID: <1481897676-13578-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Samsung Exynos SoCs and boards related bindings evolved since the initial
introduction, but initially the bindings were minimal and a bit incomplete
(they never described all the hardware modules available in the SoCs).
Since then some significant (not fully compatible) changes have been
already committed a few times (like gpio replaced by pinctrl, display ddc,
mfc reserved memory, some core clocks added to various hardware modules,
added more required nodes).

On the other side there are no boards which have device tree embedded in
the bootloader. Device tree blob is always compiled from the kernel tree
and updated together with the kernel image.

Thus to avoid further adding a bunch of workarounds for old/missing
bindings and allow to make cleanup of the existing code and device tree
files, lets mark Samsung Exynos SoC platform bindings as unstable. This
means that bindings can may change at any time and users should use the
dtb file compiled from the same kernel source tree as the kernel image.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 Documentation/devicetree/bindings/arm/samsung/exynos.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/exynos.txt

diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos.txt b/Documentation/devicetree/bindings/arm/samsung/exynos.txt
new file mode 100644
index 000000000000..0c606f4c6e85
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/samsung/exynos.txt
@@ -0,0 +1,12 @@
+Samsung Exynos SoC Family Device Tree Bindings
+---------------------------------------------------------------
+
+Work in progress statement:
+
+Device tree files and bindings applying to Samsung Exynos SoCs and boards are
+considered "unstable". Any Samsung Exynos device tree binding may change at any
+time. Be sure to use a device tree binary and a kernel image generated from the
+same source tree.
+
+Please refer to Documentation/devicetree/bindings/ABI.txt for a definition of a
+stable binding/ABI.
-- 
1.9.1
