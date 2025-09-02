Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AAC2EB5CF
	for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Sep 2025 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805766; cv=none; b=GD5u/hpQj2aGG8pkSZB5Fy5XZo/kgCDbopVMxrAxcUh2Em4dg+gSRTMth9x4Vz7Glw/z73VDA9vjbaY3JVwO2Tvb/kaNVAZa725Ep3e6jNBY5Jxy2C32plmydKSNTY1muNaZgxlURC0CvACk9hWX8sz8sy16f9w2g4Zc0mpR5Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805766; c=relaxed/simple;
	bh=FNDZEgKpAurvm9H/hOI1FSXXhYJAHB6zWHdsRjnZZJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4HymrDjrQx4xDhukbxH2rxH4hTj5retSTt8feZc/4MfuXWd+QPxFyvQUVDlFX2+1u8MrNyLzFMFUsqeGirTRHxNq02y71lmZzywdfJxrj1pjfoPALNdn+6Az2TqRHZuRAZQ5YHSfWGA/snMX1tb0g68obxnJg8N7EkWxFXjWos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pYKxUkk/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pYKxUkk/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE64C4CEED;
	Tue,  2 Sep 2025 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756805766;
	bh=FNDZEgKpAurvm9H/hOI1FSXXhYJAHB6zWHdsRjnZZJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pYKxUkk/nTxbAenQ6HTEXLKdkJpalCuD0IxtGxEjYAhZB1AkQVhiAZR642Rj3EkpX
	 Ft0MjlmGuFtVrihMBbbXguA7qZmL5WMT99073nSm4++EChcITzBimVfRPv8zRShLKV
	 fIk6CjwmoPIuo/rnW3xsw+9x6U/Qq5l1MUUxtP5ntd9ncLezJmQ2qje+e8fv5P2VhG
	 OSfC+H+h8V8/SRGHbMF4UOn+VQJBYNllAg9/CRVasav/cCnNQ+j6P2LQTbDtKsffuy
	 PBJTd/4UOBRwRES3AwnhtkGxNGhQs5quCzd6sCtJP9FKN/yKto89LQRuPIcKT1R2iN
	 1WBzQlsBQWr1Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:14 +0200
Subject: [PATCH v2 15/37] drm/exynos: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-15-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1727; i=mripard@kernel.org;
 h=from:subject:message-id; bh=FNDZEgKpAurvm9H/hOI1FSXXhYJAHB6zWHdsRjnZZJc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdgWdnNsqlvqE52FOSlnR+oy/R8rfmJTYh7lU/8rg2
 M4zSc+yYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExkYhpjwwse/ZvBdnna/pdu
 L5WRCb2wbt7OR4HhAbqhtxjsropZTvjwae3c12IVrdwylx4wbOVsZWxoW8SZKrJ4TW7XPu7P8T9
 7UzwnT1y87GiApoRQxMJnr8tTbS69meCvEb5g68X8CbwX15gDAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The exynos atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

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

