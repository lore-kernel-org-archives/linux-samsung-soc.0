Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E1B5A7A2
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 23:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310972; cv=none; b=OeHhLUiHJ0e9uDBwv+y3+KhAEZwKe/pZRvTU5m5TA+Xu1+FBRWSIaUcZ03tXFKheOI5Bs73RJDXmMeIwqXXGuQ8ZHY03txf07kujjfkde6WjM4Cww4GmWzzVtCHR3P7jMA0VUSOQu0vgwl4UoTr/pjPYhgOJdNlNA9RXkUV4Aho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310972; c=relaxed/simple;
	bh=l9cPmoT/bWbvsJfq8x1RTaIe5o9qG8C0R9ya897fz3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJHZOyqxGiSfUMFwZjEyhVTZf8IjA06+xJB/85/0MDUeUnPbnXsQ64WFmn3mpWQ4hYAsQcH/edWFFgrTnygh7PHUhu/PKJfyEccjSNMV5Sl7R1t21X6dB14/hivuxGnBCw/df1BSw7qgY6CEuAiBivbJkNp8T5DAeeRw7HpkoQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E0PImluj; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E0PImluj"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-783d4b3ad96so78735485a.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 15:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310968; x=1706915768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQhDPXykohcFJW0qtm5EHtuEzwLA0yzgLshaZoliDrY=;
        b=E0PImlujKieADqQR6p2TtSt8HXExhPEc7NuUnPza2sZo1Wecc0QMNXlgGFVVFS4/Rs
         CCRRhhK+eNUHJuEYmHjdUWQGlPdDC64dV5iUZfi5edeSjaY6qAP8bPACB62JYQe0h7/e
         lJ2LMRa++Lwtk+PngbSGeJlFdL2geGh09b56U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310968; x=1706915768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQhDPXykohcFJW0qtm5EHtuEzwLA0yzgLshaZoliDrY=;
        b=ewYXL8ikbg0fOCev29luT3Ydn4ctgoMhRTg5MCPl5MBBdx0Yi+ZMran/kUHeOrYF90
         vGcF45IeAi/82f017TrDe2bMJvdCwUqEHRIRWX3ZD8WGZzO9B2WzBFHqqkzJpiuGPfaD
         rKafJqc72ZOPu3SXe6OeW8V7BkyC+Lk2zaTtwKe+emVb4J9uw3PCsamIEaAUYa+RtJBC
         B4rc4q4+CfJtAvRfkZOPnp+wUoF/twyvK6PU1p4q+6TEQFWF4/BuQ24TzBO+PiRqlc7l
         eyEf2YAUDcyPwr25KMypOosNtxPr9XDAqOEx6KR0aHHFg9HXHY+5/v/qb8ukNkr9ojKo
         IU8w==
X-Gm-Message-State: AOJu0YycByKdO/nYjf/Yf737KvykdyWVEWL4JPltGnUnRS/Ju/enr9dn
	ReLjdB/tXo7vQYKm8pGK/UAX8CX+GPPn0OsBX49RLxWAPLTEgIPQCR2kXZHjfQ==
X-Google-Smtp-Source: AGHT+IEYax7waeMsYzBi1V5anUAE9029IxFY99+NqU01WUd1yOqmYKRjKVGaw0nUqApkIUGiDbz6Vw==
X-Received: by 2002:a05:620a:19aa:b0:783:e3be:9bb5 with SMTP id bm42-20020a05620a19aa00b00783e3be9bb5mr52250qkb.21.1706310968110;
        Fri, 26 Jan 2024 15:16:08 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:07 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:02 +0000
Subject: [PATCH 03/17] media: media-entity.h: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-3-eed7865fce18@chromium.org>
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

The fields seems to be documented twice.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/media/media-entity.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 2b6cd343ee9e..c79176ed6299 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -337,10 +337,6 @@ enum media_entity_type {
  * @info.dev:	Contains device major and minor info.
  * @info.dev.major: device node major, if the device is a devnode.
  * @info.dev.minor: device node minor, if the device is a devnode.
- * @major:	Devnode major number (zero if not applicable). Kept just
- *		for backward compatibility.
- * @minor:	Devnode minor number (zero if not applicable). Kept just
- *		for backward compatibility.
  *
  * .. note::
  *

-- 
2.43.0.429.g432eaa2c6b-goog

