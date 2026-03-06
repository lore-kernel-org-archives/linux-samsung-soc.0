Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAAB37C91E
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 10:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792999; cv=none; b=MqZ0pKmBYLfSVajHe4eC9R9C4DjEo25MPV+Ap/U9sVV5bWlTjGf+BpCAqJxjR4x9J6ugESyxkdvJ1XbLzTsI2sRA7v9VvKq0gEx64KoumgJ07if+Et6gnGw/Pvd1Mq6PND1+KlNJb/r/sIDnUzK0iCZEKN32BmYtL28a4KThCoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792999; c=relaxed/simple;
	bh=iALQKe1s8XYCZQRBPu9whaNUYAS1mnLDVYkgTcpyPr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=md0gW9+gSNQ9sHzAMPjIfgKOm7Bspi+X5L1PsgaGe+g46mNajAWSXV+pm/xQ9ivWo0JovIVNb5MR+4yh/U5qgg9vfHV5/V8QwTlLe+8GNSgWfozhOd+BK/AGXU1NnkwiTh3GNgh652KHsgZVvz4c4YrlbRj/D5Zo3esEd1RD0Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f1LOJGs5; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f1LOJGs5"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b936b85cc71so1141952666b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 02:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772792996; x=1773397796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FUcP5CBZJQtkRrAcWORzv320QMtIf9elaWuqQIxzig=;
        b=f1LOJGs5pWlcY+l4VxBI8Y0dKRfKoW7du+4GwEHr6qT7q8+ZqsvivPWlvLv3tD78A8
         VtZAI7AWRpbV14e98AOmNugaqRV8ol5CA6ra2pZAxZ4Jdc8Hb1SBeHOgRoGT1ZAVBYdo
         8GSaJ0euTsPJzOeXLL0I/Ur6bJvrggtybohvjWp/Lb0kGFXUV7m6rsa1MmFVuGaDwIMJ
         UlEtzVSClyeAroG6Rfxd3Gue6xG3P2KYDKdBZH3i6OWuOPoBpMk14WP/+nYYb2TQLfAg
         r0QsRzk43SfRjl45DP+iPiMgJpkfgV39VgasEqkuCE4MEU7Evo/mGAjFAPtUrYKt1qvs
         rF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792996; x=1773397796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3FUcP5CBZJQtkRrAcWORzv320QMtIf9elaWuqQIxzig=;
        b=MVQzXTGb8aubvJ/Tbv0SC8tyPdyFI274MYYw0iZkyVkGf9kxqBzxx3PPbLvjKV7FSP
         1tZAPrZDEumvSshsZLDYgs4P7edoIAAWazDooT/2ZoLh8PMQuHbVtC1IhXWuBL5yTxxb
         5N0+/jjnPun06G+oFFizi4O0XNxiHO07BLDsWP17GatUHg8lNBUZPxBV1rp9lJZt2KOc
         Vb6INecyIk+NdQR+7CdSHtApYpvJdpBpNErgkX8foC/6AIsF+gbUaiFfbSyxSomWc7F/
         nTcys6QvkZmYpT3v6W4/Y2SXc+XraJtOWeKjdomDWQuhw7pc9zX8TbUmbmfi7rQRDg+s
         BSXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrFE5c3E77pMTdQbqta8qgaUAHBQzLnFqC42Thh2dEJ99Kl2+9A2z4nUuPu13pcCFF0PFgl0+in/RbvStGJCwqTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIGGM2c8zU4jYFxKGT10ekywStHYxNQKFd5bqtlp4tvRlG+Vhn
	dy5wit85FzjEPOU3mwQ3yhPNxBn3BhMFxP3OimS3GvxzTSMpx3OuR99dcWnrYQ+PsYtwhk5Nbm3
	vsFykRfdfVg==
X-Gm-Gg: ATEYQzw/nqOBEUKO2gZGng2f9F8DQeTtMzrjMeJa0mtMXkDeip3qVnNBiRQMmHxbGxU
	F2ia7mNUUbXuLzC1j9W8HMraNpMEm6JpSW+3ZWAU18A5DhGpUuCslMXK21goTUJomamX1WMq7Da
	9BLKwB7Io7DIAotYRf2ermER5ElFTMujaLvw9jVj5s8KDhndUIvy5P2ZeKiQLNn5hVerQyrye5H
	8avnoILw5rGAuqRsEKN9DKJKkwF98iJJ+PN9SO47FIyCyEKzoWQW8YVKtxHE+qiF3vtwNFNkV+3
	IdffwAkJDb/2Cn+FlNpBl6Mqw2eMlndjPuM7OFb8kSjvpDo3G4KLyZ+M5bd+1hnyl/CBcH37064
	/WsawKmvarL73UJ3jSMzUiM4lBsEMm0VAV+NkTBNKCa1VVECNWbNKzDOwvYdndK03cWJpvz97Zi
	O/JzR/8Digh+PE3PrO1yQ/BgoAtOXgmJSaXe1U755+gvD0StNmpwU+Epp4S1YPY9Petci0gUttJ
	UbD9PgVcszA5yM=
X-Received: by 2002:a17:907:f816:b0:b83:b7c5:de2c with SMTP id a640c23a62f3a-b942dbcd35dmr93807866b.10.1772792995758;
        Fri, 06 Mar 2026 02:29:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:29:55 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Mar 2026 10:29:53 +0000
Subject: [PATCH v7 02/10] dt-bindings: power: samsung: add google,gs101-pd
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-gs101-pd-v7-2-03f7c7965ba5@linaro.org>
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
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
2.53.0.473.g4a7958ca14-goog

