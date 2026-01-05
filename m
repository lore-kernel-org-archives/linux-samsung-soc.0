Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B957332AACF
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603704; cv=none; b=gvoINE7LLXpXsXdUDEeTpZDU5MFJAkzKqVh8LiXmTvexWK8hu7tS+FxpdXwnHLJJFz3UKcnr3ZDQ8exafQeMzHU/DT3MZTdEiEOv0VK/n1x/SLu5BIzs8HtYfZqmEFsPFpyvs6sqYpBjcIuf14/6rzAt1bnT2ZEOkgg3jKqUwms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603704; c=relaxed/simple;
	bh=/tB8dmlRTUO4vkh5GgVdehbK8ogjmNaFBOWomDp+6hA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EJUSTq6P7Do9qv4aFVWQcrE6U+oSAWkDkjOOjOlY5poJyWsHi2MqDTwFYCKw6JGfNyoFjvIRSOU8BBmeBOSvHLxKadf8FrwSRmZoTmIuYPuPuwVcZGW1tE+VK3C+bs73gQ4tntmvUtjO5LZkf0DixQfsS/zsXpIGWwTircsflNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e21mUnks; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e21mUnks"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6503b561daeso887269a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 01:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603701; x=1768208501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcAewfHh0ra+es5CHo0kMIivfjkLmLaLZDMh7cCTg/g=;
        b=e21mUnksZ9bgxEeUdJ5ADO4yy3TILqCmcTjhJu1Sp6PMscJiqBgAzyzffbr51wJeAr
         nKRD07cQAqhcC/w0GYq5wtujsQu9/IedBPocEWtNqiWR5mWKBRk2iNjJXrUL/U9lK+gf
         XzRlDsDI6O921e+xbYBceiS/2I0XUDfaaG1Qa+hIjZJRz4VrqUk5SJZuMqQdHOMOmPWh
         8NMLIV0Wsi87Fvl1xoJe7LRw/A1TT8T2T/QihEp4s4kTlT0ZqE5x4Illvs0wiLb9wkkq
         F3MUUJLb/BglYwvgkOUxQco7qa4jhymZ4npCtwqt4ULwbcBSCbr5WVgr+XkxtRpAb3Sl
         LfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603701; x=1768208501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QcAewfHh0ra+es5CHo0kMIivfjkLmLaLZDMh7cCTg/g=;
        b=eZHRI5lL5psSVwVkg1Bkg6khnOklwB5mV4QDjpSjmmtnTjSbpJ1Pnr1D9Rc9k9Rgh3
         ENa0Sk/O7Xq3nGbVuZXBQ4XVD7nC8yDqe33Rxjhv20GmKG/5wqOwds8b3NJGBKcdRc3o
         IFWJnqe5WeIq/h3WTuotz2Ukf+b1MDAEz1fyNzEEWPv/TqotsAMatpd8K3gtKaix4u++
         K+Fs7ChIRmd/2KuVBJ7C8iecL0mhnIF24yyxXzdqJ89FBWL1UM8xkPhcOcENxBU5s9CS
         T2Ud9kIPJp+KiK5+AOCEE40Rk9HA6auKPuAY+5z9oP/EXzF01jNbVfL9JBlWGVR39Vob
         Gzqw==
X-Forwarded-Encrypted: i=1; AJvYcCWhmR7VZ+6WbpwYAjxmoAiJGJCMwlV7Faz6+qaPYzd//FpqFPMU3LLom/PNNPtVc99Y8rVmbWXz0XecvaOxEGQrPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWExI/jE/wTpFWb1VXFPVJRHFfWT4S9pjX3MJyaxH7KVUviZfW
	LqydvNOQvM5KTCCdBCZD72N8QsUaVIhSqzpIGaP50rS/zaqQlJGgXyGGjAZyDvjAWJU=
X-Gm-Gg: AY/fxX5DRCeTImPvdNgW02/hn/2jy0WDH2csYnQtmfvhvZU6kkvdcUL79Ole0KGxXuS
	nK/M/80sSPqErQW1a3dTDV3Xh9ASHki6a8/6K/wlA9pIQZ9sUqHqSDNiq6U6GvHaVzuERJE5UM7
	VtaUwhFKedLxk/zoQ48k3rediHgkAyyNaGU08jd28ne61Q2IA7V/wfoD4EkEVyBwJCpldpYPGDj
	ETBn9fRrWnJqXBM4CZBb9GqxnizIEMrQozB56C2fZ6FKq/a4DPn3jWyDePaHPyqdhnboWvr9HQ9
	SiL2LSflPVq/heZG18iA3kB84L2OfmY9UxnKxrHFoQzbygHUjsXMRJ8IoxFf2pEfi4YPhTrJA3o
	OWVCGrXEOwFEZimIxGysiVMNm2yx3Yk3jC4XizL4LUWMRqA17VfS2L0X6IWMNrooHTThwvGdW27
	X1vFsX5CjVeNJo7cQweMRgBwbdOZ4zDxqi8QWY7XTdKA5EeZg8t2GSc1GQYy109FaVd4vAtBwZo
	62ljw==
X-Google-Smtp-Source: AGHT+IF/CJPT01K+lN7oSi7PevRwGsCCriwWOuhAB/HKhWPK5/pKnCMo9T9pQaKGATPI5BY11XjZrg==
X-Received: by 2002:a17:907:2d28:b0:b6d:9576:3890 with SMTP id a640c23a62f3a-b8037193c4amr4758339566b.45.1767603700764;
        Mon, 05 Jan 2026 01:01:40 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:37 +0000
Subject: [PATCH v6 01/20] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-1-80f4b6d1bf9d@linaro.org>
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

Using lowercase for the buck and ldo nodenames is preferred, as
evidenced e.g. in [1].

Convert the example here to lowercase before we add any bindings
describing the s2mpg1x regulators that will enforce the spelling.

Link: https://lore.kernel.org/all/20250223-mysterious-infrared-civet-e5bcbf@krzk-bin/ [1]
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index d3bca6088d128485618bb2b538ed8596b4ba14f0..4a1e3e3c0505aad6669cadf9b7b58aa4c7f284cb 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -75,7 +75,7 @@ examples:
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 
             regulators {
-                LDO1 {
+                ldo1m {
                     regulator-name = "vdd_ldo1";
                     regulator-min-microvolt = <700000>;
                     regulator-max-microvolt = <1300000>;
@@ -84,7 +84,7 @@ examples:
 
                 // ...
 
-                BUCK1 {
+                buck8m {
                     regulator-name = "vdd_mif";
                     regulator-min-microvolt = <450000>;
                     regulator-max-microvolt = <1300000>;

-- 
2.52.0.351.gbe84eed79e-goog

