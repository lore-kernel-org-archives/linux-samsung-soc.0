Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2271C5D62
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769569; cv=none; b=l7ZJWwbiQstUfX8TeyX7IcuzUPHGADlYUUaGlxI5nbfgEjwHWHJkbnWU51lFXvDafFEocYxzCegU2KRZUQ48QrTRkwRAFMvM4zXVvwDM4BsH4cFzQFxuDNnlkjV5Zv0ciNgVAklJi/IA0xEx/70Zwlo9g82+lI5p7PvUotA+Mw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769569; c=relaxed/simple;
	bh=ft5MMINeJ0ZFFqsyd4wk/QMt+OACxl4RgJok7sE3LxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fkc3FNI7RpkWYyIbSL/W5JFbbqP5/e6nO3pz5dpC0CDd347VpCjz5g22TR09/noneTvjX255JathQ7AYDn6tcOGsvItTO4GYDa0OxCa1IV2epNQAUSZ9EFGZXXwNRLiChxTETUCu9PXHPzmuDiE5DnvJLa+DAV+wwP/wIO0AONc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bXVHTe/l; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bXVHTe/l"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac25d2b2354so632202166b.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769565; x=1743374365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76PH5cHSw8HwRSSvCBVkDwYPjRgUpAN3tWdOoIM1T/Y=;
        b=bXVHTe/lCcytO1CcopVSOr+R+hBF2n7JErX0VIIT7eeqljv3nLzD9yrWhU2FJRKCfq
         nrMVP3DWwwhuP3uNfZr4lsR1IstuIYajHcIuGpOcAZCaNGBrJ5HD4HuDdhBRjsK4UhLq
         qbdb/dpq2m6Hab2PG9Qa1jvC0x2/gTHdDcRsF30MW8rFDTLPkOhKjEg4tXBCZ2b8B5s+
         TwsC1hPhNTMkD7LnUqF/Fv4no0EQ7/SZf6wuR5uiA9EntK7eI8CPloNZTWPs6F301sM7
         NtxzmRhE2IOAs5UjqFaKjDBOJVUmNa0D7LvcOOUA/HBuCoO0J+r+S7g4Oz7idMYVOLAg
         kU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769565; x=1743374365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76PH5cHSw8HwRSSvCBVkDwYPjRgUpAN3tWdOoIM1T/Y=;
        b=BLGHvNPPd4YpX4eTmUPSq1P0yf0mZcuOnUupt5H0dFDSf28MEoCeJ6chHVkjdD4XLg
         r+GEPkutBtCCYFUrqcleWCIQftDxjcCSyNbTpWdYkPjdRoqWzq3cv1SvpgmXd+mKhP+r
         A9fIoxO7z6z3SGb/BornlmR9VS6lkEE2v6s0LjdX/MI2DnjvR5BD5cwCJHq3nMFgSlLI
         IFKIOH4aY0FSNsw5a3+Wik39sZIXokvMeptmHBnCUaiIP75kWJpn5oX3w4jjioP0wNTZ
         GeIihPJjmCj8Zcb0fOcOagf3cQYRjRCEY2E00xTVZ7FgptAm3DQ2Ek1IeUWG9beK3Cf4
         TdcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6cJdWZo9+UDInLR8lwcippBMAM/LBugqvSTn3yNMEWi+FtTUwq5bY0xIMNNFJ+bTHNrabO0nQSKZcZgoTiSsf9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIul2/3loraQJd7LCHT2aJ8dz6H3pWhyhyg7x0Y2IKWJvLt/MO
	p5VbqHhGTyl9ZGuiD4E/v3QS13hKyVqzlJIZABufciHJw4o84UoG+rZgLQeuZCk=
X-Gm-Gg: ASbGncvi4mFURGiI80VwPkghU9sq/LL8LGQjp0bHZLJdOoKTGg6H3JCnIozqzw9+g0f
	iM9gqx82j/ckU0r+iwpUx6RKbY1IShYo68A+IfKvALJHuuYgpkyHXeImuj9aRUrHrLYrk5KQEEl
	WBxhiMoLi7saTyt7HCMiPOxm7/+2vE/lPpsvtDZO4IAzrDlmmT9bhOn9hhxBqzzlAnsqmF6/IjG
	AileXRXKliKLxopG1OuO1epSje4Qtxvgk2e9owA9e0LN0eambES0O2UBnmupeIDitBfZJaFc/qF
	PhZ1p/BYfZBTYIrmyFliDmptYFCepo6+Ci0amv6lYNeIZBLNKQzy4DTlgv0AZiOKOOg4EC6eiy4
	E+WFNEfPwTfZK4ikMfk5iSCYFjumZ
X-Google-Smtp-Source: AGHT+IEYfWzNbR+K5DYstAqClR9nSakyWw/N8LzTya4wskfRe5KrC67EU110F2zXc4Z6WRaZMMlhIQ==
X-Received: by 2002:a17:907:7292:b0:ab7:6fa9:b0a9 with SMTP id a640c23a62f3a-ac3f208a29emr1120053966b.11.1742769564738;
        Sun, 23 Mar 2025 15:39:24 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:24 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:18 +0000
Subject: [PATCH 02/34] dt-bindings: clock: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-2-d08943702707@linaro.org>
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

The Samsung S2MPG10 clock controller is similar to the existing clock
controllers supported by this binding. Register offsets / layout are
slightly different, so it needs its own compatible.

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
2.49.0.395.g12beb8f557-goog

