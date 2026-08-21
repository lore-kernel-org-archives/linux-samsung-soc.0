Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37074424D70
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Aug 2026 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323179; cv=none; b=HUvZSBAo4dKlhoMmQurR5JdGvbbdkQXZuledhtVPtwgWkOWP4n8AIarWqTSung9wp6lc6K61aZxs3UDLe3PJ7hwK7Ju22mZYqa4ursfIUbeKjNT6Mc5fy2kMBtGwLwCN9FDRDidZT6BT3Uwo6pBXVCIKOX4tSOf02VrzD7e9blQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323179; c=relaxed/simple;
	bh=1o3Ndz6ezdx50B8YsDKIbtfJV6Vg99IBCJgOqljqIHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rOiWQvpQV7JXD0iFajvO5osh2ULD6bfH1apyabeJiJjz337u1oAOTh5GV3MzUL1eeGlc+57RnTq5+VxD4TlRQfKPRXTssH0zZXcJRvX5VJG1u46yuMdYgiZPdOqzFna9TQew9agm1cNSYe0OaHAI+SQANo1Nc/zmNnoGeX08Jjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1r5RhAN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1r5RhAN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39BED1F000E9;
	Fri, 21 Aug 2026 14:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787323174;
	bh=YwKI5yDZ9O85RvbK4cbgTYP9Q8YE2LQecf5shsJkhh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=K1r5RhANfk+aTbLHmz/WpDkVtB4wnjhpxDe2pTC09WFHb9DwLs/SiyW7wjJt/1e3L
	 +1tDeQLcZB5qYvh9h3/GLMoKp/XELkzkmrh0/d1umS5s980Vdv0SqziVezhWamp4Sy
	 VOK5+d4qEC5RX+z56y0x/MpkusMBgEH1nvQ78703iCtio6QpA3HbI9vmRizoWFxk4z
	 9zgWp17mNBlYTeq4478YszZXCBinyxyVEibwQGF9mT/pjdrNGnHEY/0CoEINX/vHi9
	 JyYzTZeAaEdQcJeaAyODYx00TKiTKODX8lNIt0MJ1mldnZYCGFUReOt1RN/y1e2wR9
	 PcvCxlslkhijQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 21 Aug 2026 16:38:41 +0200
Subject: [PATCH 05/70] drm/exynos: Switch to
 drm_atomic_helper_crtc_create_state
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-drm-no-more-crtc-reset-v1-5-fb793475c05a@kernel.org>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=mripard@kernel.org;
 h=from:subject:message-id; bh=1o3Ndz6ezdx50B8YsDKIbtfJV6Vg99IBCJgOqljqIHM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkdST/fVl9fsuOFNEfQoWtXGg2vJi92kdmYOzW9SfRIY
 LPjoT3+HVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAirzgYq9nqnv0316sSt20K
 KP3sw+Mr8DmG/QSjbNQELYajs3/ZMNo+ulzm0Bke8DRoZ6koT0QsY32Z7J64qy+XZUQ+3OD7Ycu
 vqVyfd0vVqt49buSluCJq4isecYd4Zrt7zWVPnT/u9plepAYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The exynos crtc implementation uses the deprecated
drm_atomic_helper_crtc_reset() as its reset hook.

Switch to drm_atomic_helper_crtc_create_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index b071c019670d..458cad64bd07 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -161,11 +161,11 @@ static void exynos_drm_crtc_disable_vblank(struct drm_crtc *crtc)
 
 static const struct drm_crtc_funcs exynos_crtc_funcs = {
 	.set_config	= drm_atomic_helper_set_config,
 	.page_flip	= drm_atomic_helper_page_flip,
 	.destroy	= exynos_drm_crtc_destroy,
-	.reset = drm_atomic_helper_crtc_reset,
+	.atomic_create_state = drm_atomic_helper_crtc_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
 	.enable_vblank = exynos_drm_crtc_enable_vblank,
 	.disable_vblank = exynos_drm_crtc_disable_vblank,
 };

-- 
2.55.0

