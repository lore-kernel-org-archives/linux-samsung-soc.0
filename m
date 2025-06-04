Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09F2192598
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Jun 2025 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050753; cv=none; b=BS/VITk4TlKD0jsa0FKmMSaCmSlpTUTA3matHTw2F2pO5dz+CW7cm3cXf9ySpKV2Ul9ddHGP+atJLJUa5nQCzsLARyDhM5VulMoZhP6vbI1/roJGw5RwTDjpR1pZnqa0VTEt/D9SWipbxkCn+d7tX2Xu8XcrMAbgXKGGn/1d8mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050753; c=relaxed/simple;
	bh=Gj+OkGgY96XAKccd1qEAmfoB1fWuf6GgMzaQtMdSNXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LhgmJvhhbZR0So/3pqM6I03HaQUvIFgTue28onKeeY00KEO9D6v7vq3b6/1q+o7mPSB+UBF712KOzdwqOvKaEfXeXaypiqorfP5zqzK+mv72mc0xrPscxHUWbbHuGODCSYDc5xNW8HTJyksSlQZ5h/MbIrd+CirQ5s61QO9oQlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rs12x5s5; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rs12x5s5"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60462000956so12098267a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Jun 2025 08:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050749; x=1749655549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GivaCqfw+oHHkwskzA0HrsGk/OrrGEk7Uk/oqYQ1tlk=;
        b=Rs12x5s5l6bap5cohSEG0hwzOkM2u4ZFJIn1/fqrDhrh2yJhCN78E9YRt9Gqhyjfup
         WaijkXC040eioUZrbQigqq6c03xz0vtgISmGXcmiS65ZVIxjnny3HN45CE3049u9tOJC
         p3A60+hCOVoV7SUOnhJwsyYdYaIGco5oHqs3tqtJ563s5h0o+I5kAboV9Yz3okA9q1MB
         fx9i3T0SQqd33L8P1qcWcxmqOvg4xV5R5v4o6fYRBE/WItVrIy0DX945bHlP3Gab0JhP
         qobqEY3e5ND2S4wTUtJ8E0FFZVKnNpcepTbGcDkgIz1qcsRQKT+oINW6GlDhHOrdIZhT
         jnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050749; x=1749655549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GivaCqfw+oHHkwskzA0HrsGk/OrrGEk7Uk/oqYQ1tlk=;
        b=IelAx2aZKtG3cEhzk6qAh3wgTJ/fHLAdzz6eFSAXuN9M1jJo77ky9UaVqTor0/Rvve
         h41dBHSFguTP/mpOjWtiRWGybjT3YHaHsobdk3cNyFNiebe/gpqhosj7y9hQKs8LQfh1
         sz31jsgkPelbZQNBr3etxFqZdZP2asPI5wFhWSUxa5CgY10k2U3Dth+0ax3csjr/7DjY
         zpbNvMkc90lpcfo1oKt3SN0nJEsW780Zkr3EQjnC5RF1e8pQBebfobtTzbRDs246nt1e
         pRqN6XrC6kYHGRSGW4kKvEtaTO/a0y19mwwT0uLC7qpKI4ZRZWRs2Eigs/NnldFpPmPB
         ebSw==
X-Forwarded-Encrypted: i=1; AJvYcCXPwwZkmbyLHDbd/CCQqzoAtym7+F0bjLsclijMSQyXz8R1R+t3ClzW536FofVwUUa3nqG9tyPaQe5jrMXRa20qXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvBP+67mGMjMBFb6LBV9mkBoSJiKC3cbXD0wHvz1B2VnU8danF
	8VBEqtOoXNuL5T31PAfTPlfA8UyItb8PINlmyx/lCPhz0CVdqFXFmpFx3oLWbZ4z4zc=
