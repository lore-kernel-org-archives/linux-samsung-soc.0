Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D83B332918
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Feb 2026 21:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770327754; cv=none; b=bnDf7NOGGoNgHL00Oje+3fcd+oZZ0gUlUUND4uBqwW/pesRZzeSPUsHmdeoJWTSuaYp7CB5HAlcaieKc1fMliroMMkP1D9AaZnmwat8MYoSl5haUEA0NDirLcUJcA96icfB//eP+d6P1zvjegMbc0c+8SHyPbbapIZooD5Fe8Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770327754; c=relaxed/simple;
	bh=8zHh24Y4fV58aGGijAkWV1Y30FrSoWjyJKGi5X71ITA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mElnZ1Jp+tkiXlwM3P1/oDXtwOEApFGSLv3KI0gmG7dB4lZip1BUwIncphHi56zwLnGXZ/7y4Jk7JrZOsCNnLKHTC+T0LdYqYFe+qDTVEM3HApEaSpw9S7rM5Nh3ExrPtbjUDThLOG+LORloaNNROdnY8OKGSQHx8yBuV0IFBEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uqa5GMcC; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uqa5GMcC"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6594382a264so2929072a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Feb 2026 13:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327753; x=1770932553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82wBgeiecw8diioZs9d1L/8/7KXtnNKqceYMhdMY7vA=;
        b=uqa5GMcC9a9gG6XSFYDOpv/E61h8KL2rFnfGC6gNGNJoodFEojfsY3JjtECewJfJK4
         Ton5rOMwrH0g1fMN7tm6maIrSiWlCxSnq2cyeDvZ5Ye5GNYMntmKfqkhsVZosejsNwdk
         8+SsIzPcbQMClLRkEeV/p3ZCCCKqn/8reaus5C/3R6m0p0KqFIl5i/5bGYLOK7KN7E4D
         cotUcaivP7XekcpUCmMC76wNiIwemtvtoN1PtsdZFov6Ho/7vRHIYGMvdZLNkTm/O/AN
         Z/m2jxOHwjxS+/ghVYdrJuoq/3uJJWi2H4Tn1Shw79TDqCQGT5L8Iy5ZEj4aZctjyIu6
         mhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327753; x=1770932553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=82wBgeiecw8diioZs9d1L/8/7KXtnNKqceYMhdMY7vA=;
        b=l3xm/vKH9Knwy+8otZ5uquLrqcIZ9Z8cjoDa3YBnuqNtPw2yMCz/Ji9k/v+5vLix1e
         3x+99AK9sFaFw0RoW1GD0pvUuSu0zbyV89FeK4L3MkRrUsAMVP3cLvlvNyUvEVNLg4J8
         kEFQdJRsS4Rt+HLa95xDBIp+FWM+to1GzXjbmeoehLmperIiz0eHGUmVFAATl8LKf53R
         Lz3ezsqUJ6qv6MmnmV7ef9X5c27pnhdnrcGazZFYfErZH7VAKnc2v0VqGuJmA8rtak6H
         PjRuI93snP7uambXDKoMp+W9uuNpNt5rdxQbOW6ihuEkK9eEUCGomBQvj1VxghJZ8cQ1
         ur1w==
X-Forwarded-Encrypted: i=1; AJvYcCWVReAsJ17Dmur1J8r+VhIgpscMmsRZDuwv/ncbbStu+0XkDubm+lx01LwhhHSsXJR09MQsKZ3Jjo1FDPbUW73AJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWtoFobCvASjLozSSMhWBh52wRaQ+95/sE8exySoDo0Ulknpa4
	vlAi3FCyRGRWhwiltQG9v4izzLCT0Zodd5HcBmLI0jZvjrGlV9JSJjA3qx4TGzArqiQ=
X-Gm-Gg: AZuq6aKeafPICMMKoGu7U59NKIxl5dBjnraSBf8TpedWMBQCyUbmVbTRsdEw1W5Bdqu
	Egf84W8Z1GBua7iUnqJaeMqOGZjNAF7xGCjIVQhuKDlLoP3A/bfj29wUItal2m/178O/py/bIPz
	NF5r9QlWKT7ZoNwzJV3fANlNLQOF4SJVYE8x5V96vMStSvnpgFu6h8lt1BU0lYKSbFTLR0bgcth
	Hm6FjcccNFmvARdGMaoOHKj1fo0kS5x1GAXqotOxGeGv1iQXQl/ugABgz+PB/KfGiriuqWs0S53
	KN30ZhR/+ce+IexuuvLnRC6xif2RZV/mQYo9IxD1yapNmYjekXnu8HqvgxW/p+UNmtXuoUsQH2T
	utfKXsbWzxOER2ooY259NKHDsgeoKAIFVWPnuJT5mu8dR4kTTVyYEfWj7uFBDxm8hFpZnqIXsw/
	Xw4jPyK/z7NYZ1Eg+CseQSajkYW0DsKp45lHZ18wVcaNjYd/R/CEAlRZesaOHgqx7sHmhcUeMcN
	D56SQ==
X-Received: by 2002:a17:907:3d4b:b0:b88:6542:86a0 with SMTP id a640c23a62f3a-b8edf36813amr26650466b.54.1770327752702;
        Thu, 05 Feb 2026 13:42:32 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:32 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:29 +0000
Subject: [PATCH v5 01/10] dt-bindings: soc: google: add google,gs101-dtzpc
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-1-ede49cdb57a6@linaro.org>
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

The Exynos Distributed TruztZone Protection Control (D_TZPC) provides
an interface to the protection bits that are included in the TrustZone
design in a secure system. It configures each area of the memory as
secure or non-secure.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/soc/google/google,gs101-dtzpc.yaml    | 42 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a8c61ce069d6910c47753bf14a792eb58e6ae182
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/google/google,gs101-dtzpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Distributed TruztZone Protection Control.
+
+description:
+  Distributed TrustZone Protection Control (D_TZPC) provides an interface to the
+  protection bits that are included in the TrustZone design in a secure system.
+  It configures each area of the memory as secure or non-secure.
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+properties:
+  compatible:
+    const: google,gs101-dtzpc
+
+  clocks:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/google,gs101.h>
+
+    dtzpc_hsi0: dtzpc@11010000 {
+      compatible = "google,gs101-dtzpc";
+      reg = <0x11010000 0x10000>;
+      clocks = <&cmu_hsi0 CLK_GOUT_HSI0_D_TZPC_HSI0_PCLK>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 900fc00b73e6d17443f7cee12fa7589b56facaaa..7fc1964b6beaf835a398a9bcee4ded191034d2e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10855,6 +10855,7 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/

-- 
2.53.0.rc2.204.g2597b5adb4-goog

