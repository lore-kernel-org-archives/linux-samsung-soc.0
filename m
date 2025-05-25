Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8066F7263C
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2025 19:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748199997; cv=none; b=Fn8zW0I7NYkJYSONViUZ/EnBSy9j6KFjFl6luwmA1qvFoQvHF7PVFjKi69Lv8OGh5Pu37kI0s/sD7euXh8XPETCDP5kdq+L9MEjjvFHzewzN5ZMOorHT6wEZvQzSeET0T4RAAYBgFtkCE6KtWzGxdXajSzgjidi+rl1PGhUX+aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748199997; c=relaxed/simple;
	bh=3onmZshSspOtZwdRjF5R+KZacQlOFA9qC5Ok9p5ajBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ewTVmTmyERW4hWaX+v+8FnyxHJAXygMWQ4iMSHo+pkwL5/C2fnAbo0r/iV/4Tcvk4U/JkgtYffB6ca1jerh0Hcf8BwixzQdY/0g9edaUh11wjQgJZ37IsRhg/MfhEfkGMpXIrJoW3iTYUXEi3X1AnZwI79W8Q6uxvwx5V2SXcwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WW4bewGX; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WW4bewGX"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad56886dedbso13225466b.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2025 12:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748199994; x=1748804794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p0Ac+WyyvZzgKaVOOpGDL89ciayObF3/GRMWEiWnmOw=;
        b=WW4bewGX/HVV4qGLSdSU0Cd9Pr40USIQdhTZnVJBF2XFdSiYsJApfDFM3mTQxX5UD6
         UCTps6UMoYV4SZLbTXUjCHqQFBoLRvuhPHvLUcC7mdcdsAD/ouijyQJ7PMECrOiRlatx
         GjhuUX1Z7ID4H1xItPlwJSu1C8Ji+kRf5TWC4Fcs0sFEpM1Ctv+4DI5ELeHUKiwbTSKO
         P2UU8Rcn/HXx/YV8N2+RGXh8WrwbuprPeUqpbo2hsKcmxRhpwp17Hd8JZMVPXmDgOISV
         YfPUXVj/UYniaNq5wfii2Zk0LnZC2HHZ8TvY+v88G1QtjS1KhUMa6/cDAeuK8Elr5if9
         8GTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748199994; x=1748804794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0Ac+WyyvZzgKaVOOpGDL89ciayObF3/GRMWEiWnmOw=;
        b=Dpt1L2J/yyYg5AFv8RMiBTVombj9NU/iKehgA/SsHwpKbgbxzDgG9B681+HzxIB2YP
         tqBuUKHtD5heVQ5N2/GV1qrMT/YmpAzqv2WH09yg7saZdiwhu2mNgE+NMFTB69PucuFO
         k5erbI4puNst/hRGxA+Uzp4nptpBRln+XS+4OL4NzuP72Xb+Fy59/ZVUvU5JXxNI35H/
         R7VD8y+e9hvOw2uzwdSczMp6toH1UsykM7jIjaa3VkmGQy7FFo9R+JRfAvMXGDPhyjz6
         FV2GEqsvJyvmeO8fqNi+uCUZaGJLdMJx6Q10L89kcsTwPSurl10MlI7qL5i57WV3wnOS
         ox1g==
X-Forwarded-Encrypted: i=1; AJvYcCW2PlUADcOSkFzy4KgbgOjzKbxCJXRfkralMxdimTwdRvIHxKKuH6WFxPXo6wTrjuKJu0rxeM3Efcxpx8834ZcDbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfyJ6Cek6dzxspZu1hZo2J06PUaE9MAzqO7XfQnoTbaQVyGU3c
	ly2eCUulEswiht2AVCRp+l0IwncPc/k7b7nYfLNe17WN0yv8dNfuNwCnX10AQWzmeJh92YvNFT3
	MUf2r
