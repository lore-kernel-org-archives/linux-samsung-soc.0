Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EF21DF24A
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769579; cv=none; b=UqSsHbWxTGyMJMtCN+8xEc9yFvOFFSDBYGB/gIileznDbvkrPVNbLOXF17fmSdySvz4KQe8UaBHJk1N3ci5hLktymiw+3eisCiyis3FYWZULr2MNRqMwpupcj7tVQJDySdxhXG+DSOd/AL+qcZ8ILoAu5IRKBm4l0+6U7Fzr6Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769579; c=relaxed/simple;
	bh=SN4XNsNLZFVi5qqeFmOu/MwH6DQLUxaf/XH7JDQjnuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T0wyBuFu9QZbCG/AC7A/SuGFzJqyi98umGmSNeiFAJ+WCugg5CliYY+PzPb00Doqpe2R0YT3ImpeZ91IM9KLTcGDpx5S7FGYDiWWl5vmomeGnEM9lNW8l0UD7/BtePYYrrWjYen6R0zOE0MauIayjAvudrpJLuLroSvjWkx6XZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I9GDMaGT; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I9GDMaGT"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so639724766b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769572; x=1743374372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Ic/0Xe88bpVQ1K2LP6tYIkZ9tLwnecoFfoF6m5efNc=;
        b=I9GDMaGTphRs+hke3npQ2q9wbFM4D2TV7JpNug+yQsZDr3WFSBbq3FvNVCaasq52Ki
         sWtmz5wZIs4E3tiZumlkow+8ondkFZBvPY6rDjaQL5HwMXJzI9TN03uujZFcWepa4kB+
         FD+G6JKK3VnRvH1+OrdzO73RqnaXmQx9Ff4JNO3uLjU+pgm5/6/ABLQnqdl4vt4S0+Sg
         CuLOfSApctaY055fOZXPQQ/o1sYWZVGq7c6KwnDaweCVb5INbGtNqEr4w+yVG6V1qz4w
         HkxrdNbWj8KMdRts+oY2fE+3FJlYt2LZJdAlVOvImtiET3x1VPPx7RPOEDkTVSVxTztn
         8Zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769572; x=1743374372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Ic/0Xe88bpVQ1K2LP6tYIkZ9tLwnecoFfoF6m5efNc=;
        b=b2IRGcjDYAcBKcGzBgJDVLjwdHd4yHu38jjGVxWdxSq47PfS+0vlQLxQT8OObeQrug
         IjHKQlGUHnR35SIx+zFurHPYzBGd0kekm6rXrHK4qcKqTuBigm4M8O0v7STSIkvXj/cw
         HkkKp0SKCkqG44Pu38/hBfJKv5SNiqgb5AETs8un1EyGnZTgeYNIGm3IT5CwEEGNVnw3
         V0Nu4MUhLtJPv9WS0sn3wAjDPtXccIgF3cu0r4I4WcZob7Gr20LR/0l9rScswhS5oJCM
         fMsiY4n4srY76ZjQlz/vaNXu1CJtvwoP7akvoJChjXdsKNbcXPfiSigDlUuw6hIA0HRo
         ln2w==
X-Forwarded-Encrypted: i=1; AJvYcCUFi/0+JnG9Y58nsRgJfYf4NStk/9quOLkkah9seHP1ALrRE09JChCz22NuAy2Vn59TEoK9qoelSDIL43OfFQ3Pyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzob7lWq80xhd06BmmdRYflK1liHNLKlKEj96fKhi29o/5Fn6E2
	qnJLZn8E4i/0NnLdi3k06tgnPCuZOUYe1QuVdpx55PyJXMYLiNtrQOfC4/Abyos=
