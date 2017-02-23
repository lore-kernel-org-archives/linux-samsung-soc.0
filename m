From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] phy: phy-exynos-pcie: make it explicitly non-modular
Date: Thu, 23 Feb 2017 16:46:03 -0500
Message-ID: <20170223214603.18692-1-paul.gortmaker@windriver.com>
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
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Jaehoon Chung <jh80.chung@samsung.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Kukjin Kim <kgene@kernel.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/phy/Kconfig:config PHY_EXYNOS_PCIE
drivers/phy/Kconfig:    bool "Exynos PCIe PHY driver"

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modular infrastructure use, so that
when reading the driver there is no doubt it is builtin-only.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Jaehoon Chung <jh80.chung@samsung.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[ I'd normally not send patches in the merge window, but this driver
 just appeared in linux-next and so I'm assuming it is intended for
 addition during this merge window, hence we might as well fix it now.]

 drivers/phy/phy-exynos-pcie.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/phy-exynos-pcie.c b/drivers/phy/phy-exynos-pcie.c
index 4f60b83641d5..d92d8616a106 100644
--- a/drivers/phy/phy-exynos-pcie.c
+++ b/drivers/phy/phy-exynos-pcie.c
@@ -14,8 +14,8 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/init.h>
 #include <linux/mfd/syscon.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
@@ -228,7 +228,6 @@ static const struct of_device_id exynos_pcie_phy_match[] = {
 	},
 	{},
 };
-MODULE_DEVICE_TABLE(of, exynos_pcie_phy_match);
 
 static int exynos_pcie_phy_probe(struct platform_device *pdev)
 {
@@ -278,8 +277,4 @@ static struct platform_driver exynos_pcie_phy_driver = {
 		.name		= "exynos_pcie_phy",
 	}
 };
-module_platform_driver(exynos_pcie_phy_driver);
-
-MODULE_DESCRIPTION("Samsung S5P/EXYNOS SoC PCIe PHY driver");
-MODULE_AUTHOR("Jaehoon Chung <jh80.chung@samsung.com>");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(exynos_pcie_phy_driver);
-- 
2.11.0
