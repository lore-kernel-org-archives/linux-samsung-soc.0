Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4C922083
	for <linux-samsung-soc@vger.kernel.org>; Sat,  9 Nov 2024 12:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731156518; cv=none; b=FtEtW0eM3w6vH/3P6xgY87rcoIQSB7JHHiAyUHsoqWVFaC57QJAtWQIKIc3d8Q5cHeqOYG7UfCSH06WIwhCEOVOJG2DDy21bgaaah7RHMgxWTfoVrX+yjv6OS0TBSgKE7BAL3xYX/c8weqfEcwBmb7pUKERwGE0SK6n8r/V1ox8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731156518; c=relaxed/simple;
	bh=RpfjHjeOgMA+vTAv8qdDWazS15s3/X00AeUdND0T1nY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lZAMEc578MWO62V8CPTDpgbVHq22p9sSAn0w7UhuzefbmNFmYmELAOuOC1uxFmohdWHA/VXQzg0/FuFe/tqH3HlACqY4nRqoYuEMa/kskMeoZuoGhT1YitfaEaIGx6MqDPpvicb62WOBfq9bgpt+sGddmwgpIj1WSzke5vcEY3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lt5qOq19; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lt5qOq19"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so3959560e87.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Nov 2024 04:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731156513; x=1731761313; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tktl0Wc+xw75bG8WyV2vmonQOnlV6r4PKPQgphemFMI=;
        b=Lt5qOq19L9CNUHoMdiK09hcciQnuqXD7SpVtHxsA0ZZQuuna/y+R7PKFVe0ZznSn6Q
         9BBx+gTrp55fAH/tHdHxavjbHPT/ihPfvAjDyP1k8D2o/60A0X0WES/nnXORnNhiCP3M
         K5666CwWtFRIKHasLe9ToBP2FN1T6cE5mKP7jLDyMwjxQGm6HpnoemS9xQQCI2SJhYZR
         8UB3IFtSvDOh7dzcK0T4CBVccQdatdmssRzNftx0r2jeBZtblpUF8TS7mB9M9cbv2WR6
         b4lBdpqZQUyf7JzhlzK44HLwqXF3f6tGR7+cgh7XP0XbqyNUSL47O625kVb7HCMiEX2a
         cAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731156513; x=1731761313;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tktl0Wc+xw75bG8WyV2vmonQOnlV6r4PKPQgphemFMI=;
        b=nAUYKrreKuZtg8PYwLFBKShG1xJN/wlrjwOTcUMyuheSYhcrNG2OUdZmkrbIxnX9zM
         YgFnr8K0MsEzkT7eDbC0XaRHbHlx5Z5PDagK4g6pZqb8fzdiHP0nJdrYuvGIfXWKycCP
         CDNS5VKDwjhwrpxveT0kztvwbZZC0XmVIiNbGSY3GFoTkuahDDZ9fZkA0Le9Zk1VOYXm
         NMmtepHESTI4usMNXPRwRb6JU85ZZz2v2MC8DAbfiB8w3ZZ1EA5SXBQpNbaAZGsfDUFx
         CtcNTnXvRt6/MUzQFEMKt5+68kUASPOOM5Yu272jo98NHKzNr1bglxBl9DUyyGRlmRq/
         G88A==
X-Forwarded-Encrypted: i=1; AJvYcCVpnwd8bj/Q6McAdEaNgHZKOjhgEpVL2ajnDH8Ds/HiTnmFmE0iu4d8FSMieNhwTb3keNjEuz0VCkSj5mMMFB5tLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9DTZr+EGale99GwlUs+aSm0NZwXIohthXMl0WB6wDkzYh3fPg
	U9sdroXMNQwcKEEPLJiB0AkU9hRcrEZhPzQJVh12/oMjWLMZgnKyjRweer0BkPY=
X-Google-Smtp-Source: AGHT+IFKjFQifv6YG5Ewl5DM9ApJVWk8n4DHPAB7HKN82uFlh1WN5YLZbnRUORGi+mr2yaiyEVDzdw==
X-Received: by 2002:a05:6512:3ca7:b0:539:ddf1:ac6f with SMTP id 2adb3069b0e04-53d8626c7a6mr2648976e87.46.1731156512927;
        Sat, 09 Nov 2024 04:48:32 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9b76sm929967e87.172.2024.11.09.04.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:48:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/7] drm: add DRM HDMI Codec framework
Date: Sat, 09 Nov 2024 14:48:26 +0200
Message-Id: <20241109-drm-bridge-hdmi-connector-v3-0-c15afdca5884@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABtaL2cC/33Nyw7CIBAF0F9pWIvhIUVc+R/GRQtDO4mCAUM0T
 f9dWhMTN13eeZw7kQwJIZNTM5EEBTPGUIPcNcSOXRiAoquZCCYOTElGXbrTPqGrm9HdkdoYAth
 nTNT0zLdaKKMlkPr/SODxtdqXa80j5nr2XqsKX6ZfteVqQy2c1lJlvNXHVnW9ON8wdCnuYxrIw
 hbxozhnfIsSldLSgDedc97AHzXP8weNEozLDgEAAA==
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
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5064;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RpfjHjeOgMA+vTAv8qdDWazS15s3/X00AeUdND0T1nY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1odiCa5H/aiu1dghYaNHMnUv6fDoqcv+VB6S
 50qP1XCjcCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9aHQAKCRCLPIo+Aiko
 1dwoB/9KoLfzVTiVNdiIDf9IgewzO6Flhip/P2nNmYzyGY6ZYrM2ap5xePdMtJKa+YGu5tzTmY1
 hsy9WyLM2+Ws53cZhR2VwPJLY1D3sjKSFfXoE3HULjl2/FYG/aQuh+XBNoCLh3dMuQpf4HvcDWb
 Bu2DXf6mp4zPGyfWO6nG8NvBMmqBNXCxUdf/1cW41w1i41AFfhxXh7owAzY1mMlwMfF0S42sVDv
 9ZdQBuKeGL0j/UxMgkPJTtm3+qzLPgyjz14snSq+yNWZCJDI0uosBPyBdcmb7JXab0MgEsmfq9l
 Ktm/CnuG8BZ2F8NHQkAV9O7REYMeYPL3qMqVXYLPa/xyy5QM
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
 include/drm/display/drm_hdmi_state_helper.h        |   4 +
 include/drm/drm_bridge.h                           |  23 +++
 include/drm/drm_connector.h                        |  80 +++++++++
 include/sound/hdmi-codec.h                         |   7 +-
 sound/soc/codecs/hdmi-codec.c                      |   4 +-
 24 files changed, 606 insertions(+), 136 deletions(-)
---
base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

