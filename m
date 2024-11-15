Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D559C1E1A34
	for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Nov 2024 21:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731704976; cv=none; b=R6l++ETi3Ft4PFE1ictZfMbKuzPzlqHm04R1HsfJoNa9o/yxAGyEFGG0iE4Q/5BJlpirY6hI95XVh8h6jdcIzJWXOtuCPY03btUiBtPJjeIh7fXoeKf8yTqL2Sk2cCUZNd/A7dtxKAL0jhVNPNvGOhKdLTRJjbCOFIWGhogXbZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731704976; c=relaxed/simple;
	bh=7DBFK+lDKP5iAIHminI6ZsVedJ6Zsj0sk2U8oofC4jk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l/fBAijnuKefZ8Fc9c45tc/ntIqK0NXaCng6YYVS0CjRKJtiLq0jVZGSIedJTkPicCl96g1mPATahl0UP7+6hnOm6+MHZQd402ePQhp5j4+qgwjsMZRVQ9YPnWx7r8ZzRuMLf83JAIAQdj2JWp9yjnO9wE7lQ+MwV5/tAF1suOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TckMAtvF; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TckMAtvF"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2feeb1e8edfso446351fa.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Nov 2024 13:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731704973; x=1732309773; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XED2X79g7oTzQZPuBi80aknKVusfXlwcC80XkRremeE=;
        b=TckMAtvFyFH26wRXTZQ/bEbC0kofLhglzsqvB6y/sHgzhkIrAWo7a2JEApRrYf/w6H
         3siVepGVn081Of+9KMtfjSHp03YvU6RErkTs0MH7Coo0NWfKZCKd4nN14CV9djbsv9lg
         5+He+SsYrle6oPTuFOmYCN4SOjmqkTyKM6rgKImB+7QJjjfDuqbP8aTLFLwfn5iiB7Pv
         Z3kIKJWLRzpbKYRufC2HbJ4GlhwZazeu5yi/LPxFR8d9IFun3Namb2uW3Oq+FOkNKKYw
         AhVLK8qmAZXsTrW799dleDzvg9PXH0g//XHIkepfG9ZZ6s2AAOiMVgfsGjY2KDYxYcHP
         rylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731704973; x=1732309773;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XED2X79g7oTzQZPuBi80aknKVusfXlwcC80XkRremeE=;
        b=XvlkCHuTbxTlDhP0l+37I3UUnsXMtDufJFJdSkZtfPbvxgsOv2vsybKOf/8EqB8or0
         K8Mz5X2tbG/Bxgzog7VuQ8zhN2tg/rU7DbkMgw3OU7foc5s2dDtoAaT/0f+yUufNtf+n
         Cr7wyJCYUu0ZPC+4BYmApdOuA/5UzuqF/yb/gObUVXyMPt920cxI45oWx2hQVfO+h4en
         X9hKCelbJORudzoPNQFaNt7uRbLEZjW4N692P4l1jYqHpZMJrCcBmZZXHwP8cA9Ztbm9
         ouF0Mt2N6cmoeYTG39fShtBBn5C2BZiEMIferUyFcH4QMIu06BNIdF/lrRCaSDfX/T5p
         1/aw==
X-Forwarded-Encrypted: i=1; AJvYcCWlGcCr3D3iq3ceKZwVck3G88k+5nyvcQhVKNgpk+Q8SesyoolRpLLbCLeNpkTH+FPGJhaRritpcKokNab0JIRRlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp0mLtW+EjLCELIXBYjaEYa0TCY+ehlE7CoP+OLmFOMGLVNZj0
	6qENhyZqls51hlRvpYCpZH2KEkWaEEUnTek6i2DoGbpF+4BWyKoMsbHl2a2XJHE=
X-Google-Smtp-Source: AGHT+IHez1wMZP17Apwa7Bnkqf7ljiE/uJbTx+3XZMcqqQX4tSNJGW0SXO/6d9g5SI/Am3EvbzmiwA==
X-Received: by 2002:a2e:a9a5:0:b0:2fa:fdd1:be23 with SMTP id 38308e7fff4ca-2ff606dae98mr45142221fa.28.1731704972480;
        Fri, 15 Nov 2024 13:09:32 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df51648sm219626366b.62.2024.11.15.13.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 13:09:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/5] drm/connector: make mode_valid() callback accept const
 mode pointer
Date: Fri, 15 Nov 2024 23:09:25 +0200
Message-Id: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIW4N2cC/x2NwQqDMBAFf0X23AWjtoX+SukhZp+6UJOyERHEf
 zf2OHOY2SnDFJle1U6GVbOmWMDdKgqTjyNYpTA1ddM55+4sNnNIMSIsyXhOAl79V+WSeWGPVvo
 awyP0TyqRn2HQ7T94f47jBPjSJeVwAAAA
