Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139D0221544
	for <linux-samsung-soc@vger.kernel.org>; Sun,  7 Sep 2025 09:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757236450; cv=none; b=WY1OW8HJC6IXzMz7Y/chu9igtUAJ8xOlqmQUEJnFfFqRF5lS/ycgF9/zYPRvwF0O3/OklgH8t63Lpb5TlsqDII67y7RC+ZBE/hcy+DRp0nuBuUKJxr7O96HCKqGO7EJglEAozMD5BEdh5e8wZDeexMQhaD5zkpOkRyTB31WSjqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757236450; c=relaxed/simple;
	bh=bjjOrCQY7nCRwJYjDCDSciNQEkgygJ3UGgcY5H/xmAg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o7Yp4f+sKsUFiTC00SJRoho3tCCqg2ZTwxEhpE8Grir5yluOMSCwQErbGmpVx6II81juS/saZ+DPB8g4sFAlC6LmoqG8NmIJe+45gHAzi030kBczDwPMHVTzPYtP9tapX2RrUoMdE8ds8RT1JXyDh9oPg5a7R6+HDDnEd2qCPFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pMkEQiI8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pMkEQiI8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45de185bf68so173885e9.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Sep 2025 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757236446; x=1757841246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsp0bK/nuIonUnBqY9AKagtiSrgSRD7fcSEn1YN+5DI=;
        b=pMkEQiI8+8OgDZi/+a9rJdkYDyX+icHpXyTQw4Bj1noiBGdnH51qHkOVu78nVCZ4cL
         rapQ6FaDJLlofPEF7yeCgzHCjTxE4Kjxuu6J6p5h1tga09tXm6ctE70HNyAjJE1XcudT
         5JDTewC7YuWD+uMsPkFqW71cIkCa7AIefNHpaQpcXI9/8Wh6gq69Z+zVtxvaGHq/qDxM
         ZpUslxECbRr0qcCl8Q1a3a8w8lxyLSexTVNAHrX/U7mhM5S9iXANp/76Xq1eHB7C+jNJ
         AtdyqFY8ruaX/D3xe1B9ft2KqH4WF82mUXBSpJHFYjXKfYJXcNOLOe77OpwNum0hGQcR
         Q6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757236446; x=1757841246;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsp0bK/nuIonUnBqY9AKagtiSrgSRD7fcSEn1YN+5DI=;
        b=Nmjk+iCxAAsYleuFRU4QPfC0odNzDjb+FR2qUMKQN4CPzF5PGHN1ytIObZWLxwTsNQ
         aZ0dQLHEIV+2dy4g/OfMg0NrhS5JJ6Z/V465MTVC9coNZ9PAKFgA/Zk2Qpv3JX/9BiBW
         WCNcW6fCHvUBrY6l8zGdwLds+3r8GL+BFBrCyfqartipBIp9FFve5XIJ/za+evGFvnjM
         TSHqtdzu1hJYEjuUr5h90EXU5i3WKGvMF1k7U3WTCufW1vVJu4GxhHi3RfRZn8HfYOT1
         Hq/GF6tOEUO9zafm9dx9sMZOih779UstfxNlmnk7XUg9/dKL4fwWCly9oAuFqTFNAvXC
         fjVw==
X-Gm-Message-State: AOJu0YyCToibRcwH6P0cNXlt6zPkyKmF60iqQEN+wAwbRCbOJ+Y3HVTG
	TwkKg2LNbIGjPhfr/Q6S4uQTibzl+0kCpjOczuczOUtOz5FvCUXdEfduTyLFA19EkBs=
X-Gm-Gg: ASbGncv+WRfyETuChU/415z2nx8wAFgiyUF/6qsl8HA6C+1CdlFweGy1z06W6G59dfI
	79+Jm/LF/MTQe7LifNCysYEF1mtSUbaAz4iO1ZJHrsCZzgikHIZoxx1yDmn8QHA8cbeRo2yM+mv
	zL14tjepcMwD07JGbk0gwmClNB1HP2tT31pDm+kUag3NpILFgVKg2f6aiCT3nr/hTwcSL1HaMSQ
	U1ZUXDTLMWFNfu+PrqahYXkHw++W/2H3FiXyXgdkzWlaqqIaDrI9ZR1hV3e/E04IguE9dW+MqMR
	hoZjwcyaQkBIxmyCFf6JwuyJH0FfMZxjBdv0n0tYPSpe+g4PKgQwPCqK6WvAkqB1pKFvt70LJiK
	YZ2oqe5xvtK9O7GyqdSfrizkPs9wCaY4JQfAbCeZWwDH3dTtm2g==
X-Google-Smtp-Source: AGHT+IFQImOn+iq/yUmUyBTZk4IQaF9iLgVYYsVIQC7hi6Y7Hlt3FPdtOjJo41ClE7NuPr3IM92ZKw==
X-Received: by 2002:a5d:5d12:0:b0:3d4:6abb:7de1 with SMTP id ffacd0b85a97d-3e63736f694mr1567362f8f.3.1757236446397;
        Sun, 07 Sep 2025 02:14:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e21e4c0e6fsm10918962f8f.17.2025.09.07.02.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 02:14:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
In-Reply-To: <20250904-perics-usi-v3-3-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
 <20250904-perics-usi-v3-3-3ea109705cb6@gmail.com>
Subject: Re: (subset) [PATCH v3 3/4] clk: samsung: exynos990: Add PERIC0
 and PERIC1 clock support
Message-Id: <175723644487.30719.10030399153447295312.b4-ty@linaro.org>
Date: Sun, 07 Sep 2025 11:14:04 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 04 Sep 2025 14:07:13 +0000, Denzeel Oliva wrote:
> Add clock controller support for Peripheral Connectivity 0 and 1 blocks.
> These provide clocks for USI, I2C and UART peripherals.
> 
> Some clocks need to be marked as critical to prevent system hang when
> disabled.
> 
> 
> [...]

Applied, thanks!

[3/4] clk: samsung: exynos990: Add PERIC0 and PERIC1 clock support
      https://git.kernel.org/krzk/linux/c/b3b314ef13e46dce1cdd97a856bd0250dac8feb9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

