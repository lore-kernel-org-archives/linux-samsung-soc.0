From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v3 09/14] regmap: Add regmap_reg_copy function
Date: Thu, 19 Jun 2014 20:20:35 +0200
Message-ID: <1403202040-12641-10-git-send-email-javier.martinez@collabora.co.uk>
References: <1403202040-12641-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1403202040-12641-1-git-send-email-javier.martinez@collabora.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Doug Anderson <dianders@chromium.org>, linux-samsung-soc@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Mark Brown <broonie@kernel.org>, Olof Johansson <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org, Daniel Stone <daniels@collabora.com>
List-Id: linux-samsung-soc@vger.kernel.org

Some device drivers using the register map API need to copy the
value from one register to another. Even though it can be done
with a combination of regmap_read() and regmap_write(), it is
better to have a function to avoid code duplication, sanity check
passed values and do it atomically by holding the regmap lock.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/base/regmap/regmap.c | 34 ++++++++++++++++++++++++++++++++++
 include/linux/regmap.h       |  9 +++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 74d8c06..a2e0b04 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -2555,6 +2555,40 @@ int regmap_parse_val(struct regmap *map, const void *buf,
 }
 EXPORT_SYMBOL_GPL(regmap_parse_val);
 
+/**
+ * regmap_reg_copy(): Copy a value from a single register to another one
+ *
+ * @map: Register map to operate on
+ * @dest: Register to copy the value to
+ * @src: Register to copy the value from
+ *
+ * A value of zero will be returned on success, a negative errno will
+ * be returned in error cases.
+ */
+int regmap_reg_copy(struct regmap *map, unsigned int dest, unsigned int src)
+{
+	int val;
+	int ret = 0;
+
+	if (dest == src)
+		return ret;
+
+	if (dest % map->reg_stride ||
+	    src % map->reg_stride)
+		return -EINVAL;
+
+	map->lock(map->lock_arg);
+
+	ret = _regmap_read(map, src, &val);
+	if (!ret)
+		ret = _regmap_write(map, dest, val);
+
+	map->unlock(map->lock_arg);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(regmap_reg_copy);
+
 static int __init regmap_initcall(void)
 {
 	regmap_debugfs_initcall();
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 7b0e4b4..116c22b 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -445,6 +445,8 @@ int regmap_register_patch(struct regmap *map, const struct reg_default *regs,
 int regmap_parse_val(struct regmap *map, const void *buf,
 				unsigned int *val);
 
+int regmap_reg_copy(struct regmap *map, unsigned int dest, unsigned int src);
+
 static inline bool regmap_reg_in_range(unsigned int reg,
 				       const struct regmap_range *range)
 {
@@ -723,6 +725,13 @@ static inline int regmap_parse_val(struct regmap *map, const void *buf,
 	return -EINVAL;
 }
 
+static inline int regmap_reg_copy(struct regmap *map, unsigned int dest,
+				  unsigned int src)
+{
+	WARN_ONCE(1, "regmap API is disabled");
+	return -EINVAL;
+}
+
 static inline struct regmap *dev_get_regmap(struct device *dev,
 					    const char *name)
 {
-- 
2.0.0.rc2
