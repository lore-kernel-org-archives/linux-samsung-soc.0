Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0459B3254BC
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 19:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197301; cv=none; b=U7l5ARdD3Gjktpsgsy1JCM9/Qe8FxNXe7xLIVyCumh57yjOqSFkoHh1AMIj0VjMzNX22jWb3OKWqoEP96GAJlkJCilzYA8XuH4T064UrJGO99sO4zjckjTeN4EfCXaPmG1IgyFnVkqiafEGPhxjsSr4c51GReZDJ1U3UCFjHRBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197301; c=relaxed/simple;
	bh=2sTVmTa86pv8fJgdD5xjz3zgzXpYVywXrSd1pVhx6YM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZkg7rpucmPOU55wSvWQG2JnPyebUkVeZOgJPDhlu86QSzjfy/bBD9+64XgCW5KiIeDA8U3E4K8g6VEoBA7oG2Y00hoKtPLEk+hKhG4AoyvJIvpQ745BH6E0tFIW6hmSTjb/mp/mbckjiORrxcI8tEolraskCSBqRkfT+1+1SHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ixb4czkH; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ixb4czkH"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso4119098a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2025 11:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197293; x=1762802093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swaPnlZ0H028w7OC5FVRDI8/szcqshYIBFL4ftY69C8=;
        b=Ixb4czkHCp76ittYEZ60gpEpQMoN0MUKFJEh0y/qG/qRr4oCt0gHjh56+u4bzCj9rV
         d7IUlkOzUVM0D7mamTzdY1kTIoJFCJONBnkqhLa9m+YaDJyWXjTym+o2Zq1inP2VeJjc
         L7Vw/deuhmRQRP44YJL8c7IsgprjmpbGsJo2HdWGWwhO/auHWaia9owRMq8Y03CKFYOc
         CVINsRzDV0CYuQjuli5EvJoN5NAnwQ2VcBXRM2mfpjh7lYacJG/kfkWlasbPz6nYzXg1
         SzxEiOr4OErPXv8t1qgpR0aGmaPbXAbzxttGoqkC+YzO1N4I4OnHE9EXVR4G9esrJgME
         Cvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197293; x=1762802093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swaPnlZ0H028w7OC5FVRDI8/szcqshYIBFL4ftY69C8=;
        b=Qyyvok8+hM16iTqPQfr8F/FWEPYNCEqr/8WcSUqbqF/i+10sp1WLF1PeOkH/YsnFbb
         9v76oTMOA3aez8QwfrDBITxmlFxIOg6lYGq4BxSjhEmhTzeAkRGz7i2exhMHISF1EK91
         9BlWP6Zn0xXQIrghurO6KhS0kq4cWshT6vsVBXD+Tz1BggYfvw3d7BUJ51u1iPQwNRiU
         SpAWRH1BQuZsuCLUy8p3wCpThD9Y4zwRpLQ627TQld0rtk04U8jsDQx97R4egV0PFyG0
         NGXp/etix6hgwWViC+lh9mphBOBSKbQtzdZH4jYQUAYPcS71phUMPYTmC7Ysx/i0OrH3
         0Kog==
X-Forwarded-Encrypted: i=1; AJvYcCWqtefCn02K2xV609aHYkrWA5KHPz6W+GPkegfzgY10xVVsPFs4LrBRIHdMQLaFOfjOScCR1CcLhjDebcyH/YHGSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY9EyIkY/egxLH6SBX9qy0qaw5o7mJUpMYZt+0aGoH8QY6nE2Z
	CJbi9Y5AikASPYvfUp+Fu/ObzEhG9KkBu9c/zYco2cMDO67LAnLWMsSekq9zBCPFvPs=
X-Gm-Gg: ASbGncuwWQRwU+6YWkBtymYtyN/5EkR18ZZqHmK/ulGXFb13OPpzTEhtbHpUmE+wx4Q
	ePnIl30B0WaKCzX5fRqBvXqNZZk5mWao+sLPqOpGGUQkU0T15jlb/uQkUreu4a3DLxu+6v88Bcq
	OQoAE483B9VyvGo0IgplarTl6EFwapKGwUqALleLDUrUlnPkzxGse4gDb+BR+YiR0HOqUq2nBvs
	30OctPbCWzZMAfo9mhrqArQ+oLFGHLV3K9B5I+qdbH6ObVRJovg6LMOZ6IW55e6YqEjXm6RW6XM
	/LLBXRG89DvIcrR8M6irtb5HP0smsfJI/V34HpL2Kq3TW2nIUHKpA2puXze3rEOu02tKt1d1ZBz
	D43cUZDzQWVNSgxBwwA8GZb1bhhKPJU4jk/iczD+TaGovzHmLx0j4cjHW/xYJHp2ztdLrVjMVS5
	LW3m+pfPKBRH/vbOIdDVlfVojTLBcCdCZ3Wede8eWiHWkbT1VlCnhX0meNceND3M3tMFfmCQI=
X-Google-Smtp-Source: AGHT+IHiNqxvdvsqsXOblsPDou25GeBmEyZiMxNTIJQm/CkhHutRBIYZb/OdlmtQUhYFXs6N4+W+Ow==
X-Received: by 2002:a17:907:6d08:b0:b6d:3a00:983a with SMTP id a640c23a62f3a-b70705ea59dmr1451359566b.38.1762197293134;
        Mon, 03 Nov 2025 11:14:53 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:52 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:59 +0000
Subject: [PATCH v3 20/20] regulator: s2mps11: more descriptive gpio
 consumer name
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-20-b8b96b79e058@linaro.org>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
In-Reply-To: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
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
index f19140e97b9d7a5e7c07cdc5e002de345aad32d9..3e9da15081e680d7660c60270af54ba2a4f8da1d 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -363,7 +363,8 @@ static int s2mps11_of_parse_gpiod(struct device_node *np,
 	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), con_id, 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
-					   "s2mps11-regulator");
+					   desc->name
+					   ? : dev_name(config->dev));
 	if (IS_ERR(ena_gpiod)) {
 		ret = PTR_ERR(ena_gpiod);
 

-- 
2.51.2.997.g839fc31de9-goog

