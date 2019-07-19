From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] phy: core: document calibrate() method
Date: Fri, 19 Jul 2019 11:52:45 +0200
Message-ID: <20190719095245.17401-1-m.szyprowski@samsung.com>
References: <CGME20190719095254eucas1p29c9e6c7aac20cf89b589fd2f2036c485@eucas1p2.samsung.com>
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
 include/linux/phy/phy.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 15032f145063..46775e8b0ed9 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -101,6 +101,18 @@ struct phy_ops {
 	int	(*validate)(struct phy *phy, enum phy_mode mode, int submode,
 			    union phy_configure_opts *opts);
 	int	(*reset)(struct phy *phy);
+
+	/**
+	 * @calibrate:
+	 *
+	 * Optional.
+	 *
+	 * Used to calibrate phy, typically by adjusting some parameters
+	 * in runtime, which are otherwise lost after host controller
+	 * reset and cannot be set in phy_init() and phy_power_on().
+	 *
+	 * Returns: 0 if successful, an negative error code otherwise
+	 */
 	int	(*calibrate)(struct phy *phy);
 	void	(*release)(struct phy *phy);
 	struct module *owner;
-- 
2.17.1
