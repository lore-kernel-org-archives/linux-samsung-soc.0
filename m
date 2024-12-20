Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C9E21A438
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 19:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722230; cv=none; b=O80WEuawemhpPqmsTT86esbrKkbzGZybdUT0OSYjiBhhYZOqNcwx3gQwdMzq6onDWZDctuAKTkGFUd57aENAwOetSia+eU1FaPFrIiZEVLPKfsrlpzNlyElQqmy+gaqqfsn1g/2deTabgdkU5pf5uqvCAtxfKEgvDt9TfGsWvzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722230; c=relaxed/simple;
	bh=giLohpM0BRvWhMYAR/wf1lzclRNU18yQ7AASBU7KAiw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ghnvuzWnmaLK3zeZk1wTk1fhR+ZiZ7brmvoHjEYsxZfPyf3Mwc3i4No198vputzqrs8G8h3wFbx5Ets3WHILuRbgzjmDNdDIYqhXw95kErXD8xfSona9qDWPGuR0ETDnnZ5uXeWjkW5QwWwtyLn53hmQrRuchmyD8aa/vdzKAbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z8qo+5/O; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z8qo+5/O"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-303548a9361so19563781fa.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734722226; x=1735327026; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3NH9o3sRUQc2TBuzCNn4xd0xwtaijH4zEiuuPAl8O+Y=;
        b=Z8qo+5/OUBNKdogrMndxEdFcl+Wm/kWxJvgXD+hzebUkXyLBsyYzg8rYUVxLA+/3GK
         kHG/VjSd9ActjRjsWcBbG3E4TP4KhN2o59eEJEVFMGyeFxgpWDtqR0S8UQFCGKRix0/B
         mxFHfyRGxvH1mzRsoErEgNwbtJ6lRQnv13u+cnKC7d7ARSofJ9qdXvKVI/Z0Z0CcdbNr
         r1Tabr/fk/xMaYonNbW9bljvqGVzCvUNFyR6Khvtr0GAajvT6cecDOOv6ejRX1oYLoTM
         bDLQsgkC2LoWR20X+sKYel/7HhIEW0ZaDKog/9Je98dhc4hCcGa7chrvnE1shMT+ehm+
         8bVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722226; x=1735327026;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NH9o3sRUQc2TBuzCNn4xd0xwtaijH4zEiuuPAl8O+Y=;
        b=F+njFOiDgxq5XFjyS4za99r2RIVAnEo13AiyBbZJdZ6kqPWpa3Cn5KlZjuc/6S7Cxa
         jXPNUZN7BP7lkUl74V7WtCTYNwhRAHLyN5ViCoDPWq3P5SuSuUOyPxqoqoorwY+w7woL
         7iSi9MFEHm8hMVPNW8nDauJDdhUXx+HfT3Ua4P52RzRt8sS76/ldjce4PMoC5EOgLl/A
         qH1Q8rauOeorJQJNPKEjO4Cr/4feJN/RskSWYjP02awmhvW6T9aaNZg7GXmTryctIgy1
         DJbv+JquxIm5pb0893C0c2d+W5HZ93dl0zRp1SXGIJfFff8WZNOVwqrZz6ByhVbNE3YG
         AG2w==
X-Forwarded-Encrypted: i=1; AJvYcCVoH9tEONS/ovRzraokstIF8HZXUGsv/Lq90oyX3K8cv4+qMOpLU3a0L81+CtOW9iMGjIROG9BgrzT1roNuk0SNsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9a54zkXPw9HcWafOUYrLePQEyS88t+8hMsVJzHCILLWhWvt1a
	U7fbiSo3bgPebQS/VQwXo6I7bO+5nWFViplu2hS6zmiblDasj8MbUQofNTVwG+0=
