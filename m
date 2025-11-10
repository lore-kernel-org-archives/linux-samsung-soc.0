Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B5B337B90
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 19:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802949; cv=none; b=gDiqv6/WZOjjG0BIYhBCu7qS/icjQuHDZlUXRTOSg3C46lQFm9b+ScUBMYq8oFP3lzMUy8AGpXAPn8K1ZaNGYvtvXtjkvbWdOqRjwmcKNMjzZK4MXfeR4yK1s1xC5Emy3KhZ+sA5XLTsHa1uIo70kAoOoKKN9xqtC8ICESIbk7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802949; c=relaxed/simple;
	bh=yoWFkHZtj46uF0EW4nm1cAv2iisUO6p8mkGLUTNAWgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RXAKAVjJE0ZsesHHy3aIFRZInuM1JWJkIGEn7PgF8Dm3SoukXSsp9vtU808fqkcUgqebBaLVURCEIW15XPfO9f0ElFCzOhoXKAQOupaFq0iFUa0xl4yy0dznz2xaFUYhWrPPXdvKfS4FRCrA4bVIim4tUfSvjzkjeNuC8DNxQSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=itFrFogV; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="itFrFogV"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b403bb7843eso619653766b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 11:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802944; x=1763407744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeUUtxVE/l6U3rYNomhig7G5mdbpyNRzMIJHR6C88h0=;
        b=itFrFogV/KrC/in+avJirWHOwVJ+Q5l3iUoUyFof7/SfYtLzSplG4s/BFB/X4nxpuD
         hyLzMjRt1/Z/yyxWwk4kjdsRcCEZQFCC6na3bNaM6kfagFMh7Y64kEVs6h0NeV9VlHuq
         y/cjje4pn+yrTBZCAU4L3/Xx4poJvJZIfSr3bd4yzwrQ48wzv4kWKaSZ3J4/zJnvWfsE
         8rruJejsT/3yrCu9ztIxDdWaireLL9yUcTFOLgcPGzimVZcJ0K2t/2yCpAziOPj9WNST
         b0EJPpSyTm58nw9N3QuEY0TunEFAOHoutGb0XupnpNrx/q7X0XWoJW5ZoqULvXL8sM0K
         YyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802944; x=1763407744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QeUUtxVE/l6U3rYNomhig7G5mdbpyNRzMIJHR6C88h0=;
        b=hfSCh8zhLc+gPFxGyf+4wpTUXaUT8qQvm3/FnWganXGmIIdWppCDyU5vMfUlfEIXsG
         mPggjjyzpnqx/f9R6x2QWwzfs4KUbfvfmDvMDm0/OZMz53bTTn+AtSOk+HhRjBOTCQv5
         ftgalBQgk/z6YNo97GySsriFOC7DGGO5/mUzcSS4hhLFMRmD2GANl72a7a3YIcrql6QQ
         1I/JS6Q3+ep7UqTTAGMHDn0EHS0y9CK5jsTGpjJXo7LzCL8X8Pz5ZH5E47gudjH/5i64
         CwpfM5xoxGflQk96d0cw/h7Hcti1axIW/Bhk/PWqQTvmWfLGHXXxWp3pSKt6hAHQ0EWh
         etPw==
X-Forwarded-Encrypted: i=1; AJvYcCXl/bnCx8akLgAItqwBAQwRBq+/iBRf6b0C7Ld4wpJugho18rYKgBwk8NY7TM18Gghn2iXJRBRdXTcxS6YH4vC89g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcAfH0Ra4Ojtgy9c3HxTD1AWh3qud1DtLsu8DKTi/Hs3qNGmdT
	KJDyanrtwiGxQaDzsdMbf4zmJcN0PJlTy9u5atvPRIEAnaxc+TF13lZwR7JT/XW0gsU=
X-Gm-Gg: ASbGncuO4//loZXgTyxrPmL66LmzIH0fdEQGdYDgaVGLl3JRqM0KLBgEeEH/hfrn4OX
	hjxx+HqlDbUjBJHx27jVGPd4H1yG3ithwLppA7XXC8CbUgGxLmueFFTmOfFwP65dKETHNS7eJ+/
	ljVZJNqt9axsuYR035lUKUkeHNvvnYR7vIyq467FQEpHoBSqM2BYz9a80kFP21fmLBklZhVPu0+
	L9XTM4VpHmLPZunfXob7luBQ0VNb9VIFbVjZN2Y9yIQz7Ljaz4kDX+rObJAZXYkK1qSrMaKXBdK
	1tcfnqK7938W7ZbyUrNKcpstKZoKXY1CmFciFODZnqKwKa5HPigB7GqCV87mMYBy6a6uaT+wNou
	V6bFCuQ84VGRplKexvn1J0ixWZnOxSvN1LdjomWkOgu20HHGEdH82Hf5cOqV9w4Wk+Iy0GcHjgc
	TWEGsihf6RMfqwz+94DolKKBqp+lJSzKdSVBlCAxPqVYn8Jn0INe1AtKiM82G/BJom0u2iOkM=
X-Google-Smtp-Source: AGHT+IFCwxqLkhOuR1fLThDVMMelLXW67BZ82zG7gRYpU2TMEHXfkTI5mn6Zu6XtzFQ4QrsAm2NbOA==
X-Received: by 2002:a17:907:96a6:b0:b72:614a:ab42 with SMTP id a640c23a62f3a-b72e0015fc2mr739140266b.0.1762802944631;
        Mon, 10 Nov 2025 11:29:04 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:04 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:53 +0000
Subject: [PATCH v4 10/20] regulator: add REGULATOR_LINEAR_VRANGE macro
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-10-94c9e726d4ba@linaro.org>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
In-Reply-To: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

REGULATOR_LINEAR_VRANGE is similar to REGULATOR_LINEAR_RANGE, but
allows a more natural declaration of a voltage range for a regulator,
in that it expects the minimum and maximum values as voltages rather
than as selectors.

Using voltages arguably makes this macro easier to use by drivers and
code using it can become easier to read compared to
REGULATOR_LINEAR_RANGE.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
While this commit doesn't introduce any users, the upcoming s2mpg10 and
s2mpg11 drivers are using it.

v3:
- new patch
---
 include/linux/regulator/driver.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 978cf593b6624228fe1fd9c2a3e186b53ef172f8..977755db64c6dfaea7246067eab0d9a2971caa01 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -53,6 +53,11 @@ enum regulator_detection_severity {
 #define REGULATOR_LINEAR_RANGE(_min_uV, _min_sel, _max_sel, _step_uV)	\
 	LINEAR_RANGE(_min_uV, _min_sel, _max_sel, _step_uV)
 
+/* Initialize struct linear_range using voltages, not selectors */
+#define REGULATOR_LINEAR_VRANGE(_offs_uV, _min_uV, _max_uV, _step_uV)	\
+	LINEAR_RANGE(_min_uV, ((_min_uV) - (_offs_uV)) / (_step_uV),	\
+		     ((_max_uV) - (_offs_uV)) / (_step_uV), _step_uV)
+
 /**
  * struct regulator_ops - regulator operations.
  *

-- 
2.51.2.1041.gc1ab5b90ca-goog

