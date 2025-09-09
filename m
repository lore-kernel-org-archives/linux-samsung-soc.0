Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16153203BE
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Sep 2025 11:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417315; cv=none; b=hcyOL82xNt10H83y8U5pV9rCGwqbYBNHZ5Y5QNE3jaP62F3RU8TO/Tf5A2M81zp2odl8MkvHAqHsUIjVEgQvzIiH2DuSn8rLlcvCzMrGG6bYbezCwpaAbDe5jWdZNT6BkY0sgxdNKqinUkSWPRai7/SugQUidyPcYVRZ53SQrbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417315; c=relaxed/simple;
	bh=RhV3vKNoJmITjtgf6bFTsa7XOh0uqQKzGR+gqpl6FiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z57jvuijpPtsLbFbV60ZiWuSRgE6Wb413//Bp9UzjWG8ExkFiC0pX1atWZpFCE8KJ8wxyKkOx9A2IPAG409jS3X4962vTwxtsex0wDa4OUNtKHrkuOzVLcVYlbhhkXSsOmwu7NN7kr71FDVq+Qh1Y83cqpaw8tGZfDv8oNjQKI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWRl/WYY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWRl/WYY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C68C4CEF4;
	Tue,  9 Sep 2025 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757417315;
	bh=RhV3vKNoJmITjtgf6bFTsa7XOh0uqQKzGR+gqpl6FiQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SWRl/WYY8KR/IItKPqWeV32AozQM9I17L7JqXpGh2FcVBLyUjAZ8i6QmkH1xsSKWI
	 0KrjMpWfbZdMikQjxAqtuoQJ/5f7AActcwvCWvzWwgfadkk4vHi5PzQQDR2NZNIIjw
	 qhKrVJrGimqtiwCOZi5xEg+Np15NUm7kHW51M4E40Ty8ffzIxLfo39UlyIoIWyQmd0
	 +1Y+ALqESetDK59w4vPdwIOgNIZfh2E47mR1Devdn18hNDHbyZJKwYjc4f59FUBfYN
	 PLPk8/noTaYqAxgYy55U/nfiJwP6L6f4IVitQPfs0ff+EZsSMJvVah9eqGYjIINPdN
	 hPudR0DYQG4aA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:35 +0200
Subject: [PATCH v3 16/39] drm/exynos: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-16-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+DVvVfxXX/GRk/fuhPayvKPTeaafk/o/W5zn+ORm7
 eUrvRf1dExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJcJozNkw752Tf35ZoxPh+
 j+uthvWzUr8n77s7yTAhndW+LkZfZ7l3YkxLzTQrBpfXJWU7TMrEGesrAxeef++1xeTi+rmPf7E
 4r6jV03xllvZ237zprGntkdVT3/6Q2i4a2509+XmDnurngs8A
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

