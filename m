Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB92332EB9
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Feb 2026 21:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770327755; cv=none; b=kxJUjqMXtVfanPDnUohDRxzcbYiUTsENBNNE5Up3X/ZLDMmvC/HOqhidjN/ezjkVzfBsFKOMEwJ/C4cFJ2oBAAEuQj89q67RFqvURV1I6U1VVaW88UEbpgxAyhrf91UNUqGixITvMDsKEZKx2k86kXN2jiLE7Jtk9Pzv8982vWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770327755; c=relaxed/simple;
	bh=14I3r1tdw1ZjyVaMsKvMhSGXbGc6Q0pH7IHH7aoW3S0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EmOypX79rQcpMz814DApS8gGqBL8d8jHmOz+GGPlw7C2+T0t7KUFj7BR6JVPEcqLVboHrkyKCTK55T3gy0am+rtPTWVCVgLOfmsI4ZBizNyMAw0Q42LxOKMrYuDRLEpLBIan4/Wrz4A7P/8bOdpc2z02GL/ZYwwjdj42POoqic8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WCUQenpn; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WCUQenpn"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8871718b00so2396766b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Feb 2026 13:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327753; x=1770932553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykCzK4+rV2dgKa7+qS2lLnqsh4ES+AwZxLAa8QRXGOg=;
        b=WCUQenpnajmwHxJmSC1eGTdTBCdI5EPpBRyqWPLNBtm6y7ytG6WhMDbm6GIWt2AdCF
         Thh5bp00Daj9jpoBfbXvYDEPXPpL4drAXT42PRd9r8fwS+FmjibC2jPqJRe05dp7hjse
         CvVliim8JCwD4WthHhZpsUgQNHzdYf5RvlWvvuGqcvWyivW3AvkcHleNht49RssyMrRS
         PDqKvM+9v9aDnI3RxaygFdmXoedpm3lvoKQG8VBC8dTawK8RTvCz0yjDgCApvgouvKS7
         vPljMAGs9rpcYanonjZhJbI3zRRLOHGBPPVHsnXaUCq3kx5Es28uPQcq4+g2cU2mw6Jm
         Angw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327753; x=1770932553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ykCzK4+rV2dgKa7+qS2lLnqsh4ES+AwZxLAa8QRXGOg=;
        b=PjboZiQ4LQb1sLBzZ3C2vypDUI6IBui2cBIcDLW1u2+VbVncZ2Tvn2qxmaqpwEH58R
         7Ro04l1/Q0eFpemafL21onD8odp7ISV76wDuW0ZPW8m4IkEA4KMJ187ESbp/he6i8FGO
         PcDixQAdfZW2roz+bRAhN0dlCZzjxrT6M64cuNyYcPEJ+xGZPISnZwgBQchXPR6jiRDu
         4E9cvH8asyS7CSK7sPwgK3vPD0OCjizn6rX+KxVDohS7pORzMb1zcZ9Id/U7eRHxl7SW
         Wdu2uBVfaXSTLq8UJWmxCmovpIwt07fn3SuZNZ2+LOX1ITa7befhSC2gmLyL2RqSpLeS
         GaZg==
X-Forwarded-Encrypted: i=1; AJvYcCXIUKbElk7a8X3Y39oshpLnSq2FJv6gRdUFgohk8QF7jepQmfyayqg14MYBP0HOURvJDyTTYJnqe+RAtAoxQotf/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzodxKKwVgUwI70zelgb1WWM04/mZTcAA705VFD40IgQSoArog9
	WypwoA8qLH7Sd3aMIPT7Ey//NnxVMAc7QD4WgqmU5HqzCZweIg/eLL47n2uK18GjMVk=
X-Gm-Gg: AZuq6aLm7ie9IHRKVePfB2DdGOxDUQgB8kCsBMyBooV+U0PU2k70QyxXJqUZxFgYwNf
	na5w2891MHDO1xs0ed6D4gScX+S87CSfVaIImFVymqpjbNR7Wc9zbCzUs1NTXeG31mvYayFUn7u
	ufZNh4J28Vynao/QnDJhJo2HFsV3JmmSWh93XeHm1pJjoBX25nTQIEnNy+4+Og9ftOmnmymXQlI
	1zIYGbLrqPqfLjGnTfevSCHHtLFHLS53vmO8C8OXvL2kd7o4kdH4Q79Sz6iPNoftfWMdRvzbdcl
	xtyP2nq5cIfpLQnp3aAdX7aQAe4jOJWrn7LCLYA+Eq20oiJI87AwCE2BOhQM4nb/Fa1bMNagLvq
	/HQksDnaBLFiIb36y/MK7kEBPkPPhFAhR7gMiMEG2JwlF6GlwMfBbvEY0t1lmujeq1Udr2x0SEM
	gBihCQGf57R4tqF/tvzlmgKM5NwQ3OpdLyXJUa2ppc86izXhIbhYMhAl6cOnpyaQTriSOKm6SrY
	LIDEg==
X-Received: by 2002:a17:907:ea7:b0:b8d:be69:78bf with SMTP id a640c23a62f3a-b8edf19e91fmr26932766b.20.1770327753301;
        Thu, 05 Feb 2026 13:42:33 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:32 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:30 +0000
Subject: [PATCH v5 02/10] dt-bindings: power: samsung: add google,gs101-pd
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-2-ede49cdb57a6@linaro.org>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
In-Reply-To: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
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
X-Mailer: b4 0.14.2

Add support for the Google gs101 version of the Exynos power domains. A
new compatible is needed because register fields have changed and
because power domain operations involve interfacing with the TrustZone
protection control on newer Exynos SoCs.

Power domains can also have a power supply linked to them, so add
optional support for that, too. It is believed that all (existing)
platforms could benefit from this, hence it's not being limited to
gs101-pd.

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
index 9c2c51133457112ca0098c043e123f0a02fa1291..3f1a2dc178625f8cfdbb913d0c7cb5b2519fe477 100644
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
2.53.0.rc2.204.g2597b5adb4-goog

