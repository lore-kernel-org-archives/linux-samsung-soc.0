Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF7D3128B1
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 21:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761773441; cv=none; b=oLIOvd1KC47gaBzjd7Cq55/B8L7fIBQqlB5H0ThaOsXxzE6tEwjDEybcuhp1ZrybBLMY56ZbS+rw7Y3I9Urmk6qLuK0dYk1qVOiDHcrSHujBnWrLPT+6rNTkZV/djsOQfGCKvlj5nwUS1O7qwDQh7Ow7XRMXx1uWK049I4BqOXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761773441; c=relaxed/simple;
	bh=LZlI+SfH2hRW7IEmiRIC6Wm5gYA1XEvv2huR7APCMnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EfPfhVWEQmoYc+BubECNc9ru59W3UsMR4/amk999KJXbqI9Fq3XoMrkyUOO4/R1MKAMn9rjK0xL4M8CHc4lMT7wuGiP9THd5jI9VPkYijHP3PEafkO4nbqyL/SFZLIpIH8H09CgmbMuEAjsblVkAspc+zpnZgXZx8Qc41LNC9f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=piOmRTT2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="piOmRTT2"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-475dd54d7cdso1192095e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761773438; x=1762378238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqao3OAOLCFcHU/rHJrP0WoCHPf0PW0UwACU02JLSpY=;
        b=piOmRTT29YEr2e1D3BG0pjlJ/DRFJdSpTfhQxUirTOOSkbWFuchgGvUwBv0KltlybV
         s4tYa9CCnMUW/CJ7yyOFl7QuSjglDiV77BaRHOF1ESNY5RL1yivXERNM3Qzt4dt90k0h
         Q3dbpMaAGCFNrJdXNuUd+KjA41xm5HB6jZK4a8KGlprltpYRuG3KSEMIyG0hmClPMO0s
         nvfTaJk+u/FtGZcZThUMo33N3+HX2143Rmm9RVjNHlQHUtvYoMl04oNx8Tn5YahZ4eBT
         R3+a3aCtLIFDkgb/mkGVy57uChossPnxBMN2FHtfnQiwUahW9NugyUq39IzuUZ6VirAQ
         GlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761773438; x=1762378238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqao3OAOLCFcHU/rHJrP0WoCHPf0PW0UwACU02JLSpY=;
        b=WPXyBrgs72geMrJO+beGgJguEN9Fqc8xGX1yIME6a1GSH9dZ3bXqckJ+RNhtVppi3B
         Phh0usUXAtdMM9yAsVpMk3wW6zRxWHH3HHQV9k40YfLDYRWT+sMJjSp6uBP/UqMnIIP+
         QchRUexWl0CzBFiYFXG5QCWXYgBl7WqyJKA74lmv3PJ/A5CvSMSy7JKFtqR5mMYXZp3u
         iYUGkG9JvIBLg01quFag9dqXwj7g1+Ge3xBIqFMWBEwUsHqtVlsritdjrL2MbRt8akrc
         hKD4TJmKmtB+WMtFpXnkksQ6Iv6qBe8qmFKK/jvGotXt/q8NFBHyySwjiJOejA0I+n2G
         9jQA==
X-Forwarded-Encrypted: i=1; AJvYcCWE4aFm30ZLP5EcEptMVUJC7xCBgp5PCiGdpj2sIldfDge3REWRdJ7RuNO7e5vv2ncGlQKrXPm6IPIf599iAPY0UA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx0Jhg4twEO3iFhNVxFnygUG3fa7Ln829lng5t9mOtX5bMcxIN
	AuNFBCDH8hwNyFzivKChufj0RXZ3qRLE3uUWZFyqQqrUSbcxcuAQUJCrJqksy009hPA=
X-Gm-Gg: ASbGnctkSwz0bl/rQCVRpv29Qc398YMGfFt0X5YQuuUmSAJo41zyF0SKpde4II/zGuL
	fr6nLEeg7ebxThQgBUNpzDMfLaW2DvagoI7WtsMdyFBqEV4sdb3c9jMVtApPlE7T9gY2YUDkMaO
	fqBS+1pdEhABL40sDuSxL11S8fjKYwsC8XmpFmSavmxpAVNkC8W07U8WrjTvnmgyiMS4lYUmTmi
	8KQzjBCnq/WUeo9AmzZg+sXpJC3WEu9Efr2GeA8CZiw2+QQlIRFuTB+ibNOtbL5AKrz2RRgjquf
	tjJk0GFrghZ2jt+iYa5f1WsU9f/GsQPWRncNeHKY2DQWku4l40hUunZ7UOnjmppu5i4fxUCPxin
	iqA9hk9dGYKE54hxz2z2qN/RpXe93sUfY87jP/wPnvlhr2k2+wOcomth/xK7ElxpWvTSA0FQ5mo
	kzBjt79WJ4ViVqgBtVw29m6whamQG+5A==
