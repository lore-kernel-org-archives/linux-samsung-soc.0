Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7965234BA29
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759230051; cv=none; b=YALCuX9AnJzFdsonjfWllKYIDLpToGetlGgcMZUjVQvCIt9Sdx80/VziieS8d2AErlC1AEPO8xS68AUN91+ss7nbWtZK3FGtjp+etTzJWnEF13GQ+N0hUnLKijrsDOryB7hiKjsqJrUL4WTKAW3f0ZesffD8JmdOQp25Fvbs9mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759230051; c=relaxed/simple;
	bh=SDH3XnNi6v//uFU3KL8fb7Cra3gbK8Z2qIAy3fUoWpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FE0lHWWeorb/iDw8ccjhZbcDPH50U0HI7c+3DZlDXgegNKahc+Sge3/9qF0Wg34pTdrhfK2X/Y7xctco+nv/cKjXjRNiGzRiuftarW0w/6T9u4owW/aWZ/rsR/zJt2lu5lrsjEb2NJtFJI3CKcAS4Vh9SrrDOT+qzNRfStyJMow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckbEkHKd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckbEkHKd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DF3C4CEF0;
	Tue, 30 Sep 2025 11:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759230051;
	bh=SDH3XnNi6v//uFU3KL8fb7Cra3gbK8Z2qIAy3fUoWpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ckbEkHKdRyKCkmvA1vl1evYZTUDGNQUKA9SWe48qi7FG985YXmxCI8Pn3ydTJh5Gl
	 3p+uhSxzPeoCawpU6jOhKXx3GRjrK7Q4GzmChpruplb1Y9YrLftwoEVF93hHEHMWU6
	 gzFOu5osYba/J0GyzLtAq4eNEBW2BpruQsXHO/KL+sHV8junGqze45jN5C5opd7+7g
	 Lh9fXHP8O1zpqT59mUc859bnAy+Z4dViCZJnYSbo+6pDqz1Pcw7h4tI4WvAXJg50EI
	 kP9g14dKnbhgvMnKBO/NIQ3jRtDnrghshQfeCpMI2btnx7GHoszNvYLY4YLXkMneD2
	 vNnLe292dM7Jw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:31 +0200
Subject: [PATCH v5 16/39] drm/exynos: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-16-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
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
 h=from:subject:message-id; bh=SDH3XnNi6v//uFU3KL8fb7Cra3gbK8Z2qIAy3fUoWpw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d6hFuvRJzm5y/8zv23bKVyjC0dbqr2iafLv5VMvcC
 Zv/ryjqmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABMpc2esT81UEI99YMgbEjyf
 PfTMluUbjVdHHXv3SDfnS/kcp0Ud1vZWZpt8rP3P/H5iEBxl8jaZsVZy5WSv49YtqQlFaWmnply
 p9+M4c2f/oZ9G3yq+JvAdf1S7jOt9sohgG/P8C0732EO1uwA=
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
2.51.0