X-Gm-Gg: ASbGncvfJbt20uf8eMuF0JztgJh/1n0DaNdAAc7zSVAL2T4Kuo9H4FWz0rhWAmNk3N6
	c4EWxZD7MGWU3fzdPxUrYOabNO45UIvRG85F2ZqxlLu70CYzERGeYbY7bbBi7wIKuoLr75khg4u
	4TcBW9HxNrkofHaM+37MS/G29N5L1t5CJDtpUkupZ87/u8Vwz21qH0mHz5Gu33SPEgg8zj+KuAk
	yP1Grt5u/xje7z/YEo68AlPxs/urvg+ygmejdsLC7ruCtGzTHG8V0cwk+CJ3641e8rIov29nXy7
	HvZuMsENB6TOytQK44gRQC5xNdLzwgcyM2kKPlCLfq4PwF46ZomhEHdqgUVUiE1dxLi88gUah6O
	jQNcrCZFx+CyNhZ39A+G3P9xYYJbSj7PpatI=
X-Google-Smtp-Source: AGHT+IGV8hMofF63zCcJFZH5e/p1yvyUoeRTRE3SZ/3LkqyGQ9VGgvqlN/UR+F68PovdxN0Atb8y8w==
X-Received: by 2002:a05:6402:1ecf:b0:606:4d43:e647 with SMTP id 4fb4d7f45d1cf-606ea16e715mr3425583a12.24.1749050748992;
        Wed, 04 Jun 2025 08:25:48 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:48 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:46 +0100
Subject: [PATCH 07/17] mfd: sec-common: Instantiate s2mpg10 bucks and ldos
 separately
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-7-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
In-Reply-To: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Bucks can conceivably be used as supplies for LDOs, which means we need
to instantiate them separately from each other so that the supply-
consumer links can be resolved successfully at probe time.

By doing so, the kernel will defer and retry instantiating the LDOs
once BUCKs have been created while without this change, it can be
impossible to mark BUCKs as LDO supplies. This becomes particularly
an issue with the upcoming support for the S2MPG11 PMIC, where
typically certain S2MP10/11 buck rails supply certain S2MP11/10 LDO
rails.

The platform_device's ::id field is used to inform the regulator driver
which type of regulators (buck or ldo) to instantiate.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c            | 4 +++-
 include/linux/mfd/samsung/s2mpg10.h | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 42d55e70e34c8d7cd68cddaecc88017e259365b4..8a1694c6ed8708397a51ebd4a49c22387d7e3495 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -14,6 +14,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/module.h>
@@ -35,7 +36,8 @@ static const struct mfd_cell s2dos05_devs[] = {
 
 static const struct mfd_cell s2mpg10_devs[] = {
 	MFD_CELL_NAME("s2mpg10-meter"),
-	MFD_CELL_NAME("s2mpg10-regulator"),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_REGULATOR_CELL_ID_BUCKS),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_REGULATOR_CELL_ID_LDOS),
 	MFD_CELL_NAME("s2mpg10-rtc"),
 	MFD_CELL_OF("s2mpg10-clk", NULL, NULL, 0, 0, "samsung,s2mpg10-clk"),
 	MFD_CELL_OF("s2mpg10-gpio", NULL, NULL, 0, 0, "samsung,s2mpg10-gpio"),
diff --git a/include/linux/mfd/samsung/s2mpg10.h b/include/linux/mfd/samsung/s2mpg10.h
index 9f5919b89a3c286bf1cd6b3ef0e74bc993bff01a..3e8bc65078472518c5e77f8bd199ee403eda18ea 100644
--- a/include/linux/mfd/samsung/s2mpg10.h
+++ b/include/linux/mfd/samsung/s2mpg10.h
@@ -8,6 +8,11 @@
 #ifndef __LINUX_MFD_S2MPG10_H
 #define __LINUX_MFD_S2MPG10_H
 
+enum s2mpg10_regulator_mfd_cell_id {
+	S2MPG10_REGULATOR_CELL_ID_BUCKS = 1,
+	S2MPG10_REGULATOR_CELL_ID_LDOS = 2,
+};
+
 /* Common registers (type 0x000) */
 enum s2mpg10_common_reg {
 	S2MPG10_COMMON_CHIPID,

-- 
2.49.0.1204.g71687c7c1d-goog

