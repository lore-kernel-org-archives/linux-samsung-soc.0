Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE1962814
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 23:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310986; cv=none; b=Ro7A/2WR8AYOA/14xH6usgzWhtI3RFn2bZv7gxToi6NLV9MrPhnVWSYBZgpVXMHWzxs3WXNMNzgFGB/vLn6obwwldvZ1kuvpmvN97Dml5Wtp6aV8BmPouaPCRj8hvKh8wuna+eyzBZ8Ya/uXzStEv1ArVlh7qwz8eqbFoR2MYoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310986; c=relaxed/simple;
	bh=VR34VGLdsIhpkmSEIe7z+ZhO5WpYZFRPBYv6zPfcQU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ew1ZMZA/Px1em35Sl+LBpZEVFtclR+5GQ/4qE98yCclZAaxe0PYAv8/jgpF1oIQOMhRxsv8qjROXJDh8yRWuu/QM8uT3y5KOlSDuSHG0KTcM9TvlJHyvsD9AQ2QOKiSpczlNfy3gOoeQJH8Q2yfXpdTGFNLTleJYWCU+irQkxqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bmnSpJaX; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bmnSpJaX"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-783d4b3a026so67621485a.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 15:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310982; x=1706915782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTQuVZL8YGJGo91HZaWDjGYZpj4eaCPL+PrXyKe44Kc=;
        b=bmnSpJaXMlO1bQrm/KvBelNvxr/2Is291GCihLjN9rCsHLgmXbw2hp/gQYp/tQ/ofJ
         alOFQNO9fsU+X5TCsoQtY9ZgQ9lJ71hSRSoym88L2rpGxF3k8zs8niTo0FJhaN8Q4oK9
         QSgYC6/rzp/FkZVm0mhCa0DvmUaP7ABT/NghY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310982; x=1706915782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lTQuVZL8YGJGo91HZaWDjGYZpj4eaCPL+PrXyKe44Kc=;
        b=iR1+JwKrXUrvQUNMjbR6y7Ll8q0+n9c8n4BE2hflYnGMfM6f7zbO7Y3HWB6qO13RS9
         hVdRTp5VXF2Bnkm8Cr8v7oju0TZMNhN11oZ0HlV0I/XlKA1ygbX6/nqc4clyY2/T89ua
         pVQrf+8uJTyTDM7S6JjbQLQ0+rncfphn9eUwlaLtUZ5ZibFGi/WtecZzD84Q4srwA/ny
         1w4GrKywPD424oTfKR6qsBkToq+U/jxN87ibn+8GqxbblrdtxxnanwL4JlbHvej/7ceY
         3tVKnMl4njbWBWw5QjZqxhBlbyPzLAL7Fb3bSLJgv+AiPp6JVD3sCgrEzz4i3Zz84eGQ
         xx2w==
X-Gm-Message-State: AOJu0Yxnf2NJNh/ZmZbYKdgZ9b/aVcNsEj7an8YFC4eWzBYpncUvjbgL
	7zRuD/4p2QnvHXXl94Dd0F0v1xS9iszolXLERtMT7DhzHgiBqH5vONUYoKkHqw==
X-Google-Smtp-Source: AGHT+IEphMi3U2VaLxz1TX+i8gpYrzavZfgthHPoIK0is3/PzYweSa+k/yEg+NZuAGKrkSdAEIRBPw==
X-Received: by 2002:a05:620a:22e:b0:783:d13c:cfa0 with SMTP id u14-20020a05620a022e00b00783d13ccfa0mr539361qkm.12.1706310982441;
        Fri, 26 Jan 2024 15:16:22 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:22 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:15 +0000
Subject: [PATCH 16/17] media: staging: meson: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-16-eed7865fce18@chromium.org>
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

Remove documentation from missing field.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/meson/vdec/vdec.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index 0906b8fb5cc6..258685177700 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -101,7 +101,6 @@ struct amvdec_core {
  * @conf_esparser: mandatory call to let the vdec configure the ESPARSER
  * @vififo_level: mandatory call to get the current amount of data
  *		  in the VIFIFO
- * @use_offsets: mandatory call. Returns 1 if the VDEC supports vififo offsets
  */
 struct amvdec_ops {
 	int (*start)(struct amvdec_session *sess);

-- 
2.43.0.429.g432eaa2c6b-goog

