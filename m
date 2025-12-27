Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880CD33033B
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838290; cv=none; b=FY0hYQeM1Rkg86SJ4AFIlu4PJHWhU+y+xfD71GAeDQGA3C8qVTDvG8gQbcbyqplbF0uiz241eyUVInceOUiZrz54B6jSlBFSPm1VqOPbn3J85ZkaQFO6ev8K/sobLzZkxB5lU11o7NR7jnqO2Fa2lS5+D0icsh67xDpzcZHO77I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838290; c=relaxed/simple;
	bh=zY4HDzqBb7/UAvPLwmWGSo1BI//NAtywMvqMn/JOYCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWzuFKg1kGexcm0ZGPFQBx2PNj8Dj7ZXuwH8FjIoVEOmYujzLrkkr5zd080UwwZt09MLZIv64AkXuRhn9U7mwuqalQHen7nqFZ+TqhPgNVhxAMtPeevSFift6cvuJEr9FcfwQoGLY2Q1n8EXlppvOZpVc59+TPV4ElRgsUj8Liw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xwLpD/5q; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xwLpD/5q"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso12608984a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 04:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838281; x=1767443081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERvEdThlWsJXRM1ZMwEPHPXp21IS92Dke7PuPKQGFoY=;
        b=xwLpD/5qgkDKyLQpDuUWqEBnsrnBa5zvvw40CZ2JEnWBcs35b4+5E5yrfj3lftMRwR
         lKYMUY3iL+ygfZoxV9071Uuaw+BYFXnQk4zMSrYuZ/syAk7ymGNbCD1bUwIUYOAbymTb
         OjTJLkUF9YkNge9LtmNmLSM4Jq2SNWcF/z8IGs9m+7GDlTgiQd3glHB47QAaCY4mwzV3
         lRFu8hRbvMGRO+Q9qWlUfjNbKZ4LbwStwlk/ONOalhTlQVAuTe8Hxi89NK5rBgVtoyAl
         GtpBMvT5faDWNtAxpI4OrB8vvC8xa8lQFZxEyodZKkRHSe45sJB4wtDU3gz10E28aIUF
         IMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838281; x=1767443081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ERvEdThlWsJXRM1ZMwEPHPXp21IS92Dke7PuPKQGFoY=;
        b=ZU5wi78z7IUUuV7c1c0nSTDpH7YpFcY/DsJ7zZrJGNQ4Nnl94oLRWXfnldaXIhGGss
         9zyiT95BgyB1nJrPrEksCq2rw2cWHEysYDgNDx2YezuoZeYep1YuYcgdNNc/9raey4TN
         +8KHAAyKkm7Ph2O5daje24bMZP0ZTR7CZXgBilDa6wDXa8JRYGqQ8dabtkJzjCle8SMf
         cILtvMsCbWKwFSqgCUwhN8JTDONyZ+tDvVnu2VeHCTYsykiPv3/P/l0sUYRlqTxPr+si
         J9xNqTfu07lBe1/I6FsBlVVimTQrYhEj7Tq4emQrJ0RQsyhwZ8tUJy7MNc/iVr7/Xz4k
         OlPw==
X-Forwarded-Encrypted: i=1; AJvYcCXaxaqTQD5bRcXAwpJxANYNq6IRJf9xXfm9wsG+l9bNRaP1WzlgeJy+W77jH5x34XU6WciMM/mTUwpMZxYPYpYUuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzix7ahdkYNMYPzjv53jKaDtOrxOyHzcXSGgdZTVFWVaotxa6hO
	PNIYEJvf1dDFLafRXGFpOD4Q0wqT3QBnRir6sB/VhTgteFAlnwhIpG5O2qaNfWfSyLs=
X-Gm-Gg: AY/fxX7q46eBgeNXI7nXy52hOHs8Lcz0Xy373zwHPLm4YsTdVtRp666nvE+eagY9VmT
	i5Jwtl6i50rTfQN/sq8IBahXBNe7Z/yMn9vMzy/6iN0AEVnGJVt1k0a1aWAjKEBumez1AAfsuh5
	wBCtJj4sVedYvSkk5vam7A7M5VKKzTLGaAbeEH12A1IGNd3m2Gv8FD3hc6A6BpNlWzidaXeSX46
	009LX7p/oR8aCxwt79At/3kFdi7yF87/sFsbG5qhtR/o/kjXvkmdYidr6bAjn8q5NFcSAtVAbjb
	e5sH2X7qHhDQ/QXmcrcDXJFHQeh7W55PCqWE2gD7gJ7VFQuHTXp0OvCuOHoIh6dNzx9iAMrsM8B
	ThbEw3iFlhGjdTtFOHQvbrHzgsrJCSs/y153ONyeLVNBpDNe3rbFzVm2H0Nw/FfFFDHcsnvqLBd
	nJJmkOfKZZ5xlr4VLr8cKQmpnKIfpaxm2DnwZSCj+y1LImW5xXeHRZFQzqrxt1QZMebixCMoH23
	HCcdQ==
X-Google-Smtp-Source: AGHT+IHycmOXztf3tQPqUFMR3ZDzjnCJajLUop6kueKe0OALY79Qu3QaZ0E1mu52XExCIbSh/groQw==
X-Received: by 2002:a17:907:7eaa:b0:b76:d89d:3710 with SMTP id a640c23a62f3a-b8036ebbe32mr2775195166b.8.1766838280740;
        Sat, 27 Dec 2025 04:24:40 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:42 +0000
Subject: [PATCH v5 20/21] regulator: s2mps11: more descriptive gpio
 consumer name
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-20-0c04b360b4c9@linaro.org>
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

Currently, GPIOs claimed by this driver for external rail control
all show up with "s2mps11-regulator" as consumer, which is not
very informative.

Switch to using the regulator name via desc->name instead, using the
device name as fallback.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index f068b795ab51845bddac84eca08be0efdcf4f164..178a032c0dc192874118906aee45441a1bbd8515 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -362,7 +362,8 @@ static int s2mps11_of_parse_gpiod(struct device_node *np,
 	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), con_id, 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
-					   "s2mps11-regulator");
+					   desc->name
+					   ? : dev_name(config->dev));
 	if (IS_ERR(ena_gpiod)) {
 		ret = PTR_ERR(ena_gpiod);
 

-- 
2.52.0.351.gbe84eed79e-goog

