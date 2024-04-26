Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C7A146A98
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714137054; cv=none; b=qfI4bYO3sV/j8LSsI+H8sG7fIGWp4YPl8/T6V1m3aXLYuDQOixM7A15PLje8xviWDDbOc4cLx+4ubkvyOzHiISn8dQ2oP6YDTeq7YHfHD2KYSTPb6xcwviAq1uX/0I8IY8Yyr1M4GbxqgiVqk/oBbk/9GTL4tSOvqNEDTgqmjXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714137054; c=relaxed/simple;
	bh=qjiLRzQ/LzL957Tztom+GeWOX7MmZNPVIPPVkVPDhT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W3+BZcwGKEYmIyWFowco/zMVmZUmC03Nmaey6QjC775d9LL0omcsyJHXyNR/pfc8zQBKCjHoMQQimKd9iXGrtTESxL1Jr2N9ariqKuqOauyP1nyuSkhwp1LZ75aHby9H7HZmbZcjOgE+IEmd0/Ff+mG5fG2SqUeLhGtKeDJZnxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PbG64VZD; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PbG64VZD"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a4702457ccbso290521766b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 06:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714137050; x=1714741850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyR9vWPsqsAUgpTsJMpV9yCJydAsWbKkcw3s9RwSvbs=;
        b=PbG64VZDwv6t0cG8cCOqgFc9OvK6Apl84w+cbx68SUJ1r1dE2GZyAqQn6U9rTE1Wd4
         sGCDuugL90/Hnxth7RTyVmnJK245OiVpvxCDrbMWJNS2iNJna/dRjUhrWlAkrVBahIyg
         lVlS5JCwzBAWTurfxEjG6TUqc6pt1meE8i6XeMqJObgqiCHMW+tpf6VPMq08T6s9k2F6
         XFMe7kweiOo7xMJ+tGqBXelhHDAhJYkjIp/7bgqLaMdArCX8vJS1yCkU0P9mtWyxj3HS
         zCb6u8TASk5puWwmz84kfWU5osv02uDdlLxVqH1EDfu60eodFn43kVJbmetonDRd2Hw4
         Tatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714137050; x=1714741850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyR9vWPsqsAUgpTsJMpV9yCJydAsWbKkcw3s9RwSvbs=;
        b=IRRruexQdhyXSC+IOY/c+Hme2I0MNUQektFt2zTLacbWuxGm/3Bd5rxpcttTmZniHA
         EEA3gpOzeg/fVtJZFkD0iu7eTicIz6vw3/GG8We5SMSzlVC2a2pjVbMTTmXdvP1O0/e/
         kdmUBaYrF6vIuI8iJayfzS7v7GBjlQSIhOjQqB0HOPaQxSrStqbaX1jU1SoIUyWXtq7D
         lJVcuYDyOgzDCBg00xnx+nyQa9ebBXDBvlAbnArM8abCtXYr8hJgrHDiNL8T+xStxAXW
         T18b5MLD+ld3iy01gm3Md0oES5g5KBW2svGJ98aTXR8Gsqmcnj6bOLogEd6SIHD9wWtu
         YuWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwjny37HhxO99H1klHIdXrdWPawCA5QGBzaETIrtrqfOYkBQPG+tE5QI01nyzoBypl5E7vZGFqLUDkgroUg1jiIR0GxAbLOXm20u4prcbvGt4=
X-Gm-Message-State: AOJu0Yy+tRcKvU/CjQj9GREhIugnV5fVrFi6ZncVGsNGezIGDZLD8ibQ
	aIffKwuyCOXjR9i/zlES518oSaj/pd1VUHJIC65nVInag8dfbLTAhGxmm0tcMHg=
X-Google-Smtp-Source: AGHT+IGSGholbRCB3xXRiKBdGHoIKLecb79/UgfewA7TWa6VNEesp01r2lLxHu5AHKlfCKAu7HlkxQ==
X-Received: by 2002:a17:906:305b:b0:a58:a4bc:575d with SMTP id d27-20020a170906305b00b00a58a4bc575dmr1819263ejd.40.1714137049990;
        Fri, 26 Apr 2024 06:10:49 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id u18-20020a170906c41200b00a58bec2ae2bsm1396948ejz.39.2024.04.26.06.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 06:10:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 26 Apr 2024 14:10:46 +0100
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: samsung: google,gs101-pinctrl
 needs a clock
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240426-samsung-pinctrl-busclock-v2-1-8dfecaabf020@linaro.org>
References: <20240426-samsung-pinctrl-busclock-v2-0-8dfecaabf020@linaro.org>
In-Reply-To: <20240426-samsung-pinctrl-busclock-v2-0-8dfecaabf020@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com, 
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

