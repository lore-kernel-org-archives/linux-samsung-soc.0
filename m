Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169B91EF39C
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769593; cv=none; b=jX5zBZXavkiuzH/gg5HjOSsj20DxW+5lshppU9NO7N0OfPiTG+8E82GmBvutciFh3Uine1BIbkAPUqNt1bbebGLrHMMvSQlX1UnwlgqFkDUm0sDOq7mkJBh89CLeMS3VM4MtUC53LWfi+c5brh2kKbbBLorWSnEtp29Pnugcd84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769593; c=relaxed/simple;
	bh=H9PnjiGdaPmfWukTzjrtFxLU+96UeMWEkuYWR2ErP7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EwXoXmDFr6imyUvLK9fju7Id2gRZ4ueB0/9zAfCYfp2bvE9jM9YIBmuxqlgH/ObVXsh0E82G2tqN/6SRELPGfWL88B7ZJHfX2Nc6KbVKGBSyTDb/jUslRhFFUC32NtU7NoTUn6uDyNieXaVuf1Gq+rfR6oMiXhgnyrkyR7j14v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sg/BoZUo; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sg/BoZUo"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab7430e27b2so806343166b.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769583; x=1743374383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9zuZxWNg3rbrJTairaqhANzxAqu72T6zzPhxq7UOmE=;
        b=sg/BoZUoO1vvhUz/iyXWR/MXNTeBGwofC6UNpxJQrUNNiw4KK7eE2KsY4y7RmEDrgc
         CJDWqICOsVStbXFUlcoIpWqaRqmNNCv3c12rcDsZ/VNGnK6VtAlsbYR3wNoU3zuaC46C
         fwz7FHf6mwR9L+LRktEj+XD8Vfg6qal8O9QomUJ2Tt536IPiTrdB1ffkNYE9bqYyKMlc
         tnWoNjR9gAQhM8yrQ9ooN+jhbYkfFc/NTsvVLHYDekiMBbo3Lw/btgm3ML3LS3PXwz/t
         kOBqxBnV5cVs/bHhMlwVsJk84DAfki4LbUB/W/IVthCI0pHuv19sX6FD39us8LONlxYz
         8GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769583; x=1743374383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9zuZxWNg3rbrJTairaqhANzxAqu72T6zzPhxq7UOmE=;
        b=vEaBvb0MUdWXTpz6aYcXg1tcEeLOvzfD/csnjVRt/CnFCqiN1AjBugtEBGheRckzgt
         7ZHVCmH4SGNIx/D8p1sFR/CobfDQUZqwNSRApq3U2+Am0FvcLTGiV9Z8Y28Zd+BkPH5g
         SC0Gk6Vi2aZtgCHmVdTBemjjoLPTqWtIuGJa4rIJLqh2XTdamCLI1ZqpR/2c/ykwBcpu
         um6XYZ7vkgHo8WE1LfDu2LhfXLYM2c//rtEVXJhw3NNwJyiB5hLDw1HAWgI3XyK28AVE
         Q9Kq/tpzt7/3tSsUdhcx7ZhGwOSx0RkKTac1qjnnVcPYBBmVssWj7owtkvB1Ndl5V5KZ
         1qhA==
X-Forwarded-Encrypted: i=1; AJvYcCXH9LyArmM8FZt++xDkFKhTjJKhqTOl+KObW9L4UHCDpGA3Eug9TCRC2e07Vfzwnycnp7UFXFATsUF9/067Ho+A+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBnTucen0TaMFUWjs6pX2LVtsTKGZT/rLJdjFG2pPFhV1B9g18
	sCsWzn5ZzYj6akAzZvB0m+0qSluJ23JrS0fxvcNGMd+09DBBJF7SzMtKQGXnR0E=
X-Gm-Gg: ASbGnctX30dYZujRczsX7V9r4LoKiWPae0PooBiXwy6oU3Bo9Zv8P7MKAVQi9d5dS7X
	8JoJBqyThc2btzCKMmlOy4MJIbM4ghYZ8LQHZ23Zz214C91GlZF4FkXgZAz04cZiPYkvQmEdB6J
	9VheYhTS82c1A7HVGYxLwb8d83LyqgxV5Rbn9WNBeJZ8wTQbecVm1mnN7lpixpn9TxdoW5OBZ9g
	MGb+qdC8VlR752JD7WX72r+zj/qjlPVIqAxopHCaOqj5FPbJr61SrmH+/HSQs6nfu2EhME1ILAS
	JltrEQAzQZd7Iei0JjZtrlgXDVm9wg9wzkbn8b/OOfI3550NZl93+fNwlf3CcqVN9BfQOqT8pqI
	1B6osmJpj2Oov/bRNdM5BS0dmmyVdThlT+Ek/sT8=
X-Google-Smtp-Source: AGHT+IFs4xHKZtefwGlVOQ1hTfmO2hUQ+8e+EVgI4+xRTbfzM8/S+AZdGH6X4/sL+XMu2751zvkyBQ==
X-Received: by 2002:a17:907:7f0d:b0:ac3:3cfc:a59c with SMTP id a640c23a62f3a-ac3f20b9b10mr1154328366b.11.1742769583314;
        Sun, 23 Mar 2025 15:39:43 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:42 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:49 +0000
Subject: [PATCH 33/34] rtc: s5m: replace open-coded read/modify/write
 registers with regmap helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-33-d08943702707@linaro.org>
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

Instead of the open-coded read/modify/write sequence, we can simply use
the regmap helpers regmap_set_bits() and regmap_update_bits()
respectively.

This makes the code easier to read, and avoids extra works in case the
underlying bus supports updating bits via
struct regmap_bus::reg_update_bits() directly (which is the case for
S2MPG10 on gs101 where this driver communicates via ACPM).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index fb65a8e439d72d9070751c00f5826a403ac0b416..2ad01fb3bc72fe9259a8307584c9cf3a839bd492 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -279,17 +279,9 @@ static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
 static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "failed to read update reg(%d)\n", ret);
-		return ret;
-	}
-
-	data |= info->regs->write_time_udr_mask;
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+			      info->regs->write_time_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "failed to write update reg(%d)\n", ret);
 		return ret;
@@ -303,19 +295,12 @@ static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "%s: fail to read update reg(%d)\n",
-			__func__, ret);
-		return ret;
-	}
+	unsigned int udr_mask;
 
-	data |= info->regs->write_alarm_udr_mask;
+	udr_mask = info->regs->write_alarm_udr_mask;
 	switch (info->device_type) {
 	case S5M8767X:
-		data &= ~S5M_RTC_TIME_EN_MASK;
+		udr_mask |= S5M_RTC_TIME_EN_MASK;
 		break;
 	case S2MPG10:
 	case S2MPS15X:
@@ -327,7 +312,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 		return -EINVAL;
 	}
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_update_bits(info->regmap, info->regs->udr_update,
+				 udr_mask, info->regs->write_alarm_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "%s: fail to write update reg(%d)\n",
 			__func__, ret);

-- 
2.49.0.395.g12beb8f557-goog

