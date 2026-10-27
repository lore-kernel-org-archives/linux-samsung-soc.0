Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793102511;
	b=r9iI/ghePtVfOU2ASdqVgklcez548dv57KlWwbW7OwXUuSSVMDgLETT68B96BMZXZxXq
	 Co7r3G7xRscS/M0im4Qs8I4Ewv1D/9vKR5H6QbJWtcSgwtGJA2SWgMb3NrVCNlsA1g2dL
	 Sj6bzxjGatHs/fM77JrjSLv32NU7MVTiZ8gmUekFcI1RheNZgRm0Geur2YdWBQPsBmNzS
	 xBrM1l6XBeYcyJihfihgixb773Gc0vbvnJdlllOXwjcybG1vDF7qgw+qbGLR/3MU5I4gf
	 QgmLoUEAktUuFFCQ6tE2eYe1OWuC5qWUlhp/z4SH8tFk0a0Z4bZxLTq1VC7YqKEg4QQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102511;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZzIvaYPSNTegF6XvVvXRI6A1kD3Cxh242SgobesGmXs=;
	b=CB3eim6w1oXZ0vmgNPgyVmSDarFc86AfZho5XC9wVFSC4b0TK0dFCHVUVOUG3eV2oU7A
	 2omr7GjSCH9KIqhzeedqzOR7iMGPfEZ6Z3SX1jwi/5p0H7ljdZQligKxKY9Oi3mimkl9b
	 gwfTkw6+HK+9bK0OXvhcGWcVxtusdo6JIQfj2Ya0lNFdcLTIEaCaWPW1Y55PaO48Vo809
	 dCb+OPUsioj4sKFZ8lNTyXL8a7vuoHE7ZA1T2SPcOnJ3gmlcx/bvkfvOCD/v2ZCz0FDLz
	 xTyeHYqGv2a0OL87oWU4jRMjL4k6lh2fVw2YzO+08H1S3aHMDMXXsRz0A1u3pr9z37Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbCWbErq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DF0606A337;
	Tue, 27 Oct 2026 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbCWbErq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793102510;
	b=m3OrX8O+oxKtiYsWAMfxu66pk39ZFR6LpOkBLzLXiw1x4Sq0n/qkYzLEJ47E4LNOtUcI
	 X3TFWVNiBsYEclJquqRAlkNbHQOQNwNRrIKI/OFyQ6X9yRuclAOKNNqJ6ikK281Zmta+y
	 Gj1J0oy2J1oYfmzbRA4ZLH/iM1wgbbDa5MXt+kRDRM/voDBd34fMUmHZYOgjxd35UaXi7
	 PEjWJmEXKyizTLgwT0fAVCbGn8jg5tVm7iGLmaGto2RzFohYdF/V/EIshz1yXW8KbpQ+7
	 CPdxpXvIJaK5DQ//QzT9n47ReKLGSJw5H+C7yPiUV19IZznrGIGsTQpROVnQhOdwI0A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793102510;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZzIvaYPSNTegF6XvVvXRI6A1kD3Cxh242SgobesGmXs=;
	b=IxpMAzBs0uSNEQus6wgl6qKQEe3bvLdzZ5k6uWCZ68vNVp71C0I3+lMSJd8kQ74aAZzY
	 ugpwNMHdGKYcrdfePjzBNx7y1wDNrRcKEkq/QczZH306UEwd4SkAYajOW7/f1YAt544YW
	 Lm9QO2Mhtn1ji7IouBu9Xe21Kh22KfpDe8bU3OURa6wzx2Y7SdUBJ/0XgPI+A+1OSCpcq
	 7Gr0E4fGrZCPE3ki5ULvdTtwF2csJ8PP+B5u9gSUKHf20+XZC0gbDwiTJ+KvhzdGkLAHC
	 wgfoZLolNNSBo9+OJI3665fNPvbaQsgvnnZhzcY0yMEvuwTupb6TDBLTF+BrQKIfGQQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8022E1F01243;
	Tue, 27 Oct 2026 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102510;
	bh=ZzIvaYPSNTegF6XvVvXRI6A1kD3Cxh242SgobesGmXs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZbCWbErq3mNQ1I5jP14j1p2ZuMpyJ1fLMPVE6iBF8Zl395XOMRkVdyQgu4zBHz14d
	 Ixj/en76LnrV6b0/UzzTsmwxjwSrDeM+3Trh4BKmt6kGs/rj1sOxIA/5nApmWZVkJZ
	 mLRHEw3dhzzIZ0A5OSnqmiEQprgXPGsEhN70K1CDkqkOcb8lMmVbB8m/JJTw2aW4dQ
	 FJcHHRm3VVvnm9iwfoWRbb0cl+R/x/2qJNev96M7UCQd6NVEAUYok/hdZdV8gIG4rW
	 6McpeYUWpKVSoZixgju2DGXHv5dJ6pGcAsDSk0cq7TQLt6pTXSKVP5qxdGjFbG0LS4
	 uIWWUA2hh7uQA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0DDA4450BC;
	Tue, 27 Oct 2026 12:01:49 +0000 (UTC)
