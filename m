From: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [RESEND][PATCHv2 2/3] of: Add memory limiting function for flattened devicetrees
Date: Tue, 15 Jul 2014 10:03:35 -0700
Message-ID: <1405443816-29917-3-git-send-email-lauraa@codeaurora.org>
References: <1405443816-29917-1-git-send-email-lauraa@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405443816-29917-1-git-send-email-lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tushar Behera <trblinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


Buggy bootloaders may pass bogus memory entries in the devicetree.
Add of_fdt_limit_memory to add an upper bound on the number of
entries that can be present in the devicetree.

Signed-off-by: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/of/fdt.c       | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_fdt.h |  1 +
 2 files changed, 49 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 55bfca9..fd5db5a 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -26,6 +26,54 @@
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
 
+/*
+ * of_fdt_limit_memory - limit the number of regions in the /memory node
+ * @limit: maximum entries
+ *
+ * Adjust the flattened device tree to have at most 'limit' number of
+ * memory entries in the /memory node. This function may be called
+ * any time after initial_boot_param is set.
+ */
+void of_fdt_limit_memory(int limit)
+{
+	int memory;
+	int len;
+	const void *val;
+	int nr_address_cells = OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
+	int nr_size_cells = OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
+	const uint32_t *addr_prop;
+	const uint32_t *size_prop;
+	int root_offset;
+	int cell_size;
+
+	root_offset = fdt_path_offset(initial_boot_params, "/");
+	if (root_offset < 0)
+		return;
+
+	addr_prop = fdt_getprop(initial_boot_params, root_offset,
+				"#address-cells", NULL);
+	if (addr_prop)
+		nr_address_cells = fdt32_to_cpu(*addr_prop);
+
+	size_prop = fdt_getprop(initial_boot_params, root_offset,
+				"#size-cells", NULL);
+	if (size_prop)
+		nr_size_cells = fdt32_to_cpu(*size_prop);
+
+	cell_size = sizeof(uint32_t)*(nr_address_cells + nr_size_cells);
+
+	memory = fdt_path_offset(initial_boot_params, "/memory");
+	if (memory > 0) {
+		val = fdt_getprop(initial_boot_params, memory, "reg", &len);
+		if (len > limit*cell_size) {
+			len = limit*cell_size;
+			pr_debug("Limiting number of entries to %d\n", limit);
+			fdt_setprop(initial_boot_params, memory, "reg", val,
+					len);
+		}
+	}
+}
+
 /**
  * of_fdt_is_compatible - Return true if given node from the given blob has
  * compat in its compatible list
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index d600993..1aea25c 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -86,6 +86,7 @@ extern void unflatten_and_copy_device_tree(void);
 extern void early_init_devtree(void *);
 extern void early_get_first_memblock_info(void *, phys_addr_t *);
 extern u64 fdt_translate_address(const void *blob, int node_offset);
+extern void of_fdt_limit_memory(int limit);
 #else /* CONFIG_OF_FLATTREE */
 static inline void early_init_fdt_scan_reserved_mem(void) {}
 static inline const char *of_flat_dt_get_machine_name(void) { return NULL; }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
