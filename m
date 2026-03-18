Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182433DDDC6
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Mar 2026 15:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847686; cv=none; b=LnH/NCXx1WQzQPy2BUFMKuVhI/N55O2Evx5mN7YSf63YlmbtR/GjyZyAz+KUwurQ7gHMrtpozpj37EXAAiQp0+u+wkFaXov31SID6caNkj5DWPVYvkWl3UTld3UnbEJntP1fTFWzPMEHeY9Y1NQ3fHH3rg5Zhuw9fSPrjHVA4wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847686; c=relaxed/simple;
	bh=5HBp8bV1/vaov7w+S+97JbyTVIIwdoaJlgTvdiC2X1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RsLhDCxUdK9nciVmqJQO/o9vInlGf2G91YMSA1ZuAlCE93XPDizXpYY7oMbDfTYmxc/5X6Qcg4XCelxTGa8J2bfAMHeWd0Ha8uvHnifBcsmFyb2vXWy1FS3rTYpDM+n3vt2f9qW3S6vdvl6OQVkLfynJrBj2EbZt/89MG7hz4cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NnU8yo1x; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NnU8yo1x"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b886fc047d5so150870366b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773847680; x=1774452480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P48rUo71pAt5qHURMk+v6z4m8HRw94KlYaJLWRXtfGc=;
        b=NnU8yo1xqfBITHf4u3NjINasim/rbCpKIS93FUhT0EE3Biw7YkfIUwJuo0yqMVzuXG
         FYAtg5s7f4qnt944sWCFFeIJqmBK14SCVlPtHGeQxJK8BEkHOAqWoPjEjOREA5QXns5E
         9ylgYoCggqr4E3Fq11JRlnOWZAxVE9cfDjS7nEQDw51/OuIXl+sK0cNPfKoSR7My2lkY
         B3vYWPPrPJ5mPSaFE+3mHnpMpMKwRMWPFXpAw+Uc0aaACKvXue94mhEVwJ8OOqNpxtxq
         MKJc8bHfO4pU3Ywru49gLqzVFRgmIxfT8WmJ88ZusLp+lDXRGHsyb5JL2hQWE0aj5KZK
         q0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847680; x=1774452480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P48rUo71pAt5qHURMk+v6z4m8HRw94KlYaJLWRXtfGc=;
        b=D4+U3/YAtxQD3MSwGoXOJheQTlLB9NmvHl1qvBAUUrx9TGeH3AgKPc9jluoO1MDP65
         oHn9I7NPAuht3KAR6zB6m2n/Xo1aO9GhjVBDqA5zDl+zjT9B/4GnIMMIwgsBJyn+c10k
         NUTGUBXX1e+7utXoVp4vGXmq2GSGfKY9vHf+KJAoCewrlneUgkpU4pxN/CTdshYPgi0n
         wIPZlkRwzTaoiQmyP10xZZMTTtsTIZMBpZJicgqaC2i5a1E2T9orPUa03s+10SJOyKxR
         7DacV8mrRRTFSLhwHcQ5W7IZINt06wASmqKN4dRWQk07JTRNkUUWEGF9gWc4cHYa7lq9
         onDg==
X-Forwarded-Encrypted: i=1; AJvYcCVPE6oPk/+vFcbi7JJCJV5ucHByWbGu043+hMRxKPCvy3d0Ii9omdfPQhB9qgrrpHLDWHQsCvEzXWftv/AMIAPP7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsfRpIC+dhd11AkaX2roWaor61zlUMLLvN4OmmuwCV9/zCMlQi
	TfG1FvUgO7yO2ZYmMb3o7SqQvOm3QeAdOEOllOmKvqTgeoxzTNYsqLH2RfVOVCzBEWA=
