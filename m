Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B1F1E1A17
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 15:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023510; cv=none; b=SVTrSmWIZahFckFqn8ryvzVK1Y4ggGr3piS/gyOyUBYzFOqpPs4vdegXgm4g3Yz283Wf94Pi1cZBUFeKv+Tc6kDTDv5JXt4GnLJMCFUg2iakQHW177Ifn5k1WfyyTKudRLg8W3C0htuEQOrWXzcl2UDnGoO7Dnyp9kxYprVH2fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023510; c=relaxed/simple;
	bh=81jybtZ3s587CJJH0yCGA5kZLJlEWI3joc5fyisw8bc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FGzMUOSuRga4zY9q14vQT9jVr8+CwwXFUGTFLWvme246zt4sQO5tydOyKsxemZZmrH0aDb3I9Sxo53E5u+UT979TURqyfM/RWPVCCfHcBFNlP5rkP36Mf3Dhd5u4KtFshMtn+KlUoNIjHGdBR1C5YOaMxDtAcq6rzMLD5Xy/y4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fEh42Sh4; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fEh42Sh4"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b50645ecfbbso226277266b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 08:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023505; x=1760628305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B84jNTg7Yo8n7BGFGvQ15A/U09IRq0iw+ObZ/DfjbTI=;
        b=fEh42Sh4ZTts64I9k2hI4wxmvYV/aV2JAlYlunGkCTwvM9L1hUhnv7+dYxSRe4YS53
         pj3QAapZrKEXQIPUuCZ7bvfbr8HT51lpgDtkdd1CHWkhq42Zf9WMzdoyfB6CLtUSZsiF
         6fuIHhLr8YETYNth6R6Cavjvxz8YKrQzoab2cxpXsHMucxSKzQpQTxcXzYbe5ZtyMtCO
         kZ/xcXEO6gwJQvsPKdR7MBbcT7oXMCELC5KXR/POQ/v6+wquLb0Mxe+yPQ4eRXXkIh+n
         +EgGyx4mL9FB3Gf6b/MZCemuqlIPSMSHcetaEhukHJcexbl4dH5KJDvNDZSbTPY+Yicx
         cFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023505; x=1760628305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B84jNTg7Yo8n7BGFGvQ15A/U09IRq0iw+ObZ/DfjbTI=;
        b=VqMFUY+tWn/Dv9eMMKpfoKDSORZc3EAqCoWFz1d+n2UETDzO6Hnt8fyq3MtC7EUSMW
         Ml4jfswoBkgilGDth7LKc4d/JMd/feziTxKFnBkryMkauadSESJB/1NPL0xdANo7PV6a
         hIuNYMQubIt2sw1VMaOHnp9pArQ9x7C/S3HZHzIjtKc7pZ2K90Ce3bhX5jSoBC4GvS65
         +ECnQP6Att/7/iuWGuzSqF/F8mgAoPU/kTb37CYyT5IlIO3dPn6phvHKbqZN59ScPOEi
         Pmu835IMjtMIG26kY5+qZNurZfVKL18cMXvg5EDMDbZk+Q18MYtk1YXUI3a3WwsOOGM6
         S3Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUngH/8URQkdEw1BHI9HOiLtfzD4RdqzUMfm25O9pCjUS4RWoNVovmfPI5nuI0LHoXNUt4sTPZcW13URywACYH4+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YynNJT2cs5zM5vuO0k//flJykUmX3/MqALgPXTLPCEdgEPv+Pv7
	1Fc7dnmY7UWhJZTShXqo6goaTaqpKCnwh2mgUr1cpy//5FVda+z3JZJv2v89rLErH2g=
X-Gm-Gg: ASbGnctQQAwy14aCXBwu2GD4zsvba+k6Xgdjmb9DmQSqwwEIFzN47oC1g/BTimDSOI+
	FvZs6Qimq7czGtmpjq6QpfCaufDvzfHsjZROD11UdCbf+g5FGMYCO2QTmzOIdV8NQkNdkWrpmyz
	Ry3UzbWBjYspYx9SOLIi6qJofKg0ldVqTexDrtaom7ZJAACtuO5hyk51fKnlQAf0NAiLPqyHPej
	g+8UnSWu0qjRNfuDeEHFzB9HhslrmANMAWXOWUZVzXnkN2tCbVBHJOe63nrgBrWcYe51CgrMkYB
	w+jgP35wY7Ky3t/bL9ZK1jbVCXbsWs9Zi2TXC7ShyzmXC+LSpQHRHtchWsmZV/ZbnrGMi+1DbwG
	ARFi+c200qkyKqAj6w0krAB7HoMWp1MX0b7WWXebw9n6utmY7OUKFz9zgwuJhes3fW2ejIU2cLe
	Y+F9gxvR3abP9COs4JNZFih4wYSLoA11ahK1T9GpaA
X-Google-Smtp-Source: AGHT+IG4E2/BkqY+k6KCaob1FvNFhboNdxx7lEaSwbr4nblUCdc4u24xC8dmKvD/tTwPIY9VM74oUA==
X-Received: by 2002:a17:907:6d19:b0:b45:60ad:daff with SMTP id a640c23a62f3a-b50aa99e0f1mr827465866b.28.1760023505329;
        Thu, 09 Oct 2025 08:25:05 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:04 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:03 +0100
Subject: [PATCH v2 01/10] dt-bindings: power: samsung: add google,gs101-pd
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-1-3f4a6db2af39@linaro.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
In-Reply-To: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Add support for the Google gs101 version of the Exynos power domains. A
new compatible is needed because register fields have changed.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/power/pd-samsung.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
index 9c2c51133457112ca0098c043e123f0a02fa1291..c35c9cb0115d79e5c36142da2c2a5dd30cd2ad47 100644
--- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
+++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
@@ -19,6 +19,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - google,gs101-pd
       - samsung,exynos4210-pd
       - samsung,exynos5433-pd
 

-- 
2.51.0.710.ga91ca5db03-goog

