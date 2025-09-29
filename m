Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87562207A20
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759120170; cv=none; b=pTkuYoqt5bT4T0ndQ3m9Na7Dr3KasIg4vdU4ynPzGtDuOxzTcsGT8Kh8GFn9wqebT1Z0YSXOaAhco02WU8IXvzRqJYIkGxre1zI+O1OUpXtwAfQefYuUE8XInzdYMTeopBGguv/ibTFixmxYrs3TCzR3Wsn2YrM1UsXjLsb3rk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759120170; c=relaxed/simple;
	bh=s/GCqPbeU4Eg1kMDOx5dQW1GJij75/kzPn0IXx5jF4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ms7VJI9VbsHQTZ1vJCuZwlAY1RgauLjp4hz4k5qhE3Fox1zvsBWwXgw2qntutUV7auFaAQa1McfqldqkGDnZn1PHLPYzm/rQ3NaMMooo4DfJa49WN2kEn5T+YN6RWU9Jt8+GYRpAizh3875GhCUsw9SGFObThM720HHDjmsxUtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=R0XsjvQO; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="R0XsjvQO"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250929042918epoutp0187635c9604e77da7df5f58a983c124d7~ppnbN-k0_0608606086epoutp01L
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250929042918epoutp0187635c9604e77da7df5f58a983c124d7~ppnbN-k0_0608606086epoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759120158;
	bh=Y74o6IOjQgwfeEIGmmm1c1vskXSR4OXN85rOUOM1PX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R0XsjvQO+w1Ywh/1MWZByziR5BfBr4OS6m4H5t/GbWJBGk96Xb/JCHvlf+g67jDlC
	 d3EJbm23myQ3qL4Tf8Ls24OmhMo2avzGux+usuUDPXTdrfMJnnbeqx0Mvr4YvkijTT
	 G0YjvAWsx3vMmqs9xaDfH0Dq+0Up3HB37e6Y3sJM=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250929042918epcas2p2580ef12c45a153d3b0312026dfaf0c63~ppnavDpyh1831418314epcas2p2S;
	Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.208]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cZp9n5bpbz6B9mJ; Mon, 29 Sep
	2025 04:29:17 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250929042917epcas2p4c8f375cc2355b3a48141cdddb04a01c4~ppnZ5GzZ60613506135epcas2p4p;
	Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
Received: from tayo (unknown [10.229.9.198]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250929042917epsmtip1030b8011b124a863d36bf014cdf0ad72~ppnZ0uSI12522725227epsmtip1m;
	Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
From: Hoyoung Lee <hy_fifty.lee@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: Hoyoung Lee <hy_fifty.lee@samsung.com>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/exynos: plane: Disable fully off-screen planes
 instead of zero-sized update
Date: Mon, 29 Sep 2025 13:31:08 +0900
Message-ID: <20250929043110.3631025-2-hy_fifty.lee@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250929042917epcas2p4c8f375cc2355b3a48141cdddb04a01c4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250929042917epcas2p4c8f375cc2355b3a48141cdddb04a01c4
References: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
	<CGME20250929042917epcas2p4c8f375cc2355b3a48141cdddb04a01c4@epcas2p4.samsung.com>

Some configurations require additional actions when all windows are
disabled to keep DECON operating correctly. Programming a zero-sized window
in ->atomic_update() leaves the plane logically enabled and can bypass
those disable semantics.

Treat a fully off-screen plane as not visible and take the explicit disable
path.

Implementation details:
- exynos_plane_mode_set(): if computed actual_w/actual_h is zero, mark
  state->visible = false and return early.
- exynos_plane_atomic_check(): if !visible, skip further checks and
  return 0.
- exynos_plane_atomic_update(): if !visible, call ->disable_plane();
  otherwise call ->update_plane().

No functional change for visible planes; off-screen planes are now cleanly
disabled, ensuring the disable hooks run consistently.

Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 7c3aa77186d3..842974154d79 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -91,6 +91,11 @@ static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
 	actual_w = exynos_plane_get_size(crtc_x, crtc_w, mode->hdisplay);
 	actual_h = exynos_plane_get_size(crtc_y, crtc_h, mode->vdisplay);
 
+	if (!actual_w || !actual_h) {
+		state->visible = false;
+		return;
+	}
+
 	if (crtc_x < 0) {
 		if (actual_w)
 			src_x += ((-crtc_x) * exynos_state->h_ratio) >> 16;
@@ -244,6 +249,9 @@ static int exynos_plane_atomic_check(struct drm_plane *plane,
 	/* translate state into exynos_state */
 	exynos_plane_mode_set(exynos_state);
 
+	if (!new_plane_state->visible)
+		return 0;
+
 	ret = exynos_drm_plane_check_format(exynos_plane->config, exynos_state);
 	if (ret)
 		return ret;
@@ -263,8 +271,10 @@ static void exynos_plane_atomic_update(struct drm_plane *plane,
 	if (!new_state->crtc)
 		return;
 
-	if (exynos_crtc->ops->update_plane)
+	if (new_state->visible && exynos_crtc->ops->update_plane)
 		exynos_crtc->ops->update_plane(exynos_crtc, exynos_plane);
+	else if (exynos_crtc->ops->disable_plane)
+		exynos_crtc->ops->disable_plane(exynos_crtc, exynos_plane);
 }
 
 static void exynos_plane_atomic_disable(struct drm_plane *plane,
-- 
2.34.1

