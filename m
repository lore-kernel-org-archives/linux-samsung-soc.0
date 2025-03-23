Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBF81DE8AF
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769579; cv=none; b=I4SV8hh+9aBy/scKpXRpH2XRw+9wKS0mHYs6caTV4iDfYN/Cmcs3jsyNKgdhtwjdZ3hGAs2Ma+fza+ly3J38GGgxVkHERL8dV92MIbFk+wQoi+DE4llalKoCW3w9vMDtKh0BYi8VW72zmnEAOfFh5kMKapr7mnEHomkan9NtvEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769579; c=relaxed/simple;
	bh=mYouhjAoSbLSn92zFo7mSaGFj9cCPHa2OyFJJEwMdw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9ECD56F4PdeVBCI5yZGOUp12miIQXMjpV1OgOxP0aArHO+i9eYMXpFhioR5YaU8T9cfDGpoHkiu9hxj1qj4wzE6Jvol+eXgcbpGyTUfhv8v/IRt+Jgo8GoqCVWEUgUUq7bWZiT3o4XiwZAN7T5DmCn2qsGvu8j4VQq6SuJhojo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QcQaQ/4W; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QcQaQ/4W"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac27cb35309so658965566b.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769572; x=1743374372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmds4rrDLrfKJmwR2Z+ZSZKx1qRT0gZntXalkJpQH7Y=;
        b=QcQaQ/4WkIkk+hlhTXnQ2KRnW3VAX2TNN6AhASfAlkd9xfsucnkhv9KDGQ5Cp2obuC
         R88XvwFmR2f+zbcMhEgSngCGoWb9ruRURZT7BYQjfxRvU34FrGP3cyXvQEPbMYBp74xh
         +U+OaLjjzBiYT2br160bRnAcczHdwQCDTzIJqLozpiOXEmjPB00zaL1N1AVoEJTeZ99Y
         Eig4wBR9U7BLcSkNt0hOSqXH04CtIJNHMUBIpsjR+AUcGB4dDdvlYq+K8vRAbGhL+nm7
         VSz1PhJFLEPaWCDQLwG0vy0Q7Zdsa6XmkmhZtWxV6RBqZEZVncX1iaubDm757rEepJeV
         WRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769572; x=1743374372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmds4rrDLrfKJmwR2Z+ZSZKx1qRT0gZntXalkJpQH7Y=;
        b=u6vYN6Ab8aSjk/3I3SB1Rr1MhoH47xJdQPzrSXs4mO2WVo6QiP/+e4s0LGmij3KStb
         Iw08DsuC4KWTAlBtJ9fMkWruCMmWx1W6U21+UltrfedJiDHTZOJFNl+dMohSeTqJf+QR
         BzhUJ77tIoY+lO5jQpjVux8QWDMdOyCbawVOV20LG0hMg1tiVGi6S1UWCE1u/6EyhAdv
         b3UvfTDHyrx3atemASMxCPeYakkqiBeTLqFNT1qQILjI0uTY25AZmBI2ku7bP0M64EBW
         YCBJAQxg4KVvKQEjRquwUgFVji38A3q39Ybx5QnqcOkZ6ie24ctiYNCSlYxssg6S3fTL
         DOPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVACp/UxdxSMVoecV2rGv1NO8YkCwPtA2HySNyAaMEDKikYlrCYV2M5JShJZCZNuQKTIXQ9zun9oJ2myBje0GGEsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4NHc9aBvRN/zOYrpRlY+1g3wx2yrohcfgMT4sDWPodtUq+7ru
	5U9HeSm9zDh0j8AscGUXIQ2E+OMODss4we/V0N/U6Vu9L/fmnldp+sLWqEZHxQ4=
X-Gm-Gg: ASbGncu6a9rvVYEvevhYFTgqU0Lfrw2BfH1Dz5nQaSWzLg7m4EeY+3P+vmniThLsKKT
	Tf5TFzAjhBm6yZ+RIIKK/ZSSVqJzfWdcbeQojuC+SgdYaMynbs8FUDyIk9J4TsDzmFwCxZJG6lA
	qYXD4zCOjr1LctAMCnY+xMS+EM3fHwC9Q9tzshhty+W6aa0pYxi9d1i400T3jRZdkE0YZPyW5TG
	sIs50np5/oCI6aIXpmFhk0MyPV2QXtbaVTyzUdNMfrJGae4uhKibQzb6koFTtcR1MxmzBedcYvg
	Fng6y1veHWLUnWw1yiMj7ovViIHjOf+psE1Qj8/JyK4gJ3va57IcZqKF2QfJLhuFNnrIJ9PPDyT
	QW4ezBxoGpIPBPBsEMW3xhfXHNks8
X-Google-Smtp-Source: AGHT+IEN5dOxnNTTla9a5uamRe8PZKZsb3egHapeEJMQ/eCTIADM/0J2Xb8LBoxvBHWdtuRNYkVBpg==
X-Received: by 2002:a17:907:bd88:b0:ac4:2ae:c970 with SMTP id a640c23a62f3a-ac402aec9f2mr753664066b.21.1742769571904;
        Sun, 23 Mar 2025 15:39:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:30 +0000
Subject: [PATCH 14/34] mfd: sec: sort struct of_device_id entries and the
 device type switch
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-14-d08943702707@linaro.org>
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

Sort struct of_device_id entries and the device type switch in _probe()
alphabetically, which makes it easier to find the right place where to
insert new entries in the future.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-i2c.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 803a46e657a5a1a639014d442941c0cdc60556a5..ba0efb30877bf668fed7476a5e247e0dd4095806 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -174,12 +174,12 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	case S2MPS15X:
 		regmap = &s2mps15_regmap_config;
 		break;
-	case S5M8767X:
-		regmap = &s5m8767_regmap_config;
-		break;
 	case S2MPU02:
 		regmap = &s2mpu02_regmap_config;
 		break;
+	case S5M8767X:
+		regmap = &s5m8767_regmap_config;
+		break;
 	default:
 		regmap = &sec_regmap_config;
 		break;
@@ -204,11 +204,11 @@ static void sec_pmic_i2c_shutdown(struct i2c_client *i2c)
 
 static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	{
-		.compatible = "samsung,s5m8767-pmic",
-		.data = (void *)S5M8767X,
-	}, {
 		.compatible = "samsung,s2dos05",
 		.data = (void *)S2DOS05,
+	}, {
+		.compatible = "samsung,s2mpa01-pmic",
+		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mps11-pmic",
 		.data = (void *)S2MPS11X,
@@ -221,15 +221,15 @@ static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	}, {
 		.compatible = "samsung,s2mps15-pmic",
 		.data = (void *)S2MPS15X,
-	}, {
-		.compatible = "samsung,s2mpa01-pmic",
-		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mpu02-pmic",
 		.data = (void *)S2MPU02,
 	}, {
 		.compatible = "samsung,s2mpu05-pmic",
 		.data = (void *)S2MPU05,
+	}, {
+		.compatible = "samsung,s5m8767-pmic",
+		.data = (void *)S5M8767X,
 	},
 	{ },
 };

-- 
2.49.0.395.g12beb8f557-goog

