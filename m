Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402F65822D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 23:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310967; cv=none; b=M/mpyXY1ws0etV5SiJvj+EXxBmzwJOJ0mTt/jEwtlRoG4/OrrbHqvDbwYdAgfdu7u1CySJq8j72Ev4QoaIArb3Hz+JlEE5yNI1CW/q7xI/VDphpDgIPx58wcXuNXzs30hvkVcpMsG7gf5WhZMYR43Ex1yDcYnKs7Wu6pF62dU5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310967; c=relaxed/simple;
	bh=WYMBG1J7l0m1ybFNIC2Y+ETBtIDVFmRqVIC1HYf1GvY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BMpwd3PW8wELQEOavZ8cYUMUJktx37VTy3gl9TRcv8v8dE8RQQ0281obHgW4WIZg/Mef6cUmavn5yawGJsXyv6zplIzN5W2Cwik76xYG9XsRQBfNibhnPti329gZlSoDH6IgVtcPuWgTdoMJke7sbsrAZeuRRYqkG36UoaPcY9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fzCCt5ng; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fzCCt5ng"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-783d39b7469so75055585a.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 15:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310964; x=1706915764; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m1FUbK+X4G1K2LR1tS4ThCJb/HchC8GmhhxPZxsSnw8=;
        b=fzCCt5ng5XTN+SiVVLbI1IEe/7rjIqS1McXzXaiYvS3nySCsFLyGXMgA7FqF6mGysI
         CuI0EH4rForETGJ5qQxIOr5g6STaOijt/ypwmmADWgf/pxO0iMXYQgG3bs3v4/olEFJS
         i4hKpSZZRz+afP3R40tE+a4rt7+Uv8+uxOnaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310964; x=1706915764;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1FUbK+X4G1K2LR1tS4ThCJb/HchC8GmhhxPZxsSnw8=;
        b=ncnM/N+tSC/xmaPXoLdp8tqXMr8yKLr3k3BYDKrHlE1eAJjGzuRC2qsQxkU1o7v8xs
         iTU9XAHo4SuA9MwqgoUTJ2rWRD3fyTUXx66Nm3kbyWChquIBHcwhp5gGHkYNWPZuHYr4
         2H2JyhzATq/wFpTjl7ez6hYvo0HLBx4+0ygAPkzRfAQFt8jGyOCflopEnGKB8tGWAj9R
         eF5/4ZkuJ19EUj4vGTeRLT16coq8z7uL7ikaMaFi4DHg0yGaK/iO0IJ7+jZUQPmv4d+0
         +4l5EwxyB/eKyaR6dEWs3SdF7b3ZgwnFHXgz8kdkJ7EmXiGAqVXhYSiCXY2ETgragx18
         5nZA==
X-Gm-Message-State: AOJu0Yz45nYZ426AIYxMhe1xe10rOWgHutrjrIW/L9TUmT2KjkKyRIS+
	DzPdOHteGlKEXZJ9VHaImAu14+JvawNQLwF8QfP0vKVoG0HnOJCJTf076eW/ow==
X-Google-Smtp-Source: AGHT+IEQ/tz8turm1P2FDbceVdQsCYW4IY1reD0BjYRsTNFIDrY6wN0U97EZCcKxKn339wiLqTkGcQ==
X-Received: by 2002:ae9:e647:0:b0:783:df7a:a7c4 with SMTP id x7-20020ae9e647000000b00783df7aa7c4mr586658qkl.51.1706310964150;
        Fri, 26 Jan 2024 15:16:04 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:03 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 00/17] media: kerneldoc warnings
Date: Fri, 26 Jan 2024 23:15:59 +0000
Message-Id: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC89tGUC/x3MQQqAIBBA0avErBtQK4WuEi2sRhsiC40KorsnL
 d/i/wcSRaYEbfFApJMTbyFDlgWMsw2ekKdsUELVQiqNnm9cjwUvGwMHn9CMRjjdVEaaAXK2R3J
 8/8uuf98PwmNAwWIAAAA=
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Bin Liu <bin.liu@mediatek.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3

While automating the CI, I found the following kernel-doc errors.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (17):
      media: mediatek: vcodec: Fix kerneldoc warnings
      media: videodev2.h: Fix kerneldoc
      media: media-entity.h: Fix kerneldoc
      media: cec.h: Fix kerneldoc
      media: pci: dt315.h: Fix kerneldoc
      media: i2c: css-quirk.h: Fix kerneldoc
      media: i2c: adv748: Fix kerneldoc
      media: mediatek: jpeg: Fix kerneldoc
      media: mediatek: vcodec: Fix kerneldoc
      media: verisilicon: Fix kerneldoc
      media: qcom: venus: Fix kerneldoc
      media: samsung: exynos4-is: Fix kerneldoc
      media: samsung: s5p-mfc: Fix kerneldoc
      media: dvb-usb: Fix kerneldoc
      media: ipu3: Fix kerneldoc
      media: staging: meson: Fix kerneldoc
      linux: v4l2-vp9.h: Fix kerneldoc

 drivers/media/i2c/adv748x/adv748x.h                |  1 -
 drivers/media/i2c/ccs/ccs-quirk.h                  |  8 +++---
 drivers/media/pci/dt3155/dt3155.h                  |  1 -
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.h   |  1 -
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.h       |  1 -
 .../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c |  1 -
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c      |  1 -
 .../platform/mediatek/vcodec/decoder/vdec_vpu_if.h |  1 -
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.h       |  1 -
 drivers/media/platform/qcom/venus/core.h           |  1 -
 .../media/platform/samsung/exynos4-is/fimc-lite.h  |  3 --
 .../platform/samsung/s5p-mfc/s5p_mfc_common.h      |  1 -
 drivers/media/platform/verisilicon/hantro.h        |  1 -
 drivers/media/usb/dvb-usb/dvb-usb.h                |  2 --
 .../staging/media/ipu3/include/uapi/intel-ipu3.h   |  3 --
 drivers/staging/media/meson/vdec/vdec.h            |  1 -
 include/media/cec.h                                |  2 --
 include/media/media-entity.h                       |  4 ---
 include/media/v4l2-vp9.h                           |  6 +++-
 include/uapi/linux/videodev2.h                     | 32 +++++++++++-----------
 20 files changed, 25 insertions(+), 47 deletions(-)
---
base-commit: 615d300648869c774bd1fe54b4627bb0c20faed4
change-id: 20240126-gix-mtk-warnings-7c70f653717b

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

