Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6544C8CE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Dec 2024 01:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735004884; cv=none; b=Z1rVJ0tgRcq/kfaG0awe9iiqUA79P9/goQ8dG4uiUvgK39llmdWXNvShbsTy/1oyGRdJs2pK3COw+VCRvDpio4panmwu2FAEbUqXQFDDPQWzKibVCbjMQ9mtbaki+VJPp29O4mMnr3mS9Jr/WzXuSJknxHWpBIg5rRN3phtfIsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735004884; c=relaxed/simple;
	bh=4LTeSs50C2WJ4ARGkK6H5mYa0q5kVIxYu7UmLLfaBaA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WNr9y5uSH3WXi7TP+ZuxTn3ng90urDkOWElqhqSSXYYvLSPddjC0VfUFYs3VRq7B+jTRl9Vua0xi343Yog0mqXkoQrSoWtFbAAKRMJ3s7a8MfuWbiRSyFV+oIJL6Xah2J7fclg4HbO+4V2j5g4wjKK4Fd0jbjSG35S6jM2FL1B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gBwxgHkk; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBwxgHkk"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso5186130e87.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 17:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004881; x=1735609681; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qU0qnIcIkR7dj/3kD7afUUVjsxQA9ajwBHtPtEwMtwM=;
        b=gBwxgHkk8a3Z3VQXA/ynPAwPXjXnSyEGPpl+jYz7Uy2xY7szYgEI82j9pu7aB6ckkS
         vuj3M6KsUvgoWXKhmfvmAdwPlbE5k3q3gE+GuNF3YtSK/d81R6v08lvA3xxHyQragP90
         p+Iy/ncYZ4TmqvdqPG+mI29J3QR5dR+OJ3MaJNHTYUx4Z+A68Av+kcZVMmDhjbNd8/oa
         4Nczb9rboDZYPzYfxZPWte8MIRKmfCX46mRCQuQhzjYniLW/Hjh5oDGuLIAYy27UbZlc
         h9gE4mVyOVpDskkqw3nfsFPZqN6saxEdOS97zYUFZGt8ycGilNlzHqEgKAvmIWW1+Oas
         wNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004881; x=1735609681;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qU0qnIcIkR7dj/3kD7afUUVjsxQA9ajwBHtPtEwMtwM=;
        b=hCJqLcMeUYBLZB4JM0CdQ7jx5If2XQ4WzCI2w6rHQMax2/nrfMZiOGb0YHFVLPTUBd
         1IkOkyj8tilaTECQ2Pfk9CVKsqQ8kKxlIQ45p6nUqJOmzbX89PHqbDaZCJATCxujoS2C
         VgBqXbirhfSx5BXbdOqa9nbiPLvOJS+lF2ArUeD+KYocRO2cEH/rg5B1CVcHeOLhrbRF
         Q+7k+h1WKhJ73juuHylcAaY0MYYwU2X3IWUuVExGrJvqoJzIjOm/n8UTsWHLJ8mWxFt+
         L1j9jHeFDdFjpTOOsO4ohWELFfous7sdmcEkiJpo6ZrLArdVvQ1371Sh5SWkmcLY6zxq
         zuzw==
X-Forwarded-Encrypted: i=1; AJvYcCWrPbZPrZm1ZivpmHS5eZLBkNeZj6eihbq3Yfn0wdrkodrRqd7yF67GWO/kQcK+jfRrefaqWsFPqwVe1QafMnRqMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSnjYK6be0/tRXg0L4T3earhfrqeiadIqHuoYJEpOmIK9GpRSc
	FH9mg6kGy5K5N9ttDKYiS6i1NFquO7Lls7V7AFjC/o8KUGqUoYSYCowWnIab9No=
X-Gm-Gg: ASbGnctdXtSVSzdXZ2ao+0sd400IOrlrxCsNytCp3nqPu3bM3Jf0ipK74bUeCfxm0Ow
	pWk5IxdtahpqN89PNJ6eDFN42BufBYRwWLVR2bRr5wtNxYGvC1+mVeRXhdKwM6/4LBkHXsCbpdR
	OHux5DopNTn+5hMFbh3JNlesET8amS4wkl5EfE4tqmRIXwaAabdeSvgnkq/qNt+NffCpm/8jCYr
	5m2ePTenVq8/TpQmBLSt6WurEepC6lfaYGtRtECroo3BhNkNCtzANApJ36dKQD3
X-Google-Smtp-Source: AGHT+IHuyQh2BUXQhwG9fpuqLgl4F91XKGr1wGSBYyzdxhmmzfsQu5ejyZAvzjxiBq83VzqUskBGGw==
X-Received: by 2002:ac2:4c48:0:b0:540:20b0:da2f with SMTP id 2adb3069b0e04-5422956c0a8mr4482466e87.55.1735004880777;
        Mon, 23 Dec 2024 17:48:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:47:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v10 00/10] drm: add DRM HDMI Codec framework
