Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393E01E1DFC
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 16:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616659; cv=none; b=IT8/KKg6YwyW6ZPQkWmDkxCXtQYvx64fjg5x/Y0sg2hQbB3nVuXFi/GAaPkoSPsV5PbPeWFemYuAPaG8Dkm4XY2aYI5qGM+DWMqFHFKid0vnt9KzxB3WE+NSCs2v3fIVPfcVqZf8oLFlKmTkvJ51GdnOkB0mN1TCNRRIwdIYhfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616659; c=relaxed/simple;
	bh=MsoVcEJe0MhQwSs/kIxrngmiJYPnulx6/TKC80irjeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lu/kykHqZMeF2BpCpwxTvNkMM8RvfNH+cO9/NkR7hvsxwjggnwrMo3uZjrcqhlkZxofSn5OdkasOvAtuZ1AuNecQyuRlUyEKc88LaWl2LJ7u/kYxAMx4whrPrrhXnJJtW7YQV0gSDrpjpx8hyMzTZ9m+DXLybBJcbsxUNbvkCOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tq8UqCiS; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tq8UqCiS"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b88593aa4dcso779697466b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 08:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616654; x=1770221454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1M488vXqKcrQj+Jd5yyT2ZpNnjcHsZKW7NNZqOuyYk=;
        b=Tq8UqCiSTkL6ZHa17gsf4E1qldJ32PNfHq/rgklwJ57hWzw0h4dnkpU0ysfBYjPKCJ
         xTg6C8GAemty4yI5SVfQ64UTVU/a/33xwtdOrUvforkezEkgC/53WjNkJkdfuMEjbKxe
         MEqc0k4I0+7ypvkqQiL4KW08LgeBEfgK+F15IB7z8wNqbq/Dm3/TvMZChsaov7IEMkNl
         lYFOrgIVlyaLDzaxF3KaH9lT7O9IDZFakRLPNXkW3vhnxAUeV42sblFeZQq78LcB+o0x
         RUdaFitBsp827GANNJqn+CAjuFhrNeK6mRJc9eyFVYBPbx94sdsigs/ZBLPbL+oEfiyO
         n+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616654; x=1770221454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c1M488vXqKcrQj+Jd5yyT2ZpNnjcHsZKW7NNZqOuyYk=;
        b=MDOYIka1XRHzTl6oUZH34DgTtR83LsFHV0pPa5Xm829rbBKUMf4pfzjGM1vvmkuuFD
         CblgFQVzd+1dOnUMIvIgKOwY4FL1Jb/HzvrhU04yNPhhrPAOPHZDv1A/hmMu6wp3EdAm
         aSJw+4GaTMtVGlPjjPm4Bvc0QTl+d0CMbP7YucpafHgW2Di3t+c1JKAxcaYI50U0iPp6
         NEFc9x89wT9Xiia65ekwR27R9tk05Wzm1E6tzv4EEExWOGLyCelR0blrQoogdag17Jv9
         HRuFuvAJ406TEpRMLa3MNlzxBzAhrsBcz71oxYBAa5MyL9zpN4GEHOj+RN3bmY6EB+m1
         1Haw==
X-Forwarded-Encrypted: i=1; AJvYcCUw7eH3vg0wKtEchJYfljJfkYutlFRHy4gfbRl5a7lBMuroi/YlWeE0aEK87NNDKvMlkIx6/OP1YnMLE68XD8Tldg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuQ+WBxhSWQJB80GIUvIufKheV/pvPT8vwfdpCO788SjW0E+H5
	P2jM9rR0M4SjR5aoFCXZ3fzszS09Tc3MBnOmPPaN7hIeRWMluw5WHXwq5dyrCAnUEHg=
X-Gm-Gg: AZuq6aLmYC/vxLyeKwBpn+PSv+wkK0uk3jwyZIEFMA0+LnMCDVyeNi6CnZo5UzjCQX1
	IyV/g4Y2l280Cpc3QlPbWYnqe61OG4RhsFGMTw31lBTSGn7qkRkFvG5QeQKH1vVzeoKagFiBwgi
	FzaKIhErsvcvMSZnf4ElQA0iP9V0L63h2IZUzF9yVEh47wW/Hz/fKl9AKc19e21POM2Fuj2LVYn
	HilOCbc1pPTbE+d5iPUlDsXG7/P232nV9JP3PEJNXbEg2mnKeAfZLUNkEyJYxDl7zoOC87NnAry
	qHu7x3zFQMwAndQsLAYAFtqvEecP2F6EO121iGhkkHJMAJSnY6j0jvH0yGfCT6yXF76hEIfbzMN
	ZO9GFRwYIajpbINrBe91Swk5P/K/60oB+hYegGbP7yi8BsA9tFDdCbOUxMTLr7HpYMXm87RvUUO
	S7vGxEI66W+dejn09v6R2rTrPAOT3wg4DoutMC11Z4/aScrl75aIX1LxW/AMpxSU85l+CC7/qW7
	fivwQ==
X-Received: by 2002:a17:907:7f8f:b0:b8a:fae9:5c60 with SMTP id a640c23a62f3a-b8dab3aa7a1mr404537966b.51.1769616653505;
        Wed, 28 Jan 2026 08:10:53 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:53 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:50 +0000
Subject: [PATCH v4 01/10] dt-bindings: soc: google: add google,gs101-dtzpc
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-1-cbe7bd5a4060@linaro.org>
References: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
In-Reply-To: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
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
index a56f8f00aebb938aa765a8a6d66dfeb7f062dac8..98b2ef47c809ac0232e6941c9483b19d7c798bb4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10833,6 +10833,7 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/

-- 
2.52.0.457.g6b5491de43-goog

