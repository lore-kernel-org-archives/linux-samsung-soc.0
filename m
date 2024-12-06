Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6111FF7D3
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733480209; cv=none; b=t0lsHVMcO1eKE3pHgfPJLubnL+LRE7vYO5XLWDRDujyOj45vs5cHreC2M2BjftZRbgHwpeTQ7ODLNI8T/A+pPT0DoKgA3pB5r9C3nfBzwnVJU8+2T+NoEmb4yVKhw7E+mrABd1vl6iMq9ItOTaS2foDLk1kywqkhcbz9K4xJMNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733480209; c=relaxed/simple;
	bh=X9kaSDtRP1MgSeYirvVG+XyehxBCw+87eheLybmqpYo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hpkJ/1FiuyuXiIRh/KiBjQ/1CAwkHpPnEQ58eAtu/pClFKDFjrgX6F00Wsx/qSdaxTfaJ5PWJe6suCIcawPslL5gOn9u36MTfD5d4OnbNWcTBsDLmRNwpvNdphDglnCgeJocU6GSracI5wgmBKGMl3yeaEqPseEnjieanqTYKvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B5i6tbXL; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B5i6tbXL"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53de92be287so1887886e87.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 02:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733480205; x=1734085005; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMu0r/m4fzk4vy8ni1/jP/ytexs8H5s1m6UVlxoiIzM=;
        b=B5i6tbXLar/e86gsS+h2iBGZRtftibynzzSsiPwU6XoB9Zt6BzjjBERBDPXhUbg1sg
         +0yEBZ0QG3hU0qv9YWx/KP4wD11GGt02MqQQfhhFKZmESxujzroav9KXkrwnch8/4jYs
         Fx2Hw/hjewFvI7WUBiQin8qksjOWKjmBIahlTvYCcNDyX63mdP8BwZveDr1xAvauj4CZ
         3SPX+rk8Kpt5eb3TsTo7pJM0Whh00bO3izcUoj5J9d0WfRlp7Wv4LflTi0ra6hQrtIAF
         3529dwAugikL/guScoObMGhyNs0EQf9JEa9UkwdF7uOhj/Tjvcj7lkge7pucqxURqvGv
         v1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733480205; x=1734085005;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMu0r/m4fzk4vy8ni1/jP/ytexs8H5s1m6UVlxoiIzM=;
        b=nitE21DSi3UunGFyhB4kCKVo7zeQ6cLvKKLn9dXfWxJ50SWa63JZeA9HMeI0j+/nXj
         6Sk5zHpPYYHo7KKcrUummUDvEXw+NbYd3wkDlTLQwPjLIDviHXiYDSqWRNe1UWQFg8jw
         TlgQy+upWQeEiIzBVPl+lpbw2XaAUqPmbPbFU5o/76g9P5K5/B8FbqI+pVpkN5M39LW4
         i00K+c8YBkQUFUjkHZN95FSOVIOhgjCeJfewv01Jx0iCYmhS1K/0i6d93igophGLv5KY
         L4Dojh04iKEcG5vrEqDXlzs8bXLjfPMC0ESfzFKeX7emGnQSLnmq5xcdQfk2b2dzizce
         lBlA==
X-Forwarded-Encrypted: i=1; AJvYcCWrn9vgveqpaed6B+4wYknfHMxSn/wJbdFEmjfqlWGZcB/OxVaYWh2X5qK8OoIMHH+OWUBexSAeQ2aURtsT62tQvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYlfyIIaH44NoZUMD86ccTO5ILAUfmJc2tO7bMcTFWAYa0pT3w
	JTG1Elk7w3UKn1XZ5NN4StOE4A9ph0w4qHJTq8YAcdYvkp3mBl7Qyo0Nqo1Fph0=
X-Gm-Gg: ASbGnct8PbcWM5QccEuICjGB7q+U867k89OolOGbGVCoxGyJKt7f0Z2En3/nxJYXOcD
	UDOpg6ykKjYgcGyax4aCIxPT/cdVfPPlS8TP4OFbpUA8fgML/v3Tla4q1gGWwf11Nce8sis/bN0
	m4cX9ConH/fLOFSADVpZ0fY0qoToYwJVeJ99KEkpkDa5KD+ADZHstfdg+jkIr4TwW9HA1HUDat6
	+8CMCFjXHS9SgGzb06f18kni97QlthmWMKanVJNrSg1YtgR88C9qCB8tw==
