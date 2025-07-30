Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637072701BB
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2025 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753867915; cv=none; b=bI5S9ZrmjyvoaG07KJahrAU3TSaVugN9u1O9ZekRjKvE4Cb1vz98jouuHmH0HhsE21l+DA3dtM+q8JWaJqP88vHQCfcfXfQgX4jzcxuNXVV+YgvVH24rVPCs22ZBbYofrzVNoH3oDsJltwb7Gx/uQ/5UiZyuq4ZlXgR2v1CyFT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753867915; c=relaxed/simple;
	bh=z0sV7SsJGuqFTYd+996vC08KW4HD/oyOt5IUehYunPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZ6t61r44m3ArgCuKrVGPG+OTzeRts/udXUx/4cMBbkLMYnQDHgugnLBXTHlRTprlgGDGAjdAMMtFRSbXgdJRoUm/ws4MJX0hO7zo03H4/iriZEsuSI7/73cKlyUs/20qsQBM3/i6HBTzvJWq4hyLPBzjKfKFCx2qWIRp9q1w0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jRoZoA1X; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jRoZoA1X"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so10526859a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2025 02:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753867910; x=1754472710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGjRMX4G/COI/IQf9/y2Lgcl/FQUEBYc+9lDliHqOG8=;
        b=jRoZoA1XKBRFDe+qdAVZjLUGo18CsWEeKrteg4OlGq5ZIrJIDCT5cPd/YXQaGK9S6j
         kmpdVMVY/y+wH230Zuvb7S4UlZaPkVheCTPpeQZesCrMwfwaGjshtlvwnDQ5zzdfQxKY
         odLg5WZTEQ0+/SDOZ6aGo7yil4Q+yl0PLprCgFgSRWPkHWD+82BklO+6ScMXcWkMGbI6
         3PSuOJeGoIeepz4r+0GUOrA2hwgeE2NOqCISk/S62Pob9SM9lLkGEpiJxCG8OAtnbMUD
         jWpLZtCygBJcahy9lgnufhScAtaOAKtoOcf+Fxa0l9WazCJqkBuVqq5TsFU4xdRqpe1j
         yugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753867910; x=1754472710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGjRMX4G/COI/IQf9/y2Lgcl/FQUEBYc+9lDliHqOG8=;
        b=JC7/ApDvpDpYBjxun38oUIoL5waYc1miR1ifZcSN7Tvqv9RR3ADUiSxbgG2jisSQz2
         zW0iQ53DsSr15MdvKvh/TfRB/SkQ1sA+3bHc6uB8123SGVUNCEfNvzZWln/IHzY6x6aW
         n07Qc/K5rBVg1PlgZp3H0k7x8Xe8isB6TBPbAdvFSG5x8tjp52/ehkTxGCQKBP+4Iydl
         Ob1TcNi5gl2aAScsl1mhJMXsQBg9JqKJzZn1WKOFyyBu9dbeyYUrbshFpvGrpq1yCEWP
         LSM3JQFYAEsFqFII0SHXcEJ1IVcnBg+gqfjNegnxLXkm9n+jnxBLUI4RNUaxFeTLfErI
         maQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUssAx4zk7I0/8J9BpHfe+i20whRPGuhXTzkg08bGhNBsNGZiyJ3UJBIr/q/Zeuqq3w6mv0uxsvEG11f93I2KliYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbWuN+I6QAFy2498JJvyk9nE5Em9c9GpND0qOm4OhVO1eo+yGP
	03JHkX8g3OQ+nhVf1vIL4dqFIj0RgKDqhUHxSxW/GFZlRWrzaVsFgdkORBcg/4204Zw=
X-Gm-Gg: ASbGncu+7ZS89NWCm/4v7YZFyx00OhclOX3CYsNIEFjXLXacXk++0JgEXgjEIwz6tb1
	DB5He7BG2deei8qcocpZ4KjMCnJaEFmTnvKQ45K4DsXvrpOnsVC4R/vXKvF50XGFshmSzp45kgA
	zkbOeVjheMTKFWVA2KpqMMs2tjzEhxGR8pedXMhdkYjUJAtt45Gl5r6XFsG7N6T/CNdSxMKeP9f
	DuUOQ7pJBnzKuznaninVMy16pNWOS5cXqjsBo41BdJHj3ByZVs8hb6mGkJrpvZbd5W6a1hRYxOm
	cEdDaadM5NkrgT4rXICT6zGs5QARtFGKWRDXAvVxe5+j1hplsFdeBMnSWPPdiXFLG2S84+R7HUf
	UBXh5X/zcCBbNWJ4EjDFWHHbnn3sVp4C5dQAihYB3sLZXzOi+yquFZVonn1jfOQjB8yPAhcxqg3
	N0r0Y0yg==
X-Google-Smtp-Source: AGHT+IEUMxf3gSpGjkAUfDfzDG2wfz30DekTf/PJZewF4AZbZS4xARY+7EQX+t4IEFMHZ+3vt+QMSg==
X-Received: by 2002:a05:6402:40c5:b0:615:9b4e:7b81 with SMTP id 4fb4d7f45d1cf-6159b4e7f50mr683882a12.7.1753867910401;
        Wed, 30 Jul 2025 02:31:50 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61536916dbasm4090424a12.43.2025.07.30.02.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 02:31:50 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 30 Jul 2025 10:31:34 +0100
Subject: [PATCH v5 1/2] dt-bindings: clock: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250730-s2mpg10-v5-1-cd133963626c@linaro.org>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
In-Reply-To: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
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

The Samsung S2MPG10 clock controller is similar to the existing clock
controllers supported by this binding. Register offsets / layout are
slightly different, so it needs its own compatible.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e6053a1881650b8e8ff2524ea01689b7395..91d455155a606a60ed2006e57709466ae8d72664 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-clk
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk

-- 
2.50.1.552.g942d659e1b-goog

