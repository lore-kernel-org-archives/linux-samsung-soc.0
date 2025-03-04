Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7140A28D053
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107938; cv=none; b=iAuim9Pc5wq0QwN67BekXE5FIjD1bGbV2grkbb+n2t4QYS9+Ue4a6NBkwNxxdDI0LFuxziFcHk+E2ygoUhDrhpcKNq+sCfQbWNZsn9SSuV6/L+yprHJxrCF8O9XNGrIBL0Wocm28UMRNaaFmUxp4OqUdHI+9HJx6uOkfdtiebok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107938; c=relaxed/simple;
	bh=bdvX1BNhSG2fpjHo2VIxHhZrYGN28llP3/MopMlEtfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iJXHjHmuuhOyx6FjthP+RL/HNPtCTLsgGaWPPs5EpYMUs0DC3pFWvJdKO+CC5FyXOW8eSQ99AOJKwPJNS6Sj6FWjUhaI6rTAsa117NCcmsORwPh1zeUwZM2JzsB1B2HkIeWrMDbiv9vgfrAAgPgBuOlfDoqTw+8YGT6qRyLUYAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zgH5+x53; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zgH5+x53"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab771575040so1214215666b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107934; x=1741712734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=;
        b=zgH5+x53GgY567EAqrqQQRqhEWpQo4fbGGD9KCWkD13ACPz0pLbH0oILvZkJP/nOZy
         3YVf4fEp8SBgheguN4RmtUYH+sS+Dput4mpcyDGPR/mkh08N+fdLLuiKbJHIDLHxQMcJ
         JuWy8ukcyWnUriTTB0ZlqmmSWiU9bPn88QAqT+Vnnfdg8cdZWm0ZSH8VXxVCLUuQ5M58
         KVR1eVChRiJZNLjExmO+1aDTcBvfKiVJsVyz/zn1vJlCzqafEFVPUkbjByDTx1dXDbp6
         hE9aZNR5sxcQRuzbjNlVfad39mh04vBdFVRdPYhfYhrkHbCiETHwOOYzquwiqDsRykp7
         4JHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107934; x=1741712734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=;
        b=ovdOLqBdXqRXO7Shy+3j1JZSJmoCl4dYMmewQgMt8T0x8J/93XzAUHHfiQkSkgwKBC
         KaMer90gbGIWgXiDI2zhg0jjs668vuSbcpjWKRJ1lMfGFDLxpVvBYyf/hf8c5YOl0YPW
         CdSeT9MKLvtRT+Bj48R62HB3tE9SygpxS2jARIhKGhEBj7qwQSAN7Wly1ZPyT8a4MWe5
         8ps5aK0kV1V9yDxxYgdf6MZrAcBcv43WyD6U9Svt0xNdUypsflVIk16rboTNrMcnRfk1
         zIlz3q5iulvC8n0xy82mspdWTuTvuUJs9tnBUupYQNt2G6FdvbiT0a3AOjopUD8jG4V4
         qLXA==
X-Forwarded-Encrypted: i=1; AJvYcCXxLTgxB1wnESKBQNTu8ADv+DeQhLoEO0ACsmeTIg/ocyFEla4n3cRp7eI8rf2MLMBmq+0/sKDXSy294aOAo+X4AA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL3/YFm1dX0XcUYBxwpp7iYGeWYFMwD02dixaTAC4gyo036ORj
	l1GcdiggtkWQqzCETvoR74vswSkzTpLRiLa68Du1osHTf9cUe8+kod/1+EDYFSbvepCEnT7tAxa
	nlHM=
X-Gm-Gg: ASbGncu7Fq2WHqLpKhyDD/H6eMUNvg3XGVgazulRQCwcqdMob90pZoll9YFNn4lyDsw
	l6oaqwl5F1401eLv+GkXzbfACuvs/wj43LekGQ6bH+PdBFL4SRsMVHt8TJZyDsT8NNArL+b6CHc
	sWeCurNP0Z7yoH5VMO9dLvTbgdLpW4Tg0t/mT0JGCxr22zvdNBNd0nHL0PJH7zmLmZfc2Qhx4+r
	lQTUZ7U4l1HwM7VydSpkG+pt+RIE3pWA3cfgIW2Zk7hj4f2X8z73RGZGCL/x08NdR019zneZswj
	VjnHA//q2R+nn6KmDN7ZOhl3xwWNr1Hu9zTyupanLOpH4Y46HLgylIFH53v0EdS+5IKJV4WRkkL
	Wv5IKSewbL74862T9be2EOUc0JtjK
X-Google-Smtp-Source: AGHT+IGsdjvAcycMp31oFEdsdwWFqJQmXbxtDBoL5DRz6SC3HgSNRmbkL1ZXNDzmFm2b5aF1OyYNnA==
X-Received: by 2002:a17:906:c150:b0:abf:4a62:6e5b with SMTP id a640c23a62f3a-ac1f0e60023mr427555766b.5.1741107934486;
        Tue, 04 Mar 2025 09:05:34 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:34 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:33 +0000
Subject: [PATCH v2 05/16] rtc: ep93xx: drop needless struct ep93xx_rtc::rtc
 member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-5-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-ep93xx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-ep93xx.c b/drivers/rtc/rtc-ep93xx.c
index 1fdd20d01560ef4fae2b996cf366b4f812329225..dcdcdd06f30d1ff6d0939f6bcad2c17c03c5a65e 100644
--- a/drivers/rtc/rtc-ep93xx.c
+++ b/drivers/rtc/rtc-ep93xx.c
@@ -28,7 +28,6 @@
 
 struct ep93xx_rtc {
 	void __iomem	*mmio_base;
-	struct rtc_device *rtc;
 };
 
 static int ep93xx_rtc_get_swcomp(struct device *dev, unsigned short *preload,
@@ -123,6 +122,7 @@ static const struct attribute_group ep93xx_rtc_sysfs_files = {
 static int ep93xx_rtc_probe(struct platform_device *pdev)
 {
 	struct ep93xx_rtc *ep93xx_rtc;
+	struct rtc_device *rtc;
 	int err;
 
 	ep93xx_rtc = devm_kzalloc(&pdev->dev, sizeof(*ep93xx_rtc), GFP_KERNEL);
@@ -135,18 +135,18 @@ static int ep93xx_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ep93xx_rtc);
 
-	ep93xx_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(ep93xx_rtc->rtc))
-		return PTR_ERR(ep93xx_rtc->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	ep93xx_rtc->rtc->ops = &ep93xx_rtc_ops;
-	ep93xx_rtc->rtc->range_max = U32_MAX;
+	rtc->ops = &ep93xx_rtc_ops;
+	rtc->range_max = U32_MAX;
 
-	err = rtc_add_group(ep93xx_rtc->rtc, &ep93xx_rtc_sysfs_files);
+	err = rtc_add_group(rtc, &ep93xx_rtc_sysfs_files);
 	if (err)
 		return err;
 
-	return devm_rtc_register_device(ep93xx_rtc->rtc);
+	return devm_rtc_register_device(rtc);
 }
 
 static const struct of_device_id ep93xx_rtc_of_ids[] = {

-- 
2.48.1.711.g2feabab25a-goog