X-Change-ID: 20241115-drm-connector-mode-valid-const-ae3db0ef6cb7
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
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5960;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7DBFK+lDKP5iAIHminI6ZsVedJ6Zsj0sk2U8oofC4jk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnN7iH9UX+z3iPeGBrDJ+gqWgtsWho1RLd/uzgK
 y5jp5dF6RSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZze4hwAKCRCLPIo+Aiko
 1dvoB/9ggjr7svokfox4UbrLISeADRAMrka4CxEv6luVeowWrO4BDOHeR/LpneYbdOb0tmjA+Pb
 ObskcENd45LKNnm8iiuEv3ORbexyMoRqMZI6FdO+hWMIvWfeFAeCrbxoEb2AU0mz/0OJRhYdFIh
 6ADcN+5MudlSWZqBj8CeTwERU6kZeeZ9h55X8e9ga9vjWTcvn37riLK7gIwCVt5aFKpDOVJTJEG
 3dOkx1p9Fu8DnCMYGt4g+zzCiCCQwSRVTWlIZ7YuQ1D6PJTmyvl30OSHCd3ej7eDm3HO7WLpKua
 3NsbAZnA8gZ1iI0FRTpMJG60zM1XwIjJD2ahRcO3pGZ5FetB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

While working on the generic mode_valid() implementation for the HDMI
Connector framework I noticed that unlike other DRM objects
drm_connector accepts non-const pointer to struct drm_display_mode,
while obviously mode_valid() isn't expected to modify the argument.

Mass-change the DRM framework code to pass const argument to that
callback.

Note: yes, I understand that this change might be hard to review and
merge. The only viable option that I foresee is to add new callback,
having the const argument and migrate drivers into using it one by one.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (5):
      drm/encoder_slave: make mode_valid accept const struct drm_display_mode
      drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
      drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode_idx()
      drm/connector: make mode_valid_ctx accept const struct drm_display_mode
      drm/connector: make mode_valid accept const struct drm_display_mode

 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c           |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c                 |  2 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.h                 |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c        | 12 +++++++++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h        |  2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c |  2 +-
 drivers/gpu/drm/arm/malidp_mw.c                          |  2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             |  2 +-
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c      |  2 +-
 drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c |  7 -------
 drivers/gpu/drm/drm_crtc_helper_internal.h               |  2 +-
 drivers/gpu/drm/drm_probe_helper.c                       |  2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c                     |  2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c                |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_crt.c                   |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c                    |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c                  |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c                  |  2 +-
 drivers/gpu/drm/gma500/oaktrail_hdmi.c                   |  2 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h                   |  2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c                  |  2 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c                  |  2 +-
 drivers/gpu/drm/i2c/ch7006_drv.c                         |  2 +-
 drivers/gpu/drm/i2c/sil164_drv.c                         |  2 +-
 drivers/gpu/drm/i915/display/dvo_ch7017.c                |  2 +-
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c                |  2 +-
 drivers/gpu/drm/i915/display/dvo_ivch.c                  |  2 +-
 drivers/gpu/drm/i915/display/dvo_ns2501.c                |  2 +-
 drivers/gpu/drm/i915/display/dvo_sil164.c                |  2 +-
 drivers/gpu/drm/i915/display/dvo_tfp410.c                |  2 +-
 drivers/gpu/drm/i915/display/icl_dsi.c                   |  2 +-
 drivers/gpu/drm/i915/display/intel_crt.c                 |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c                  |  2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c              |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi.c                 |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi.h                 |  2 +-
 drivers/gpu/drm/i915/display/intel_dvo.c                 |  2 +-
 drivers/gpu/drm/i915/display/intel_dvo_dev.h             |  2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_tv.c                  |  2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c                   |  2 +-
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                      |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c      |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c                |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c                  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c              |  2 +-
 drivers/gpu/drm/qxl/qxl_display.c                        |  2 +-
 drivers/gpu/drm/radeon/atombios_dp.c                     |  2 +-
 drivers/gpu/drm/radeon/radeon_connectors.c               | 10 +++++-----
 drivers/gpu/drm/radeon/radeon_mode.h                     |  2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c                   |  2 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c                     |  4 ++--
 drivers/gpu/drm/rockchip/rk3066_hdmi.c                   |  2 +-
 drivers/gpu/drm/sti/sti_dvo.c                            |  2 +-
 drivers/gpu/drm/sti/sti_hda.c                            | 12 ++++++------
 drivers/gpu/drm/sti/sti_hdmi.c                           |  2 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c                   |  2 +-
 drivers/gpu/drm/tegra/dsi.c                              |  2 +-
 drivers/gpu/drm/tegra/hdmi.c                             |  2 +-
 drivers/gpu/drm/tegra/sor.c                              |  2 +-
 drivers/gpu/drm/vc4/vc4_txp.c                            |  2 +-
 drivers/gpu/drm/virtio/virtgpu_display.c                 |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                      |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                      |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c                     |  2 +-
 include/drm/drm_encoder_slave.h                          |  2 +-
 include/drm/drm_modeset_helper_vtables.h                 |  4 ++--
 69 files changed, 90 insertions(+), 91 deletions(-)
---
base-commit: 7d2faa8dbb7055a115fe0cd6068d7090094a573d
change-id: 20241115-drm-connector-mode-valid-const-ae3db0ef6cb7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

