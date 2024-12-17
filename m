Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D66B17BCE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2024 00:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396032; cv=none; b=GGFiBZ/fTZwmQWl1ZzWFtRj188+NvpeJiso8x0PkigOTl5x/Ijdtpp6R6NQHGucZ8WJihF5nO1LYtoHSplEj575Fgv6LDLkvPeN5jGht2roPm8HVA4+QHbwMqbADcyScDvmJE3Roeulz69TulVJT7LsYp+WeJVzedgrC5yPp/Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396032; c=relaxed/simple;
	bh=mRS1w8SNa9F8msOnfuNbepVkyjcxKNCRov7QDV7keWU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eB1WsjbOZvZEaH7M9TUGrMa2VmNkVmFLIq7bl8ENlH3z7zVhehat5fafseTN95BDMqTXMux3rovwdGqzD7ftQbsnP7vND5vyiYoAmGeUp1zHdg5dRqGLkTYoZ6TojT/6UiC5syOTNuMQXER/d5X+18+tgUUDYGw9JOFcxN2NM14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TBT7zWE+; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TBT7zWE+"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401be44b58so4766664e87.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 16:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734396029; x=1735000829; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sgTKjvs5B9umQJDB9laJqcBxoXGDoUpyDIM3gP/T+70=;
        b=TBT7zWE+7cs8o5S9tyhUoxbtQIZa964dbvQrwU4RXOMxyM52OoiiA5m89k23qqWufF
         bQTQsTNCVnw/6lAvqRdd10Ji+awBHtNhNiVHmvq8UdKiIeJXocNlM4efRCtfV6RWZu/d
         MMYaRyzclFr4SjaH7MDqS6gyxdz8YXsVrXuB9p4x8pIhkQLkdS8FQCQs1k/Ezp53Smhd
         RoPBDZtcUrOSEDqXEuN1nMF54x0AcYEc4RM37oRdw9hOqmgpB7YQ/MYdhq2L0jXJ5VI8
         tNauPNme96Nv1JfQgMn+3XakWSvYkP/5iJdSFqlLMx253ubXBnSo3a3P0egWlt9HRNit
         8ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734396029; x=1735000829;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgTKjvs5B9umQJDB9laJqcBxoXGDoUpyDIM3gP/T+70=;
        b=mcrFmGzpKiXQj0uxUkon9i8AA7VDdhMKblcz4EjLgRrH6PIWAZIWb2akbbCvai+x85
         A6AIwTR/glx3yD3cN14ucwe1eBOu72/FR4Ia4dVIl7iXZCWonBDb0wbILAkDwODfm3SH
         RcMEIqxW85540zgkppAgKO3OODtCc5suWNsBwiRkxoTyCcT8WZnhYILES7lKueW7f9XM
         oStizeBHHyHlA1mBXD9st8repPCiUTkzp5eF+y7T0O3svjYLHTb+IAEhZevzhgL9FUYk
         1kSqQSVTwJ4OIftmHOT+6ghtbswLxgtriFl68B6lw+spXPwCoJQYsWT1MO8gkGRImz3D
         oX8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFkR8r8Hx8teRNlNb2GLruE/NHh0cjrNd9G+lVaChbse6co+ZQ+5GdDDYCrE/2ohMcdL+1omCzqWQ23Iot71gXcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUHU1F+rz6Kw1FaARYwgaQNeOqVPuDUcmcVEOwXGxjvRl/VQuQ
	onWt4Nq4iXvikjc0R/kvrNzZJmTOIn53OnKbdquD25nc/oHzRWRNFTx3liWnu3A=
X-Gm-Gg: ASbGncsxOoWAXJljCHcHW5CjEGm70cDIGqGpH+cvXMRmIDRl596ORcDRIAmw4OqPZac
	/wj0Gz+g5GQehIX/AnruJ+LN4rGOEqTv9b4BUT3ghwJdR+jbaX21MUMa9CoUValmLODZ/F6p4AY
	8dSjVe8op+d3YBgJnhYZuXlpexa4+VCgjZwm2KXymUvVKcST+AvB/gEAldsWn/zwvtTRG/t8RX4
	V0R2ythpv0R2FI/ojzvET8TbbQrFOl9yOWv/cFU7A/bOL8sJ1UI6O/+2KJTLsHg
X-Google-Smtp-Source: AGHT+IHgyssPUoD5TTHyYQK7cwkYSeC1SmeWaAD5CnHBBIgjrBsFSL/7oq0zvZWIwIxweshvE4C4MA==
X-Received: by 2002:a05:6512:2356:b0:540:15b2:fd27 with SMTP id 2adb3069b0e04-5408cee91f9mr5298547e87.7.1734396028668;
        Mon, 16 Dec 2024 16:40:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9ab2sm1009122e87.74.2024.12.16.16.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 16:40:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