X-Google-Smtp-Source: AGHT+IFoNdCoX9yAN9f6E4/wn97zmUD4xfv4UmC2Fb6ivX/IzUxT2UJ0tEJKhb3Ba6M0U4YvvS3rmw==
X-Received: by 2002:ac2:5212:0:b0:53e:2ed9:8122 with SMTP id 2adb3069b0e04-53e2ed98271mr483370e87.22.1733480205200;
        Fri, 06 Dec 2024 02:16:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:16:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v6 00/10] drm: add DRM HDMI Codec framework
Date: Fri, 06 Dec 2024 12:15:54 +0200
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANrOUmcC/33RwW6EIBAA0F8xnEsrICie+h9NDwjDSrJii66x2
 ey/d1zTuhsTL4SBmTeBuZIBUoCB1NmVJJjCEPqIgXrJiG1NPAENDmPCc17kUuTUpY42KTi8aV0
 XqO1jBDv2ieom96rkUpcCCNZ/JfBhvtsfnxi3YcC0n3uriS2nq6qYPFAnRrGp1N6WlZKm4e/nE
 E3qX/t0Igs78X+KsZwdURypUmjw2jjnNewo8UjpI0ogZZk03lkjq6rYUcUDxfkRVSDVFE5pp0A
 0Tu8ouVH8+IFyoaRgCiruFTNP1G2dSYLvC455XAezTbnOnjpsKpwd7S4jzLQyQhshAZeqxn9Hs
 DEDYG7XhbHOlrouDPbtb0MjzCN2vv0C/vUs5GgCAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7229;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=X9kaSDtRP1MgSeYirvVG+XyehxBCw+87eheLybmqpYo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8IyVydnpBlAcAHh/cXorjU91qWaV7pIsj38
 2HxLjH62cyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCAAKCRCLPIo+Aiko
 1VNVB/98WtyAUjEWVIPrfqZFogwDMChB2E3F91aMuAO5L1y25H5WYJcPWv69B5Xc2pV2tb5JX5W
 VjbizeqJ4/CraKCMUGpGUGJ8O+JaYQ+ZzZQjogS4f/irTluKP5JH0gOKfBg5yTVJ6R9W0XLpUNP
 oUN6rEmaLqKEiNbRo040BvPDi+1wYFwg10PnBdzRXDF/Q91Uxh9wokseT7SouqP36U9jIQwTFpL
 98w14nh5sW5flZ/suxJZkpFUvHHXOp0wpbk6WiVtsdL9RJFXPRrqqpO7bbTfT3idPOtTEIg3PHs
 UCznbLm0RFr43E4gqaM7+j9yZv1QHF6kvjzzpiuc6U6qK1cY
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
      drm/bridge_connector: hook drm_atomic_helper_connector_hdmi_hotplug_edid()
      drm/vc4: hdmi: switch to using generic HDMI Codec infrastructure
      drm/vc4: hdmi: stop rereading EDID in get_modes()
      drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi_hotplug_edid()

 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   3 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 169 ++++++++-----------
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   5 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   3 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     | 127 +++++++++++++-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  61 +++++++
 drivers/gpu/drm/drm_connector.c                    |   5 +
 drivers/gpu/drm/drm_connector_hdmi_codec.c         | 185 +++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  98 ++---------
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 -
 include/drm/display/drm_hdmi_state_helper.h        |   8 +
 include/drm/drm_bridge.h                           |  38 +++++
 include/drm/drm_connector.h                        |  80 +++++++++
 include/sound/hdmi-codec.h                         |   7 +-
 sound/soc/codecs/hdmi-codec.c                      |   4 +-
 25 files changed, 610 insertions(+), 206 deletions(-)
---
base-commit: 84e541b1e58e04d808e1bb13ef566ffbe87aa89b
change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e
prerequisite-change-id: 20241201-drm-connector-eld-mutex-8a39a35e9a38:v2
prerequisite-patch-id: 8373a0638371955d1a695a6253a5429c5c79ee05
prerequisite-patch-id: cd898cf6d758d05fda796b0ab685ed53d7ccd72e
prerequisite-patch-id: 92115dfe744bb79f3ef0a10fc1fb3c8ef22f3bda
prerequisite-patch-id: cc8334b2d881be3418f1d4d2fdea8b05776fdb73
prerequisite-patch-id: 8c6c14a1dc11e4b70ea67b25dc3d2f6ef3234160
prerequisite-patch-id: e0dbd26699df8fcde52a46a66e4ab4dc705b2c2d
prerequisite-patch-id: c6ca8b52338034569c09e35061d34b277a876253
prerequisite-patch-id: 32bdfe82c8f8573fc9132395520bf6ed949b8915
prerequisite-patch-id: 865b400514c2207990c07d9f789c05e414d19fd6
prerequisite-patch-id: 0e05e8ce53477acfc686620b9e212763ad3058aa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

