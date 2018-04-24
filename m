From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFC 02/10] ata: ahci-platform: Remove support for Exynos5440
Date: Tue, 24 Apr 2018 22:32:31 +0200
Message-ID: <20180424203239.21885-3-krzk__39727.27293517$1524602050$gmane$org@kernel.org>
References: <20180424203239.21885-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180424203239.21885-1-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org
Cc: Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The Exynos5440 is not actively developed, there are no development
boards available and probably there are no real products with it.
Remove wide-tree support for Exynos5440.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/ata/ahci-platform.txt | 1 -
 drivers/ata/ahci_platform.c                             | 1 -
 2 files changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/ata/ahci-platform.txt b/Documentation/devicetree/bindings/ata/ahci-platform.txt
index c760ecb81381..663766685818 100644
--- a/Documentation/devicetree/bindings/ata/ahci-platform.txt
+++ b/Documentation/devicetree/bindings/ata/ahci-platform.txt
@@ -17,7 +17,6 @@ Required properties:
   - "marvell,armada-380-ahci"
   - "marvell,armada-3700-ahci"
   - "snps,dwc-ahci"
-  - "snps,exynos5440-ahci"
   - "snps,spear-ahci"
   - "generic-ahci"
 - interrupts        : <interrupt mapping for SATA IRQ>
diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
index 99f9a895a459..564570ea3e27 100644
--- a/drivers/ata/ahci_platform.c
+++ b/drivers/ata/ahci_platform.c
@@ -75,7 +75,6 @@ static const struct of_device_id ahci_of_match[] = {
 	{ .compatible = "generic-ahci", },
 	/* Keep the following compatibles for device tree compatibility */
 	{ .compatible = "snps,spear-ahci", },
-	{ .compatible = "snps,exynos5440-ahci", },
 	{ .compatible = "ibm,476gtr-ahci", },
 	{ .compatible = "snps,dwc-ahci", },
 	{ .compatible = "hisilicon,hisi-ahci", },
-- 
2.14.1
