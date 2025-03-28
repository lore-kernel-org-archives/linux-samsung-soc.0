Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F4B19D060
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 13:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168660; cv=none; b=OTAhxvhNMB1pxNRR7NKqedQyG/SMXByN8x5EnfeKbkhl7V/4SUrsdrBotCKulYtf3nhKXQSj/+zwQA0/EDofcVdY7197WIycESb9FtRHU3fyHCyFUj1s3vgO0Xy5kx780eGH00WDJAJ8LswrwSXyvnEpUvcXvXb7bTNSuFnP8tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168660; c=relaxed/simple;
	bh=qCh6oRLfLTgTThIJ6lv+09+QKw9X55onfRfdQJjsxHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rPTByhpfO1l/Q6yagu4KYjkfqmlEALEjOAerj00pVvQAfr//lOp9xhj3w8AZC6QEdSNsxjyvPmSqe2kkNq4wrcJduVUsBewRovMfyRknnHvQJF/hS7C5vm88kfsKuXqbug1q/80CwUlvmnifGiDzx0Py6WzhAxnh2dvxKuAoLwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IUsUDsty; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IUsUDsty"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac29fd22163so372143566b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168655; x=1743773455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1w11rlVw/TNBQvhMqe/HobIw1/0AFB8/Oe+GpWOJoY=;
        b=IUsUDsty209X8KDYmlOHZZUCwwfH3dNQZN6IEd8gF0m+DviV3e0ysaK43kubxQ+4iu
         yP2d3C5+5d/f1X1oIWNwHxlEew9DaKhyJFQi6y5Y/M6YIVEyvYoLtZezW6H7DmlhZk72
         Ih5D3imEE1lSKmtAG9UBX3DbnApu1w/3nLb51YLY3iQnja4Nh+6g4bkzia1nET8C2E3O
         t9/IC5yPqM3vDw3BiPO8qkuOuxWn6C9oV2OpZ6woFpcAzUnLgHMKCSpZpU/9FsvvouZt
         33ACMOHxhBGHr/MQZqLPEJtOImI2V53474tN0AhzQ+7CtbIcZFHFZGO6BwDEUl8fxV1w
         T00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168655; x=1743773455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1w11rlVw/TNBQvhMqe/HobIw1/0AFB8/Oe+GpWOJoY=;
        b=p2di+niOfvq8Y8fcgUzpnCnKwylFIM02MFDoPHCqQtti/a4ZvwYKgBn5FLB5LXysoL
         NbvsfBsVztQyc/v9dPxjiJKsyr1lf126TymnzxQoHduNM4jw5bRyx6RcVvQdM+3BtEKA
         ZgHSCFZk1zMurbbPuLcSKAujrYyXeX5UOuKU16ObhBTsYSimddRWWpaVrvzAhaQdm6Fv
         fav/eKiKNy9MLt5hbaj+ziW1FSYVK+xq7iaEAhsrXELvZAWZPLIMRVacNGOScrNhAw5X
         Uu5IvrhYYzpN38QyipnKxMENycZS0XoY76no4e8iusx4pJRCkSURbU0YhsGd3PUBldkv
         kmfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWu7iiel8VYIHNO2sizbGpEzYbBlMBveKpLk8jTAto+L/LDZFS7rhvMOJlod8rQeWjw/AYsknNZSN2EZRreHYVQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcpxe702+6oDIV7+D5OkvNzqkKEVwORpg1Eq2FIF05FrUvaeOo
	kt+aGpdPMXtPT/G6Hz2XkV3znM55FF01w+d8tkEndL3D01toTSN9OdwEmsnZqps=
X-Gm-Gg: ASbGncu4LPRo1DmSKUJ2IuSs/efcWJ3EerHq1SClYfNtzcfBHfpK4LTgFLjvlWecojD
	RWOFPXDLJ5NdmQSRlpjlBWj6ZQKDGduE4TH1rU3YYhoriLo0kLEY+WLIy4FpXtGF8lAlemcsEJb
	z9UXsvyBnCQvnNo9B+xu8ImZVIRg8Kai8VgC9tHde2boEH2fbdGHzAlycsF6Xhh2kCNGKiS3LHw
	8WPG6xJAGCl0GuZiYO6x3nVTq6QsqiWJv0Wp6yV7PPOl9T13MjDJamaYZTBH3stlRD0QOgW4qi6
	wtKv0xTinVfTif4THuaNgzDmpy1mEj4WC5GTZCmLB+heYPzmTh1DSymw8F00/WgE/8yhMBs4nya
	UbmnqkWSuAlRe8Q62pWgxWZgz6hYI
X-Google-Smtp-Source: AGHT+IEq06ryYPSRFnijp9zBT7TVwvuxmad5wvipQF5Or+uJmUZMEkHYbtpAEod3NTnJDeU/8eOeEA==
X-Received: by 2002:a17:907:7b99:b0:ac2:7ec8:c31d with SMTP id a640c23a62f3a-ac6faea0f0amr608739366b.17.1743168654961;
        Fri, 28 Mar 2025 06:30:54 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:54 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:49 +0000
Subject: [PATCH v2 03/32] dt-bindings: firmware: google,gs101-acpm-ipc: add
 PMIC child node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-3-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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

The PMIC is supposed to be a child of ACPM, add it here to describe the
connection.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 2cdad1bbae73bb1795eccf47e1a58e270acd022c..5524f2af5bda2d29b5113f8fe14ece7f02366a60 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -27,6 +27,16 @@ properties:
   mboxes:
     maxItems: 1
 
+  pmic:
+    description: Child node describing the main PMIC.
+    type: object
+    $ref: /schemas/mfd/samsung,s2mps11.yaml
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: samsung,s2mpg10-pmic
+
   shmem:
     description:
       List of phandle pointing to the shared memory (SHM) area. The memory
@@ -43,8 +53,15 @@ additionalProperties: false
 
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
+        };
     };

-- 
2.49.0.472.ge94155a9ec-goog

