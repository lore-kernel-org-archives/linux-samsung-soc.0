Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE3C44D680
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096638; cv=none; b=h1C9lo5DJ0bElaFu88UdyOs6PhRVBhiuxuoXvrMtG4QbWJmHdC+ojfKzPrXsHhe3TgwZF9X5FFu+1hhi4xfo5wgHfZ9aK9YVRPmRripmSapr4QyYkXFjFMrsNlIget2GEm5A0bmaHCV9aASxj2/maCO0iMkhmsV5j9D9zsqfZ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096638; c=relaxed/simple;
	bh=GVzTile/yZwpKHms32vEGpKMdnPMenoAs31RnHnr0vo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CdDNf+NOm2lXodGvPx/iwawqd2XjLoemOj4rHrAU4k+UB+xNIxa9uBYnYbM4zIBDExJvm35MzP6U40IzjD9ygm7W2fxSlPgbS+JwdzWG3iWS2u4uIm+3VoRBqHjvXaRxLb4m0Eo3fMsmrZdvEqkdwEMLvKw8ymWnYEVjaAqkZS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IZa+UIUn; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IZa+UIUn"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so1716383a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096623; x=1769701423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mnYMLTw+v58WgRJpE4wU5fkf6SbugO2jmsGWp983LU=;
        b=IZa+UIUnxuvCSVrceV9c9aeWUpLVihpwcjYklH+anAqCNWYmznLgqdLr5ZiVC5Ywrd
         y60FCfX2LBUzMHwuLysQWqMnOOltb4KsoVDyUsLf9i9ku6kcrlxVPLnjGSClJxciFikO
         anp7vvJGjmepNZ1R0yZ0J8QJ+Xi+KdAF4MKNCJdYpkjAo3Zzh2BqlhdEMTPxAfweQ9aY
         s0/pyr+f4Mh9/BS4X/IHzOdQG8g0dImjxrz0ELzyVGEniNEFs/ep7gAD4d1O6omWVjhp
         z2YIw9yhwhB70p1R+F8HrWhkNEpEDfqUOAz5QCnwCQJLqySgpfeuy5nxejPkE9W7qgFs
         g6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096623; x=1769701423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5mnYMLTw+v58WgRJpE4wU5fkf6SbugO2jmsGWp983LU=;
        b=ZJK9Ow/WLjYhe+Ea7uX1bR0Z/I3DF4OhO6cRKQSlvahRn8s+lVSgBNk41bFwmB7cNB
         2/qVQ6yRtk72jvZnp038n3OehAMJ/oaa67PGWmkuI3kr1ER77T4iWSwj+4Dw6JpB7W6Z
         43zx8pF6SfMcxTjy5aWKvGG5kpbEWHNnd6BvFDPJOE6PiQfc/Ywx7pjvax6j8IWlpb/i
         yH08kDcUsTLBwubRJ0MLtkQp/FpPYxjUfNw4s7Z+GpGaXcvixHKnw2ItTuNUD2CCIzGW
         onM4epHzuxmi++0tDv4H2zsSPR44vWv9Ow1i2DPc2Gq18t8Rjp3I3+HXDDwi3j4E+Y6h
         oZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU91gEiYaXmcGa/uHdMyC3sW6rEeh9Fk7r9pm68wdKDqKQzMe6b5HOiXBvzSArk7fuMOsS557hh1YcczrFS7AlfpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTcWfy5q2GrqAPaey+VKAbRG2+3pEZyeGasY//ENAYMF1QbEqz
	DP7Y4wHVNkgWfPyRAT5xPxLUDcOYg9yBdIWXFRtxCleklJDCVBhQrWK6GHToCL9b6pY=
X-Gm-Gg: AZuq6aIBvYYeS54JHCuy8x6MdOYm+ZSvGutlzwIWJ6NteeNr2iF5Q1oqzHpHwd/5Zvl
	a3lwvWUxWaC+fTratC9wHkkgvKCuRKoJAQt/B+P82fR01NE481Sb/F9nUd+E2/tPIh3ZMZ9OKpk
	7+dizu0zrSWB55sKkCxsCyvbIRHr8KH7zBciGlJQMU4OYASOzdA0ZPtk4K0Yn+8rfEUG7Mlg5yP
	+ZIzt5u3VuKdhAKreTmF0Q1KjklkFrGVmS0EtS7lRYZnr1kHpIzghNXl/eMfR8r1iPyz+D21Nmj
	cSMkdud5kxdwl+Q2q6TjsFQltxbHxSUA+W6Yd86TyegAG/52OmaHqVJQybY/ut9tfE6ab2htOHc
	bTUCOCBusKAF+6N+CFFuOq6q41AHS6pACfcmBAsJgN7cfC/MgO5OfHxn94nm60+2oB0m5AbM9vT
	Qq+/8wt1vD25ZF/ddsqXucjvud1mnEKf6H/l/BkPToikm93tNC8ES6m7fOhZQb8GT87n5wzb8cI
	ZdKFQ==
X-Received: by 2002:a05:6402:50c9:b0:64d:2082:d027 with SMTP id 4fb4d7f45d1cf-658487b933amr25772a12.29.1769096622839;
        Thu, 22 Jan 2026 07:43:42 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:42 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:37 +0000
Subject: [PATCH v7 10/20] regulator: add REGULATOR_LINEAR_VRANGE macro
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-10-3b1f9831fffd@linaro.org>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
In-Reply-To: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
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
2.52.0.457.g6b5491de43-goog

