From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] spi: core: Add devm_spi_register_master()
Date: Sat, 31 Aug 2013 18:59:50 +0100
Message-ID: <1377971991-1494-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:51153 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754389Ab3HaSAE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 31 Aug 2013 14:00:04 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Help simplify the cleanup code for SPI master drivers by providing a
managed master registration function, ensuring that the master is
automatically unregistered whenever the device is unbound.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 Documentation/driver-model/devres.txt |  3 +++
 drivers/spi/spi.c                     | 35 +++++++++++++++++++++++++++++++++++
 include/linux/spi/spi.h               |  2 ++
 3 files changed, 40 insertions(+)

diff --git a/Documentation/driver-model/devres.txt b/Documentation/driver-model/devres.txt
index 3d9c2a7..5bdc8cb 100644
--- a/Documentation/driver-model/devres.txt
+++ b/Documentation/driver-model/devres.txt
@@ -303,3 +303,6 @@ PHY
 
 SLAVE DMA ENGINE
   devm_acpi_dma_controller_register()
+
+SPI
+  devm_spi_register_master()
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index ced0703..3d34045 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1245,6 +1245,41 @@ done:
 }
 EXPORT_SYMBOL_GPL(spi_register_master);
 
+static void devm_spi_unregister(struct device *dev, void *res)
+{
+	spi_unregister_master(*(struct spi_master **)res);
+}
+
+/**
+ * dev_spi_register_master - register managed SPI master controller
+ * @dev:    device managing SPI master
+ * @master: initialized master, originally from spi_alloc_master()
+ * Context: can sleep
+ *
+ * Register a SPI device as with spi_register_master() which will
+ * automatically be unregister
+ */
+int devm_spi_register_master(struct device *dev, struct spi_master *master)
+{
+	struct spi_master **ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_spi_unregister, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = spi_register_master(master);
+	if (ret != 0) {
+		*ptr = master;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_spi_register_master);
+
 static int __unregister(struct device *dev, void *null)
 {
 	spi_unregister_device(to_spi_device(dev));
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 887116d..4d634d6 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -434,6 +434,8 @@ extern struct spi_master *
 spi_alloc_master(struct device *host, unsigned size);
 
 extern int spi_register_master(struct spi_master *master);
+extern int devm_spi_register_master(struct device *dev,
+				    struct spi_master *master);
 extern void spi_unregister_master(struct spi_master *master);
 
 extern struct spi_master *spi_busnum_to_master(u16 busnum);
-- 
1.8.4.rc3
