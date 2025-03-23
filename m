Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0032D1ACED1
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769568; cv=none; b=Ezfp+t8AoCab4vj7fERxmRdU0EKSzKyM6ufeDF3pNgPCp/rZgmylDfY2mMwiUuG87/taouENq+YDUmtaexkfhFLLD23Zqu/c9OOUahVjVGeu1kYCWQrbshpjF13dlPUviZyV/LSM/XGWvSw8ZTgTCeiRK/lfQWLbtUAQyFcOm7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769568; c=relaxed/simple;
	bh=6BfqEn0+AzamtK4yJsWD0fg9sFcnberX6yxt/ti3b7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qmmk61IsiMH/I7A/WpQADkHI/q7AbXYoV8my8HxKbyyv9yt31L6V5yEHI4OBppwfEHF4BF/Rp4NUKWdCiPQW97JKfhMKPFgjlDmnvCrgKtAyzVn9zTx4kuyGeGXqpgj+ekUuH2D0CyRw30lVz0EUPhzaImz+Uyibx/NrbOBXDEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AUILnTg5; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AUILnTg5"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso560742066b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769564; x=1743374364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXb1pE2B5VZK7eIRvGjCX0bwONX10G0/gh8FJgs0P90=;
        b=AUILnTg5pDyMjJktcjQAtmP1cN0YWyqEKXXo2XqFLorxlSzzY4rR4Y+GKYRE4L5Qpr
         YAOgFfFJ8jr/0y3aYyYRjzmlWg1XGmdvjig6nStIcR5K3EEugCpiCrtqpnbYE0xX+VzX
         cU3oJU3EJQ1l1Exx2tOzCS2IIEj5Uu9WypxXStl0JV2h1KbJ9snD3locDm9NdMXCxe+0
         PbdQf1Va1iNNfWpUo9pbv5LDd+AZs+zxuXfOmxyY5xR1GyYgq/7xw6fb+uRaQPbIsO/P
         Ggo4tyrvSmebQcqNHcSyIioe4w0x5AfrbuNtC49MKrZZRu+m5zTeEK+LYZ+baQXqFQRe
         Hq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769564; x=1743374364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXb1pE2B5VZK7eIRvGjCX0bwONX10G0/gh8FJgs0P90=;
        b=oQ7wkx8C6G/vTGXzoHp3HjFGTgWYTB1tXOqXpeSmXBYSovpE9hizrug+RzO75UELXA
         2Vj0ZpYZuvVG+TQUgGNxmFwBmCI513uG/BNcW46x7/Ro+DHzmTdS2d5VG8r+9pyEdwt9
         9SVkA6v5bFOT5bU5x1jB9lB4ORYI4E4sErje5L1zq9HXLRaWkWlYzkY5ucI4xbx1x/wl
         m/l0P4jWCsqfFmp7QSjlCtz7iur4XzOuNL0Qfsk4X8LTZ23boXfqmNwGfKWxhFEgSUzO
         CWwn+jBIzL+VdJPOshzdGgnJzouD5qxzmIDpSIOQzdPcFfoP2e4avc/8c2MSAGdWiYo8
         1ZXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW4ChLJkDu4O5flpj5tq7TJ3bA8fine1JI6Sg4H/05vT9rMzt8xB7CUzQ8WWCcSFqBgby/xiVXm5GdfKXZ4CpRJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5+y+Fg4McOxKppe7IMRWI0zfGvHYf+ASrAmZuw6yp61FJ05qU
	QoYaCMlUDIc/QQxvuy3z/yCgwyD3WCyhAeX2AUckSqdkdMr+dT3HusZcVSRzA5A=
X-Gm-Gg: ASbGncs+N8H9zAllPzrJIiCBHUoU2WiGbOMFkjo8GequffKm+ecvcwCfUNbsijqtj9k
	bXaD/LgNJt+o/uhb1/52nfFDGbkq6aOS6II20IIMR2V/23EdccTFrGD5pbSgwYLM4rBBNWGWpet
	pfvotE4d2TWfkBIG8uKY4Fv5ISGJmLNTr/EydvTM6BYXVsU7vH0lgWWqp3vqE2QqCxlbYEBeMtA
	2b3GPMXXiIoJFUZhRcwI1vwmr6X7B6kuv6QYhRPfSVJfjZgdcDPX1aqXxkcWVZhrmavmxlBh6uf
	694TURKaXW5116D9SJhbYj+If7pV2FjqU6WlJJipA3OzUb6nrPt3jwO0BNhgSA9MPVkE73wovGR
	fjvfH9Xo2UcdyCmFpsu6g6Qx3SHL0
X-Google-Smtp-Source: AGHT+IFEmZ9BlAcg5cpLq9P2zpjpd5ecowSIznI/DDr2rcI73G5OWcR4yuBPI4oD1OUtU38fBId+Ng==
X-Received: by 2002:a17:907:7ba8:b0:ac2:b684:542a with SMTP id a640c23a62f3a-ac3f23df97emr1170613466b.33.1742769564196;
        Sun, 23 Mar 2025 15:39:24 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:23 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:17 +0000
Subject: [PATCH 01/34] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-1-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Samsung S2MPG10 PMIC is similar to the existing PMICs supported by
this binding.

It is a Power Management IC for mobile applications with buck
converters, various LDOs, power meters, RTC, clock outputs, and
additional GPIOs interfaces.

Unlike other Samsung PMICs, communication is not via I2C, but via the
Samsung ACPM firmware, it therefore doesn't need a 'reg' property but a
handle to the ACPM firmware node instead.

S2MPG10 can also act as a system power controller allowing
implementation of a true cold-reset of the system.

Support for the other components will be added in subsequent future
patches.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 34 ++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index ac5d0c149796b6a4034b5d4245bfa8be0433cfab..ae8adb80b3af7ec3722c2a5718ad8fddf0a5df34 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-pmic
       - samsung,s2mps11-pmic
       - samsung,s2mps13-pmic
       - samsung,s2mps14-pmic
@@ -43,6 +44,12 @@ properties:
     description:
       List of child nodes that specify the regulators.
 
+  exynos,acpm-ipc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the ACPM node for when ACPM is used to communicate with the
+      PMIC, rather than I2C.
+
   samsung,s2mps11-acokb-ground:
     description: |
       Indicates that ACOKB pin of S2MPS11 PMIC is connected to the ground so
@@ -58,16 +65,39 @@ properties:
       reset (setting buck voltages to default values).
     type: boolean
 
+  system-power-controller: true
+
   wakeup-source: true
 
 required:
   - compatible
-  - reg
-  - regulators
 
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
+        regulators: false
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+      required:
+        - exynos,acpm-ipc
+
+    else:
+      properties:
+        exynos,acpm-ipc: false
+        system-power-controller: false
+
+      required:
+        - reg
+        - regulators
+
   - if:
       properties:
         compatible:

-- 
2.49.0.395.g12beb8f557-goog

