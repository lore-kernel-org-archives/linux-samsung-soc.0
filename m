Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F77A14D28C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714061035; cv=none; b=j8gxgIMQpL/AnfKw5jjqOiorrOKQpyyXeQJrPpie3wosd4//kU1uCF2s38vpweqG3AMEI479iq10PlULx2BYZtlBEmmkPiiso/pZ/B9USr4zR00oCVDZAEuRg+VHQHEGKocQRiK3vxwf3GrW2tNJONJ6LKxWkH3zXu/Pws+w/7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714061035; c=relaxed/simple;
	bh=qjiLRzQ/LzL957Tztom+GeWOX7MmZNPVIPPVkVPDhT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DV4W6wYP1YLWxkxhcia7e9jITuU/vZT/1FLVLdDRhAOagMFOSBUBl2OWpF2L2NxLzc9BCeNvZNciilfPLFzbPUQmpvanLgBA/09+mX9u+Oc+rdPP8KDwZ2ci5Qj/JlG99SEi3C6qQWir8cgws0+j8ii+mHSKXeJpAhlrowee5CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yAlbA9vd; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yAlbA9vd"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a55bf737cecso145284866b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 09:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714061030; x=1714665830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyR9vWPsqsAUgpTsJMpV9yCJydAsWbKkcw3s9RwSvbs=;
        b=yAlbA9vdpKll8bZrBaNU6rcD8+XAh04F/rFaXX6fvdSYj7XfQyV/lRlX+DS/oB/ZE2
         2CdeQJjfrFiOBvbyA2CkJv8fmUbiroEz9Fd3VrZyzRu5Y/GOvkon9oWMLE/xz+giL9FC
         ExeqkDI/X0Yw88AcsFICWjF2Otw4xvIeWtohxik0UDwo6dwDGLfWTXdicWJQ6b7W2KO8
         BAbcG8r3KMVjkw4ps1K/KHydeONaQn/fz6gHqwnSfcXTc7uA0KxhRaTLthbeu0DmW2Cj
         bjKL34eDFNWECfY3xGewwDGAWj0PTP9ISvKOE0jn6Y0G4xx9Bl4DMLIhLPyql4GGbs0W
         /i9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714061030; x=1714665830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyR9vWPsqsAUgpTsJMpV9yCJydAsWbKkcw3s9RwSvbs=;
        b=qwGWWENvj+CbTgbx6HxXlenxvYjlxzXz5ZRSFry3uqx7q7elU9tZu8ZCa5L1N00H/e
         TBK0+GOIRrooBg/CCq4CowN6Xw8qyaMlHgwWRODlh4YKeZt7D/2SVKFhVcmrQRiXhIvU
         GHrU5V7xJ/wODuuA/CIYWpTx3kp1gaKG9k0PDTn/9eEn4YGfDe45+gdtD6muDiP10vqU
         j3RlAo/F5WzVVf2sjMH2HglJ+N1ONvniuLPfSk0iIq5072BBBJ5k4pntlKlRQN0+9bAD
         EHXIayfUZixN8kWTCwRGhWj2zqznQ25Vhj/18RrD05e0RYqKN4SSCt3eif9RpDnG5xgl
         lqZg==
X-Forwarded-Encrypted: i=1; AJvYcCUzSPFyIWPb70+FKv0eTLNpUlbD36PeAOWGSvz6Gn20nkDerBsydjCHZbuxPomDhDDbBh6MsPDSlfFYBeWvD1z7XRokNnEje6Cv7qjiiZGk4rI=
X-Gm-Message-State: AOJu0Yyoa/a4yFB6x/e+isOJF7DCUBgZcxUhtLZvt/yGxD/oFg5Ww9LX
	mlgxZ6fufYar4+YhhvrduP8teEPQYIVIYuTGs3x0bcyGhg8+eDDO53wIubGGuCk=
X-Google-Smtp-Source: AGHT+IHWlzXObnhoIYoQz5NBCn2aut5u9/VWIBSK4AfPvrhlCDjNKP1pLhTffJGnUYMckpFjpwyP/g==
X-Received: by 2002:a17:906:6bc6:b0:a52:367b:e4ff with SMTP id t6-20020a1709066bc600b00a52367be4ffmr120217ejs.42.1714061030485;
        Thu, 25 Apr 2024 09:03:50 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id mm10-20020a170906cc4a00b00a58a44a4419sm1329562ejb.57.2024.04.25.09.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 09:03:50 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 25 Apr 2024 17:03:31 +0100
Subject: [PATCH 1/2] dt-bindings: pinctrl: samsung: google,gs101-pinctrl
 needs a clock
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240425-samsung-pinctrl-busclock-v1-1-898a200abe68@linaro.org>
References: <20240425-samsung-pinctrl-busclock-v1-0-898a200abe68@linaro.org>
In-Reply-To: <20240425-samsung-pinctrl-busclock-v1-0-898a200abe68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
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
 .../devicetree/bindings/pinctrl/samsung,pinctrl.yaml    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 118549c25976..49cc36b76fd0 100644
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
 
@@ -120,6 +127,16 @@ required:
 
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
+
   - if:
       properties:
         compatible:

-- 
2.44.0.769.g3c40516874-goog

