Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D93A211A21
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231056; cv=none; b=fKaYJ2IDZvvveTAvJ2e56FqrJVG7wORg2cEifHzXtVkKjlLoe6x9DDR6hTN9aadPLcXODEREDSmohOoBXhLwCtLWnCGKVqMqVsFBqQ+yCcz5o7Itb0cLdMB4IueHr0yi7chlTxQ0VX2edDMDxcIce6jLUIJ+P/tgotsE6LDZptw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231056; c=relaxed/simple;
	bh=3e9/UfR1mJvZZf9g38Aa3kwt2igeAl1jk0oAMPkKz/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHJfRTMf6izXiDz82KPcYMUtqXbqU1UP+C0I3MZ/sW6tUf887S4UerGEiV2mydyzyDBr3HNdVeqHxY4Ic8a2Olflbph6r9yoHGP7gKNwntdZ1rr/fTaa3Lm8EhQDCOL3Ojm1ncGOWwMtrWv23K74+lbYPVrvJwjr/wlP435fqp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Se5rR4KD; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Se5rR4KD"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso26349666b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231051; x=1744835851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLmgb19AbWrd/UJeKJUHWxq/eTD9hl5bKw4d7syAvGk=;
        b=Se5rR4KDuZ+RaRijeUzq96U19GGhw3U4QryetzbJxQrBmGlhP28oQgTEOkOkOGvt56
         7i9fvECyqyoDZ1DQDp7Dp6KWtky2tv7QruOhuzycCfvr2m5moBwu6KkB0ZC1oEixlitj
         AH8DZ5EOssP2uy9C2hD6hRibirf1RsB4D8LDyHE+W3bIk7wPyzTs/atdGwkmdwhdwC5N
         qKVgRLOjYJji8LuLu2jZkxBSf02/POEHeg43Hb19EmweSGKmLsS/2iMRwr6TJxkBneeR
         z19Z5dxHvcUvTJJIGE7X0p3o+V2aN5bBv85k5k9C+GJPLl5Td0FysZMbaI1pyCr+hpv5
         tpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231051; x=1744835851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLmgb19AbWrd/UJeKJUHWxq/eTD9hl5bKw4d7syAvGk=;
        b=JS6/t/lw+rrPk3Z5AxN2nbjdnhxnweBgLyO2xMigc4jfm4eI7x7w9QDOVNUooIVaXL
         /B7LLPq28ohyCrF4t173RbRAFGVtzIgrIQ6jwJKyfy+reEhFIRGbsXUW+KSum1yIhELu
         0WTh89XE/ecDK9SHnRIGCxAiyfsoONixlqWRXKkNwfAkXiKwn+ntLoipDS/rLB/itATl
         vpSPlngo6ihE8Cl2O09O6HqCR7FfKshwv49oA1HiZ/AgVNoe9aSSIqTmB3cYz88DID1W
         2aB5W44+s3qa4voqDT0NvhLU49OtTIWxd7NEcY5kFRvXxZ55riYk2CCislnuOymRtcYZ
         Geng==
X-Forwarded-Encrypted: i=1; AJvYcCXrd7J5CzX3lXQzi2RNdAYvr6UKtNF1jSfHvZoO1bs+bqG3KaeMdEKPtYmKV57RIwOHR/SGzfJrYOeQbFkwJ+mJOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdLwx9S605b0qnojtFdqyE4E5/UYwKWu564cd6CnZypxZEJaXK
	u5ecDVE99UFDseIcaizi5Vahp4VjoUfwTQbr9PtR3NyPGkXHrZNAdx6+U8dda34=
X-Gm-Gg: ASbGncsh3plTfVKYhFasJhA1SORfrMPx7Vx/EC8ekDnOfjIxuSQVNE2+En4iE5tX/tu
	JnhM+1BfkrMOaYNiFpzvYk9Or7jGUeq1gIPfESApy1JhinwLc2I6pI8yyauLE6rhu5TDRTxe08L
	oVsoE6dfgTJP/Hikd+VSl9km1vK484Kg2bJWZcgtgO5oGYVqFijvCfn+RgHBGCI+Fq3jisDVH9Y
	JJ4colfppawEP0xCO/IE75rD7UKjeF2Z0HaPeldlPW9rutPTd5M4dafLXa6wVdPYRiB9MqQ7xOW
	oZRG7y+XxYBY6H2V2CjktFh0XvNu0EjU3ip3CVN0vnktSU55zMQxhwrDqUZ0JC1OPrL2mHgbwNe
	hNGMcDFn6cIMkCLOn5z0XE0wsAheLQGCNKdjvTA==
X-Google-Smtp-Source: AGHT+IH0zvKNuRDAGqLs83RwWCcDR6aym1X5YrwLki7lH6aKqe66Jq6ZWK7rMjqREavabKtC1MlIlw==
X-Received: by 2002:a17:907:3d87:b0:ac3:c59a:413e with SMTP id a640c23a62f3a-acabd4dc96dmr8505266b.55.1744231051490;
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:25 +0100
Subject: [PATCH v4 04/32] mfd: sec-core: Drop non-existing forward
 declarations
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-4-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_resume() was removed in commit 6445b84abf91 ("mfd: Add s2mps11
irq driver") and sec_irq_exit() in commit 3dc6f4aaafbe ("mfd: sec: Use
devm_mfd_add_devices and devm_regmap_add_irq_chip") while the
prototypes were left. They should be removed.

Do so.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index f35314458fd22e43fa13034439406bea17a155c9..b7008b50392ab857751b89e0a05d2c27f6306906 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -72,8 +72,6 @@ struct sec_pmic_dev {
 };
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-void sec_irq_exit(struct sec_pmic_dev *sec_pmic);
-int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;

-- 
2.49.0.604.gff1f9ca942-goog

