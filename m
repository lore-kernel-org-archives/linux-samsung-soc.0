Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD15289373
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Jun 2025 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222200; cv=none; b=faPVtKYeeti9dXsqhDarhVfr3uHALDGQj+vObSy8UhY+IVrWfssOCdZilgebLGiSJjSQ8cPqzu4aEqF7C+lTgVONKBtFBQYAgBr8pyVcPxm+Hl1o+kwkHza5L6e5wzC8JE7Tp7ySSw+n60CA294T3rJyKMYWECsB8PxjD9iYq1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222200; c=relaxed/simple;
	bh=SV1YEZhjghdwhLBj1UwFLLk2JQcneGTldmvPx/Nj0n4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EMVGM3CkU2nyZPKlraKON+7x/osfq5WEq5l7k7yLlKeGxFSL6U/1OmfvLvbTTMIsRUVyt7vCQoRalIUqyuA/uX/cVhbLnnPAoV0P7P8D0QkgrTAl/GL8IzqiM+z3+kV47MazKbjmTqJdygpXydpEmr8f2b/NngecwN+6wUV1pP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MsUquoKD; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MsUquoKD"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so1243628a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jun 2025 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222194; x=1749826994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5a0iQ1Zgu99ffy4hMTjSX982sJBmFY9Vv0OH16Bj8Kw=;
        b=MsUquoKDSChE6v4iYJ1C/y0x44SRRNsjprg/xNm+tN8JzJBp/U/vX6wqcrpPFyiZyB
         zWaZugr1OL5FGB7qvby5QH3+ukBtDOhyxWidarXgn6Pi+dSqUOwaIwJCQ8iZE2eAXH0f
         SzOCflzLsx1qlydb55YiRYRtZXWhjni1TX0yIfnPDdkcjIy6eGwEgX+57VIPCjey2FB9
         iWjNt+cFxmYyH8eDO9w2fGcAA4BNQ6amOFv4VuBCLK9SZdcLLkRXT+cZsu0YdO2plFNL
         5w3ZwVJ6MADfaBPSB3Ch7N0ZP4zpF03EewBObF6/ujq3+4slONlSy4ZTFksp9Eaapzqh
         X/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222194; x=1749826994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5a0iQ1Zgu99ffy4hMTjSX982sJBmFY9Vv0OH16Bj8Kw=;
        b=D5MeQ6lEPdR8AcaBb0MTgCPB7ikWuzQeaIEA92sVT1GZjmsJ2PsXotcq7wqiEuM5jk
         BENER5+Pe205XL7ne7Kr72HisIqG1Isnx9Yq9uS2mTC4l+bdO+PDx1ZQAipDnGKa9ZRf
         zBYdDPEuggRkqjq/V+qxE8+aHM+JJ8ea/LDq4mQczsyaQ4WTeYJBrzg6Ml4lMPHTmwhq
         tSuZ/1qOI9siAPhDnDY8QRmMm6XKgSBNap0DZOE4FmHsV5W03ogFyT1wZYV2RNTIlgam
         FJaUiLKebMFNjjbwWbBUBGd6lTgeXbIH+o13qj8BR+sCKatjrgUKpjVlBw7Yn5A0rYX9
         zWZw==
X-Forwarded-Encrypted: i=1; AJvYcCXWEj97O54XR+LFoJM+orEoxVeVOVBIjiu2UlwzUIucBUDQu6JSfdTqx10gvpqdCOX7VOdsLrXJx/cUamN4QTBIjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZm5SHOH+oUJRaUC1qPnh0qnK77eZ+0QSBsbB1LjiJtqs3ukoo
	at8XRQRitn9vCVxOSxREpaTQT67jztl+6baiLD970FSFk+nDovU5onyAOcIQ0sfFGkI=
