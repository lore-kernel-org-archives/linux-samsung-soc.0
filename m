From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH] drm/atomic: only run atomic_check() if crtc is active
Date: Fri, 13 Nov 2015 11:45:58 -0200
Message-ID: <1447422358-18891-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f175.google.com ([209.85.160.175]:33644 "EHLO
	mail-yk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753238AbbKMNqF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Nov 2015 08:46:05 -0500
Received: by ykdv3 with SMTP id v3so146319520ykd.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2015 05:46:04 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Fixes an regression added by 3ae2436 (drm/exynos/mixer: replace
direct cross-driver call with drm mode) and while this regression was
caused by a change in the exynos driver it makes sense to add the
check on atomic core to benefit other drivers as well.

The whole atomic update fails if the exynos hdmi display is not
present/active.  Add a test to only run atomic_check() if the CRTC is
active.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/drm_atomic_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 0c6f621..7e3cb48 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -510,6 +510,9 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 	for_each_crtc_in_state(state, crtc, crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
 
+		if (!crtc_state->active)
+			continue;
+
 		funcs = crtc->helper_private;
 
 		if (!funcs || !funcs->atomic_check)
-- 
2.1.0
