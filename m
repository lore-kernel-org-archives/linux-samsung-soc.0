From: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v7 2/4] drm/exynos: mic: Fix parse_dt function
Date: Thu, 05 Jan 2017 19:20:07 +0900
Message-ID: <1483611609-23522-3-git-send-email-hoegeun.kwon@samsung.com>
References: <1483611609-23522-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170105102012epcas5p308c2d3ed269d9bf76f76f1d38422eb54@epcas5p3.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1483611609-23522-1-git-send-email-hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The OF graph is not necessary because the panel is a child of
dsi. therefore, the parse_dt function of dsi does not need to
check the remote_node connected to the panel. and the whole
parse_dt function should be refactored later.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index fed1a94..cf9361a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -269,28 +269,9 @@ static int parse_dt(struct exynos_mic *mic)
 		}
 		nodes[j++] = remote_node;
 
-		switch (i) {
-		case ENDPOINT_DECON_NODE:
-			/* decon node */
-			if (of_get_child_by_name(remote_node,
-						"i80-if-timings"))
-				mic->i80_mode = 1;
-
-			break;
-		case ENDPOINT_DSI_NODE:
-			/* panel node */
-			remote_node = get_remote_node(remote_node, 1);
-			if (!remote_node) {
-				ret = -EPIPE;
-				goto exit;
-			}
-			nodes[j++] = remote_node;
-
-			break;
-		default:
-			DRM_ERROR("mic: Unknown endpoint from MIC");
-			break;
-		}
+		if (i == ENDPOINT_DECON_NODE &&
+			of_get_child_by_name(remote_node, "i80-if-timings"))
+			mic->i80_mode = 1;
 	}
 
 exit:
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
