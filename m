Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2A21FF7CC
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Mar 2025 08:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251538; cv=none; b=m1vbtaHPBK2IHffrVCR/dDEGbq2DaoOov6Bn6bfTN64ryRg0/5hW6NgVZY9ZcSdnA/TSr4ii5F1Z5XTakekY7YGXsWIsV75G/HSKtCBHyqVBv2//ib80Kr4ZX6X0p8BR6MiRglH4Xa0ZRQ2XgTFlrByR7j0PnGLTe5QgzVB5eIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251538; c=relaxed/simple;
	bh=h8r+LBE+AI2ozP6h7eTjG3J4/BjLDXG10kpvMQ2oQN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRbIosG9azvYKWkj49vYuq7kojQilNX4TQDa1a8IZTgfrTaPVk4tF91GnReMoOVYrqEj/z8R8+R2SFWZ/qcXIzSLZtHpDPL1gGiCWQigdSnCsL5HLnp3uSLw04oywVd/Rs1DvpIaRFMFKF5DshmsB1WwCno79jeTVsXnFHW6WXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dMegtc2A; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dMegtc2A"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43bca8cabc8so308725e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Mar 2025 00:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741251535; x=1741856335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hEmsvIcMhwbu7qmMBTCnWlLRUTQP6Sh0jelKQ7eVPQ=;
        b=dMegtc2AgzVA1a5u67kGMZfWNM6Y2LiF3j33GyVUqWf6SkLWzu4w6S46qfUGkDb4GF
         cWglMRcyrJzUohaMbBZgI2jQrruFryCXRNMZSEPpDKcRPtRe7z9eR0SHhaMRP3hvLVT/
         VwWG9bM/xsRGhvR2KP5PGpj36t7Gbn5Z+Y2Yy+mbvhwM44fCQD91Wc0xTis0sz2RC6P0
         gbyauqLKeBK0ke+s81PVqBg9sARw6ShhzqbWGRwmZrKcJgJFwIeplITKA56D0qfBmkwh
         HxqQjjS/cpX4oYOvObL9vJp8pUNdYQdvE9KaYx5rLATq5yaOpguLZ2WYp7uxRY2CvpsZ
         OEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251535; x=1741856335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hEmsvIcMhwbu7qmMBTCnWlLRUTQP6Sh0jelKQ7eVPQ=;
        b=PjnnFXSHEWv339eKwroU3B/WPsvpdV2wxropa8NuEiK2bUyfvL3e03pb+ifkk5sjZt
         pPjcFP5T7h1Vtrd4P0mBuGH2UvBAK8Py9JsuwBKA4IwMx0oqrjjjau6gU55SaehBfXKa
         jJQHm0UZvYLTtY7A2XvH0aUvQw0U71v5ZGaVpQe5c9gxCj2H9umwTWTUxD+ZTSVH+Qih
         /Gkc6CPQlqYBt8hQsNqim/2JQ0w8ocpfMPudNu04D5VyF1T9RFDcWyKZMdjwOLKFzISr
         emQnOABTP8smJNwEXhBBdg75j7EKBUQX8Li3nuNND3dd9a4TCxb6nrdDQpSK4fcVyE51
         6r0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8VEoz/fRl1tjO/BhbdJVjMezH44ODS5/rVgZhudmmgL7X9qb3/exbAmRnDOrLOrH+FREGWx+1kI3le/W1M4lr3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yweu/IrELNoMN+u6YjFkLda1yHPIxBGXhfyzE5GPJCc9CmPgUL0
	ci7D8aXwR0HuxEe/t9R82EuZ1NVYt1aV2s2v0MbQ0H4y9ZLhu8hnQ/yLx5kb92w=
X-Gm-Gg: ASbGncvNpZnHobEbmEjWoKLOrfkt+zUR3u9+EIq3FhtJm3U5m3Kf5g5EAd6QOtDeyFs
	mxjuAN4Taxl6L8HkxJ33YW/tRj9i6NRtvKIWMzTkZRIoDP7yKoUPvGgHc4lmPUbKheSc+OeFeYU
	lcaA1WQ9eoPiXTDXcdevh5gvK62zJKflg5n5GaTTZbx3KKVQREAK4HxOQBjNR6klSonBkk1FXGu
	mKmFgq7Nkio6HRg7jW7FVrrvtYoNEsz3+Ytteg+C/UErH8ugj8NTXfuP5c8r5yW9Dhl7EEBzWNh
	CUCGmrBd0pvo8QXsxXwgmwr6KGmS1gMbTJ+Qk7NzHSOtyxAZD7s9XxT0uIg=
X-Google-Smtp-Source: AGHT+IHIwsYxtasUsH7F1cqK4+j6EXhOQvlZn/zl/WS+mfi7XrhQaNW7pJTzxIk7YBr7G3/zWRlTbA==
X-Received: by 2002:a05:600c:b8e:b0:439:90f5:3919 with SMTP id 5b1f17b1804b1-43bd29b66eamr20092285e9.4.1741251535085;
        Thu, 06 Mar 2025 00:58:55 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b046dsm13184405e9.5.2025.03.06.00.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 00:58:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: memory-controllers: qcom,ebi2: Enforce child props
Date: Thu,  6 Mar 2025 09:58:49 +0100
Message-ID: <20250306085849.32852-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306085849.32852-1-krzysztof.kozlowski@linaro.org>
References: <20250306085849.32852-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm EBI2 peripheral properties were moved from the device schema to
separate "peripheral-props" schema for child node, but the device schema
does not reference the new one.

Reference the peripheral-props schema so the child nodes will be
properly validated from the device schema.

Fixes: 06652f348f28 ("dt-bindings: memory-controllers: qcom,ebi2: Split out child node properties")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fix for Rob's tree.
---
 .../devicetree/bindings/memory-controllers/qcom,ebi2.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
index 3e6da1ba460e..423d7a75134f 100644
--- a/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
@@ -104,6 +104,7 @@ required:
 patternProperties:
   "^.*@[0-5],[0-9a-f]+$":
     type: object
+    $ref: mc-peripheral-props.yaml#
     additionalProperties: true
 
 additionalProperties: false
-- 
2.43.0

