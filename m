Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13A0241CB6
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670744; cv=none; b=RAzf+AuAgK/hrvf1kR34S5sw8r4rSlS9o780+R2KgJsu7aPVJppXWgtX1q9290djSk9aDwalT/DIPZldX2w3UMcVmusvcMs+4Ax7t1eFCMauVB/ftCifNmLe/Vymni644sKp2uIrObYUvaS+Tf1sfpMRbZT6vCMgb2fZReWJTdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670744; c=relaxed/simple;
	bh=GY5aflUP8HyQZVCvYH781i7uGwHWsWCKLpX/UgZ7jiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lP1nWQv512VWAVg3IDGDmRCXA9iqubBH9UhRc7jrcH+hB5jblLp12ZISJPPHhVMLRPubgDHcHkFXV7cvndMEps/t7ukeqGXHcQNSVK/qQprUmcCtei4giiHU2MOHLcDC5Zm/HwWu50m+Ho3l+It66Jr1iJZFp/Yu9spOmb4QpYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zMfY6vZo; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMfY6vZo"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5eb5ecf3217so1241060a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670740; x=1744275540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/wEh4QmLnuluQvbcZ6Yqq9yXOMvoeHgrUwhyH2g5L8=;
        b=zMfY6vZoeD+0C+rJjnkjVt3bDkOAdTXIiZAFKxQECBujQ8CEzEwgH5lM0KDR1GVhg4
         IB6RmNOQnmB1sPJrzkIm90OxheOn1KBdZW4O6gcT9IQRszdJq3QbhfSPRb+w197+l3Iu
         a3hy4Hc+uX9th4a1/y+FVGMUQhI9w99XhPdBkO/osh+phqb+VxYZZm5Pxj98h/nAOCvO
         OaORvxhY3mmS/EX4ipCng5roXPVOyd1MQo9IEy4a4tWLFe2l1ghafJF/fQDb6XKhroYC
         jFPC4YbidkKnscT7zB4iO/RfH868ambV3SjiY0o8GTdLWFeeJQwn0ZZku+rhwcPoLpSy
         fzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670740; x=1744275540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/wEh4QmLnuluQvbcZ6Yqq9yXOMvoeHgrUwhyH2g5L8=;
        b=vEHYjyn1glOrQYAOGXafPoKpczUPJB9zn6wHUf27to1TZbmQ0z2hDU3PGp5yi9iN0+
         zwS9MGCTIToWUofJkHJlrKe6g1z0BFVYYRt4k6/6sy8uxz8Lms4DXMaWdQCyZt47JlGM
         oCoOCIhY6L4eAtzwrMccXtB6nMcbeBIQy7YyBCJl2xS4oeyaDNnTd5uUe8QtMD5e8Z3L
         Cfonuo5ozAF7R99ak3mURtqm9E4KW97dbaXkNtpLmfM0odQ5iFMIG4QK5O5pQVCUp8ma
         gmbRG1eL72FFwmw4PmazTDcT5ZYDHo8FyoQAIkRzxRzxidlzhN3/jc6t77pAvI7sPid3
         u+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWJkiL4WlCg93T2/f6mAUM8Nob6By3WYG4JGZCbtOWiHGg+jL1kha6wvcsIeW509/FjWqUttERUHdaQ7oMAjzJsnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy61l24wfuMEhUUE5wVc5zCvzHKRKgmz+BLsFe4us96dsa8sdsl
	caLZSY4uogtJpD6HBMgm4pxym5LbJMjeIfcv16g4Txd4WhwoBUOx5HIMwhfOz0c=
X-Gm-Gg: ASbGncvgHeX2M4jQOfUb8DaCe/OAeC+xBt0AiURrHFMIKPnAow/oQoICyE9fnioGjJm
	CeJa7jysKHlC1Dq0pOGyczZbBJZgmW9vfuXIVM4jPEFgtXDpdHNxzak0XWYHvgCU2+nttUtCB7P
	dR4e4zfkaCozVwRVqYpAHFDjqp9zgsM5MCFf/pR8CvV6y/quXIpL5g5zrVPptWEGMv+FHo1hTi0
	ZPfYEGe0E9M+5m6jABmsslVm3By8g4UH90lV04Dsz0ujJ9cyVOjeyspw7qRhrsL0xYD2ROPmYy2
	YhdTLOzrWu1/MhUVbV9fUcyakBSq8fYkZztFXwfSYe9JNJwrCeV5Rouv+kG8cy/Ow2/0vqJ/3nY
	AkiuzU/WsqFJRyg6kuBUPexFtQ54s
X-Google-Smtp-Source: AGHT+IFpNCgTUy3yn5kNBStSgNtkMlYeVkvi4R54YROwAonbhkdXCkRSsgfQeF745WZBnvMJR3nP5A==
X-Received: by 2002:a05:6402:27cf:b0:5ec:958b:6f5a with SMTP id 4fb4d7f45d1cf-5f08726ef19mr1525065a12.28.1743670739930;
        Thu, 03 Apr 2025 01:58:59 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:58:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:54 +0100
Subject: [PATCH v3 02/32] dt-bindings: clock: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-2-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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

The Samsung S2MPG10 clock controller is similar to the existing clock
controllers supported by this binding. Register offsets / layout are
slightly different, so it needs its own compatible.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e6053a1881650b8e8ff2524ea01689b7395..91d455155a606a60ed2006e57709466ae8d72664 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-clk
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk

-- 
2.49.0.472.ge94155a9ec-goog

