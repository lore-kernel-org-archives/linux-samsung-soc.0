From: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/3 v3] exynos: i2c: Change FDT bus setup code to enumerate
 ports correctly
Date: Tue, 15 Oct 2013 10:43:15 +0530
Message-ID: <1381813995-16050-1-git-send-email-ch.naveen@samsung.com>
References: <1380524290-9644-3-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1380524290-9644-3-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, d.mueller-Xx/oXIv9zdPtRgLqZ5aouw@public.gmane.org, trini-l0cyMroinI0@public.gmane.org, mk7.kang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

At present the i2c ports are enumerated in a strange way - the
fdtdec_find_aliases_for_id() function is used, but then the ID returned
is ignored and the ports are renumbered. The effect is the same provided
that the device tree has the ports in the same order, or uses aliases,
and has no gaps, but it is not correct.

Adjust the code to use the function as intended. This will allows device
tree aliases to change the device order if required.

As a result, the i2c_busses variable is dropped. We can't be sure that
there are no 'holes' in the list of buses, so must check the whole
array.

Note: it seems that non-FDT operation is now broken in this drive and
will need to be reinstated for upstream.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-on: https://gerrit.chromium.org/gerrit/59369
Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Changes since v1:
Nonei

Changes since v2:
None
 drivers/i2c/s3c24x0_i2c.c |   25 ++++++++++++++++++-------
 drivers/i2c/s3c24x0_i2c.h |    1 +
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/s3c24x0_i2c.c b/drivers/i2c/s3c24x0_i2c.c
index c65360d..0e6f241 100644
--- a/drivers/i2c/s3c24x0_i2c.c
+++ b/drivers/i2c/s3c24x0_i2c.c
@@ -52,7 +52,6 @@
  */
 static unsigned int g_current_bus __attribute__((section(".data")));
 #ifdef CONFIG_OF_CONTROL
-static int i2c_busses __attribute__((section(".data")));
 static struct s3c24x0_i2c_bus i2c_bus[CONFIG_MAX_I2C_NUM]
 			__attribute__((section(".data")));
 #endif
@@ -164,8 +163,8 @@ int i2c_set_bus_num(unsigned int bus)
 {
 	struct s3c24x0_i2c *i2c;
 
-	if ((bus < 0) || (bus >= CONFIG_MAX_I2C_NUM)) {
-		debug("Bad bus: %d\n", bus);
+	i2c_bus = get_bus(bus);
+	if (!i2c_bus)
 		return -1;
 	}
 
@@ -483,19 +482,31 @@ void board_i2c_init(const void *blob)
 		if (node <= 0)
 			continue;
 		bus = &i2c_bus[i];
+		bus->active = true;
 		bus->regs = (struct s3c24x0_i2c *)
 			fdtdec_get_addr(blob, node, "reg");
 		bus->id = pinmux_decode_periph_id(blob, node);
 		bus->node = node;
-		bus->bus_num = i2c_busses++;
+		bus->bus_num = i;
 		exynos_pinmux_config(bus->id, 0);
 	}
 }
 
+/**
+ * Get a pointer to the given bus index
+ *
+ * @bus_idx: Bus index to look up
+ * @return pointer to bus, or NULL if invalid or not available
+ */
 static struct s3c24x0_i2c_bus *get_bus(unsigned int bus_idx)
 {
-	if (bus_idx < i2c_busses)
-		return &i2c_bus[bus_idx];
+	if (bus_idx < ARRAY_SIZE(i2c_bus)) {
+		struct s3c24x0_i2c_bus *bus;
+
+		bus = &i2c_bus[bus_idx];
+		if (bus->active)
+			return bus;
+	}
 
 	debug("Undefined bus: %d\n", bus_idx);
 	return NULL;
@@ -505,7 +516,7 @@ int i2c_get_bus_num_fdt(int node)
 {
 	int i;
 
-	for (i = 0; i < i2c_busses; i++) {
+	for (i = 0; i < ARRAY_SIZE(i2c_bus); i++) {
 		if (node == i2c_bus[i].node)
 			return i;
 	}
diff --git a/drivers/i2c/s3c24x0_i2c.h b/drivers/i2c/s3c24x0_i2c.h
index b4a337a..882af62 100644
--- a/drivers/i2c/s3c24x0_i2c.h
+++ b/drivers/i2c/s3c24x0_i2c.h
@@ -16,6 +16,7 @@ struct s3c24x0_i2c {
 };
 
 struct s3c24x0_i2c_bus {
+	bool active;	/* port is active and available */
 	int node;	/* device tree node */
 	int bus_num;	/* i2c bus number */
 	struct s3c24x0_i2c *regs;
-- 
1.7.10.4
