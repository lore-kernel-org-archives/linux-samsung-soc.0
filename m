Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA33158845
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Nov 2024 23:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733010933; cv=none; b=sAlKDMrQUb6eUuSl1ouHMQtEjWuDu8soGifpAMBvZqCcrpJHkbWmkOFd4LUfThyH2xfMi2DTnIIS15ydQ5svNHAQALm3EIzYgDYt5S/YZnz+hRwtcizDGctCO2NWdYa9KT0qKYlfJtLYhnC7aihaj+hG1EkKRaatHaEaPziTDXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733010933; c=relaxed/simple;
	bh=h9SpCjrnoVeyG6yy+hC7dnaQqGomdEDru9YX9FtBpig=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Yxk+4aT2BX2uTOzNpFskCzjZwqWmngvhEd/Bs+00H2y3wK1mAfGodT+Oy1wfNcFghY/e7YqlU1/xqGaJ4yPIdkEcU8rsZN2T+gH7A/vizbhf4j6PIpKjIrhWVUsMNw5xjY4tsMbHC6NxlA8QWcNgPGDQKKOr0bmzJBTlOvHEVNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yE6iTeh+; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yE6iTeh+"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffb5b131d0so29384971fa.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Nov 2024 15:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010929; x=1733615729; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=igdGJ+6WFp5yYbSTVfMkHAFbN2LBIGOZkBsdW6CIVmA=;
        b=yE6iTeh+7ndrnGLLQo05hhUOapS1TEw4SzI6x2wNytpBQubdztYeEIJ4Kn8HOGHQjs
         HmvNobZyW1GTLgAwhM3/qkENBrLoWcU4tG8s8X4tbZ5d9ps/K2S4sosPStYFEN0mwaQ3
         Y8Ryi/89z1WPH1PKz4ylUqpBEHKoKc/IA963FzYKu8EVfbVSiHLma8jzgRZiwth19WxR
         Em5u4VDYVokIgbEO7ETbIUR8tKJfbwQCqrZd25XRCcx63HYwk83QDAOYbq9OK4/fGvKz
         BXoAJmCPT4o+dtd08bb+NUGEIw8gBgRhmqim5G6mkyG5cr8faRVuYGqX59OBCAx/1IYv
         bQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010929; x=1733615729;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igdGJ+6WFp5yYbSTVfMkHAFbN2LBIGOZkBsdW6CIVmA=;
        b=Qiuk2+fumUQbeZNjrXSt4pcbV/V90cO542n2svh1JDMAxJkIi01aOmE4PtKSKghbW7
         iWYNn2IM1K7iAJ5A6GcuL12p74IXzAh2P7zyl9z04024pmNE832B8m8PZZuq9qMOZGsd
         VENA/0TKOPU4MMbj7XoUfUzgnLdtCcx1SEjS8slcffcJLF+ydTeDjNKVPXP5A5pVDAdB
         mZt2/uWa8OEnrd7d/IoRnmOYPSy9s5Lk2h9E3Vk/VT/5blUX9kqtCP4oqIOmx6su2U/L
         aEBK9frZe28I0/3rKmgCREJV8CFcoTEjwbKNE8KhrfNx+Gs9BiJxUkXMJeDCESt+K7JQ
         c4Cw==
X-Forwarded-Encrypted: i=1; AJvYcCU/bn73Fp4m20/kjgkm8634NUITqIgSQSwdEUpoIzW8gh2cFxbN0QIxxsA+A0wGtXPSJPzFbVKq12l8q61mjZ6Fig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnn8tMEBVksCObc4AIiLzSYTMJl1bezigCY3SjQ8d22PFQDxpW
	rpnPoUwR4lWeKLf2Rr8s+jovRTu6vPRPJnP9ZAEX3a+TWdgKICmHL+JpKamiDkY=
X-Gm-Gg: ASbGncvImcoNqld0SAqqcwkO79kejJNV7pFmVG3AgRGJyU2i9B+FtIM5S59yA7/2FWZ
	O8i3Z4s0/H/Pj6n96MQ5JV6zj306fuG+VA3LqunmFBaOvaHDqXbHTJJ3EANRwOnUhYUZ6Vj1ITq
	mLP7FghutHziUMDwTMv4nJFUziOKq+U77Vh3PA68RhAPmN2V0NskKsbuYXd2vVhEDc1rBMEz0H8
	bgd8F+gwtu5IrO+cltgt11Oacu0TBB8Txprme9zkN+9Jxdh1d21ZEQueg==
