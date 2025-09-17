Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6928E32BC1D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 14:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758120416; cv=none; b=tr04zGvExah339a/qLqzbKmBlcyhAy6Qlxu2z83WY18yss9RYX1wpLBycNdbzN2RGMbn70UfJ82mjzvO2Rv524qztUVxRlriMqlaPE4zKLW20oWrGOPHKQwtbIUEv3Wis0ukakEwIOpIxtH0kA16elnRH6jVQbvSWMLwqVwTPm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758120416; c=relaxed/simple;
	bh=RhV3vKNoJmITjtgf6bFTsa7XOh0uqQKzGR+gqpl6FiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0iQ0jZP9phHRHuCoiPWeZbU8lyrPtMKK8jBEWavWJ4amvevNEz1apemiiZsA/STE+36dz0lXkihUvL08ImhWNBSLeVig4yOe0f9aBbwzsHhhRECuWOe+dDwH/GvvYacwz9f7myR8OfgfGahPS6UngDl4XakDs3qlJLN7YLDc8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OV2M8jAp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OV2M8jAp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A785DC4CEF7;
	Wed, 17 Sep 2025 14:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758120416;
	bh=RhV3vKNoJmITjtgf6bFTsa7XOh0uqQKzGR+gqpl6FiQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OV2M8jAp6LZHANWZfPjwbgb+t8rkDbEV3iggOvJrLwgeDmo4oWVRKcKprh++pxGEz
	 9FMo8OwhFk+VR9zUnp5lWhRcIsAG1i//cTRgChPYPnYBzu4z6F8FKNoTNCwPgyZEVP
	 S49q+IbBBaazA+l9tLr5TYM+XuRHLI87YWWiuggU8DXUoBlwm+uBGb4H6F6bDPYeVj
	 JI+THlsmoK7V6oDC9TKqcTLBCt/HIyAe602o8wpUvU3ZB2fFwNO6B23lm1B613oQzG
	 aG88mS7uzQ3NYjYONPGA6CfFVuWN/seWEfwDmMptEgE/Dug5y0FRsGJWunJVHY8EbG
	 DqxL9wGm+jomA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:45:57 +0200
Subject: [PATCH v4 16/39] drm/exynos: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-16-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1787; i=mripard@kernel.org;
 h=from:subject:message-id; bh=RhV3vKNoJmITjtgf6bFTsa7XOh0uqQKzGR+gqpl6FiQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTi7TUfx2UeSS2NYr3Jq/em9ls325sTStPWdCwZStH
 zgLlWa3dkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJZIkz1temP/DJzu4LL225
 Yij3Ue2t89/06LnRhXNXMbs5Kijt/BnJlGWU97qx49DUjimy6dsuMzYsiNNdNsugieEu54yzry6
 87Fc/3bWfV7E72qTZ5ZSo5AJ3Tce9tTuyKspP/xBdFBVrcREA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The exynos atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Inki Dae <inki.dae@samsung.com>
To: Seung-Woo Kim <sw0312.kim@samsung.com>
To: Kyungmin Park <kyungmin.park@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 7c3aa77186d3431d7020db4dec70332c0cfccb5d..6400070a4c9bcc00ecd0f21cbce1b5aafe1bff48 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -56,11 +56,11 @@ static int exynos_plane_get_size(int start, unsigned length, unsigned last)
 static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
 {
 	struct drm_plane_state *state = &exynos_state->base;
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_crtc_state *crtc_state =
-			drm_atomic_get_existing_crtc_state(state->state, crtc);
+		drm_atomic_get_new_crtc_state(state->state, crtc);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	int crtc_x, crtc_y;
 	unsigned int crtc_w, crtc_h;
 	unsigned int src_x, src_y;
 	unsigned int src_w, src_h;

-- 
2.50.1