X-Gm-Gg: ASbGnct11miWXDowVxnAsFvLHqI9ufVEDSXhiaCy/HiJdMEZfGA1O+sCM5+xLDJAgVt
	QbBy8Vm8pryQiooe7naKQTjt/eKq4jXxN99iCOW+xTkJEfzqZvfY0EeJGNyGWnMMtieYX5G1ijx
	fV26VmfyPQYd9C5mW8jesRwNJWXbjNn84sLdOMqyBakayXTGb8lgXn4hchSOsCh6/yZ7sJq747J
	bRW6P5rv4kz2JxQLmXDbNgVBW4CC+dEIe1qJ72jjrV8m9i46JIUgIwJEf30dtSkiaMKCgoWXlAR
	Q3LKxYvC4gGmgRvwAmar4HsmjvMfGKZVof0BlLXLBXtHJC0TT/XLEMuKdX4kFw==
X-Google-Smtp-Source: AGHT+IF1ytVUxy0yTSnOyU3J5wIiT4fljHMLqV1rwc+JlbKe1QUVexTGhNkOuAvqkz9QFmk0klKpOg==
X-Received: by 2002:a17:907:7351:b0:ad5:76d0:4ffe with SMTP id a640c23a62f3a-ad85b15a680mr156583666b.9.1748199993680;
        Sun, 25 May 2025 12:06:33 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d277a2esm1563862866b.83.2025.05.25.12.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 12:06:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: soc: samsung: exynos-pmu: Constrain google,pmu-intr-gen-syscon
Date: Sun, 25 May 2025 21:06:31 +0200
Message-ID: <20250525190630.41858-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=837; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=3onmZshSspOtZwdRjF5R+KZacQlOFA9qC5Ok9p5ajBQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoM2o2sfBErBvCiBSO8rZEm0Oj8WqokUNHdzls2
 njdMxJ6ihyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDNqNgAKCRDBN2bmhouD
 1xcTD/9ORDhwOmIMphZfmjLWKYfBIueQ2BR1coOZs6pfI1Ls5H72ollgg0KYwTyI4D6DX0gOzyf
 6qDZWDIJjzx3MuFqn0KREZA6jH4WbIoJVrJnP3PPnuA43OrKcro3d69to0GZO6oAVJL4vytuLK2
 ldaL93C94RlOm8EIaNZfrQ6dlJDVbDLm6tM/WMkuYob9+uIyWKKGhW7FfFegEonv0ty66aPSRXn
 m10Dd+eVHfl8YlQdXcdn6NWdBce134CRTjTdR8wgfELEPWK7XGHjHUEZNsujD/gP1L5XZRMvKML
 y24Sn3/gn6Ek0Hj+bQ40m95RXge/Pic4IH3kP3NkaefdmnulLKW8JGasAHw/kJNFiGfR5asjtK0
 yBQR1fn5kwS8Qs8ch0JxcFlA1GBcd9s/tvuI3l34HrV4B7snOvC1OJxSwpnUQkdRRIxyzBvqsWs
 RLkPUIG+sMXgllOhkMslaC1Kg47e4wVOzmAo19o3JNFUVi359hUWnGasheNTahJE2kB046nBNNP
 hN0e9AviLhPzloPvVlbED2n1/8XY+mwFJFE5YfljIvGh6O0s58FMSBcoFhRoLI/UaYXS77iveLP
 Cn21xCtnyTNJHL/DZClux6U1ws2LTVVOoOfjwUz6Mk9Z8iRmIgOB+QNWMLZE1c4meJhMLBDSKU+ i/+a654QuS/hpFA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

PMU interrupt generation block is not present in older Samsung Exynos
SoCs, so restrict the property to Google GS101 only.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 3109df43d502..f0fb24156da9 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -203,6 +203,9 @@ allOf:
     then:
       required:
         - google,pmu-intr-gen-syscon
+    else:
+      properties:
+        google,pmu-intr-gen-syscon: false
 
 examples:
   - |
-- 
2.45.2