X-Gm-Gg: ASbGncvAwEGIQ9dsdqAt5pSU1WuJ0udDoYTe9ZYBNEyTbz41QmL2jmz/oFDsoP8Rs0x
	95e8NcK79NqERnrtkKPok93nYSwX6sy8SrUzmE8juq0WGfeY0ITLv1xjnRoa5opUh8N7Ldw9jrW
	pLtYJ+i8bf+MkNmHyA3PsSRZ9OQhFVb3EcwqEbe0TzTwtQ+AdgR66/aIO2CK03Y2XDNSOXV+Iza
	8IS39Cv4iMLJTOdycU1x6cVoptu+3Zdb+KuX3qIlrr18vmG0k/aMGrWFzQfH8Xt
X-Google-Smtp-Source: AGHT+IEwbdV0vqS0CbZsf9gavU/S6dsgiTym1Hj3ImdXSFJiHjGHsRoZIPzHljOSqCM570WwNxfbig==
X-Received: by 2002:a05:6512:1055:b0:53e:39e6:a1c1 with SMTP id 2adb3069b0e04-54229560360mr1595277e87.43.1734722225396;
        Fri, 20 Dec 2024 11:17:05 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:17:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v8 00/10] drm: add DRM HDMI Codec framework
Date: Fri, 20 Dec 2024 21:16:57 +0200
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKnCZWcC/33S207EIBAG4FfZcC3KoUDZK9/DeMFh2CWxrdLar
 NnsuzvdRq1pwh0/MN8EMlcyQskwkuPhSgrMecxDj6F9OJBwdv0JaI6YiWCiYUoyGktHfckRT86
 xyzQMfQ9hGgq1niVthLJGAsH69wIpX+72yyvmcx7x2te91cyX3VXVXFXUmVNsqmwKptXKefH8l
 ntXhsehnMjCzuKX4pzxGiWQMtJCsi7GZGFHyS1la5REKnDlUgxOtW2zo5oNJUSNapDyTdQ2apA
 +2h2l/ihRf6BaKCW5hlYkzd2O0ltK1yiNlGIx8EY5G5jeUWZDcVOjzPJX3sYkvHaKq3/UbZ2UA
 h+fOHzTOi7EuxGQ6Lo8HQ8L3eUxPP0saA+XCUtv35WVZBK/AgAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7525;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=giLohpM0BRvWhMYAR/wf1lzclRNU18yQ7AASBU7KAiw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZcKtk+PPS9ufezpvTTjC4kTqVhFjjhD5e9vOj
 0BznWorBwiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2XCrQAKCRCLPIo+Aiko
 1TAiB/9wLaUi6L1U0wm9kaQGolW2F/JocJmm7XmS2xhVk+EutMK+TI68eC0FFtEFQOTPNa0grFr
 BU27z3zSFRsJO9H3uAi5rvJE+A3WirWbzGhomKwyls/EHSjQ6zzrz4m38LdZXI37jKQ4oCQJkz1
 mMfIxU5NvmIQfPyTifwZ3NuZwsQeo4CxNguZ+EbSZCCXW0uVivlx/W9y0wX3wexEF+LlOdMtuw9
 2rA1nGLaBjhsAxlc1YDMzCs2vElD7xprsAwL621D8TE5r92DUlBbgzdZrwX2mHf+VVRsj0ktHkn
 gxmNAiIe70Fgr8rhAbp/jFHW/SGfLzvFuwyzbwkG0wvSWyzz
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
 drivers/gpu/drm/drm_connector_hdmi_audio.c         | 189 +++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 103 +++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 -
 include/drm/display/drm_hdmi_state_helper.h        |   5 +
 include/drm/drm_bridge.h                           |  74 ++++++++
 include/drm/drm_connector.h                        | 141 +++++++++++++++
 include/sound/hdmi-codec.h                         |   7 +-
 sound/soc/codecs/hdmi-codec.c                      |   4 +-
 25 files changed, 716 insertions(+), 208 deletions(-)
---
base-commit: 74ef9527bd87ead62deabe749a6d867af748d448
change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

