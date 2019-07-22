From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] phy: core: document phy_calibrate()
Date: Mon, 22 Jul 2019 19:32:23 +0200
Message-ID: <20190722173223.19518-1-m.szyprowski@samsung.com>
References: <CGME20190722173236eucas1p171299dfaa34f3124622df488bfe57a89@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Commit 36914111e682 ("drivers: phy: add calibrate method") added support
for generic phy_calibrate() method, but it didn't explain in detail when
such method is supposed to be called. Add some more documentation directly
to the phy.h to make it clean that it is intended to be called after every
host controller reset.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/phy/phy-core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index e3880c4a15f2..b04f4fe85ac2 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -394,6 +394,16 @@ int phy_reset(struct phy *phy)
 }
 EXPORT_SYMBOL_GPL(phy_reset);
 
+/**
+ * phy_calibrate() - Tunes the phy hw parameters for current configuration
+ * @phy: the phy returned by phy_get()
+ *
+ * Used to calibrate phy hardware, typically by adjusting some parameters in
+ * runtime, which are otherwise lost after host controller reset and cannot
+ * be applied in phy_init() or phy_power_on().
+ *
+ * Returns: 0 if successful, an negative error code otherwise
+ */
 int phy_calibrate(struct phy *phy)
 {
 	int ret;
-- 
2.17.1
