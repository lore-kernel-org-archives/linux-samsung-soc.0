Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672489;
	b=JwH2hlBrl+7/JkEDefe74d5yJ0U7Oe6SeFW4NJRk19lrsRm6Tj0hPiBC7eZQDCjwxXU9
	 Jl9eqNJgD9AOCqZYKZEXeni6zt486h5JQcEqUpCEekgiYnNSAOKSY94Ahy2MdoB6PgC6Q
	 h546rBJjjsQKnoO6JSij2z80kAW4xbyRoF/8xO3nf564js0MHA22z7YDEHLW6NKIxZCkW
	 1J2GFCEbDbTHppKNZayuDMouc0D81nthnjfiyG9g5QpsrTAAH5R4fLcSM4Qe+VLnvSoYo
	 jrJ6/H+IjMAUXKlh/mmfluhX3reO54y4vLxSOTk1MGPQjMYNlv2wTKlGQQxXKAVDKdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672489;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2dnnP8Wa81IdUFmqyrsgZbYDGrVfTtadJ9nTlfniJCY=;
	b=E3TB9lMIoq/jgFUYrQrrenAaZ4NYt+drtNkhOmQXbsp0ONZdD1HXWHF+ks7c/QaYWf8F
	 HLeMNhv6lvmycyFs5INPcQ2nVmQeA+YVhz0nfwFAGZqpnLRbbYcaXoVtcqdYJCt7hPBPN
	 RbwjLb1QQFkE24qLlfV3LLiyT9nVXEKgerAF3jaDa91qKCfNO8L06UMFstBGRmXajLWl2
	 ArAyLMZk7xck6MrVjFE9T0kXTAcEq/AVQEbmUnVnQAihpVu9MI7LaOF1GjXbSPX6/bmAI
	 qkt8vfrlbzig0idlNqRRierUdI4z+4xAxt/8pEQHXSk1bWnl/DTa9C6fhAJRyiZA3ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JHxqVkD5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EA9606A321
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Oct 2026 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JHxqVkD5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6581F000C1;
	Thu, 22 Oct 2026 12:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792672488;
	bh=2dnnP8Wa81IdUFmqyrsgZbYDGrVfTtadJ9nTlfniJCY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JHxqVkD5xc/w9V+4YNXCfDW5W4BvBRxyPB5LgUPgpsNeVQO6mpi469fMbSztKmGxX
	 j6fNZoO5vQi1StTDQFtx5gKSiOTlDB4zRxZnDOsbYNjRoWGoB7dgpvUWLNoKcU1irW
	 8kgYP87CyK2otwTG4ZtD+4oydzx7cvrV/yJXfV8A6mNSnWOWxuTzpNDOz1+MTWe7LP
	 OnM1ZeWY071b1X4RL3nTnYDiMpZpbLJ5OxX9sjdRt8R2kfIOSBR28w1Ncpzg1k6BNU
	 /KJ46akLgLHofKA/B92ud+EN2mW3uMe1DF5e/P5iOcJqRtq6Sxjx4oDopw0/lCPEhs
	 r4LWFLSESMTDg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 14:31:16 +0200
Subject: [PATCH v2 17/59] drm/exynos: Switch to
 drm_atomic_helper_connector_create_state
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
Message-Id: <20261022-drm-no-more-connector-reset-v2-17-0b7e4e85b1e8@kernel.org>
References: <20261022-drm-no-more-connector-reset-v2-0-0b7e4e85b1e8@kernel.org>
In-Reply-To: <20261022-drm-no-more-connector-reset-v2-0-0b7e4e85b1e8@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2712; i=mripard@kernel.org;
 h=from:subject:message-id; bh=gmbVcyopCfjI4fWSLHz7Zy9KT93vZwch19EfPTd1/Lc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3mKZ6hUZ/ZY0/xHWOf3PIqnncHwPlDjzseOWRsmrz5
 cUvl+1c3TGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmstqBseGJd+ZC3U01y/fP
 3GhmMHdR29Z1LZ+EnyWfU18mxuZq75B7OmqNwpT9Jom/30e/m35ylypjvWOLp55z29QPLRVJYaL
 MbYuVarVa/wp3TTiv9cZKh931Y++93Yl8yk+nuN44ptEiz2EIAA==
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
@@ -57,5 +57,5 @@ static const struct drm_connector_funcs exynos_dpi_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = exynos_dpi_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
+	.atomic_create_state = drm_atomic_helper_connector_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 077571eae9d6..f3e8a2bc1182 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -335,5 +335,5 @@ static const struct drm_connector_funcs vidi_connector_funcs = {
 	.detect = vidi_detect,
 	.destroy = vidi_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
+	.atomic_create_state = drm_atomic_helper_connector_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 055dc04f9b3e..654a8b1b4afc 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -876,5 +876,5 @@ static const struct drm_connector_funcs hdmi_connector_funcs = {
 	.detect = hdmi_detect,
 	.destroy = hdmi_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
+	.atomic_create_state = drm_atomic_helper_connector_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,

-- 
2.55.0

