Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF8632B9B7
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603712; cv=none; b=VEZSLHLBAmUaSwGQuFQy55EyA82Vmdc3jlTGrNghSLsgH3/iREaoYNdLPGDvxJQBzq/M/rAZbNp9s/vnet0bXhibB1eHi3jNUZCuHSzLFbgDqoexKXdUOIUsGmFu6lGIN4guXVtiYoLGcQ6Z2+4ueq1RaG7CsT22DnlBwvOGUN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603712; c=relaxed/simple;
	bh=ZETZajMfvd5Cj7AwABnaIbo8YXi84LCz2hhmRM9mv6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bj0b+ymuQk/LxBwtaQ6eqFzXf2mXgNh7SC0u4yf9C8mved+Jztsj5A2ILaZisSzDiorZmcbNcBpOr39SMHIsbA62xy62/cmr8B4XINFzD6LfTUCEmlel9Hi6FzQiybEkK7uKVugxYRLkCNrefy6mRx4yDvo887tW0usPTbI8Yyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kpym1xiZ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kpym1xiZ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b79d6a70fc8so2418274266b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 01:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603706; x=1768208506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydYm6Jwl4gZ6fxTGOTSVWGkOP7GwrBDA3cOK9JtPOwA=;
        b=Kpym1xiZuf7cScimQeO1H/x48ruE1eGm8QYvaGfgU2fXZxLzpuuOnFhJ+1EBs1xjzP
         QaujlZYVxGg/h/y1JugiVeVo0CDtvZXhY0qtVWGOjgF3UQxuCnUtDwGBJWbQzIakKeZx
         daYKOAT0fvh007ZaiNjCyOdYJyMOgXg/kVcGqJdwtO1J8ZF8jT56kt+N5eBRw2nNaTQ3
         76xF3vFnHnqcKuMs/wIIqlhpQab1w7tfaCSBcfE4Ca2z2UCdRIF4uocLLsTxmp8y4iwf
         22WB9wHzgDq7tpJ0yGPJQK9sVVhVJCEVyy/BfBigZxj2rBvVX41owHbMBcyuZJOmZehp
         2GnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603706; x=1768208506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ydYm6Jwl4gZ6fxTGOTSVWGkOP7GwrBDA3cOK9JtPOwA=;
        b=gA26ceit1KoZ+Xn276ghOsdIS5SlWilQw1M7tCzijOP0Ye9EzCT8QNtC32XLCbqtsO
         XSlRQvw5Ptl43VjAYyIh/esdT/OzS5lY4DzGDlIVFSZSCc7aiolFvUfClWK8OPcoHu9Z
         f+GGQbkZ4mlO39wog2fuVwpfknV2Qfp20ctMHYf9nH6/NPndol8XmSZoGOM5UD4d8jc0
         bS/mTEBMhXOpCrtCIIMQAAc2lzzE7pm2BG8olouUN8/UTBOuVH+UPGXfzcd0HfuhNZws
         SDQxQJm5xrMxLHpb+uu2AyS6+oMK2fitzc0sXxqEpNf5AN3AN+rvPDkYjLyyAzxR6W7W
         GMKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8g5ITx8/kZH3WWuz2FU6BFFmUWqKDpXpI3KH7t7t8n+Fw8r5HdA0eTV+XuXDSC+YdKQEGVY6xribh/nhHPF1Ocw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywif4o7Z5sZyd2pKJzupFhsm63v6eKJUVwxqI4qdvzUrWKXMq7X
	EJgvn9ombNJLy0CVcUR6sfKBz3VUiyi3pzCNEehYSucpxVrBYfaikCnHy1cslijoQAE=
X-Gm-Gg: AY/fxX7bL/oRlK61XfzxyGmbsOCoFjO6FF4c0/98GsDAEEMA2t1BHkAZqI4tVZhHnvz
	vFv7fJPKcYimZyxgUQXnrSz/Acbb/tc4c/l7wxmufK5Ux10HWdIOEyY+H28cIObjDXugzn848ub
	hShINA94R618mR+C1XHlrrqt7uxWL4CKatrKZWsr/tv0lHNqWL6xnqa6JEb4Dlssjn9ZLUBLjGR
	8UdfFOCxKGrNSLzvokpA90sq71cLCqlVxmXffo0A1B3PPL4NZFZW84VVwOH+6JOFjcElKfHbfUM
	JNYPF9pJu+amIlqlhxzdAsYQhd6MdIbQGx4b0eqwiLw2kWwUKP06nO0lGqVcxAQZfJYHPPPWEfo
	oGVY5ddj5AT/xpWvj3bg7c1Dg8pGW2n7wEe1ivFfWooQa7ikVCL3hYsV8b6/IVW/ORP6b52Buaw
	W/YqaUlv22vp5M8FqOmwyOEVfHDJjk7Hph9Ja0m+gn3GAT+vOQBRSg/Uk9vfumUaCJQ+IcYMMqT
	0CWFQ==
X-Google-Smtp-Source: AGHT+IHlDkTLEXnDdmXJOAB496ZocW/7AWPPvHl6kR9niuqDxJVFfo22iK/G7e68AW5rLvwMIepbdQ==
X-Received: by 2002:a17:906:6a1d:b0:b79:f8ae:a893 with SMTP id a640c23a62f3a-b803719d4a1mr4700447566b.49.1767603705564;
        Mon, 05 Jan 2026 01:01:45 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:45 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:46 +0000
Subject: [PATCH v6 10/20] regulator: add REGULATOR_LINEAR_VRANGE macro
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-10-80f4b6d1bf9d@linaro.org>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
In-Reply-To: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
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

