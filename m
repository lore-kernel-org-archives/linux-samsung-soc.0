Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2F4289E0D
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Jun 2025 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222201; cv=none; b=BS+iRmeJtDSrIOhKbhJIuYfshYH9Jv4FmcCBPItZPldLRoJ+DtFGNAfhCLi9uMziA5iJaL/HqVAkB6TqzrPL28zXPBbu4OFnjC6olFlRbRb/0D8F4cCqOJuGXVH43lmNNjnLSSrFzmV51qaslVts6IX4VbORnIiR2z5CISldcd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222201; c=relaxed/simple;
	bh=8YhlHBum+GMkpxcfSNF6Fsr5CtES7Gq7MKq60ULoi6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kXWac2fZSNDgTPpWc2CDOFGgpl3febTL7teG14JlsUm2UvfVEbJQzBPqgVbfDClm3QdukCJlpfm7qMbBUHXtGzpf2LXEHgUbA9gAcEjZIzRodLyqR36wX0j5bTCEsKL4etrHVAZF/+JSYahkWRKpaWdJULdoH6N4/5VCcuazoiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o9ePEAzT; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o9ePEAzT"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ade33027bcfso42851166b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jun 2025 08:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222197; x=1749826997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86/sdIvo6lqhOQlCC6J1qPyFFkh630x60KJMH3jfrKw=;
        b=o9ePEAzT7/z1ZCjcl4w44NvBa55hiT0AUGH78eEXeygoTZaBbbb+ziG5EmJh+2GP/3
         0vhe+3pMmVcaX11kozQLRhBQhHyntljs1yPwHYGXjmWcDxdVgYbNiaS3LjE8bEmQkNp5
         TZH2jjANbcJSJ9dQt++o1kGo0CXHvJhPLG+wVh1bKgw/hkfnfcl4UKQZUijAK2sHwS4C
         PkdAfMytoRKD8SfdwVtTm75/Vzg38GQnnILxMsxpOjZHvFbSSAmQkU8Swkb/zEqNr5Rt
         4v+yxMdbg4k1O06XpiN+Mec8mxhwGu+02Et7BDtWOSqYw0wRwIVYSKedmgFoHLdXCb7T
         ku6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222197; x=1749826997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86/sdIvo6lqhOQlCC6J1qPyFFkh630x60KJMH3jfrKw=;
        b=VLPLc/TfRk3elyW1JZ2OsZDGG2x3UjmbzNyfB1x6F/AU7xrGctiIEsEOEbGiIYHr9H
         qJOjF+oXM/G0OccYKmiuAvcgymioBhhRzL8jacSRJeM3Hezd9wWrj5LCNcJ38nvfYdxi
         BF6ZKhUITp4D9dBd1sfg87ByJhcw1+1W57+0dB+jHniu+J2lUaehjiLy7VITozbaznhA
         PYhKpO8cmhUi4ZPjkZ72RFkyJ+OeI6g5egtQHntl/D2iwC6H/Fj0S5/NsLG3eUSpD4fe
         +/T3vbJA1OiWF7ZV98SkC3Srz2R6GGvaJqx5LZn+ECPMTpLGmSb3V1UfQXs6QJiB+mz9
         y+9g==
X-Forwarded-Encrypted: i=1; AJvYcCVyz+jJ80KjqsyoUrZLIiOL2u0giih6Pr7cn4bQfpD60X5jt1NXks+xNOSTSdsWiD5jJlx9Vu7DgVBW+3V2PyiOYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3oCDNozHWt4JxWyCVRxSu9la1egulR08C/lWAZgfVvxk8x20C
	gFnOPpJkZOHRCcTqPpSML1e7ygLUQZ5P01x+qQ3Lx6ZBPMAfOCPScBaEDqB4oZVPX4Y=
X-Gm-Gg: ASbGnctqIInH1u7gQEECrsfZOXrp37q0fCch0DYgfOXInDPSQ+QVO9vkl/FuoAXCOh4
	LWTZ2uLcEzIlZUzhse6tswE+ZGfw27na1AWDFxmjImfDNLfs/iOT5RtQIB8j7qiVWV92zt0vWU3
	RRUZGgrm3a3JGzpY8K/zOayZNb0tOkXV3cWwEQ2z9axwNYHw0LPd4kZRHrc37k8pWu0S78LHhUo
	cU2zbeyD3NUce8yUErUsfxzxuWvXUjRpCGWltKlDrVP/a3ACaGCXsMUFjhqhJsrjVjwsaHuhOcg
	MYqzFwXZWLHzLsILIaUGaiAOu64KN5y2UMfcyrI5SKpcUvX9+Z5IxEWPmk1Lg97pP/2OetE8PzZ
	mMET3nTJFZbWGNsFPZpT4nzpGQwiMWtZkhIs=
X-Google-Smtp-Source: AGHT+IFqXf9+Um6DWXqgz7nJCFTyJ4x+s9ENYnuEsI/OTxzyyQL/fitGdfmm5vxFgTyc5juu03zvqw==
X-Received: by 2002:a17:907:94c8:b0:ad8:8a46:f156 with SMTP id a640c23a62f3a-ade1a9c825emr352106266b.6.1749222196713;
        Fri, 06 Jun 2025 08:03:16 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:16 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:05 +0100
Subject: [PATCH v2 09/17] regulator: s2mps11: drop two needless variable
 initialisations
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-9-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The initialisations being removed are needless, as both variables are
being assigned values unconditionally further down. Additionally, doing
this eager init here might lead to preventing the compiler from issuing
a warning if a future code change actually forgets to assign a useful
value in some code path.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 04ae9c6150bd5ae9dba47b9b3cfcfb62e4698b6d..1f51fbc6c7b6e158f9707c04d9f030b9eee5e842 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1207,8 +1207,8 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
 	struct regulator_config config = { };
 	struct s2mps11_info *s2mps11;
-	unsigned int rdev_num = 0;
-	int i, ret = 0;
+	unsigned int rdev_num;
+	int i, ret;
 	const struct regulator_desc *regulators;
 
 	s2mps11 = devm_kzalloc(&pdev->dev, sizeof(struct s2mps11_info),

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

