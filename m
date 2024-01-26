Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E675EE60
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 23:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310982; cv=none; b=s5pGAO/GcEYorp2KVn1hmWDe2BY5NfGHWj6vbrH51YysP5UtmfTQVhZYFJufFcJEO0eRhpFL0S64LUg3t3VzcgxsHc+qHyIKsKBIbPAM2rksmRcLGQXrfdfRZbjAhfDR48Ze1CzUeR5F7kgBnNnbvFTeJZ21BCCJW1Vatmyiwkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310982; c=relaxed/simple;
	bh=+48T6wmUjtEbzw2F4kReN9y5ew7crNm72mJy9gOUbCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eh/ow1mgMRoWhAwrljaJzuK5mk+Ms4qjGjpmykG64dITwHRAEGKIGSy3eD2JRnI0oxgwLni2Q8fxovYwZKsNLTniRQZPa2rbacUOMrA8WGLoBInpQSCzr9dK6mQGnF4iTMON9bzN1l2zRSs033A72VONXYG3juFbNTs3ZdAiWTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kdAqUg7o; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kdAqUg7o"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-783cf58221fso78009385a.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 15:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310979; x=1706915779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stuI7gBMJumChDGNuDa5NAtrFPgVVPyF9dOhkVEQIZs=;
        b=kdAqUg7oKF4rdGcn3FUNPkBE+RVAfw+BRW4GKeUhTxWZY+j0n0qh81DdzJuWQinnHy
         i9BigIvj9fNusLJogH/mpQazvrdlAbtYSkey+lpKxdWvg6i6Z2BUkLYlyAA8zRPDjiDw
         tBYi3Yj79f1DLY5oYO5KfWnTjApALcHofsKuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310979; x=1706915779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stuI7gBMJumChDGNuDa5NAtrFPgVVPyF9dOhkVEQIZs=;
        b=psKLDlmNmKWqAcGo52z0axDCi9ebocgI3hHwgwEzkzyVDk1JsIL9+Xg7X6NHYX/g5X
         d43CMBEJCsEAAabAXGa4FRYNDRzODhmTK3s3E1zrSjqhWB6ALKoo8UlzKPgh5kjWm+OL
         g4xR9++IMTAIQseWK1wxFqVU3NiQFxsySDLfkCdmhsmNoVqk57P82uCvlNfYPX46hmAy
         8PQz2ubBq9qiXTEmwE6dscfhthNJoE/o/oEQEgnPlVMhRDEUdA7NesnDRnAZp72/ESWd
         u7As6aKmsyZ1A8kGq/davkWVCiCxuPZN+/t6rQ8CK2QRt6qaZvWLRAeJ0X3jl/FFiD6t
         fLsw==
X-Gm-Message-State: AOJu0YxEFQZGm9PHF+0kwu68K8JfcWBqnx9qExEhHon98+btYBHeGIpJ
	8azQbFdHNpqjs7opyinqglE5oX1PBTVhF2ifjI3fMdE2Ea4LwQmW0AZhNsGnMQ==
X-Google-Smtp-Source: AGHT+IEd+7JsySye9GLJ+DZua0TH24OzjziTyfzLeDvrZrUGlvpFgq8zte88/+mhTsCB6LhfusGKZw==
X-Received: by 2002:a05:620a:5593:b0:783:bd38:aca6 with SMTP id vq19-20020a05620a559300b00783bd38aca6mr655440qkn.82.1706310979526;
        Fri, 26 Jan 2024 15:16:19 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:19 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:12 +0000
Subject: [PATCH 13/17] media: samsung: s5p-mfc: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-13-eed7865fce18@chromium.org>
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

Remove doc from missing fields.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
index 59450b324f7d..7e7e7b695b53 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
@@ -612,7 +612,6 @@ struct s5p_mfc_codec_ops {
  * @chroma_dpb_size:	dpb buffer size for chroma
  * @me_buffer_size:	size of the motion estimation buffer
  * @tmv_buffer_size:	size of temporal predictor motion vector buffer
- * @frame_type:		used to force the type of the next encoded frame
  * @ref_queue:		list of the reference buffers for encoding
  * @force_frame_type:	encoder's frame type forcing control
  * @ref_queue_cnt:	number of the buffers in the reference list

-- 
2.43.0.429.g432eaa2c6b-goog

