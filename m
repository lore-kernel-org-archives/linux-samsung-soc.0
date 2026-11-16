Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825080;
	b=wzbGoyU1war28PmIEUOeWiogmdFs01OVvgPUfZXh6+iZdR75BGtfJCqOCKzoXJgGa1B1
	 4Qvv2dNdII1dQ86KL4BvHWpjN9UqI/ZvrDqY0bEBdYqIpzN2yRSCd/HpvuS+pRqrv7hL4
	 FG/rcokb0fttduKzhyCaCXVol7CzKT+eyJ/Nv5uTRjGjU6xW11bug3g7nmBVWR4Bjd50f
	 27et+f5z2AYmO9Fah5KAOoeo3N6Wn99tSR9eTov8PUm2nyBOvU7aRacsG7x7qkkTOTxTK
	 0ZWB00k7U21FyJeasofJr4wOIX+nb3X1nGdC8FExgdxqGwQSe8qmt/45U16MQ7C32TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825080;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=HR1RnG73PrXXW9f/KrS7v/UuHKcFn403pSvB3v4W9gU=;
	b=rydhLyqw0MO5pLA08+JYrwRJ63N2LuRnxGSXnFMgf/PJRFx6lKXZ0PBtO1gQXoPvVOfM
	 a+q36/mnETk1YiCQfEe6G6/qFyc0ZzmVVjulEvxJJJJvFnv0rNG1PkpcJu/j+9vhI3uOy
	 gkuVaogeGeomXsRUsU15IrkVeEq5N0NKQGDsEVeUQCIuw6+WpkcfwEok+SkDCrxmycciC
	 mrlrCpZy3XvmDh8s/R4FVT/iCSHt/74coUdV9kAt/XVvCn5f36wiuaPzj3gn6yuUkxKOX
	 NLYP31TYpy3WuHLEI+zxK8vBPvfxdwSVTm11olGTIb0XJn8uBIosmvkPzGXOsngb7bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODUBMTjs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393C4606A32F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2026 10:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODUBMTjs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484521F000C4;
	Mon, 16 Nov 2026 10:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825079;
	bh=HR1RnG73PrXXW9f/KrS7v/UuHKcFn403pSvB3v4W9gU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ODUBMTjsyBR50n0RnnIkFijnpZFYJkbqs4kXGVGODhDtXc1bivzW/taUGsgyr023a
	 GseO1tuD2m68NZQ0d3luzZQF1sqsUNjS4OWFm2oKz9ulLYY98RC8zvz57xujS00tL3
	 tNacntiKXcS3HOixihTOQDsgV/GLtv4ReXogxPjqO7d9a6VZ04PAYAmyx5imcYn+/L
	 /cnEz37OAs9G1aBo9csI8hWzCJ2YFuFPA/Gc5nbAriJxk5hZFjz+0nWWNaX9PYmzMB
	 FHe2x1hgxnRzepKPRHj7oG3ZtK6EEdho2cOZYofXJa8xrTWu8AtC5D6oq/jV4VwKFf
	 h8xGAhW+Kj0Zg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 16 Nov 2026 11:30:23 +0100
Subject: [PATCH v2 07/64] drm/exynos: Switch to
 drm_mode_config_create_initial_state
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-drm-no-more-config-reset-v2-7-0bb471f4d1e0@kernel.org>
References: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
In-Reply-To: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574; i=mripard@kernel.org;
 h=from:subject:message-id; bh=jqgMByXeT6UiGU7jKa8TjYMskSzMribJdbP82Ad+0/Y=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm/bjuLXtjyvqFKhG9fcV7AyXaRnq7217FdLTnpz+q/G
 jOrHdzRMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZyxYSxYX3eJoZoRzYmUzH1
 WQLVfaXq7dsUWbocXj/hM6x5VX1c0ezJnAXXLXi3v1q6IzwmI3wvY63Yq4UGRzbv/DQnboWG23O
 pyIeCy0/W951rPDTr96IfmWwd7Ova5j14t2P2BHmT2ANrBV0A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() has a dual role: it creates the initial KMS
state at probe time, and resets hardware and software state during
suspend/resume cycles.

Since the two roles need different behaviors (notably for objects like
drm_private_obj that must persist across suspend/resume),
drm_mode_config_create_initial_state() was introduced to handle only
the initial state creation at probe time.

Switch to drm_mode_config_create_initial_state().

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
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 9ee30086879f..712e5ac86f50 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -275,11 +275,13 @@ static int exynos_drm_bind(struct device *dev)
 
 	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
 	if (ret)
 		goto err_unbind_all;
 
-	drm_mode_config_reset(drm);
+	ret = drm_mode_config_create_initial_state(drm);
+	if (ret)
+		goto err_unbind_all;
 
 	/* init kms poll for handling hpd */
 	drm_kms_helper_poll_init(drm);
 
 	/* register the DRM device */

-- 
2.56.1

