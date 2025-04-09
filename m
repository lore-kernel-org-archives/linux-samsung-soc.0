Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1306143748
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231055; cv=none; b=hKzX7oH/qACUCnsh8ivRJOWVNSedJdCw3V5qusxjyyH1qbKy9w4t9tQcZNwvW3tN1xCdVu9EHszlZ/6tIaDS7/hFJ3najNc+XnuzKgNVryQAL8G80e3O2ak/nKX91iCysdB+XeGbqOAHOXUFmsjIkiW1T9gaK80lDI2IxrwiM30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231055; c=relaxed/simple;
	bh=oRSZ5ZfkKagzsJyi1Pj0UTKqxcsDGiMKoSYBL2YzZv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IhGnG2WacswmFPlhxO0zJZMz0eMifLtZzTrS64UeZQ9VlK04+5Fe9vnL2hLPV0RiTz4jhfCep9VGHAmGq3xC2YyYrWJ7qSrQcwLcHw2z+Z4hV01wdf3s47QyUhRVzw7X4zs8f1ltX7MY7ia7FE2qViw3kJKF77po+/QGkkClZos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lkI+cqGh; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lkI+cqGh"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso2257178a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231051; x=1744835851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVnUcLf7rUkhmKcblE8DIPr7Qf/4SKbPpJHYfQM91kU=;
        b=lkI+cqGho9Bt5fsCYesRDmr15Rx5N4+v9GsyzCGRqVUO0Y6vQHaJC/6NOzjEq/vWR1
         7e6XoIBEunx107xEgsEK/iYVGAgAxHwvuMY2ocdaHZCBbpHMnApY8w5S3MgOXdjhSNjn
         kzKqnX8U5HJ6cjSbQSIbhk9JZmcezgrK6fSxfWiW9aszYAbvKanIdyszCQn5Qj/L8aBA
         kJTEb6Nf4c/Mpqzqb67qIRmBeedJ2an/0Ij83QTU/zFwvQO1lxj3gPrLq3jPCXC2cnOC
         uSQ7ebjfDEHXPvFf2kR1wdiKbNH1lKhbOZdjLVjLp7YRkP5nWzCI63Iemj2QgbreO3g+
         FOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231051; x=1744835851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVnUcLf7rUkhmKcblE8DIPr7Qf/4SKbPpJHYfQM91kU=;
        b=fcN0Dqg3cr2j0+Yz8jtuS+IlpDrwVYJZ+IEPBfZcNB8SSeljrebG9WCYvV4ErDufBo
         4kad4kHuEdMEch6F13XMO+AHP79tsYrOuT/qZYQpHUMdr4Pic7xXn2cWyoI/vhX36nhO
         NI+QKguXZZwqQz6VZeWBaJc3WUOnCsyfypr5mT9FpZvv7umcGhbGKGZYdw3awQv9Hhsf
         ZueRhqEeLmDcyreb78e8mFjPJpg+3HVcB/jMUKnwflx2m4C1Nw1AOmUGxc1HDapgxbwl
         YbNfw0rEKFY1fOZhoOyaDnzuD/YeBHiAEnSC1mOQlJGBkSfhrXEzvNO3MEUgOTVX0kyU
         aoiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWODnXNOPRCq6jisLUe4Ps9A//uNcvHH5S7eCtwzOgDsGfWMjRUOVkiZQLckf631zEH0fv5pbDOWCMNVuGnkaSvVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSiA0TxZSuQ5C2axoEce6Ja7tSau84xMgjXuA+x/YHI+mMKnXn
	Dcv04M8sfpHpFm8EwjALrgZ5n0RybrlVG5cnElTDPmWQXG35sLx705Qfb0H0NOM=
X-Gm-Gg: ASbGncsOA+tTIqtYhj2b2bPKW0NJBbt4cOGeFoGzHU742tb8W3fkNY9MljXzmAPp9Kl
	8QfNurPXrdGHmnuML/HIBOXS2oxhbpVhIXYHM3tvMShK9uFMSfiDwTNzc4xxWkrzyfMZIbjJ0PO
	X3NtXu22JAkCw+l+GuOuwhFZa9ub8Ww3q/lKpre6g3ilyBkIBzJjedRto63qpq37hkCO5pC2GHG
	Bmcj71VgAYaKfvPYalYce5EZvjoOoAiinsln4fx4tWoszIYWEHPnVNCvGW/bgGNj1Gr2ZaFd3nO
	GVU+k9Z3re9FbHU4nsu9JtZu2aQOtdJO2FQ7TeTRoVtCVOWF7ofRiJzBCjhsJdchTvWtdu6eHS0
	q8xnVYzsiwsohSawoLaP9ORHuRrw=
X-Google-Smtp-Source: AGHT+IEjKjbyVX1trxn6vhWMEq8SjYl6s0uvLlNF7RYWo3JUaldcMy8toq0oDQoK52nrthEFmj8Kqw==
X-Received: by 2002:a17:907:7e8e:b0:ac3:8895:2775 with SMTP id a640c23a62f3a-acabd36b337mr8219466b.13.1744231051032;
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:24 +0100
Subject: [PATCH v4 03/32] dt-bindings: firmware: google,gs101-acpm-ipc: add
 PMIC child node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-3-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

The PMIC is supposed to be a child of ACPM, add it here to describe the
connection.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v3:
- drop '$ref' and 'unevaluatedProperties' from pmic subnode, use
  'additionalProperties' instead (Krzysztof)
- add some regulators to examples since s2mpg10 requires them as of v3
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 2cdad1bbae73bb1795eccf47e1a58e270acd022c..9785aac3b5f34955bbfe2718eec48581d050954f 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -27,6 +27,15 @@ properties:
   mboxes:
     maxItems: 1
 
+  pmic:
+    description: Child node describing the main PMIC.
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: samsung,s2mpg10-pmic
+
   shmem:
     description:
       List of phandle pointing to the shared memory (SHM) area. The memory
@@ -43,8 +52,34 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
     power-management {
         compatible = "google,gs101-acpm-ipc";
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
+
+        pmic {
+            compatible = "samsung,s2mpg10-pmic";
+            interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
+
+            regulators {
+                LDO1 {
+                    regulator-name = "vdd_ldo1";
+                    regulator-min-microvolt = <700000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                };
+
+                // ...
+
+                BUCK1 {
+                    regulator-name = "vdd_mif";
+                    regulator-min-microvolt = <450000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+            };
+        };
     };

-- 
2.49.0.604.gff1f9ca942-goog