X-Gm-Gg: ASbGncsZFp7awpZDF6gS1M6dX1ovQZOexVRdFaCgGUqJcO/NKr4eIYs4nR7AgeZ1Xnd
	jfYRGNI0KGhqt4LfUfWP865kEa18T4VBQ+Sq7M7/uUvT44a/L+v7oBT85xuwwU2PbJJqm/ErJCi
	Xd8wo1mCMhEHhnEPR9Y/tjz9NOpt7OIp6onyZIUQ9p+gs4gtDlgZ9DBER6r+8w8WlEY2Wbk/w8u
	6qWXaVRGGv1o8jJYaCtXLUHnRGQe5Vvaadg7sWDHGpuiaZjz1L2g2+uuoQfwC/EYojyv1YKKymY
	nBA9JjMNuVDge7gei85LBVTCRHiw/40W8WTsjJGLvkvkFlcFzDI40B9ml6CqDILmhTxQHn0qWCn
	SImjfuPfalC0ja5Hygyycz9Xb71X3WqtiFTVUtE9Z0rgkkg==
X-Google-Smtp-Source: AGHT+IFD0H7/bKqCGgjIWLRQSHdueyqkrNyxVEdxUASVzNc/Gd4FBNci113q+7Q9jH8HWKk/Y0thnw==
X-Received: by 2002:a17:907:3e0f:b0:ad9:16c8:9fee with SMTP id a640c23a62f3a-ade1a9160d7mr369309066b.3.1749222193726;
        Fri, 06 Jun 2025 08:03:13 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:00 +0100
Subject: [PATCH v2 04/17] dt-bindings: mfd: samsung,s2mps11: add
 s2mpg10-pmic regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-4-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Add a regulators node to the s2mpg10-pmic to describe the regulators
available on this PMIC.

Additionally, describe the supply inputs of the regulator rails, with
the supply names matching the datasheet.

Note 1: S2MPG10 is typically used as the main-PMIC together with an
S2MPG11 PMIC in a main/sub configuration, hence the datasheet and the
binding both suffix the supplies with an 'm'.

Note 2: The binding needs to switch from 'additionalProperties' to
'unevaluatedProperties', to allow adding the specific -supply
properties for S2MPG10 only, as otherwise we'd have to resort to a
global wildcard with negating inside each of the compatible matches.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 33 +++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index d6b9e29147965b6d8eef786b0fb5b5f198ab69ab..0b834a02368f7867a2d093cbb3a9f374bb2acf41 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -67,7 +67,7 @@ required:
   - compatible
   - regulators
 
-additionalProperties: false
+unevaluatedProperties: false
 
 allOf:
   - if:
@@ -78,9 +78,40 @@ allOf:
     then:
       properties:
         reg: false
+
+        regulators:
+          $ref: /schemas/regulator/samsung,s2mpg10-regulator.yaml
+
         samsung,s2mps11-acokb-ground: false
         samsung,s2mps11-wrstbi-ground: false
 
+      patternProperties:
+        "^vinb([1-9]|10)m-supply$":
+          description:
+            Phandle to the power supply for each buck rail of this PMIC. There
+            is a 1:1 mapping of supply to rail, e.g. vinb1m-supply supplies
+            buck1m.
+
+        "^vinl([1-9]|1[0-5])m-supply$":
+          description: |
+            Phandle to the power supply for one or multiple LDO rails of this
+            PMIC. The mapping of supply to rail(s) is as follows
+              vinl1m - ldo13m
+              vinl2m - ldo15m
+              vinl3m - ldo1m, ldo5m, ldo7m
+              vinl4m - ldo3m, ldo8m
+              vinl5m - ldo16m
+              vinl6m - ldo17m
+              vinl7m - ldo6m, ldo11m, ldo24m, ldo28m
+              vinl8m - ldo12m
+              vinl9m - ldo2m, ldo4m
+              vinl10m - ldo9m, ldo14m, ldo18m, 19m, ldo20m, ldo25m
+              vinl11m - ldo23m, ldo31m
+              vinl12m - ldo29m
+              vinl13m - ldo30m
+              vinl14m - ldo21m
+              vinl15m - ldo10m, ldo22m, ldo26m, ldo27m
+
       oneOf:
         - required: [interrupts]
         - required: [interrupts-extended]

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

