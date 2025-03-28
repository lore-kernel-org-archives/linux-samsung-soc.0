Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C6B23643A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168677; cv=none; b=SNkQ3jtA3QGVL58jEVSUK4RC7II2imJCufrTSBMVnR+7aVC+/XjeRPTMSaB2bggLB0fWPJ0wCVLjj1yHrmd7Q6cxuw1TJ+L/aiKEM6nF8TAAwvXkx+ot7knVyh+HiVaaZ6qpdjtRiELhsiPPX+qxE0FJBngu5o70uQ+vJrL8xBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168677; c=relaxed/simple;
	bh=X823p7d8VeG19dJIhYLsSWA3HtswWk7j0eIGd+yYPcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ugeqWPLeMTtv9ZQjN8Rpq0xaqmrXZ/GL1pEYMvfq6YI+ShLsbKvDOlo/KJi6OrijQ2wOvd/sEKlb6MNI60DWm6C+Xos5UA9WgfL8hT6TaBUdWfNTxVN/o3qTS1Dxu0il4x4jq8jdC4IttMP9LOKNp+4xqaIxfkpUD9Xok06a5Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lU8nw+eG; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lU8nw+eG"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso3668625a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168670; x=1743773470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TCn0wifCdb3UC3ucEx7Zkhg1UJ6ww+TPiSGCbm38yQ=;
        b=lU8nw+eGPn8sYUYY8pW8wrAmszaAHu9XAx8uMAYBv39XNsOUH++MflwfrtZxjxPdGl
         W8ZiBJtB61yW1SaHlo3br8niEBunD35aSOTcXYFAoD4x1m8zdzyiYQa7NnZwoOVxp8Zg
         0/62ToUJ9cxBM9EWRCGgfCVefe5tuJ4WmRaHq30aMwpeKjfcTP9UbKMnKRwypr+HDWOR
         6sDVPFPgc8P5pqvjiztX5EykPZN6AqDwT/Z4n6xhbuzPTnNqpML7mIrsze4pZgX1+6UQ
         PkMrUdpSwyYIhaiT5/utbbcL7EqFDn6K/nAg6hVkBXWCCxeF1sv96r1anMWYTd8Vy8JE
         6AHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168670; x=1743773470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TCn0wifCdb3UC3ucEx7Zkhg1UJ6ww+TPiSGCbm38yQ=;
        b=Uz4EOHjWkvpwLulB3LIdEJLXgUQ4UVJVFXqD44Q+gi/Z/weuS71NBvnur7PLTNgwOE
         IAL7aFFmKX8dVcrxJDIvsqu5HtJEKuaz1k6hvj0PzFiZZDxQl0DiSEyMMGrmpsneCapf
         o1TyvlycW4VI4AJIZ88f9pQmzHmugKGJKOPZ9a3iWZmFid99qLFo6YgHzjlp/pHgSApT
         HZkZVcqCJ8U40bW4bqA0I8s/+kXwwT0ZAfvKmNhcxAZ64TOxhuGGbS02+fMsd3lKKfEC
         GtaNXxPTc2oGs8J7WShkj0uqdKjVw8LSdFh5OSEkeZ+JWFrEZkQm0MX/+u+z7TSEpa3J
         0P6w==
X-Forwarded-Encrypted: i=1; AJvYcCW+dTweiI0dw8qVF2MO+JWmy1QIs7HZuu1ePHs4PqzK60OkDd3U+DxSV6+A733N5YICfpYPLk8Lc+jdOtxRryt98Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfugzicGeWEK7JT4Ay3tL3EQnEsyiwqSx82s3lLBWEsKQercA7
	fz7SIHo2Q4qBC9YIm8+eiliVm0P/e9Jl5mXGehJ7ybcA3MOfzPE1RhQ/CBTq5To=
X-Gm-Gg: ASbGncto0cYwaWhjdWspwPgDlCsnsQ86LDRNG79BSw6l6SDg0lTJHcuhleDo3f9sIU1
	6ISDKyloCkJ5c3M/+8fvG2q8DBYwUvO+hljk6xHbr28JAQS1dVqPV6EKuH1owJ8Se6Btwknuw0O
	XM9Bq/57ZHt57N6jMftQwBv3l8Y/yD3s/brOtGgfhZMVavHfE3ww1+GS0eFWu/ff3KLEK5dduFw
	Nh3yJWvr1uDSUcpqVKgABM5RA68q5D67WxZS+f83yalUrXFgXwb8w8p1tVCgE9iRyti87oh9tUv
	XH0h1+v0k+8aMpets6f/R/rZTMPT8heudOsRzyiCpIw4dDS0lpvcJorsWOza+7Bp2+az9VLP0nw
	xzjULE6wjszJZu0umHVLuL0++E5YX
X-Google-Smtp-Source: AGHT+IH4AkvKS9gIeAEdf4WO0mRjBtbxCllwxmJHe2U/y4p8yWBXxd7byUvVNmfoRgEJ54AQL4uegA==
X-Received: by 2002:a05:6402:1d4a:b0:5e5:dea5:3eb2 with SMTP id 4fb4d7f45d1cf-5ed8e388e5emr8163708a12.11.1743168669663;
        Fri, 28 Mar 2025 06:31:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:15 +0000
Subject: [PATCH v2 29/32] rtc: s5m: switch to devm_device_init_wakeup
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-29-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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
2.49.0.472.ge94155a9ec-goog

