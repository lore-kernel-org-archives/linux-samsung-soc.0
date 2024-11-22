Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF7A12E4A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Nov 2024 00:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732236463; cv=none; b=KdRcUTN6DY+Yts/1zjUGLJlceZQU4oBI6q8J5Lp7xN2hs9xChMb/+l5oy0WcKMtmci/eb/MF46J5kj0WG9+BvjMpZ98kUXlEcKpLyS8ai/PLqJVWKH+5vq+jw56BPJeuSPWlBrAwA52lGnZtw/tVXgqtewZoKVFbNjIN/yCDgok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732236463; c=relaxed/simple;
	bh=C4fwAVi8Y8X09kTJmKrmpH7fVyGUsoMv9zUOWXGRYW4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Shbswzxn4uuDtZ5cD/O696iMCa7n1kUiCrp7dZhaCUOKDiBSAWKOpn/uonNKQN9ebZJ2F+XBdXvTQlj/omxCHEdRiKlYcgdTCQ01yLC89AwFuizoLeiMLMJaNUcSz4O5/7NbNL0DebgduN2yw3BOe6Qj4u3vgjIXfAscThzR7TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yplQ68aD; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yplQ68aD"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5743074bso13558931fa.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Nov 2024 16:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732236460; x=1732841260; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=um90wdHTeL15s/B2MACNx3ktfE428gcJvXm907/nCMg=;
        b=yplQ68aDt/3b8crLZcE9IHh8mk5JOaLuh/2nMuev18jN0EYO4zX0ehzEYH0AAPb146
         fo9D9xfy/il3IyXsS2JLsMYi1a5PteAmuPv0i6u5CA3fYS/VbRQx7ncEBkwhrZPtJjPv
         2c2g6TUwmt3o35dOCJg+di9iyNZR2c/OmnSsaTue77bZ7dUo8bkXFOZXZIzBrqe+J5M5
         HMj1tlFBRpkfzXsAIjRYVRBg913eMK4p9pAS/g1Y56FovlIV6r8PRmiKUYVskA0wvFqf
         EZoDC52kFUSG50eB6tRxpeZeP+Apswg8EPvsmzS4S5I5hqSvKlTVjImVAKjnHn9q6wiV
         wv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732236460; x=1732841260;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=um90wdHTeL15s/B2MACNx3ktfE428gcJvXm907/nCMg=;
        b=OHrxlJnt1gy+++GrklY/JyQ3VJBAMFDlTsw29ASPPJxqnz4UvIaEHr7wrjrPYEV0qA
         uwKn4OHPlnS7cYn1dwFeyhEmoM1FsevUynhAjo1PTYhp2yhP1YnY4pej7EnosumoFoQb
         i0GkpCKNkvTL6XIsPKJmK3Fd01aHhpxMnx/HrdvqZfhcpXwIhEe59h+3WDUpuEpHWv7+
         Lqq7beVulOGshIsDKpqE3gTohmlmmAL7TTyQiHwTcY5AeO9phVJX46edjSdx7FS1QpGe
         ov7VekPRLVu2/+K1p6Brc9mfAwgy8nFc43B3oYi+9tsEetVY5MVpCNDgl0IRmEbBEeoO
         +ccw==
X-Forwarded-Encrypted: i=1; AJvYcCUljnctHWMpSCNMQoRo98hN13G3p5NbI7Ro7DKF+BajP4R9dcQV6SJzICgDzxCrcHA73AXYFwa5RsRJhaLKH2dm4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhj7SShHHH6YkkYSNxv0ZatYS2qrHQ5dfnF7EiG69NfpP1QKNi
	Nw9l/C5CpIPL5gDOm70m7D5kS80dM/D0mgC57Gmp+BQo5g7PhE+klJW+kWxWzQk=
X-Gm-Gg: ASbGncvHF4Kaz3uiEb2lPPQFwa7eYULhnYbb9Qxc0Zk3qThGbeKnQr8cTwYChiaBXNy
	784bOFhiXWVik122j5TTnU8xxrdjaxjQ5WHWIZVrDL3VAWOf6emrBzOuo0ALA+ZQqgmEFK3vl6p
	fOgZIWcZdCVUsvL/cDe8JOBRzD2FvYcoJevBdKiDcViJPLd7rPv7t7vAjjHOesxPH3Sm10h8osv
	sUcLHaGFdX5MIP9Qdh/K/n0DXVwzWyY0NsixUlez46i6gx4lHN6wDTO3Q==
X-Google-Smtp-Source: AGHT+IEQzKqwfnQr8BDICIZTlsvnC/r9hitkRE3k+QvhrVxsSO7Eaui8kUS1x+WJb2x44tXBhDKq+Q==
X-Received: by 2002:a2e:bc89:0:b0:2ff:8e1e:7692 with SMTP id 38308e7fff4ca-2ffa4ca6837mr3674881fa.0.1732236459662;
        Thu, 21 Nov 2024 16:47:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa5375caesm1083071fa.85.2024.11.21.16.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 16:47:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/7] drm: add DRM HDMI Codec framework
Date: Fri, 22 Nov 2024 02:47:30 +0200
Message-Id: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKPUP2cC/33NywrCMBAF0F+RrI3k0bSNK/9DXKTJxA5oIqkUp
 fTfHRVEEbq88zh3YgMUhIFtVxMrMOKAOVGo1ivme5eOwDFQZkqoShgteChn3hUMtOnDGbnPKYG
 /5sJtJ2LdKGMbDYz+LwUi3l72/kC5x4HO7q+qUT6nb7WWZkEdJadSY6Nv2tq4Tu1OmFzJm1yO7
 MmO6kNJKeQSpYhqtIVoXQjRwh+lvym7RGmivDQuBu9M21Y/1DzPD05/udVZAQAA
