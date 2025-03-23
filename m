Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433861EB9F4
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769590; cv=none; b=AaSCHz7Gx+aK0gBIk4L7Ee/PtEo3eImf5AdN9bPGxmywCBIpRZVQzX66Wgbe/e6trMsxJUwvhhiklkCKvRJ/rWkcD14BU5qhG7nmNtvi7SimLehzd5HPzz/xFKnt9qn9zPWqbxVXpDymRhFoIQQ5ZfVrcuSBzuH5uPYr2c/sL8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769590; c=relaxed/simple;
	bh=4+DMC9tlZSVxGow8DqTZFfBGSmBCzD9dumGbvfgv2jM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tFIdNqPrP1sicF8vNdoTOroE+C0aTqRwzozZvJVKodG5H6BA+Xze2eeehoCt+eHN8THUr1kkFG82nKEUQlWyNVSFrEWCpcxFtD9fYw8cniodr4iHZsH4hlVGnYs8PmmJ0Eskn4QGy3HRxzCr1+53JcUJo1o0UbjFeIEEj2GJKWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F/adUMDC; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F/adUMDC"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so567675066b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769582; x=1743374382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFl8ti8LLZE4LPxCWkejP2QjcAENJxbtxTGfboQDJno=;
        b=F/adUMDCgeIQn48hezFMzA3iy9ykNsZxAZujlYI+2S5mAqvxAzFPzEBrS3DaHa2mgT
         K+RFpDFGFP927W2pvEtsJARxOiru3g+7gXLhda41gu2k28r8NIdvW15xjUlV1WU2Y6K5
         NNBqOGi4qlbsupsM2T83kv3uKX3q7ql+ZcWNvYBfIA+ajJP2PFCAuDmBrsldUl54fizf
         7EHB2dtdHXta9MuVueZ/g4vuUKVmlk73VYuYTzJFs9cRs6rmUt5H3YcZPckXthRH+EYx
         FEGUORCiF00Bpt199J+2EyueV4DIBgiDW3oe0uipdXmp55mE+jKN4/9pjm6nTatarjOf
         RkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769582; x=1743374382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFl8ti8LLZE4LPxCWkejP2QjcAENJxbtxTGfboQDJno=;
        b=H6ZqFzlZniP460gQWyjAz1LL+NSpBypLMNPog9dUp5eSQbAl2xfqSyCAqbQ23mEu4E
         twf1wrkI8QX/c13ICFF2tM+IVbPubGPmyIv7Jrx1VRRvaSQdJEu4xDOgZwqINhieL2mH
         NZ1crvRB3ZdtrUzPINE6nwI7JKraW2VFe5cjT8sM4kHSkoH9J4lKEsDuQQld2ws496gv
         ZDwyF9yF9BhFPkopktS969mS2AOu59h92BQRl0SuGd4ludj4KlQeBHLWhHtddFKuiUGZ
         hDGigvQ3aUpclvQOa9KmYqhJmktL31y6jnayiX1sVPGqQ7cCLNyCW9qIWDmpTMI7hmT8
         DlWA==
X-Forwarded-Encrypted: i=1; AJvYcCXHJrzf0y1Hn1cDpNIKbVTEiV/c6vXbHchl/qi39oIi8HiT6Fjt+QQt+QsHESLeAj8eEk93yssMsw89ZEadSHAn0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJf8VokiBasl8Rgf0cD6GqGBG1dnQ0CTkyJWwVJggf4OHcoDHK
	7Qwhkk8AQZIVL1phVWBMxTIbzp4QtXGhont5/z3Cp36eLA68FmM3pjiik/b2aqk=
X-Gm-Gg: ASbGnctPuVlTshJmDJjwNbfS3CJGMPquImpaVIzlYaVIvvEpEQ0b2VF5Q1K8bvK+7jq
	XjoEt3YJPH0oX/mOgVWufh6T+MwpaQenijg51945GP/Kot78i7EtgIohavbnJypabVkbwGvrVpq
	nXM3JBalCTVnOJpHwefE0L6SYQVRvnDlmw3QsAHPoAEAjVMdFIy5XA4jktprqjbmj8V9k6BLwAf
	CSWRWQIMPiWxjeOW5VYLz1UhX+t93p9KshyetWhoEm5ycNf5184Xolhx3+/je4lVo9FdfFEMlgl
	f04w1leBKY3FkUIgSm7ZhFiPU4SesP/64MooWW1nUl46Brm1HdYz09aQNwVPvzgi9oiu1GDIvYm
	3B2LM2gRl/Al6++lVlFYkSbSmK9NG
X-Google-Smtp-Source: AGHT+IG4c/ltmFn+ZYM2U03LWJ2WSMibTI8JvVco3lTM01jqnuwgY40zG7FK43Yn/mRbbubKlLsYtw==
X-Received: by 2002:a17:907:c1c:b0:ac3:422a:76dc with SMTP id a640c23a62f3a-ac3f22b52f7mr1161510866b.34.1742769581788;
        Sun, 23 Mar 2025 15:39:41 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:41 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:47 +0000
Subject: [PATCH 31/34] rtc: s5m: switch to devm_device_init_wakeup
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-31-d08943702707@linaro.org>
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

To release memory allocated by device_init_wakeup(true), drivers have
to call device_init_wakeup(false) in error paths and unbind.

Switch to the new devres managed version devm_device_init_wakeup() to
plug this memleak.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 7b00e65bdd9c25b3426f92355f8ea36e66c3939f..e8e442c503064eb4e570af5bf7dcff6bfa7f4656 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -779,7 +779,11 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 			return dev_err_probe(&pdev->dev, ret,
 					     "Failed to request alarm IRQ %d\n",
 					     info->irq);
-		device_init_wakeup(&pdev->dev, true);
+
+		ret = devm_device_init_wakeup(&pdev->dev);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to init wakeup\n");
 	}
 
 	if (of_device_is_system_power_controller(pdev->dev.parent->of_node) &&

-- 
2.49.0.395.g12beb8f557-goog

