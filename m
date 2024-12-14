Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF15196C9B
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Dec 2024 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734183455; cv=none; b=ahoyuaMJwnn7G0Bsj+DLfiql2Te7B5FnEbNyxZDpH030g0kxEpIHUB+2dTz+Hz3FZppsvIRrNK4QaPLXX+NVcpnc+VtyGmyabgMJygez0/wVyKI9VebMkijdxgeSlbklEwScXG0OEL5neHL7/d6TX8f+9OX7vBiZ9XnuzZ7opvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734183455; c=relaxed/simple;
	bh=fIH1atGQEvkLWi04AIEXYETQz0o/iNjqyQIeIWP3jdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lSxJdmfn2g/CQ+UA6Lnv4LMY+YKtR1G2CNmSrnXwaWeIKkEIa5BvCS4ze8zE5WR14UP6r/Y34Rh1ANH9qU9KStOlDtj0lx4HMtasdafEhx50ujfjwPPh17wf5erQn/rTmVN8F1B9wuvru7shU7HJQvuMzlVLZ4LTtlvCInWLL14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l4k56QPD; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l4k56QPD"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3022598e213so24031991fa.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Dec 2024 05:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734183441; x=1734788241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfAoBNlarjV9Kr0yPdaLHtIo2MYFINu9J4XNO2CCrRg=;
        b=l4k56QPDs0bosHBWb7R6GiyRkpdvyPOO0C/JotKStmeBxwlnf2AZJKq1t710dIobxH
         SyqkD6+szAAX70hRnU/udzNag3+ltPExROmB+8z2biZSTpC4qLG466IE+tAfdFRhGYA0
         zkHVofpPQkQULJcz7y/q/ICBnX5B4fjggqbpGi+0uLDcokxAOLkCPTjCM3t6e++A0JlX
         SNgRdZsuCFEQONBDKN6nIMs/FEqeIqwQY15kIGC7wA5E0chtg7lxz59BIfvntrolCL3d
         S4kiUc5u3I2LQ1bmGwEyF/iTKlG00DoYE3vrV3pqlfFSqhH7AxlkJGXAPbzQuCwCXJYq
         gmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734183441; x=1734788241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfAoBNlarjV9Kr0yPdaLHtIo2MYFINu9J4XNO2CCrRg=;
        b=DIgS/Rc9qJKTQMl35HCqqgLRyZtS82PIrKjeBcXxVxyAijBoUKKu2KxhqLQQIXTc4h
         wZdzV2PbwFyRocMKIsCN1VElcrN5TdOQWVejy9UKy0CLUmzprRhsllHV3Y/n8Xri6hT+
         Ri7JkpaXP4qy50eGM2eCqRXi+i/QFHBDQQsPrrRGFRuEEtSg5NxNxlyuV12LNNzy5vk+
         C8py83ZLkHyIEiREma+pEtAzFn0G6ISmB4pOvZldWJSFoxuOeA0ivlRrW8xL2KnPID5k
         t+9IX/da0Q+UVGgP2tP9OS45tdW/Ki0Onku5CdaWG/Osx+hMDAFq8mGWkdpQkN7iMrSW
         EQig==
X-Forwarded-Encrypted: i=1; AJvYcCUREP3ASWHOzHczOxKA2ZI6onAf3E709k1gA6szhPwxwU61AGfxuayxB8Gg8x8MhKLbprkxm8MLMudQ6v6GacOrpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3cVSHX2II78snGvS/Bdf7NbqKKGHBnplw+M1deV0DkqfEZ7aB
	XgIX1ADEhX2ARESpv1WS2Av6zoPzHwIXRSRnnFvPXydDzJ+C7sEWON09sYFH9Y0=
X-Gm-Gg: ASbGncuzlVLbl7nBmWyGwQpkJqObXMwp+nWks9zGyf9qTjS5SdEbvwTt7MHBMjUkItV
	J9RjazAfIbxmIpbpzDS7YaTsjCy6f8MV1R/zDViESCj+P1r+0oMf46Eq9ksBWdgsAumSimNQaST
	sFaiOiEBHH/FKWYa7/S8OiDMyFuIgQZ6GcpToqx9j0JTQcCfgWALiPqsnAoiNYTYJI/j/50FA3z
	oHwTfYTUJAjemynW2tW+zsWCaTOPfwKX8nrOT6TZ6xoyibWq2blTAK0HMjCtFRV
X-Google-Smtp-Source: AGHT+IFSZO4bNy8AjxBG8Wtyvs2G2G0moKCebZ7Bi6AnMIS81nyzk1n5ZS+J4Ko1Sbkn2pNNU644nw==
X-Received: by 2002:a05:651c:1541:b0:2ff:d2e4:8dd9 with SMTP id 38308e7fff4ca-302544b11d6mr24876241fa.32.1734183441395;
        Sat, 14 Dec 2024 05:37:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120baa474sm220131e87.90.2024.12.14.05.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 05:37:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 15:37:08 +0200
Subject: [PATCH v2 4/5] drm/connector: make mode_valid_ctx take a const
 struct drm_display_mode
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-drm-connector-mode-valid-const-v2-4-4f9498a4c822@linaro.org>
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
In-Reply-To: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Jani Nikula <jani.nikula@intel.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1823;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fIH1atGQEvkLWi04AIEXYETQz0o/iNjqyQIeIWP3jdk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXYoElMfelOPEJNjs+G1Yj9xgEcdTdcLAHLPa0
 1XczK3Ryz2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ12KBAAKCRCLPIo+Aiko
 1TNjCACQzndFYYYqNzhLedAqKs7VfOsz2ZEbJAu4qQr0caK2HF+hvtR+VUIlYwQ0jcqqWXJmXLM
 +4HlPR43bEtxaoe4QpWwccR/sQYlEGLTcuF7/jlXw42WpNdOY6WhxbDnr23gMEQXuLD2NuXBTyB
 XubcAVl2e73ZHfh1LpZ35luOaheCBIz8zL33f8d5nxxFyCEqHaY5q6zARwkPBAoe852c0K3chfm
 oDoop8CfLRyNhvoGEF/YGoigASSuk7/jucbCfOlAXSz1JpttbSHzvLiZtgMdHVwI2RHxPySD27A
 yiEIP9OceoguE2oL2gaLonv3bIozOrfBbnj0xVgmnNavKUi8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The mode_valid() callbacks of drm_encoder, drm_crtc and drm_bridge
take a const struct drm_display_mode argument. Change the mode_valid_ctx
callback of drm_connector to also take a const argument.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 2 +-
 include/drm/drm_modeset_helper_vtables.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 123c4ece626883bd2fde997d5752611bb82018ac..87e3e178df6e642da89e81ec92328735e477230a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1445,7 +1445,7 @@ static int mst_connector_get_modes(struct drm_connector *connector)
 
 static int
 mst_connector_mode_valid_ctx(struct drm_connector *connector,
-			     struct drm_display_mode *mode,
+			     const struct drm_display_mode *mode,
 			     struct drm_modeset_acquire_ctx *ctx,
 			     enum drm_mode_status *status)
 {
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index ec59015aec3cf3ba01510031c55df8c0b3e0b382..fa9ee6a128bec0205f501df6f7634757f5fcb9ee 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1006,7 +1006,7 @@ struct drm_connector_helper_funcs {
 	 *
 	 */
 	int (*mode_valid_ctx)(struct drm_connector *connector,
-			      struct drm_display_mode *mode,
+			      const struct drm_display_mode *mode,
 			      struct drm_modeset_acquire_ctx *ctx,
 			      enum drm_mode_status *status);
 

-- 
2.39.5