Date: Tue, 17 Dec 2024 02:40:22 +0200
Message-Id: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHbIYGcC/33S207EIBAG4FdpuBblUGjZK9/DeMFh2JLYVmlt1
 mz23Z1uo9Y04Y4fmG9ChiuZICeYyKm6kgxLmtI4YGgeKuI7O5yBpoCZCCZqpiSjIffU5RTwpAt
 9on4cBvDzmKlxLOpGKNNIIFj/niGmy91+ecXcpQmvfd1bLXzd3VTNVUFdOMWmykTftFpZJ57f0
 mDz+DjmM1nZRfxSnDNeogRSjTQQjQ0hGjhQck+ZEiWR8lzZGLxVbVsfqHpHCVGiaqRcHbQJGqQ
 L5kCpP0qUH6hWSkmuoRVRc3ug9J7SJUojpVjwvFbWeKb/UbdtvBk+PvHHzNuMibMTINH3aT5VK
 92nyT/9LOgAlxlLb9+JCdIOdAIAAA==
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
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7339;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mRS1w8SNa9F8msOnfuNbepVkyjcxKNCRov7QDV7keWU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnYMh483Vpm6YpzMX9dKJr9f3olvRFJHcdSD93X
 zwWLjpOlJqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2DIeAAKCRCLPIo+Aiko
 1VGIB/4kMV7Jy1pqTM07yPePXEI6rxw63Q43UZOrElHr/cHnE8zoLmUAw6qrzAwhV64ZZglIrfy
 nIKRz2ehx4CQ7xMgKNVPrVbAh1GjO5pMWZe+OaiTvfrfvyqpLe82GVCMG467y1S/ONPEi9RPSmr
 80rs6Rj0x8/zHjpcD4F85x90QvfXseTtr9Pk9CElxhpDDDb8Asghn+WA7Qt5L79HuhkcRJOslsL
 /fj6LMAs7PVPCbR0luL4hTm/5e1UsYYBoc0Z9but23RgUvpkBDKcS844vyDO6ibCZ5UB5mRhpBu
 g0bANhLq/8PqCOybErtIcH3/tenLUXuKvKPu7CVra1bd9q/u
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

This series depends on the ELD mutex series [1]

[1] https://lore.kernel.org/r/20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v7:
- Renamed drm_connector_hdmi_codec_init() to
  drm_connector_hdmi_audio_init() (Maxime)
- Added extra empty line in struct drm_connector_hdmi_codec_funcs
  (Maxime)
- Dropped if/else from drm_bridge_connector_audio_startup() (Maxime)
- Added optional .read_edid() callback and reworked
  drm_atomic_helper_connector_hdmi_hotplug() to use that callback
  instead of having an internal function which accepts EDID (Maxime)
- Made VC4 and drm_bridge_connector use .force() in addition to
  .detect() and .detect_ctx().
- Moved HDMI codec functions out of struct drm_connector_hdmi_funcs.
  Assign them from drm_connector_hdmi_audio_init().
- Documented struct drm_connector_hdmi_codec and its fields.
- Link to v6: https://lore.kernel.org/r/20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org

Changes in v6:
- Dropped extra checks on the EDID (Jani)
- Reworked drmm_connector_hdmi_init(), splitting the codec init to a
  separate optional function rather than passing arguments through
  drm_connector (Maxime)
- Reworked EDID update functions (Maxime, Jani)
- No longer refresh the EDID in vc4_hdmi_connector_get_modes(), it is
  redundant as vc4_hdmi_connector_detect_cxtx() already does that.
- Link to v5: https://lore.kernel.org/r/20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org

Changes in v5:
- Moved prototypes from drm_internal.h to
  drm_connector_hdmi_codec_internal.h (Jani)
- Rebased on top of ELD mutex series, resolving the long-standing FIXME
- Converted the VC4 driver (compile-tested only)
- Link to v4: https://lore.kernel.org/r/20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org

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
Dmitry Baryshkov (10):
      ASoC: hdmi-codec: pass data to get_dai_id too
      ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
      drm/connector: implement generic HDMI codec helpers
      drm/bridge: connector: add support for HDMI codec framework
      drm/bridge: lt9611: switch to using the DRM HDMI codec framework
      drm/display/hdmi: implement hotplug functions
      drm/bridge_connector: hook drm_atomic_helper_connector_hdmi_hotplug()
      drm/vc4: hdmi: switch to using generic HDMI Codec infrastructure
      drm/vc4: hdmi: stop rereading EDID in get_modes()
      drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi_hotplug_edid()

 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   3 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 169 ++++++++----------
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   5 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   3 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     | 137 ++++++++++++++-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  56 ++++++
 drivers/gpu/drm/drm_connector.c                    |   5 +
 drivers/gpu/drm/drm_connector_hdmi_codec.c         | 189 +++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  99 +++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 -
 include/drm/display/drm_hdmi_state_helper.h        |   5 +
 include/drm/drm_bridge.h                           |  38 +++++
 include/drm/drm_connector.h                        | 141 +++++++++++++++
 include/sound/hdmi-codec.h                         |   7 +-
 sound/soc/codecs/hdmi-codec.c                      |   4 +-
 25 files changed, 678 insertions(+), 206 deletions(-)
---
base-commit: 81a9a93b169a273ccc4a9a1ee56f17e9981d3f98
change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

