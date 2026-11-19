Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127934;
	b=cabk2qLrxKms+shL6y1VDZDJd+9WDwobInNeJTJVzvQbx6DOA8PJQyL7e0bBdhAWf3V0
	 xYNZO8OFYHgJsJoBInzFx/FS8CIfL69oi4khDp3OC4vVcd3OBZ3ePDWbEmKbH6Be+RKQ9
	 6nJE9RtzNT1hZAEB26KOb7oS57js/e1e/csUwA3Ckwkk3hpspY7n1CYkUtckTHbS9OmRb
	 FdeZrnsm2JGb5OPyr7oLNbhcV3bD6ytvUstm5xtNmCzBUtdmi/+1aUo0dpHu55DMOvZqM
	 Bkvhr6lN873A6hwUhwIIegeyZ3KKppHsL2Ovl2SAZA3hAdNpb6+xttoedqUMSNf/rYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127934;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=IyhCtPxAOxrGyki28nMoGyyI3HRHwoX1RJn1wNBIqdM=;
	b=g+YReKkMQ6BQdQgblSk8Giu2bO5w9vkbO4C0C9fQUBMrvLDFltA7OwzImEFatAKYM1eZ
	 XeidWdlX2opCyYG3D9ZRll7I9ahQyKhJweJWLlJRgwJj5MeWZDUD/JuTsET4lCKi4yAtG
	 gl7WpExFbAwMeK+5vdPHMDTSIISzXceBhUw1gN/jh2zwDvA8JxCWb/CofvwYWPMacsBWq
	 Cavn4r3w/zI71DWagQ7MbYNL0HpCVj/E4HXnh1tWob9TSSkOKNO3hrQ2EhMV68Atl6hs2
	 +HgeRGw4A2ZgIgIQWDdG8KWoKej39UutqeVS6vDZz35UqFqsNAO3YOaLWqZwg77XGEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=IU4FWGHU;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C079606A32A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2026 22:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C079606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=IU4FWGHU
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261119223851euoutp02ea3a779c6f11aa7a5d98b2b4ea5245e7~pk1egu79s0813808138euoutp02b
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2026 22:38:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261119223851euoutp02ea3a779c6f11aa7a5d98b2b4ea5245e7~pk1egu79s0813808138euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795127931;
	bh=IyhCtPxAOxrGyki28nMoGyyI3HRHwoX1RJn1wNBIqdM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=IU4FWGHUfl0DbtLGw1Na3Qy++KX80T0mhcLMEqek1pq0/ZLaHPfoFZ+3YUSwtE+SM
	 bq+ndUzSxhESdi0b8fffe6T7oZcogSWx66Yd2x8GWKmHNoViWh3nC3XnjSnWEpfQTK
	 i5nqhOm00bF8ZypYhZh2Wdt3pa8N11HBjf1LWZQM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261119223849eucas1p1ead1f9ecc9bab76245a4cb6cb91d8e00~pk1dY-Ne70286602866eucas1p1f;
	Thu, 19 Nov 2026 22:38:49 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261119223849eusmtip1b6e16b1a8f5c9c9b906a997dd4b263fd~pk1c-LZqP1774617746eusmtip1e;
	Thu, 19 Nov 2026 22:38:49 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Jingoo Han
	<jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Subject: [PATCH] drm/exynos: dp: Enable pipe clock from encoder
 enable/disable callbacks
Date: Thu, 19 Nov 2026 23:38:42 +0100
Message-ID: <20261119223843.3694307-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261119223849eucas1p1ead1f9ecc9bab76245a4cb6cb91d8e00
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261119223849eucas1p1ead1f9ecc9bab76245a4cb6cb91d8e00
X-EPHeader: CA
X-CMS-RootMailID: 20261119223849eucas1p1ead1f9ecc9bab76245a4cb6cb91d8e00
References: <CGME20261119223849eucas1p1ead1f9ecc9bab76245a4cb6cb91d8e00@eucas1p1.samsung.com>