X-Gm-Gg: ASbGncttbXVmL3j9+IX2UDK13BaRsLQgmU+uJAotkI98havUD6Q64ds/VwcjDa0whqO
	F3tsw3UDra5SqrR+/rgkAKR+knw3t/dhhwaDKAfE7InQqRuX6QcrvJo/qRDl8fuRO2jcQiVz5pi
	7LgYX2Ah7lBo7trrwVUb0rV9XmQ8guxrB/o3kIEx+e2BYjWsOQ66EdKxF2A4+JkVVji90USXsUj
	ABqx4CjyyzhdRRcGgGrQLEM6DyYviuUUDFI1BCULvl8A0qOO8X0wq1JxrzvX8xCWP872jAuGBIO
	r7HjQeUa446AIzZOVWWuJKf75p7nNOEOb3e1+t7EBShWj0U3WK78Ye6266t4QhVOTGBQKOlB/uP
	stZAJfM7piGNl0tqfNA3KaM3TOPBl
X-Google-Smtp-Source: AGHT+IHSWJYMmiilFq0GtP25G1GQAXzOeFA4uM6WttlSQSDa4D8BZIvbWko1AKzeqQZza3T/DLDdOw==
X-Received: by 2002:a17:907:d785:b0:ac3:3e40:e182 with SMTP id a640c23a62f3a-ac3f20f29c6mr1017949366b.19.1742769572496;
        Sun, 23 Mar 2025 15:39:32 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:31 +0000
Subject: [PATCH 15/34] mfd: sec: use dev_err_probe() where appropriate
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-15-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

While at it, harmonise some error messages.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c |  6 +++---
 drivers/mfd/sec-i2c.c    | 10 +++-------
 drivers/mfd/sec-irq.c    | 14 +++++++-------
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index fcf7668efd3215ad70d81916ede249ed5f9d45ae..5e084e2c389ea6d509393be93f7e2d39a795a60c 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -211,9 +211,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 		num_sec_devs = ARRAY_SIZE(s2mpu05_devs);
 		break;
 	default:
-		dev_err(sec_pmic->dev, "Unsupported device type %lu\n",
-			sec_pmic->device_type);
-		return -EINVAL;
+		return dev_err_probe(sec_pmic->dev, -EINVAL,
+				     "Unsupported device type %lu\n",
+				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
 				   NULL, 0, NULL);
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index ba0efb30877bf668fed7476a5e247e0dd4095806..ce1e5af9215a305fbb55157ae4e7bfb9aace86b8 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -152,7 +152,6 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	const struct regmap_config *regmap;
 	unsigned long device_type;
 	struct regmap *regmap_pmic;
-	int ret;
 
 	sec_pmic_i2c_parse_dt_pdata(&client->dev, &probedata);
 
@@ -186,12 +185,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	}
 
 	regmap_pmic = devm_regmap_init_i2c(client, regmap);
-	if (IS_ERR(regmap_pmic)) {
-		ret = PTR_ERR(regmap_pmic);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(regmap_pmic))
+		return dev_err_probe(&client->dev, PTR_ERR(regmap_pmic),
+				     "regmap init failed\n");
 
 	return sec_pmic_probe(&client->dev, device_type, client->irq,
 			      regmap_pmic, &probedata, client);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 4afac3aa0a582994bf04c41768c1c788c54ee2e9..d05c8b66c35f2a1356d7c641484404628870ed42 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -488,18 +488,18 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		sec_irq_chip = &s2mpu05_irq_chip;
 		break;
 	default:
-		dev_err(sec_pmic->dev, "Unknown device type %lu\n",
-			sec_pmic->device_type);
-		return -EINVAL;
+		return dev_err_probe(sec_pmic->dev, -EINVAL,
+				     "Unsupported device type %lu\n",
+				     sec_pmic->device_type);
 	}
 
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0) {
-		dev_err(sec_pmic->dev, "Failed to register IRQ chip: %d\n", ret);
-		return ret;
-	}
+	if (ret != 0)
+		return dev_err_probe(sec_pmic->dev, ret,
+				     "Failed to add %s IRQ chip\n",
+				     sec_irq_chip->name);
 
 	/*
 	 * The rtc-s5m driver requests S2MPS14_IRQ_RTCA0 also for S2MPS11

-- 
2.49.0.395.g12beb8f557-goog

