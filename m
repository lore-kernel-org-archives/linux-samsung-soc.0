Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBA460DF9
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 23:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310985; cv=none; b=iWBKjV51qbgnubCyp8I9cIq99Gv0TItkc6QAO5xWFd/C4iwvqBN2sioPIoVlUja8XHk5Ot1aXZAQdRbGpQbHzy23/DVIIZJ3wGq0H/kBKplBtVXVwVuFgdDaVyu+B2qD89Tij2+lH/P3TmsKF4mQvt168ndJ2D7JEVAORE21LX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310985; c=relaxed/simple;
	bh=GULyhm197w5UOJZcKZKq9bcfe1J5MHmZHKsYUDSi6mo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yr3KREJ0Lm+e8NDsgxHi8zEVrkxtTKSxbNi4c204R47xu6uMZr0qPiq+sG+vA6gDLF8QsSltkhor3go7Nb2TjV+0kB3vy6MERxVDgNwIVcgki8yjCR5ryDnA/7jSb1KbhbHYKdXw9TIIQ0cwtThuxl79+052eXygJKTbS1Mh7+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DqdFioom; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DqdFioom"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3bddf109e9aso810992b6e.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 15:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310981; x=1706915781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCxJ4tiFippaBrxy1sFWSD98oDdK4KvGR8VQl9S7yQ4=;
        b=DqdFioomUtNgHzQhR9t8WvGpvTSuXPQ7yGFrw3CbOj6tN/aYQnRE70rych626K6+p2
         9zZXWyrUMmkcbcAkBC/3Y1rS/Ut2Z9OQeja8JR3ZHpOjPFJwLv9YMrG70sGtbCE+o1zA
         /m23QCJhzf7S3jdp7aAEqlpaGVWzyN1bdPhAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310981; x=1706915781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCxJ4tiFippaBrxy1sFWSD98oDdK4KvGR8VQl9S7yQ4=;
        b=KIOgU1ZhIqfiTtGuq/BQwQJqIAJdyUkJBRby6VR/PKkL80jblL9+xNSshjOQQ51gPT
         6cAE8pYjRcFwJWNTRsz+qHyJlZ7UqedpWAEuyxxqUY8r2KVFzoWMEhABNhI0wXoxWWGe
         zX/Gc5ZX3ELoHswlI5xK9HANXPpTRbdJM5Je0HZP9Fv+hFVEgN4VlO7hlgM9FFpglWaX
         yyZjuv4+Q+iqXUPluoS/VqM26DdZB31HvlKj3bqPU91L677Y7hdLZzXV7N/vTQcxlBbh
         xNFWdoTXu2lynrXNAkYgpioaBR3hUjVxDpQQRmDipEBdToKe+1OrmIcbgrTz6HOWTRvc
         nQLQ==
X-Gm-Message-State: AOJu0YyDlgcGurbPKUJJvwFE9VuhqbLSvem61CV3/sZ1oQhU8+sbG84X
	UVRmeo6UjZuhbb+rqag1O8pAFLXdPU1v8r7Tf+1SU4PSJGG7tbhvhTCvIw7nIA==
X-Google-Smtp-Source: AGHT+IG2D3NC+8qBPHrcajc/wj1UJVv6b2Ko0Gyqx05WQt6GLVPDwCaJl+4BVmpG1ygKipZTOYQ4Rw==
X-Received: by 2002:a05:6808:124d:b0:3bd:c98e:bf88 with SMTP id o13-20020a056808124d00b003bdc98ebf88mr451359oiv.79.1706310981414;
        Fri, 26 Jan 2024 15:16:21 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:21 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:14 +0000
Subject: [PATCH 15/17] media: ipu3: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-15-eed7865fce18@chromium.org>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
In-Reply-To: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
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

Remove documentation from missing fields.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
index caa358e0bae4..4aa2797f5e3c 100644
--- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
@@ -2485,11 +2485,9 @@ struct ipu3_uapi_anr_config {
  *		&ipu3_uapi_yuvp1_y_ee_nr_config
  * @yds:	y down scaler config. See &ipu3_uapi_yuvp1_yds_config
  * @chnr:	chroma noise reduction config. See &ipu3_uapi_yuvp1_chnr_config
- * @reserved1: reserved
  * @yds2:	y channel down scaler config. See &ipu3_uapi_yuvp1_yds_config
  * @tcc:	total color correction config as defined in struct
  *		&ipu3_uapi_yuvp2_tcc_static_config
- * @reserved2: reserved
  * @anr:	advanced noise reduction config.See &ipu3_uapi_anr_config
  * @awb_fr:	AWB filter response config. See ipu3_uapi_awb_fr_config
  * @ae:	auto exposure config  As specified by &ipu3_uapi_ae_config
@@ -2724,7 +2722,6 @@ struct ipu3_uapi_obgrid_param {
  * @acc_ae: 0 = no update, 1 = update.
  * @acc_af: 0 = no update, 1 = update.
  * @acc_awb: 0 = no update, 1 = update.
- * @__acc_osys: 0 = no update, 1 = update.
  * @reserved3: Not used.
  * @lin_vmem_params: 0 = no update, 1 = update.
  * @tnr3_vmem_params: 0 = no update, 1 = update.

-- 
2.43.0.429.g432eaa2c6b-goog