Date: Tue, 24 Dec 2024 03:47:52 +0200
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMgSamcC/33TzU7DMAwA4FeZcqaQnyatd+I9EIf8OFsk2kJaq
 qFp7467CiiqlFvsxJ+VyLmyEXPCkR0PV5ZxTmMaegoEfzgwf7b9CasUKMEklzXXilchd5XLKdD
 OOXSp8kPfo5+GXIHj0TRSQ6OQUf17xpgud/zlleJzGunY173XLJbsqhqhC+osKmqqIfqmNdo6+
 fyWepuHxyGf2MLO8pcSgosSJYlqFGAEG0IE3FFqS0GJUkR5oW0M3uq2rXdUvaGkLFE1Ua4OBoJ
 B5QLsKP1HyfIF9UJpJQy2Mhphd5TZUqZEGaI0D17U2oLnZkc1G0o0JapZ3spBiNIZq4XeUe2Gk
 qURm1uipAIIzqIE4DsKtpQqUUCU8SiM8xhc6/5Rt3V+M3580p+Y1iFmzo5IRNel6XhY6C6N/ul
 nUfV4maj09g3pG0UOVgMAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8225;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4LTeSs50C2WJ4ARGkK6H5mYa0q5kVIxYu7UmLLfaBaA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLMxQMTXQRiB17Z7g4FirxL4CVH11OFVc7Jy
 9mXzwy/acOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzAAKCRCLPIo+Aiko
 1XB/B/9f5VZ7CS/KKbdKaH3Z9CJwy80SUzTZZLDgLfAx3SQyYLwt5hmgTUW40F4/UW1aiebwUU3
 bHKlvw8ya64lnYpy71sACEwy4AcIGXhppL94rEK/tQU2YS9+9PPieFpFRar194CQ6V7G4GAyptl
 fPuMPQF8m7dJGPYfr/rb+2yosJxwv48eMY8Br3bJOMcxczbUgjcEDtYHMH8b8OHGhKR+q1nrXdX
 gUUnzjJqAZhNugILCCxJADp5+o943BaU2oaylZk8zNca/yzpYxjG6HDqc2IqZfNvA3tztmeSFDA
 j0yGYepRuU5pwS2WF+mFgSR5HVEArhvLISZhAFLJz/JYcavs
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v10:
- Move HDMI Audio functions to a separate header.
- Link to v9: https://lore.kernel.org/r/20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org

Changes in v9:
- Fix a part of the hdmi_audio rename sneaking into the
  drm_bridge_connector patch.
- Move HDMI Audio implementation into drm_display_helper so that it
  doesn't get compiled for driver which do not require it.
- Link to v8: https://lore.kernel.org/r/20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org

Changes in v8:
- Mass rename hdmi_codec -> hdmi_audio, drop redundant audio_ prefixes
  from several callbacks (Maxime)
- Fix the commit message to stop mentioning
  drm_atomic_helper_connector_hdmi_update_edid() (Maxime)
- Link to v7: https://lore.kernel.org/r/20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org

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
      drm/connector: implement generic HDMI audio helpers
      drm/bridge: connector: add support for HDMI codec framework
      drm/bridge: lt9611: switch to using the DRM HDMI codec framework
      drm/display/hdmi: implement hotplug functions
      drm/bridge_connector: hook drm_atomic_helper_connector_hdmi_hotplug()
      drm/vc4: hdmi: switch to using generic HDMI Codec infrastructure
      drm/vc4: hdmi: stop rereading EDID in get_modes()
      drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi_hotplug()

 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   3 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 169 ++++++++----------
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   5 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   3 +-
 drivers/gpu/drm/display/Kconfig                    |   8 +
 drivers/gpu/drm/display/Makefile                   |   2 +
 drivers/gpu/drm/display/drm_bridge_connector.c     | 138 ++++++++++++++-
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    | 190 +++++++++++++++++++++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  57 +++++++
 drivers/gpu/drm/drm_connector.c                    |   5 +
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   2 +-
 drivers/gpu/drm/vc4/Kconfig                        |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 104 +++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 -
 include/drm/display/drm_hdmi_audio_helper.h        |  22 +++
 include/drm/display/drm_hdmi_state_helper.h        |   5 +
 include/drm/drm_bridge.h                           |  74 ++++++++
 include/drm/drm_connector.h                        | 132 ++++++++++++++
 include/sound/hdmi-codec.h                         |   7 +-
 sound/soc/codecs/hdmi-codec.c                      |   4 +-
 28 files changed, 743 insertions(+), 208 deletions(-)
---
base-commit: 9d2616754ce7e16a9e73ab6c00efc27fe47cb943
change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