The FIMD -> DP video (pipe) clock is switched from the analogix_dp
runtime PM callbacks through plat_data->power_on()/power_off(). This
only works if the DP device runtime suspends while the encoder is still
attached to the CRTC, i.e. synchronously from the bridge disable path,
and runtime resumes from the bridge enable path. Otherwise power_off()
bails out with -EPERM because encoder->crtc is already NULL, the FIMD
driver keeps its cached dp_clk_enabled state set, and after FIMD loses
power during system suspend the clock is never enabled again. Enabling
the bridge on resume then fails on Exynos5250 Snow:

  exynos-dp 145b0000.dp-controller: Timeout of slave video streamclk ok
  exynos-dp 145b0000.dp-controller: unable to config video
  [drm:analogix_dp_bridge_atomic_enable [analogix_dp]] *ERROR* dp commit error, ret = -110
  exynos-dp 145b0000.dp-controller: failed to set bridge, retry: 0
  ...
  exynos-dp 145b0000.dp-controller: too many times retry set bridge, give it up

This happens whenever the DP device stays runtime active across the
display disable, for example when runtime PM is blocked by writing "on"
to its power/control sysfs attribute. Since commit f2b556e3dad6 ("PM:
runtime: Update last_busy before calling rpm_suspend() in rpm_idle()")
it also happens by default, because pm_runtime_put_sync() in the bridge
disable path now only schedules an autosuspend after the 100ms delay and
the device is runtime suspended only later by
pm_runtime_force_suspend().

Tie the pipe clock to the display state instead of the DP device power
state: enable it from the encoder .enable callback and disable it from
the encoder .disable callback. The atomic helpers call them after the
CRTC is enabled and before the bridge enable, and after the bridge
disable and before the CRTC disable, so the FIMD is active, the clock
is running when the analogix DP configures the video input, and
encoder->crtc is valid in both cases. This also matches the other Exynos
DRM drivers, which switch the pipe clock from their enable/disable
callbacks.

Fixes: 3424e3a4f844 ("drm: bridge: analogix/dp: split exynos dp driver to bridge directory")
Fixes: 73f613908eb1 ("drm/bridge: analogix_dp: move platform and PHY power handling into runtime PM")
Closes: https://lore.kernel.org/all/av9AkwQDhB7O4wgl@google.com/
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This patch has been developed with LLM assistance and have been tested
on the real Exynos5250-based Snow Chromebook device.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 drivers/gpu/drm/exynos/exynos_dp.c | 41 +++++++-----------------------
 1 file changed, 9 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 4db7400c8a23..8beae1132dfa 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -32,8 +32,6 @@
 
 #include "exynos_drm_crtc.h"
 
-#define to_dp(nm)	container_of(nm, struct exynos_dp_device, nm)
-
 struct exynos_dp_device {
 	struct drm_encoder         encoder;
 	struct drm_device          *drm_dev;
@@ -43,39 +41,20 @@ struct exynos_dp_device {
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
-{
-	return exynos_dp_crtc_clock_enable(plat_data, true);
-}
-
-static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
-{
-	return exynos_dp_crtc_clock_enable(plat_data, false);
-}
-
 static void exynos_dp_mode_set(struct drm_encoder *encoder,
 			       struct drm_display_mode *mode,
 			       struct drm_display_mode *adjusted_mode)
 {
 }
 
-static void exynos_dp_nop(struct drm_encoder *encoder)
+static void exynos_dp_enable(struct drm_encoder *encoder)
+{
+	exynos_drm_pipe_clk_enable(to_exynos_crtc(encoder->crtc), true);
+}
+
+static void exynos_dp_disable(struct drm_encoder *encoder)
 {
-	/* do nothing */
+	exynos_drm_pipe_clk_enable(to_exynos_crtc(encoder->crtc), false);
 }
 
 static const struct drm_encoder_funcs exynos_dp_encoder_funcs = {
@@ -84,8 +63,8 @@ static const struct drm_encoder_funcs exynos_dp_encoder_funcs = {
 
 static const struct drm_encoder_helper_funcs exynos_dp_encoder_helper_funcs = {
 	.mode_set = exynos_dp_mode_set,
-	.enable = exynos_dp_nop,
-	.disable = exynos_dp_nop,
+	.enable = exynos_dp_enable,
+	.disable = exynos_dp_disable,
 };
 
 static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
@@ -170,8 +149,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 
 	/* The remote port can be either a panel or a bridge */
 	dp->plat_data.dev_type = EXYNOS_DP;
-	dp->plat_data.power_on = exynos_dp_poweron;
-	dp->plat_data.power_off = exynos_dp_poweroff;
 	dp->plat_data.ops = &exynos_dp_ops;
 
 	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
-- 
2.43.0

