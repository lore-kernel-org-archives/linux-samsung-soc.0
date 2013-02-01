From: Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH V2 4/4] DMA: PL330: Modify pl330 filter based on new generic
 dma dt bindings.
Date: Fri, 01 Feb 2013 18:21:56 +0530
Message-ID: <1359723116-18173-5-git-send-email-padma.v@samsung.com>
References: <1359723116-18173-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1359723116-18173-1-git-send-email-padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, padma.kvr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, boojin.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch modify the filter function to filter the required channel
based on new filter params.

Signed-off-by: Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/dma/pl330.c |   15 ++++++---------
 1 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index ddf4dd0..14d84a4 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2392,15 +2392,12 @@ bool pl330_filter(struct dma_chan *chan, void *param)
 
 #ifdef CONFIG_OF
 	if (chan->device->dev->of_node) {
-		const __be32 *prop_value;
-		phandle phandle;
-		struct device_node *node;
-
-		prop_value = ((struct property *)param)->value;
-		phandle = be32_to_cpup(prop_value++);
-		node = of_find_node_by_phandle(phandle);
-		return ((chan->private == node) &&
-				(chan->chan_id == be32_to_cpup(prop_value)));
+		struct dma_pl330_filter_args *fargs = param;
+
+		if (chan->device != &fargs->pdmac->ddma)
+			return false;
+
+		return (chan->chan_id == fargs->chan_id);
 	}
 #endif
 
-- 
1.7.4.4
