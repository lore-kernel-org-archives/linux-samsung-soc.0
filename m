Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED13119AD93
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Nov 2024 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730456352; cv=none; b=WPaxBpSqn7BrE1N/gt/l+jYkdl9Siglxx3SUzxpb97u5lah5+wHEKNmtJtE0L74R+Y1k6YCOQ8IZ8GkB/P/X6vk/h/gmRYHBq+OI1YF9YX2BBMtfQ9NO7YM0dtRGDNzwCUEDY8Om9VuHzSbK2Vx/gOacxo3Hp7SDqroQjMb9E9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730456352; c=relaxed/simple;
	bh=QgZZzJg9ZFJE02xI1Hrtot2oVYSJiceonkhnIgQN/h0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qstbvSfqhh5sIUC3udgi0hiAEH1gZvzp9XQKcujXvz5Lzw2iHJCQtEs5gD7LPMKZjpZ/iGbVzcoT7HCPNIudEGyAwW6lCmMD1EVqx1e9khMCwmu5AC+Gs5YPQX4s2H2NivNtphP1wao5/r+UqJWfvnoZbAhQ6qPb/ucV1nEIZDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UVlwytOd; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UVlwytOd"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso19426621fa.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Nov 2024 03:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730456348; x=1731061148; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=le/PASSZxeUtTWMl/wNKSD8ec0kDdmO9btc+axn7CcM=;
        b=UVlwytOd4wnrRNU85aB4M5RO1Mb7Rp0e0Jo4V/ZPhePtBbrqLFgrwhutcitcSWQ7aL
         6JMwDMBiMfuMfnSwvUdQgpYjMdIwgUrPHuNX8z2CYNrIbjTVQxogs00hdfwFflLfvn01
         D1yy2zBVr+uXZrXmCaKVtPHgXJWhOr4N03vmPJxcA4YEBPX8ZIGxf5s5m7HKzr+fKblv
         WvyiDzb8vOTNFVP2d3AvrhiUBKYzgFWKixV1NJY/Sn4gQGvCHhabqT6GGHCfoY8txQli
         2ME7P6B20li8FFUBZK5HCIC2I8j2BpQSXwfkvOccGRgSrs1qvEYMMRG3RdDwF96EK8RW
         Y/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730456348; x=1731061148;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=le/PASSZxeUtTWMl/wNKSD8ec0kDdmO9btc+axn7CcM=;
        b=E05oEO2YvgbhUoYlGhScJmqMf5LDDrJBsZUsL6hXoNhh43mERu8ZSHaNe17XmfLuIv
         3avPxmRERHQXQvZkP0uPel6XU7lmxTkTR56lSUpiLTfOr8TD7p5lyM92Un1xKb/492Fi
         uS0/LqDf/6fCk5V/1ZjSAviTGkyZTJHa+ceUwBFJ5oRiv5hozcu/du0GrdzA0wkpSS5u
         oxEiU5g8UiCdkhONeqmrvEMhJnk4SukXKi+nom7pHKXCsjOLvOyw4XTcQ7vlskUcS3Iv
         DbhbNtvJJBIBJX/yftPMl3Kvv61AXDDda7oyeXI0frKxZgYOx187Htyh3LruZKEnEiHw
         Iqpw==
X-Forwarded-Encrypted: i=1; AJvYcCVCzn/7wP2lvgvV4wLY3yn9jW1vbZEOQ74psuvrwsHVYk46YFm23gK7wgNEAu1v4BNgXAosoAnuoVzWMbPgaJzT2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9xjzsSnDInBuKg2H2VY+R3ETEqRy0u+dKl6HOpImRbzlr9bZg
	1TG1eX4f9SRnI4bMy9hbR3Ts7lTnyuzPebNqG6PJ0rc7Xn4T0lJKzXok7k5bo8M=
X-Google-Smtp-Source: AGHT+IHY7ovUMeRzJsMU5xMtc2Dvgev8mxKT+oIlhDInundzFyWvx582oufvDDooCRwUY9gtgQ/5NA==
X-Received: by 2002:a05:651c:985:b0:2fb:569a:5543 with SMTP id 38308e7fff4ca-2fedb488babmr9537901fa.19.1730456347942;
        Fri, 01 Nov 2024 03:19:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef5d6ef4sm5197031fa.48.2024.11.01.03.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 03:19:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC v2 0/7] drm: add DRM HDMI Codec framework
Date: Fri, 01 Nov 2024 12:19:01 +0200
Message-Id: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABWrJGcC/32NTQ6CMBCFr2JmbU0pFsSViYkHcGtYQDvAJNKaq
 SEawt2d9AAu39/3VkjIhAnOuxUYF0oUgwiz34GbujCiIi8ajDZHbUutPM+qZ/KSTH4m5WII6N6
 RVdProaqNbeoSQfYvxoE+mf2A++0KrZgTJel+899S5Cijq8L+QS+FkmfbDK4+VbbrzeVJoeN4i
 DxCu23bD0dTIXXIAAAA
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4653;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QgZZzJg9ZFJE02xI1Hrtot2oVYSJiceonkhnIgQN/h0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJKsY88bZNto8DqlmNoOzOCbmLPcIj7Q20qCAJ
 JjoQmszobCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZySrGAAKCRCLPIo+Aiko
 1ZMxB/9PlgUbk1D7PhNPxChE5hultBBglq08GH0Umkd+Za2/2Io/+TRzSawGpJdQvyxkjlgfR0V
 0y4x1NxVaNkUE0lL9SCdxQENW6FuWm204EDKSf12UssCKVaaxSBhb18R8Y5pevOS+ZxuJiSRann
 virCc8/G78fIZmOcG+fMTmaAK3JSG29OlKMAzDUMON9dZj7DQVBpShmW5IkenDcOz9Rw7tBwDRl
 7MZevUXEUJa6Q458HDM/jZM4XSAiLfaB+vJISqffjuKFlvfRC99iOSplpF6789oJDrsBwunWAe6
 n/wG5kc77eAVv8XoWMc/5iYXHHRut+GnvvCeHuKnPEFbapd6
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
      drm/bridge_connector: hook __drm_atomic_helper_connector_hdmi_update_edid()

 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   3 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 170 ++++++++-----------
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   5 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   3 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     | 160 ++++++++++++++++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  56 +++++++
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
 24 files changed, 601 insertions(+), 136 deletions(-)
---
base-commit: f9f24ca362a4d84dd8aeb4b8f3ec28cb6c43dd06
change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