X-Gm-Gg: ATEYQzx45zwBRReQAatc+7FWQt9Pajn/UzY13lVtHx6IgTDI0WB9gCPI218t9Qyd7Pb
	l1W3njYfWzSqYUSKUrrMh+jDmE1ZXWUnmxpvRj4nm3wzgiKtqoA9B92ju40/BftHhCIURWnHf9Z
	FBTA2oVYY46Iuax+Mtr8nlqDKM+TKAowI4bjuSdpnA+seGYXpJ/Thfp3c6maUwY5KGsqMPabG7g
	yWrjFuIfLqY7NwvH/DLoRbmXL785cYNs2kQUr600qPDAxfdKfXb08MVaCBcCamzKnzmOzxHLrDP
	r5k+CQHVvCkSOcIfBHEB/cg44OjhXztOtMeyw4qzCtQCxPhPNUwhBcnzNVo135+eDavbbdzcZK/
	xMinAL8RJxn5CexJz8Sxkpl0i40LV1cAmo1vS0wrDOFvFLAo1vzDCBJ1fqQ+ceeuRJZ9HUTkAdP
	gm95/qZQkyRO1uCludxRehxq672DF952cQi6WYwcmSr+EI8080sSovOkCfhtqc8Am4WWCgQ//5J
	V+W8f9Bil5wnPA=
X-Received: by 2002:a17:907:3f9d:b0:b87:b0ba:5d2d with SMTP id a640c23a62f3a-b97f4b86e27mr250568466b.57.1773847679718;
        Wed, 18 Mar 2026 08:27:59 -0700 (PDT)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3e3sm226989566b.61.2026.03.18.08.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:27:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 18 Mar 2026 15:27:47 +0000
Subject: [PATCH v8 02/10] dt-bindings: power: samsung: add google,gs101-pd
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-gs101-pd-v8-2-241523460b10@linaro.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
In-Reply-To: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

Add support for the Google gs101 version of the Exynos power domains. A
new compatible is needed because register fields have changed and
because power domain operations involve interfacing with the TrustZone
protection control on newer Exynos SoCs.

Power domains can also have a power supply linked to them, so add
optional support for that, too. It is believed that all (existing)
platforms could benefit from this, hence it's not being limited to
gs101-pd.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v5:
- add domain-supply and update commit message

v4:
- add new vendor property samsung,dtzpc
- drop previous tags due to that
---
 .../devicetree/bindings/power/pd-samsung.yaml      | 33 ++++++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
index 9c2c51133457..3f1a2dc17862 100644
--- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
+++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
@@ -13,12 +13,10 @@ description: |+
   Exynos processors include support for multiple power domains which are used
   to gate power to one or more peripherals on the processor.
 
-allOf:
-  - $ref: power-domain.yaml#
-
 properties:
   compatible:
     enum:
+      - google,gs101-pd
       - samsung,exynos4210-pd
       - samsung,exynos5433-pd
 
@@ -33,6 +31,9 @@ properties:
     deprecated: true
     maxItems: 1
 
+  domain-supply:
+    description: domain regulator supply.
+
   label:
     description:
       Human readable string with domain name. Will be visible in userspace
@@ -44,11 +45,28 @@ properties:
   power-domains:
     maxItems: 1
 
+  samsung,dtzpc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Distributed TrustZone Protection Control (DTZPC) node.
+
 required:
   - compatible
   - "#power-domain-cells"
   - reg
 
+allOf:
+  - $ref: power-domain.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: google,gs101-pd
+    then:
+      properties:
+        samsung,dtzpc: false
+
 unevaluatedProperties: false
 
 examples:
@@ -66,3 +84,12 @@ examples:
         #power-domain-cells = <0>;
         label = "MFC";
     };
+
+    power-domain@2080 {
+        compatible = "google,gs101-pd";
+        reg = <0x2080 0x80>;
+        #power-domain-cells = <0>;
+        label = "hsi0";
+        domain-supply = <&ldo7m>;
+        samsung,dtzpc = <&dtzpc_hsi0>;
+    };

-- 
2.53.0.851.ga537e3e6e9-goog