X-Google-Smtp-Source: AGHT+IGp/EK/XdKFzXP6oeVl2/r7JHS0fvkT2KmtT02FgLGepcMP0rkpaLkN8Wts6sL/irg9mBZrSw==
X-Received: by 2002:a05:6000:1ace:b0:427:9d7:86f9 with SMTP id ffacd0b85a97d-429aefca833mr3622435f8f.47.1761773437650;
        Wed, 29 Oct 2025 14:30:37 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm28573457f8f.6.2025.10.29.14.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 14:30:36 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 29 Oct 2025 21:29:22 +0000
Subject: [PATCH v2 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-automatic-clocks-v2-1-f8edd3a2d82b@linaro.org>
References: <20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org>
In-Reply-To: <20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2314;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=LZlI+SfH2hRW7IEmiRIC6Wm5gYA1XEvv2huR7APCMnc=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpAod3/hjW6JkpLI91/1F2pv5Yk5g8WxPvDM225
 Z9qWHYzybqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQKHdwAKCRDO6LjWAjRy
 uraFD/9gcT510rus+j0Qwf85erYOI8NExBts88NnHeq2TsV5BroIjNQqqB2b5LnQjEQM4oylJHT
 CMTJAIIfJ5z/6bCamCq/NuCVjLI3vLJnKVTNaByO2kcvUpHz1Fg71I8XzEAdqkhECDZYqFEPeAT
 atVq5LQi9DRfjH3PzTrhQROICxcEoWSKQFPlrT85bdS6zHWUHAkW8jM0KWemy8JUuV0ke3GLVxS
 a4bkBgM/xXJ4fFD3IbOkQ/vH6wvYgBt/zL72tuVuJHUmIjT1cqp11Wp578oudpLnLDC/9FxO/7V
 LLYWtXfSFIe35m9Mmh4J3TASKoAULUI5QPuR3vS6ZwxaNU0iPXvIZWCoLtvTKzN3Q+m57DIEO4p
 JkfMCqM2OCEyFBJLxAmlCaWGSLE11l2GnT/+/cUHlBaywJoQPzK0A0dSeExxJDqFYlfPcF5ikjq
 iH+yft53TkF8/aizlyA8g16Odgx/399UY2axj3STLfmVly2dfwREuR06g59h3qO1Q+/I31KuYDJ
 TuEmdjq8/LnUXgJ6ud6PMmztXP2w2DnjKyBfd4JrQhsETlpkN0YuXDFdcOBcGjylQMIPJIYbafn
 BeHWnCY9dXPAqGSnLKz/uJDSCkFLfukdTxqagbWd0wikEDoT58tKiVQFhCWr1DXLnzrqgo6WZTa
 PrVYt8q/hJjDlHw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
that contains the BUSCOMPONENT_DRCG_EN and MEMCLK registers.

If present these registers need to be initialised in the clock driver.
Update the bindings documentation so that all CMUs (with the exception of
gs101-cmu-top) have samsung,sysreg as a required property.

Additionally update the DT example to included the correct CMU size as
registers in that region are used for auto clock mode.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
v2:
* Update commit description as to why the sysreg is required (Krzysztof)
* Update commit description regarding updated example (Andre)
---
 .../bindings/clock/google,gs101-clock.yaml         | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 31e106ef913dead9a038b3b6d8b43b950587f6aa..5ce5ba523110af3a2a7740b8ba28e2271c76bddb 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -52,6 +52,11 @@ properties:
   reg:
     maxItems: 1
 
+  samsung,sysreg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to system registers interface.
+
 required:
   - compatible
   - "#clock-cells"
@@ -166,6 +171,22 @@ allOf:
             - const: bus
             - const: ip
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-cmu-apm
+              - google,gs101-cmu-misc
+              - google,gs101-hsi0
+              - google,gs101-cmu-hsi2
+              - google,gs101-cmu-peric0
+              - google,gs101-cmu-peric1
+
+    then:
+      required:
+        - samsung,sysreg
+
 additionalProperties: false
 
 examples:
@@ -175,7 +196,7 @@ examples:
 
     cmu_top: clock-controller@1e080000 {
         compatible = "google,gs101-cmu-top";
-        reg = <0x1e080000 0x8000>;
+        reg = <0x1e080000 0x10000>;
         #clock-cells = <1>;
         clocks = <&ext_24_5m>;
         clock-names = "oscclk";

-- 
2.51.1.851.g4ebd6896fd-goog

