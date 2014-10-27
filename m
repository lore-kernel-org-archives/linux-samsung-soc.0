From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Mon, 27 Oct 2014 23:57:34 +0000
Message-ID: <20141027235734.GX27405@n2100.arm.linux.org.uk>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
 <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
 <20141027190137.GT26941@phenom.ffwll.local>
 <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
 <CAKMK7uEch65=ZuaG=4JY2u3S3w5RND+uNc5+qL=tWxDLfEqEwQ@mail.gmail.com>
 <CAKMK7uEtNMOTg2j9XYN91_gRWWxHCfnb57HHpsdXki+T-rvwYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:46217 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752369AbaJ0X5x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Oct 2014 19:57:53 -0400
Content-Disposition: inline
In-Reply-To: <CAKMK7uEtNMOTg2j9XYN91_gRWWxHCfnb57HHpsdXki+T-rvwYg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Sean Paul <seanpaul@chromium.org>, Thierry Reding <treding@nvidia.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Rob Clark <robdclark@gmail.com>, Ajay kumar <ajaynumb@gmail.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

On Mon, Oct 27, 2014 at 11:26:30PM +0100, Daniel Vetter wrote:
> Looking at the of_drm_find_panel function I actually wonder how that
> works - the drm_panel doesn't really need to stick around afaics.
> After all panel_list is global so some other driver can unload.
> Russell's of support for possible_crtcs code works differently since
> it only looks at per-drm_device lists.
> 
> This bridge code here though suffers from the same. So to me this
> looks rather fishy.
> 
> It doesn't help that we have drm_of.[hc] around but not all the of
> code is in there. Adding Russell too.

I rather dropped the ball with imx-drm when things became difficult with
asking Greg to pull my git tree - and as a result, I decided that I would
no longer be helping with patch submission for imx-drm, nor trying to get
it out of the staging tree anymore.

I do still have the patch (dated from July) in my git tree which adds it
to imx-drm - see below.  Rebased to 3.18-rc2 today.

I also have a patch (from April) which creates a generic OF DDC connector
helper, but that remains unfinished, in the sense that it lives beside
imx-drm, pulling the DDC specific code out of imx-hdmi and imx-tve, even
though there's nothing imx-drm specific about it.

8<====
From: Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH] imx-drm: convert imx-drm to use the generic DRM OF helper

Use the generic DRM OF helper to locate the possible CRTCs for the
encoder, thereby shrinking the imx-drm driver some more.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 drivers/staging/imx-drm/imx-drm-core.c | 72 ++++++----------------------------
 1 file changed, 13 insertions(+), 59 deletions(-)

diff --git a/drivers/staging/imx-drm/imx-drm-core.c b/drivers/staging/imx-drm/imx-drm-core.c
index 9cb222e2996f..5e2c1f4b9165 100644
--- a/drivers/staging/imx-drm/imx-drm-core.c
+++ b/drivers/staging/imx-drm/imx-drm-core.c
@@ -24,6 +24,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_of.h>
 
 #include "imx-drm.h"
 
@@ -47,7 +48,6 @@ struct imx_drm_crtc {
 	struct drm_crtc				*crtc;
 	int					pipe;
 	struct imx_drm_crtc_helper_funcs	imx_drm_helper_funcs;
-	struct device_node			*port;
 };
 
 static int legacyfb_depth = 16;
@@ -366,9 +366,10 @@ int imx_drm_add_crtc(struct drm_device *drm, struct drm_crtc *crtc,
 
 	imx_drm_crtc->imx_drm_helper_funcs = *imx_drm_helper_funcs;
 	imx_drm_crtc->pipe = imxdrm->pipes++;
-	imx_drm_crtc->port = port;
 	imx_drm_crtc->crtc = crtc;
 
+	crtc->port = port;
+
 	imxdrm->crtc[imx_drm_crtc->pipe] = imx_drm_crtc;
 
 	*new_crtc = imx_drm_crtc;
@@ -409,34 +410,6 @@ int imx_drm_remove_crtc(struct imx_drm_crtc *imx_drm_crtc)
 }
 EXPORT_SYMBOL_GPL(imx_drm_remove_crtc);
 
-/*
- * Find the DRM CRTC possible mask for the connected endpoint.
- *
- * The encoder possible masks are defined by their position in the
- * mode_config crtc_list.  This means that CRTCs must not be added
- * or removed once the DRM device has been fully initialised.
- */
-static uint32_t imx_drm_find_crtc_mask(struct imx_drm_device *imxdrm,
-	struct device_node *endpoint)
-{
-	struct device_node *port;
-	unsigned i;
-
-	port = of_graph_get_remote_port(endpoint);
-	if (!port)
-		return 0;
-	of_node_put(port);
-
-	for (i = 0; i < MAX_CRTC; i++) {
-		struct imx_drm_crtc *imx_drm_crtc = imxdrm->crtc[i];
-
-		if (imx_drm_crtc && imx_drm_crtc->port == port)
-			return drm_crtc_mask(imx_drm_crtc->crtc);
-	}
-
-	return 0;
-}
-
 static struct device_node *imx_drm_of_get_next_endpoint(
 		const struct device_node *parent, struct device_node *prev)
 {
@@ -449,35 +422,16 @@ static struct device_node *imx_drm_of_get_next_endpoint(
 int imx_drm_encoder_parse_of(struct drm_device *drm,
 	struct drm_encoder *encoder, struct device_node *np)
 {
-	struct imx_drm_device *imxdrm = drm->dev_private;
-	struct device_node *ep = NULL;
-	uint32_t crtc_mask = 0;
-	int i;
+	uint32_t crtc_mask = drm_of_find_possible_crtcs(drm, np);
 
-	for (i = 0; ; i++) {
-		u32 mask;
-
-		ep = imx_drm_of_get_next_endpoint(np, ep);
-		if (!ep)
-			break;
-
-		mask = imx_drm_find_crtc_mask(imxdrm, ep);
-
-		/*
-		 * If we failed to find the CRTC(s) which this encoder is
-		 * supposed to be connected to, it's because the CRTC has
-		 * not been registered yet.  Defer probing, and hope that
-		 * the required CRTC is added later.
-		 */
-		if (mask == 0)
-			return -EPROBE_DEFER;
-
-		crtc_mask |= mask;
-	}
-
-	of_node_put(ep);
-	if (i == 0)
-		return -ENOENT;
+	/*
+	 * If we failed to find the CRTC(s) which this encoder is
+	 * supposed to be connected to, it's because the CRTC has
+	 * not been registered yet.  Defer probing, and hope that
+	 * the required CRTC is added later.
+	 */
+	if (crtc_mask == 0)
+		return -EPROBE_DEFER;
 
 	encoder->possible_crtcs = crtc_mask;
 
@@ -511,7 +465,7 @@ int imx_drm_encoder_get_mux_id(struct device_node *node,
 
 		port = of_graph_get_remote_port(ep);
 		of_node_put(port);
-		if (port == imx_crtc->port) {
+		if (port == imx_crtc->crtc->port) {
 			ret = of_graph_parse_endpoint(ep, &endpoint);
 			return ret ? ret : endpoint.port;
 		}
-- 
1.8.3.1



-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
