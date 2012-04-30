From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 10/20] of/irq: fix interrupt parent lookup procedure
Date: Mon, 30 Apr 2012 12:14:20 -0700
Message-ID: <1335813270-13083-11-git-send-email-thomas.abraham@linaro.org>
References: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:47061 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756579Ab2D3TRM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Apr 2012 15:17:12 -0400
Received: by mail-pz0-f51.google.com with SMTP id z8so4463466dad.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Apr 2012 12:17:12 -0700 (PDT)
In-Reply-To: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

The interrupt parent lookup fails for a node that is a interrupt-controller
but does not have an explict interrupt-parent property and instead inherits
this property from the root node.

Consider the nodes listed below.

    / {
        interrupt-parent = <&intc_level1>;

        intc_level1: interrupt-controller@xxx {
                interrupt-controller;
                #interrupt-cells = <3>;
                <rest of the properties here>;
        };

        intc_level2: interrupt-controller@yyy {
                interrupt-controller;
                #interrupt-cells = <2>;
                <rest of the properties here>;
        };
    };

The interrupt parent lookup for interrupt-controller@yyy fails. It inherits
the interrupt-parent property from the root node and the root node ('/')
specifies a 'interrupt-parent' property which represents the default interrupt
root controller. But, the property '#interrupt-cells' might not be specified
in the root node.

In case a interrupt controller node does not include a 'interrupt-parent'
property but inherits that property from the root node, the check for
'interrupt-cells' property in the root node fails. Fix this removing the
check for 'interrupt-cells' property.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 drivers/of/irq.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 9cf0060..a520363 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -66,14 +66,16 @@ struct device_node *of_irq_find_parent(struct device_node *child)
 		if (parp == NULL)
 			p = of_get_parent(child);
 		else {
+			of_node_put(child);
 			if (of_irq_workarounds & OF_IMAP_NO_PHANDLE)
 				p = of_node_get(of_irq_dflt_pic);
 			else
 				p = of_find_node_by_phandle(be32_to_cpup(parp));
+			return p;
 		}
 		of_node_put(child);
 		child = p;
-	} while (p && of_get_property(p, "#interrupt-cells", NULL) == NULL);
+	} while (p);
 
 	return p;
 }
-- 
1.7.5.4
