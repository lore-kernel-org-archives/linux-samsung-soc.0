Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169B62080C5
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Mar 2025 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251536; cv=none; b=RSVsBUKKXGB7zQOoqKE4HFpmnJsbXPTU4CQ1fr+B1uFs4eTCPNgdYeahgGeNLTpZbgid7AgTDRmaKQt39unW6ENnYzfgYTjP6fsZUh0cIxQPTmMaMZh8RR+npSJh+s10sfiqh/umKVW63fu1tt0fvFcL1VNfpxtSWDuafJ3pxdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251536; c=relaxed/simple;
	bh=NWlL1nGttJYahk2Cib0CQslDOn2EQ4g8BSNR5s0Vy4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XIERsJ5guaf2gd4Ajv3PKfNvK7TB7c0LNN5gSmRjzbB34z3105K/051k//GGy3PA8gDwKI9wPEPQKLUMUO4ge7MRemuBPtarICKU3ForcwVURYoR3doMc7ohNSbaEcwRjh4ejYo0ef+BhiWVvd+QUyMuB7YThSTs/5x7UeR+qIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iTn1l9Jy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iTn1l9Jy"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43bc21f831bso471315e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Mar 2025 00:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741251533; x=1741856333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OzaWip0h4cgnJEaNxzWkXQf8pOprxx1UV0JvZpTPUv4=;
        b=iTn1l9JywyFToOEZDB03xM+KZymFhEm1e3EKN2AN33XI7czuW8ZNPfc4sMThRptgyw
         fGQIoVb4aYH0EGIEz0Xw5nPfNFDEbbyoc5VzVl7MZ45voopn9GwOUNssn1atzQ0XU9qn
         0jjCNU441n275PY3Lf6A9YMIldYYp1XOiqZkWkXmiirzU32h8Irulwl1VWyQW/skMfKB
         PShn7+Nq7DGJM5y2roAjl5KlMwdM3SiNgfY+05+ZAPDrUK4Enc1IK2xQKn2cdxru+FlL
         jM6Pp6pVqTsqH0v9AHSxtIEEbeFqvr70aDMCPLSSO9JrlCvK4ZSviEEvIkzD8ayhYN9P
         93kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251533; x=1741856333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzaWip0h4cgnJEaNxzWkXQf8pOprxx1UV0JvZpTPUv4=;
        b=Tr+ASH1ke/+cyQZLyp5U9Enic8MUkT7R8m4hFQkcNlhFwEeuZNLIY1OfV0E/vVkd24
         6t5F3DivtVZoW7zKvNnFnYPZKuJxI9qsYzXPAusLei7sEiebIac3X1mzdyzq8pSZrLN7
         GVyh4exvkqAEs9bZnT6RoIIZ1huybQSRuVpsDTL3R3mckMdmSKeQwkgaOmsWRGw+rWRz
         Xx2TGIaQ9AQIYJeWcTNfrxQHh34d/pD19QK7rg/Ny/APb4BW3rhnx47BRNpd8rhWw1BM
         xRh1BZTY+eQI315ESp8wo7edtakveLd8XDrSnkedH2h8qesU+E+h1TDxGlTzRb1Y9DFV
         WK4g==
X-Forwarded-Encrypted: i=1; AJvYcCVdhFjfHE9ragHRRqx1J4PMTLJpWY4k2giFORbbFuFIdmqw4djMwN340MPakNfM4L5s43jY26jsY8Woqkcxu8lgqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRtbZQ+1UtQrmVNDtIHpZvFC32uadzU62IW/Vq/nd1t/8Chxny
	3hev3wn6b6JPP5dKb8/wnKwKs9tSKf1gWVoWeryiXeuxZbj6AudAw0/biLEE3Yw=
X-Gm-Gg: ASbGncsFOZ/RLDKdKL41KNAvV4+SSZ6j2fAS4f5xZxlIdk7MIGHv3s/74KT9V7NLuGZ
	Y3V0C4/GH1BCP1Y4fHCRncl3Y3UgfrWg09TPRZlHRoKzQAtTvuSwYtVLyjb1m9OmBxFvwt8FoC4
	aOSHYSNdIm5IViHJEpCvfxo0xIzfT2GJyolGUJ7nBfshEIoR/cD3N3mTBzykWXgi7l9nCMYrz9a
	6/81EUBPyBU/Zyo2iR3tY3NHJ0UF8ErToEk6sSuNIM7LX3QNMhXPAWXZ9s2JcBSzwOSzOfZOulN
	kjuVDWY6Df9HJ8ioZVgt6JUZ12q5CjOA4OXgJp5k0o3evdqjeN8cg+bB0mI=
X-Google-Smtp-Source: AGHT+IHVNtHxGr+nftjAhnUun25Kgv6DcFTFjM/EL36b0UMvE/mwNcZOxoyBOBbcisiK5cck01E7sQ==
X-Received: by 2002:a05:600c:1d90:b0:439:9a40:aa1a with SMTP id 5b1f17b1804b1-43bd2ad9d91mr19260025e9.6.1741251533219;
        Thu, 06 Mar 2025 00:58:53 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b046dsm13184405e9.5.2025.03.06.00.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 00:58:52 -0800 (PST)
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
Subject: [PATCH 1/2] dt-bindings: memory-controllers: samsung,exynos4210-srom: Enforce child props
Date: Thu,  6 Mar 2025 09:58:48 +0100
Message-ID: <20250306085849.32852-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung Exynos SROM peripheral properties were moved from the device
schema to separate "peripheral-props" schema for child node, but the
device schema does not reference the new one.

Reference the peripheral-props schema so the child nodes will be
properly validated from the device schema.

Fixes: 67bf606fcf18 ("dt-bindings: memory-controllers: samsung,exynos4210-srom: Split out child node properties")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fix for Rob's tree.
---
 .../devicetree/bindings/memory-controllers/exynos-srom.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml b/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
index 2267c5107d60..1578514ec58d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
@@ -38,6 +38,7 @@ properties:
 patternProperties:
   "^.*@[0-3],[a-f0-9]+$":
     type: object
+    $ref: mc-peripheral-props.yaml#
     additionalProperties: true
 
     properties:
-- 
2.43.0