X-Google-Smtp-Source: AGHT+IH/lMi82z0v/iMa3bnH3O48sOuTvGtLHugaIGP26xUYLLpIeMPo9osg0TDFc6RKyN8BchLK9A==
X-Received: by 2002:a05:6512:124f:b0:53d:de48:7409 with SMTP id 2adb3069b0e04-53df001cb8amr5926461e87.0.1733010929250;
        Sat, 30 Nov 2024 15:55:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 00/10] drm/connector: add eld_mutex to protect
 connector->eld
Date: Sun, 01 Dec 2024 01:55:17 +0200
Message-Id: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOWlS2cC/x2MwQqDMBAFf0X23AUTFWx/RXoIyVMXNJGNLYL47
 wYvA3OYOSlDBZk+1UmKv2RJsYh5VeRnFyewhOJka9saWxsOurJPMcLvSRlL4PW34+DeNW/XdCj
 oqdSbYpTjOQ/f67oB3wr3/2kAAAA=
X-Change-ID: 20241201-drm-connector-eld-mutex-8a39a35e9a38
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2285;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=h9SpCjrnoVeyG6yy+hC7dnaQqGomdEDru9YX9FtBpig=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6XsZ1/pqxgC30AKzvdNBVrv5HQb2dJZaZ5zn
 VEhrpDwtKOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7AAKCRCLPIo+Aiko
 1ew4CACbQcTx0V9Sgmz8qhhsUnlM0Vh+dbbDTDz41dhDdcEgbBBokvib8Go3fPRoR2hiD5m4p3q
 Inrqmtu6WxnuFTZ0QoZhHX0EdGBd/UJUWQcfS5pdXJ3Xg23dIDNSEqxBkJVEmRicpeJ9ZaUAQMi
 YdIJpl1FT2/ANTrI2tncuw5hhWL1lQ7u+U8y6VrDr5QZjFXAAeZ0Zu3y8lTuITAxcxTLjSfCapq
 SK73gIYvnestQ4yiI9RsX3EIyujQ6z18dGKF1awnRjx9cXrXrBMiBVD5XtL8+PtSrfWgAuHy9qW
 g8v2j0eW+fy5k2eNqU4JbP7IJfm7WWm2CTjtdsikNnIqWkIv
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The connector->eld is accessed by the .get_eld() callback. This access
can collide with the drm_edid_to_eld() updating the data at the same
time. Add drm_connector.eld_mutex to protect the data from concurrenct
access.

The individual drivers were just compile tested. I propose to merge the
drm_connector and bridge drivers through drm-misc, allowing other
maintainers either to ack merging through drm-misc or merging the
drm-misc into their tree and then picking up correcponding patch.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (10):
      drm/connector: add mutex to protect ELD from concurrent access
      drm/bridge: anx7625: use eld_mutex to protect access to connector->eld
      drm/bridge: ite-it66121: use eld_mutex to protect access to connector->eld
      drm/amd/display: use eld_mutex to protect access to connector->eld
      drm/exynos: hdmi: use eld_mutex to protect access to connector->eld
      drm/i915/audio: use eld_mutex to protect access to connector->eld
      drm/msm/dp: use eld_mutex to protect access to connector->eld
      drm/radeon: use eld_mutex to protect access to connector->eld
      drm/sti: hdmi: use eld_mutex to protect access to connector->eld
      drm/vc4: hdmi: use eld_mutex to protect access to connector->eld

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 drivers/gpu/drm/bridge/analogix/anx7625.c         | 2 ++
 drivers/gpu/drm/bridge/ite-it66121.c              | 2 ++
 drivers/gpu/drm/drm_connector.c                   | 1 +
 drivers/gpu/drm/drm_edid.c                        | 4 ++++
 drivers/gpu/drm/exynos/exynos_hdmi.c              | 2 ++
 drivers/gpu/drm/i915/display/intel_audio.c        | 3 +++
 drivers/gpu/drm/msm/dp/dp_audio.c                 | 2 ++
 drivers/gpu/drm/radeon/radeon_audio.c             | 2 ++
 drivers/gpu/drm/sti/sti_hdmi.c                    | 2 ++
 drivers/gpu/drm/vc4/vc4_hdmi.c                    | 4 ++--
 include/drm/drm_connector.h                       | 5 ++++-
 12 files changed, 28 insertions(+), 3 deletions(-)
---
base-commit: 44cff6c5b0b17a78bc0b30372bcd816cf6dd282a
change-id: 20241201-drm-connector-eld-mutex-8a39a35e9a38

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

