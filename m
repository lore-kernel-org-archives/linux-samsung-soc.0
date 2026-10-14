Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCBE419302
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Oct 2026 17:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998911; cv=none; b=ZC77ByR6eTXF90ic05qHfFuCrnPRuCMKlWOytiRfvEDHkvoLZ+nouOprxheBdb3CF3AFCU60Unr3qBRtniv944EVZvAiVSJyZKDV65MAxWUPA/Co7Q5kmirrsclADYF5ktYvAnksPrFfL8+6EBn1oF+wperA6MeMC6LGQDarn6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998911; c=relaxed/simple;
	bh=qn3k3FOdcpzaM6GfmVkx8rFrmH800I05g1866GM0xEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rPQTAOEQY0AHWz0xaGhyvf91HFnWXrfO1ObX3iLPsYHPAZvcWkUiPSDL3LYzaVFrnd/bPXk/DwP4/lRqBuCClWTad/717Z+9AB2+S08Hto3uL6nK+eNUwzq5cJyVJtP6t9rrxYsfbMYGpiXEBhhPNFRG6CLFltwxkdH+Op2ldlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jH9g7WNc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jH9g7WNc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C6D1F000C5;
	Wed, 14 Oct 2026 17:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791998908;
	bh=OILZmv9y/fVkx2Fm9G+55bfV5ppnmSyKiLBGlvCyxcQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jH9g7WNc8DN7xnORmG9kDsVMvPvnbQ4keo6dpZwbjewtxbTgumRWPWcnkn/7Xehbk
	 uPrE7BXSuN3Yhx6G0ssXBPHylDj0b/tJDIJ/dpC/c03b7zTtr21OtPEHzPPny0bJW+
	 C7AWIvsthVUn4FOmTwzUi2m+59fgJ9wW/JmFpzLrexi2ZR+hEhNzs6ZO8KQA3roMFU
	 osBrdvMOS+Th9EL6RWfKRFBqbk/ot4H8QlbFbI3FA9MbABow1O+J2cn4YLSmj+7cGn
	 rUNhdK3hmXb10RUIuyg6b9iZT7DJnk9yG3YvqjJ6lnrOGs/j9gzt7uReo4w3eXhwsI
	 jpgOLR5H+Zufw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 14 Oct 2026 19:26:44 +0200
Subject: [PATCH 21/75] drm/exynos: Switch to
 drm_atomic_helper_connector_create_state
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-drm-no-more-connector-reset-v1-21-586c9c026823@kernel.org>
References: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
In-Reply-To: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3304; i=mripard@kernel.org;
 h=from:subject:message-id; bh=qn3k3FOdcpzaM6GfmVkx8rFrmH800I05g1866GM0xEA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnndwf/1TU8oTlFPyLCskqyUa6L0/NpbePbPvuATIdfG
 T8bG3k6prIwCHMyyIopsjyRCTu9vH1xlYP9yh8wc1iZQIYwcHEKwEReCjLW+z3Ujdetlt974GfY
 X/YrfvuNvKqzgyZcvZL6P2f7sYsu5mdfXIz+/Ep86unDFi0xe7bMYKyPevpHysa98P+UesUIb8d
 m9eXxzPU5upWKVz+l75VvXftP9HMi47bnfD2VD2/ECq3xVAQA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The exynos connector implementation uses the deprecated
drm_atomic_helper_connector_reset() as its reset hook.

Switch to drm_atomic_helper_connector_create_state() instead.

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
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 74d3a2bebb74..42c48fd14050 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -54,11 +54,11 @@ static void exynos_dpi_connector_destroy(struct drm_connector *connector)
 
 static const struct drm_connector_funcs exynos_dpi_connector_funcs = {
 	.detect = exynos_dpi_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = exynos_dpi_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
+	.atomic_create_state = drm_atomic_helper_connector_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int exynos_dpi_get_modes(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 077571eae9d6..f3e8a2bc1182 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -332,11 +332,11 @@ static void vidi_connector_destroy(struct drm_connector *connector)
 
 static const struct drm_connector_funcs vidi_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = vidi_detect,
 	.destroy = vidi_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
+	.atomic_create_state = drm_atomic_helper_connector_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int vidi_get_modes(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 055dc04f9b3e..654a8b1b4afc 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -873,11 +873,11 @@ static void hdmi_connector_destroy(struct drm_connector *connector)
 
 static const struct drm_connector_funcs hdmi_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = hdmi_detect,
 	.destroy = hdmi_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
+	.atomic_create_state = drm_atomic_helper_connector_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int hdmi_get_modes(struct drm_connector *connector)

-- 
2.55.0