From: Alexandre Marquet via B4 Relay <devnull+tb.a-marquet.fr@kernel.org>
Date: Tue, 27 Oct 2026 13:01:43 +0100
Subject: [PATCH 2/3] drm/exynos: exynos_dp: change poweron/off to encoder
 enable/disable
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
Message-Id: <20261027-drm-misc-next-manta-auxbus-v1-2-3a45c3cf531d@a-marquet.fr>
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
In-Reply-To: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Lukas Timmermann <linux@timmermann.space>, 
 Henrik Grimler <henrik@grimler.se>, Hendrik Noack <hendrik-noack@gmx.de>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793102508; l=3149;
 i=tb@a-marquet.fr; s=20261023; h=from:subject:message-id;
 bh=niciPhHYJMxmPiaLdY+j6FZWFXq5DN1CObPsB/9SrOs=;
 b=W3oDPujpfRAKf7/x7WSPSc9GAbQ8GiBn1glOfFzN8eiBh04Wrgc4gBWJ25Z4sRJbPyYzcbcvr
 oMRsCO0EwzkBu3vR4EGr7MhPT3QF/7aomVTJK+mslMOTFzRjBNM3q0a
X-Developer-Key: i=tb@a-marquet.fr; a=ed25519;
 pk=zVRSO6FDK46rqmeA2GuzAhM24eFlUq1QpmXi9/KCFyk=
X-Endpoint-Received: by B4 Relay for tb@a-marquet.fr/20261023 with
 auth_id=1334
X-Original-From: Alexandre Marquet <tb@a-marquet.fr>
Reply-To: tb@a-marquet.fr
Content-Transfer-Encoding: 7bit

From: Alexandre Marquet <tb@a-marquet.fr>

Current functions exynos_dp_poweron()/exynos_dp_poweroff(), that
supposedly powers on/off the device, actually only enable the encoder
clock. This cause issues where poweron() calls fail silently in
analogix_dp_probe(), leading in some cases to a state were the encoder
is never enabled but the rest of the driver assumes that it is.

Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
---
 drivers/gpu/drm/exynos/exynos_dp.c | 40 +++++++++++++-------------------------
 1 file changed, 13 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 82c238829921..16b00aacd55b 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -43,39 +43,27 @@ struct exynos_dp_device {
 	struct analogix_dp_plat_data plat_data;
 };
 
-static int exynos_dp_crtc_clock_enable(struct analogix_dp_plat_data *plat_data,
-				bool enable)
-{
-	struct exynos_dp_device *dp = to_dp(plat_data);
-	struct drm_encoder *encoder = &dp->encoder;
-
-	if (!encoder->crtc)
-		return -EPERM;
-
-	exynos_drm_pipe_clk_enable(to_exynos_crtc(encoder->crtc), enable);
-
-	return 0;
-}
-
-static int exynos_dp_poweron(struct analogix_dp_plat_data *plat_data)
+static void exynos_dp_mode_set(struct drm_encoder *encoder,
+			       struct drm_display_mode *mode,
+			       struct drm_display_mode *adjusted_mode)
 {
-	return exynos_dp_crtc_clock_enable(plat_data, true);
 }
 
-static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
+static void exynos_dp_crtc_clock_enable(struct drm_encoder *encoder,
+					bool enable)
 {
-	return exynos_dp_crtc_clock_enable(plat_data, false);
+	if (encoder->crtc)
+		exynos_drm_pipe_clk_enable(to_exynos_crtc(encoder->crtc), enable);
 }
 
-static void exynos_dp_mode_set(struct drm_encoder *encoder,
-			       struct drm_display_mode *mode,
-			       struct drm_display_mode *adjusted_mode)
+static void exynos_dp_enable(struct drm_encoder *encoder)
 {
+	exynos_dp_crtc_clock_enable(encoder, true);
 }
 
-static void exynos_dp_nop(struct drm_encoder *encoder)
+static void exynos_dp_disable(struct drm_encoder *encoder)
 {
-	/* do nothing */
+	exynos_dp_crtc_clock_enable(encoder, false);
 }
 
 static const struct drm_encoder_funcs exynos_dp_encoder_funcs = {
@@ -84,8 +72,8 @@ static const struct drm_encoder_funcs exynos_dp_encoder_funcs = {
 
 static const struct drm_encoder_helper_funcs exynos_dp_encoder_helper_funcs = {
 	.mode_set = exynos_dp_mode_set,
-	.enable = exynos_dp_nop,
-	.disable = exynos_dp_nop,
+	.enable = exynos_dp_enable,
+	.disable = exynos_dp_disable,
 };
 
 static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
@@ -171,8 +159,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 
 	/* The remote port can be either a panel or a bridge */
 	dp->plat_data.dev_type = EXYNOS_DP;
-	dp->plat_data.power_on = exynos_dp_poweron;
-	dp->plat_data.power_off = exynos_dp_poweroff;
 	dp->plat_data.ops = &exynos_dp_ops;
 
 	dp->adp = analogix_dp_probe(dev, &dp->plat_data);

-- 
2.43.0


