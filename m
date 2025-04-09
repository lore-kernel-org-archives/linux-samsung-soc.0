Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F5121CFFF
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231078; cv=none; b=T8lm3AZt20DOrYN5GhAhfwm0NBqH1OXg6VJQt1v941aTF1TF6i0Mydf7sUAzeqEDxMZ+bSYfsIlKE+yoN9lT8L0/vhnwPXMXFnq2K0Fw6ULPK2p3uwGQXe/4SSZ37wcqQByt/HKWqOFxcglEgb5b2c5dUz7Yf18xm2mDO0cbJ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231078; c=relaxed/simple;
	bh=CoKrSJInLiIXwlY1ZZ7M5lRUgwJwFwDmaqWcxDpmqQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fZ++eVKl5SHz77APZ0sh0egcbQS7QpP0jFSLKxfb/YhUms9bbSI6WPwxaMh6SXm12RFiXSNDYYiPd/SIh6F+WHpxkdvk/uk3fJl0Q6C6YEYCEIFtBAlYTepmTmwHkrZyvTU+3a+fEpjoXrkzV4cSlTkw41yOn1ga3TeyUYArO2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uQ2JPrfy; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQ2JPrfy"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac25520a289so17184966b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231066; x=1744835866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Ow5hOPbiIZXZpWZ6Uu6oQmw7CcTYqg39bQG6yedoPQ=;
        b=uQ2JPrfyUL4InhIYJFfMorllx1mzrBQFlwuQghTNuTEbVA9uzUptUuwbdJBoR7sROh
         daTsVIxDMfBXo7w+dSyQIlEzyUb9SpHT0s+U2OejvKDOAe3f63hTr98Ocglgvzu0kOiW
         5aPEr7xyLzTl/SR6ZlMYr3KMb2J5nR6dp7PwMY4q7l3ifdl5qy1+OgUVTT277z/DVMtl
         2C09nOWOU+haKmfD+V5qqmX+QlaBeru5pUvZXVlQFAbDo2gCCRE1xllwbOGyryoVxG9o
         dXbAP/8Wj70FG/MrKFv2EC/bpoxg3391AilSGNJjDySBH7hlpRXOohBHIJSVpJIL6W02
         aTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231066; x=1744835866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Ow5hOPbiIZXZpWZ6Uu6oQmw7CcTYqg39bQG6yedoPQ=;
        b=aIyxk2Rj/FIl/4O2Lg+2z8YOGXvf+D5lwugSpc/qx523O8WcJ0V7rh/Hrvr4D7FQFI
         nU3VN0PX72GG2zhvsrHwyL46OWkdHI6GICBTcL2Rqqff2GABxvGccOJ63zfMuCwbvP1S
         HxqmKPuQbdCXRzG4OiX2ArdWh2sbvBvSTbqHB2T5/8D0d6pNGIhr5IBGR0brSrZlJyUU
         m1mA8vefftScYmprfA0L6+xgoa75cTn+1S6pXwxP5iMzXscgAklwcFunKmRvXQTBSYSz
         cjTbHMifuYg+hWQYzNExzAaOn2GgWGFabEgMNyRogvvJQFaB5ho/78iNPHLNYY6Rt1Jn
         8BVA==
X-Forwarded-Encrypted: i=1; AJvYcCXFasuqbex5CVrObG+hb8zfbzYa74yDGkMesB6Aw10tgpwIMwRJdrrFBfvWbSUWZOAVFiqVg9qq3nzcFqTc11LoQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq241nyDzJkx/pfDHVLrfZ5Pqj4iKmd7nz40rBoOQ6DQQNw6Bo
	b/IwAzxz1GmGKEJmx/Nyjxwmik+5STCVs+hDuah9qWrpbrA+CxuquqZe61T171M=
X-Gm-Gg: ASbGncsyAuRd/0xFWdROxS2XIcWlZ9NcVeQzB/Cks9pSc+V/0fGm1AjAFFURQNYbtNa
	F/yeH6RgBXJDhZ/NKhfyOO6TJBCffCGPYinbt6Wixeqd3g+W9CneY0vgapDCjfP84LVq65Fu17w
	kW34jWMFhX0DJpCQWy0jMUpLcrBN19pZMZKcj5GzQwEo53Sxm091JE9PxP9Zto2KcCzn97zdsYk
	AlezFWLC3Z0ew0Bm/iaUkaNHquYWkj+NOaiDix2LVK5Wgt818pzji5hYzvJJxyuByXfkUjTUGLO
	cDBMgxSN8IMJLSH2byMvoatXjWz8tybAoJY5r310MUWHIKxc9xKP6tMsLxeKlPpZ5wNQEU6cVb2
	+LhZ1xcbEBoFaKzqfjkNFs5DEQPI=
X-Google-Smtp-Source: AGHT+IHIxFKwjUo5uFV6Jyj3wWXPZsF8lPwam2ydOiylWhWcuYhWeTd4XU5X8ZDB51XZhRzJ2FSu4w==
X-Received: by 2002:a17:907:7d8b:b0:ac7:9acf:4ef with SMTP id a640c23a62f3a-acabd4d7131mr6904366b.56.1744231066055;
        Wed, 09 Apr 2025 13:37:46 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:53 +0100
Subject: [PATCH v4 32/32] MAINTAINERS: add myself as reviewer for Samsung
 S2M MFD
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-32-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

I'm working on a Samsung device which includes this MFD and would like
to be Cc'ed to further contributions and help on reviewing them. Add me
as reviewer.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4d577b54d798938b7a8ff0c2bdbd0b61f87650f..9f05af52b062d8cab0f8b48b2625432108604c3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21397,6 +21397,7 @@ F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
+R:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained

-- 
2.49.0.604.gff1f9ca942-goog