X-Change-ID: 20240530-drm-bridge-hdmi-connector-9b0f6725973e
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5312;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=C4fwAVi8Y8X09kTJmKrmpH7fVyGUsoMv9zUOWXGRYW4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnP9Sn9nKiqy+nhkrdFBttnXflL5ViiMKvfm+nv
 dqQY3eVyaKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZz/UpwAKCRCLPIo+Aiko
 1Y9VB/9nUIvKzPfa6965IlISfpPf9ACZ4w5nJFNa7D2JevOj33zVCtjWri2gXfW/0vlnodCMiUk
 9m3z5habClZZBt5jkyJdTbT0DIHnSMsElQzHYHukEd12M/SgQbbEUjSc+GFejAtKVL1Ijxu+FMG
 ASZZb1YualEDuroQKhsrgnQkxdr2DNLTz/j3IAp3KJu4CUGot88ERprip2HeQC9Qr2lLJuNB2ke
 cjL5F9V+9m0ZQNoJDsf1j6/YGPlAd6bFJUq+2GykIgVl6rSSAiQNojT6QX7fk5phe55GDJZ2fQP
 xTlSjB9OnDXSAO6HfbBOtDzc2uI+tdk29iZWKWC4/ICja0PD
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
framework, I stumbled upon an issue while handling the Audio InfoFrames.
The HDMI codec callbacks weren't receiving the drm_atomic_state, so
there was no simple way to get the drm_connector that stayed at the end
of the bridge chain. At the same point the drm_hdmi_connector functions
expected to get drm_connector instance.

While looking for a way to solve the issue, I stumbled upon several
deficiencies in existing hdmi_codec_ops implementations. Only few of the
implementations were able to handle codec's 'plugged' callback. One
third of the drivers didn't implement the get_eld() callback.

Most of the issues can be solved if drm_connector handles
hdmi-audio-codec on its own, delegating functionality to the actual
implementation, be it a driver that implements drm_connector or
drm_bridge.

Implement such high-level framework, adding proper support for Audio
InfoFrame generation to the LT9611 driver.

Several design decisions to be kept in mind:

- drm_connector_hdmi_codec is kept as simple as possible. It implements
  generic functionality (ELD, hotplug, registration).

- drm_hdmi_connector sets up HDMI codec device if the connector
  is setup correspondingly (either I2S or S/PDIF is marked as
  supported).

- drm_bridge_connector provides a way to link HDMI audio codec
  funcionality in the drm_bridge with the drm_connector_hdmi_codec
  framework.

- It might be worth reverting the no_i2s_capture / no_spdif_capture
  bits. Only TDA889x driver sets them, while it's safe to assume that
  most of HDMI / DP devices do not support ARC / capture. I think the
  drivers should opt-in capture support rather than having to opt-out of
  it.

This series is in the RFC stage, so some bits are underdocumented.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Added forward declaration of struct drm_edid (LKP)
- Fixed kerneldoc for drm_atomic_helper_connector_hdmi_update_edid().
- Link to v3: https://lore.kernel.org/r/20241109-drm-bridge-hdmi-connector-v3-0-c15afdca5884@linaro.org

Changes in v3:
- Dropped RFC status
- Fixed drm_connector_hdmi_codec_init() kerneldoc (LKP)
- Dropped double underscore prefix from
  __drm_atomic_helper_connector_hdmi_update_edid() (Jani)
- Moved drm_edid_free() from
  drm_atomic_helper_connector_hdmi_update_edid() to the caller's side
  (Jani)
- Link to v2: https://lore.kernel.org/r/20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org

Changes in v2:
- Use drm_atomic_get_old_connector_for_encoder in atomic_disable() to
  prevent it from crashing
- Reworked HDMI codec init/exit, removing drmm_ calls (Maxime)
- Drafted the helper to be called from .detect_ctx() that performs HDMI
  Connector maintenance duties (Maxime)
- Moved no_capture_mute to struct hdmi_codec_pdata
- Link to v1: https://lore.kernel.org/r/20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org

---
Dmitry Baryshkov (7):
      ASoC: hdmi-codec: pass data to get_dai_id too
      ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
      drm/connector: implement generic HDMI codec helpers
      drm/bridge: connector: add support for HDMI codec framework
      drm/bridge: lt9611: switch to using the DRM HDMI codec framework
      drm/display/hdmi: implement connector update functions
      drm/bridge_connector: hook drm_atomic_helper_connector_hdmi_update_edid()

 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   3 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 170 ++++++++-----------
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   5 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   3 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     | 162 ++++++++++++++++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  59 +++++++
 drivers/gpu/drm/drm_connector.c                    |  10 ++
 drivers/gpu/drm/drm_connector_hdmi_codec.c         | 186 +++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h                     |   5 +
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   2 +-
 include/drm/display/drm_hdmi_state_helper.h        |   5 +
 include/drm/drm_bridge.h                           |  23 +++
 include/drm/drm_connector.h                        |  80 +++++++++
 include/sound/hdmi-codec.h                         |   7 +-
 sound/soc/codecs/hdmi-codec.c                      |   4 +-
 24 files changed, 607 insertions(+), 136 deletions(-)
---
base-commit: d80b5c5b9be6b2e1cdeaaeaa8259523b63cae292
change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

