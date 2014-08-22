From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 2/2] drivers/gpu/drm/vmwgfx/vmwgfx_fence.h: Add missing #define
Date: Fri, 22 Aug 2014 14:04:36 +0200
Message-ID: <1408709076-13260-2-git-send-email-linux@rasmusvillemoes.dk>
References: <1408709076-13260-1-git-send-email-linux@rasmusvillemoes.dk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1408709076-13260-1-git-send-email-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>
List-Id: linux-samsung-soc@vger.kernel.org

The name of the macro suggests that the include guard idiom was meant,
but the #define was missing.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
index faf2e78..1b48a22 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
@@ -26,6 +26,7 @@
  **************************************************************************/
 
 #ifndef _VMWGFX_FENCE_H_
+#define _VMWGFX_FENCE_H_
 
 #define VMW_FENCE_WAIT_TIMEOUT (5*HZ)
 
-- 
1.9.2
