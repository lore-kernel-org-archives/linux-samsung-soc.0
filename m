Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AC0330308
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 12:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838279; cv=none; b=jwU5QfhL77BieQDOUzlJbEc16mw39uvaH7ptmjZ7u+MpjYW8lXUb2pllk6oQ1ISO6yMJOADnC21PWjxgiorjBWT849sezS1adB5RjEWjFAv4/vPPpxAeiyLQD+IsDmN4rbRazjtG2dpt2owjOlOm2ZCtxhGZwOKysjMJW+CM+DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838279; c=relaxed/simple;
	bh=ZETZajMfvd5Cj7AwABnaIbo8YXi84LCz2hhmRM9mv6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jatBGavV8eYW9oZ5wV5GFDoSyGg2Q/CZ5TajLy6MJ9qS5uedjQSlYQqn7BT9InDyCaWE/XKY+jjlPdl+4cmUmTyQZ+kLVvPvonzx+zvZuUSzj3WHm0Kf8wolhVjptmpal+qo+XCGaXbjcx/fsKV4vp35u2K6fQ+eI8LwsZsmGd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JVdSOk3v; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JVdSOk3v"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64d2c50f0d6so8166742a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 04:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838273; x=1767443073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydYm6Jwl4gZ6fxTGOTSVWGkOP7GwrBDA3cOK9JtPOwA=;
        b=JVdSOk3vCMomAwy8cm71LE1sMdttZxiV6D9ZzAACcub7eaQ252VliCAxzqQrCPeezu
         GLNKu3vWJNb6omFnwI8kXbNCaZpexqVadyvlqn+7V0bLHxxziUa0d1urTvxGHNSWqMCn
         7vpkNm502YsFg6w/dDiIlLPrvImSHLbfZ0vFOR79xW3rHhWiTda4cAw7yoiIsB+DWWCG
         TXW8uIWkzjS4R9YDX6mFDsrFFl2KTi/+Z3ixRRh4UaaUSU7OC3HAI34kNArNsVaz49d0
         eQiO4p81sPLfAJN44j5/zHIyjeZ1iJNb0HTxLRGd2dFaP5yiZb998QS1b5g8p2I4+byl
         TZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838273; x=1767443073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ydYm6Jwl4gZ6fxTGOTSVWGkOP7GwrBDA3cOK9JtPOwA=;
        b=wITG64eXQjlP8CePk+/CNY4MlOuWpY77//t+icTvSIJzFdRaNLcElZ/ulCl3SyMXuG
         zZe/B06p+msLDEXNcRfAUGWWtweLBhZq9BO7G4+wGUdbAbVLvf/SUBrH9/7cgBIVWzbF
         dhCEtIGcQaLeXd/N06UNZ/0tZPN2H0lZAEASLcRZPtWNUYTQMXHfDpD8PCnKMEk8IRWh
         nJ3jlsQPmsOAj5Diwm9ww5oO0OX2h8aA866xnZKkfdzov1mG4PBZR6azcKBconIY0ib/
         NkDlVY65DnCMRfHmn4ikea5dsb5GLlowMt+8EW0XVkrA2JTP7MdkiUDnU64wXKbGlcHa
         gCPg==
X-Forwarded-Encrypted: i=1; AJvYcCUjl4GglQXEVOtvl+LI1i0F/SyWAMhnZd8J6aPq3FCOXz80AGCf3oZPmr64Nfe7z4hDvZgrPTf+e7tMFT2iUnT+Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOO1AR0p50xwQct+2fd7j10/mIVMKkNnKE9KjvMgkFqgGixN6b
	VgtaBDxHo7V/T8FrchoFIGMHTmCSwJZDhl0s7qBsZdJwGG5kH+FVPpHTI/SFn7SeeSQ=
X-Gm-Gg: AY/fxX67V8QgEZVN2qvXLxixOnYGmg0L4onYBCSRCDPIC5ZEeuLzVeXdUHDGMHkwBcC
	++PuWdUa+O3ExgJsYYgnDleuOAj6Rd5vCeYA3BmAqnIzYHQl+q+5qOF6pDf6MFMh5rdVmekRdgR
	2qAzFAZAN/57Vh+nzupMNwf6nZPllQx+NxKnRzmbvKbUUt8cxtYAOqGkhOtdAj/YnnOzlfj4/Db
	n2cVHFnevnXVu55RsDKWDMCtdV7XiU8bojSqfEK4EsWlrFKvOG9R3/gznpunETL80PRPxkZRSpu
	aE6q6FcboyN1tsxNACIFEL2WWobLlUPeZEf1SdHPQCRWKjDtdr6XgFkiFo0784UfRnAbDPyT6XX
	7/k39H/F9SPi6cG+TyrcUmE1WQWEQ3yVcLnYvX7br1hc9Q65RgzOhEuWJRaX4Scg6tYK1dJDgSz
	4INaD6K1NkZnkke/2VS96RkQDJ083k5knbL/VXvEvNIQvgNpHiiZLR1UVGXYp6H3kjPvA9yxdPm
	fMBDg==
X-Google-Smtp-Source: AGHT+IGmVBStv7QqUeeTdiGjFu04kQuUG0+cc+BTzhSqsOpYCHbA58GXVMsLwp+XBrPv+6vtCMAYWg==
X-Received: by 2002:a05:6402:4414:b0:64b:70cd:ac2c with SMTP id 4fb4d7f45d1cf-64b8ede3550mr23179595a12.32.1766838273410;
        Sat, 27 Dec 2025 04:24:33 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:33 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:32 +0000
Subject: [PATCH v5 10/21] regulator: add REGULATOR_LINEAR_VRANGE macro
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-10-0c04b360b4c9@linaro.org>
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
In-Reply-To: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
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
2.52.0.351.gbe84eed79e-goog

