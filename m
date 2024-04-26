Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F5B1474D0
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 13:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714137944; cv=none; b=aKUKwkRX3htjMTrtOtpZLTFCqQZrWzliv3KHo9jQbM1hQt+5y3GdBFXXXwO1YZxg2LVfvxm07fPG/ICYiGQSmNcpRDAMt9s9fLE4ellQJVXpS3OqlLT6fVW7KyPfe3OZHP8tBNXdq/Xa1XUgUULNjbzsBapVKag6RqR8hFywgKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714137944; c=relaxed/simple;
	bh=ztaqmhvdRLeUQiXlEr1FC/+chY8yQf+6bxg+Si1/hN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pgl+ie/998IzEOCXEaZ0MJciaPdpb7fRcuSOwv9SnthF4WxAnxMARDPhtk/CyuV+57LM8ohK0oaK2CReVXttUB4pgOevQicm2WIcvK2cfgUxS3SgFra2EIxDWaY53tkf7LV0uOsJLe4S3BBAf4KZNYmYVs+T+j6yyiglTej+gFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zkX14Dfo; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zkX14Dfo"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57258c90899so971065a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 06:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714137941; x=1714742741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvJQ6z3LIYsXbX0CNbTi23jNqb0LHvvyCvPaynRyaTs=;
        b=zkX14DfoJ+l+KH5pSBs0Hb6YhjccbYvaq4ixcWKszs6s+3OxXO+H/4hOK/DkZiv+x5
         Atp/Izkia1XRLfG8i75tsf1vKstmbx08tolgBe7wdXO301hvo/Wk6eS87kHIqJjr1XSH
         yNOea39v4FsfxKJxZvbWSIR7rHYreCdn+41QtTWVlpsGInaVaazcvvCQ3v6ep/+nBD1D
         W4VoPuCY5iAK99xqnRcep65PUOEEAx8HtiHfNCMkHQ8APJvUxwHFgo/Whabnbt14uzti
         A92Htr0wByd7JLQlahHyP8BbeJocUtAQi7aYsRYCKA5gwQTMttCzoJM6tnBaF8YFiCwf
         UIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714137941; x=1714742741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvJQ6z3LIYsXbX0CNbTi23jNqb0LHvvyCvPaynRyaTs=;
        b=BOWvv21dKlLZ3ui93efKHxjf8rEQ1I549uz5JqipeAR4FO4LYOXBiHq/hqdOrabqD7
         7xGrQktxbN/cfjG5oK/HYQ9ZO7+Phzl5g1i7VhYlFQIymIIZ0WecEW+sqyXNSnv/+jq4
         QyTNzu2DIkRzfIfRyrq2ms4f0yjiSe7Kc4SuMdW+/H9B0UCB9SAIhVeQoT57Rnqyz0J4
         jB/aCuZPmgbkLGaXrXWnDjq3v7zPMLDQMg4zfNPBHFXZfB0ViWtsdnxY6jlEglq2B6oE
         PnICJIECkcxplOWkeSCY0K6ulhcg5sMDRdqz9Ij8uHhv09QHVpU+i4K/CvdaaHanHJjy
         rJBA==
X-Forwarded-Encrypted: i=1; AJvYcCV/ivpVzB+m4bio/+bseVEHVXwXOcmmCnJ/7MVO5jjs0jf5GZYQ11N1s/0yiwplMceFJVn6rxTZJ18OlmVvfMp2ZMpZkD4upZlsPf/hJR6JX7s=
X-Gm-Message-State: AOJu0Yzwtqh6RSWGoPMnZ7GcpIPBTnvro/nmU9SoStxIa1DWAoZVt0uw
	9SJEzkOH9+w3zX4RBbrV3hWweksgNOG6jmHYTeakV9YxFA8cdddKsRcP7K8Zzps=
X-Google-Smtp-Source: AGHT+IGyLKLUTlpLc0/JKdHbgkUEEFP/rYyXDO/oYK6H/QYkI4iS98NiLFkTCs9d+I1/u+WoUFPuQQ==
X-Received: by 2002:a50:96d1:0:b0:572:553e:6c1b with SMTP id z17-20020a5096d1000000b00572553e6c1bmr1170246eda.5.1714137941095;
        Fri, 26 Apr 2024 06:25:41 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id q25-20020aa7cc19000000b0057203242f31sm6187837edt.11.2024.04.26.06.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 06:25:40 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 26 Apr 2024 14:25:14 +0100
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: samsung: google,gs101-pinctrl
 needs a clock
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240426-samsung-pinctrl-busclock-v3-1-adb8664b8a7e@linaro.org>
References: <20240426-samsung-pinctrl-busclock-v3-0-adb8664b8a7e@linaro.org>
In-Reply-To: <20240426-samsung-pinctrl-busclock-v3-0-adb8664b8a7e@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

The pin controller on Google Tensor gs101 requires a bus clock for
register access to work. Add it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
As we only have the one clock here, please let me know if the
clock-names should be removed. Having it does make
/sys/kernel/debug/clk/clk_summary look nicer / more meaningful though
:-)
---
 .../bindings/pinctrl/samsung,pinctrl.yaml           | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 118549c25976..242dd13c276b 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -73,6 +73,13 @@ properties:
     minItems: 1
     maxItems: 2
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: pclk
+
   wakeup-interrupt-controller:
     $ref: samsung,pinctrl-wakeup-interrupt.yaml
 
@@ -120,6 +127,20 @@ required:
 
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-pinctrl
+    then:
+      required:
+        - clocks
+        - clock-names
+    else:
+      properties:
+        clocks: false
+        clock-names: false
+
   - if:
       properties:
         compatible:

-- 
2.44.0.769.g3c40516874-goog

