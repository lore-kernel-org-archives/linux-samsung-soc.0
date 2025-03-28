Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7326021CC4E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168677; cv=none; b=ONb3ZejLYclonSWTRWQEc3DdLjnQPM9PjYgv0rAcImdfONYerJQjGTUxMl3SN7dnlQgNLpwLgZ07R0Cx1GVOmt/JeB/IiCMczcLKLNxiiNE8jS9zZT5Gglzh3Ld6PDWiSepIuOtLps+3UAHu1aT41bVD+VdhBAutoKfDX0p3vwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168677; c=relaxed/simple;
	bh=X0QQTgyZyBPIURJ3v2tympUyOwlqSVYuYyMtIMSpfpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eOE5+bcqfmRuFup7LFuMtgn1HsWcGVHRt0etjE5iF/QcnXH3fxgswdZOOqaZuDF4JQmgsXxA+jWEYgRpTmaYkTu4R9YO0WZqKrwKFWkXkWCLf7pL4Sw6f3/MvlXhDIAs5RY/42i7kKne+8IaEOZcIS8OJXVdAP4t/IULIb3Y5Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=En+/83zz; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="En+/83zz"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso1349585a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168664; x=1743773464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=;
        b=En+/83zz2JnMpQOWtuk2jCDJ+XxaXrWiMelE/N8tSqAWNlQjxSxlMoVEEmE6b33Sfk
         NTdaOnhFa94eLQmjNm0kQX9LkllxVIDbU0jX95dZG3s26gd0JJk0H2UYYfLo62vvjKjf
         fnVNqpK0uxH3NSfbnQYY0Cs0UQD3VnK0PRhGQtW99BP2c0ZYhui+pddKFsu6/BbjMEJ8
         zN5/RQBoIdNDbbIDDtUR2jvqr3ZdbOGfRIpuIAf0rNr3I2aDjSfPDJgoqXvQSULs3eDe
         SHS86+6HeMQPVvrg6x0rJ2IHK5sir5Tjuqxtqg6lIo4mVJXez7M2lduvv1DNech54jG0
         6NOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168664; x=1743773464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=;
        b=wneWNmcYCgtLfuDYF7w4UTYqTHir4u0h4c2SjtuEKX7Gb9q94dv3MBPUhp+rHeL9B2
         OvYQ85FHAaJm+PZuAFmKzlAKfncoosS6rWay6VkCbEi57+t30LmRKE7/jJm+Ka8cieMP
         AmDKkdh1jjdfLDiRPkb4rngRpUPyGnpWNWi4fiP924XxFZMDfY1oHB/O7P5wBsgQFljX
         U3FkhU4ZYQjbvZbyojiMkySEjJNsyExuduPyCiwAq9LlJ0KfKUX4VcHpRyr5CsC2pa2t
         WdDjRtWkfu92dLnX2FKPPABYhc9pWu/R/kbBQPfiE8k4rrNbSEEogyqqVr9dLXiJ+8aZ
         yNjg==
X-Forwarded-Encrypted: i=1; AJvYcCX30JBoZBnMuhAFH4cUO+HsZqQiETVbaBxFPGqTNZT8Qfh/ysLRB3rPVrGHf+QRgJ3rgu8P26E3RePzRFUO3/Au7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzuFkLzXbSsugDYKbdPc9YNZJdiyYscMRLBOQwlFnwxiEUMlsu
	NwflmIbL5CFjJ6i+fXrU2IJtnEoVx5yL9dB2OnSjlbWI5quakF1QgW0euzlfPsc=
X-Gm-Gg: ASbGncunTPd/PYGuHC18GQFmZlyt7fbq6a4dlE1WnONjx0Nj1v2eRU3I0L3PsVcS9WN
	Eyrvo2qcjRDI6/C5pniOl1H9tTzBngV5bCbGS3ISv8oD5nDTwF4phuus0IUZ9jGbmdsCwVmKqpo
	OrAOP5fQZ+hVkNFaa+uoe/g53ad9M4SNKRxYXijurn3UnrB08gtdoO3tWkyaNSaRaNdpPRU7M5Y
	YqfeplzEeGgnS5VF4wgF3QA3mAX/ko4s3OxuyOMRr/HTBb7E/IQya/BAT0KEdfA2PPfuOzecLg+
	V8pnKK4PWFWvyhmtluucWyGHIs6r0827V/KOsISDxRt5r7FGOQgfDSDkq8xJu8+mHo75bK65PCc
	PGhRs9ghEu5It49DpyeCmG+RvtmEN
X-Google-Smtp-Source: AGHT+IH82jsJ04KqxSx2urRuI126Wc6BqmkR0wyKM63ai8QchgotV1y1Ewu8V3BijV087u2FKOXDPg==
X-Received: by 2002:a05:6402:26d0:b0:5e5:c637:b69 with SMTP id 4fb4d7f45d1cf-5ed8df6b334mr7910381a12.6.1743168664240;
        Fri, 28 Mar 2025 06:31:04 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:03 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:06 +0000
Subject: [PATCH v2 20/32] mfd: sec: use sizeof(*var), not sizeof(struct
 type_of_var)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-20-b54dee33fb6b@linaro.org>
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

Using sizeof(*var) is generally preferred over using the size of its
open-coded type when allocating memory.

This helps avoiding bugs when the variable type changes but the memory
allocation isn't updated, and it simplifies renaming of the struct if
ever necessary.

No functional change.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 55edeb0f73ff4643f23b9759b115658d3bf03e9a..e8e35f7d5f06b522a953e8f21603e6904401c983 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -163,7 +163,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	struct sec_pmic_dev *sec_pmic;
 	int ret, num_sec_devs;
 
-	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
+	sec_pmic = devm_kzalloc(dev, sizeof(*sec_pmic), GFP_KERNEL);
 	if (!sec_pmic)
 		return -ENOMEM;
 

-- 
2.49.0.472.ge94155a9ec-goog

