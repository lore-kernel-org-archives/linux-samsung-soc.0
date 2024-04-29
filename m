Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19848665A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 17:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714411808; cv=none; b=lo+anWmeaAbfqQi2w24UyI9yew/ZrE7YaTS9vEcl53/ksM26C4RjgnGcgwW/9kDVJc1ZjOLSFmmMSzh27tScZGRQQNyXMIiKLtQAa8c7gAcz0Xt7H/O1v0TmigQ+s/PweqAGPiHOMtHkIr/+iaDAUo7rCNPX/zbE88i+IdSyKXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714411808; c=relaxed/simple;
	bh=EW6kZKQhnee/+u7Uh1ONzwe60Iv1cp1olLQqZFlNuL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZD6xCYxX07/1NlPf+eNf/6NC4Sm/+Wx3tVPEwkxk6IIzMsQslw56HK8cn+mBPPjVHMxm8/RK6itUO6UpMoH2tZKvpa5xsLYpPLGUBHasj40T4mHVOOvDnU/UgAblr7qwfWLhJOEJb+k6PUstwJXRSo8thFH/yKdwoh6w9Kftiks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ehmtYhlB; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ehmtYhlB"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-571be483ccaso5734814a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 10:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714411804; x=1715016604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9Zpib5Bk7poFRJsSfMceDxizPwFYK7Xs1pErXif+HQ=;
        b=ehmtYhlBGxM24yxRKq2HcQQWHEw/nAU7bLEUBLPhbJosP4uZ0o0QFIJa+aLiT8DUvc
         56Iwdw2xBOrMh9sbIir6sAYluv1le4viyOT/Loht3/G6zC2DeFUixwk7MGVc7xahoidI
         Pjr7fdt6z94YEcjop25pxFcAykKcbXojTWpB5B64M4ftGS84ol99VYwjSAioAr5u0S/l
         zuwqt7oaflaozTRMgw8wsnSzXXWuu8jGlPBhar+bQIl4QfL3mOIMZz9GeheFkWYClJHP
         IsLI8PkklXPhelf1kWr+TsPz7a7bB3vG/hgHPif9rLePZ2p1lOXX/XzZVgjXTRyvlzTr
         Gy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714411804; x=1715016604;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9Zpib5Bk7poFRJsSfMceDxizPwFYK7Xs1pErXif+HQ=;
        b=I4rtiX3sEMcPiKfRP0chqi2F17L3rzr0yHSG5ypk/8acxQVj0tWPDENBA+nphjdEDb
         t6vCwLzOdAM4sN1uNV3HUzoJ5uY8hOFneodthiNuBqKL+EkFDLCEqh5lXpK+6wAmow53
         lrzyN3JHkf3Bs4SLmb6pVVcclcuUTIfwJ8WBXgGAEIUxDvrC8lgui8hGwQV7u5nA1B3g
         7nOr3yAHsqpyWUGBCf/wzYFTFGRsFS9uFEBLJetn/4ufTZ0G4An25Lx7xFJz955AzRTh
         qlDzleY15yqUUUq0Kg5FIujimN0Q/MjKb5aKPwkxbcIySY//UpSfifGTfJQ7jAf4zM0X
         NMqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUR+vhgNyDy62QrUJSGZ8jPLaV7qm2nYVPchaAWaCV16gEIVZjeHdsJpOR48Uc3hSHvwZVsuXMHKK+WFLmsCLgkn5fhZvRxJ9R9gvDQums5s4=
X-Gm-Message-State: AOJu0YyqdmgmpMYDkn79dOZp3/qjQ0gGdnQ2AX+PyGrFPnQbgurOdTD8
	+Q7Dsz7K+KtuW83jcxzxvKiI8ggZ169c16LDQdw5IKROMCGvJQCGInrPAHwrltI=
X-Google-Smtp-Source: AGHT+IHp2mXYqvqQkWbaVr1BnjkMifTqCDlfD53aEUSPi59G0Ej+G1+n004plXgbLnmiVGUeBSlDWA==
X-Received: by 2002:a17:906:b03:b0:a58:c5a5:2050 with SMTP id u3-20020a1709060b0300b00a58c5a52050mr7789079ejg.53.1714411804208;
        Mon, 29 Apr 2024 10:30:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906298a00b00a58ed644d6dsm2770173eje.127.2024.04.29.10.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 10:30:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240429-hsi0-gs101-v3-1-f233be0a2455@linaro.org>
References: <20240429-hsi0-gs101-v3-0-f233be0a2455@linaro.org>
 <20240429-hsi0-gs101-v3-1-f233be0a2455@linaro.org>
Subject: Re: (subset) [PATCH v3 1/3] dt-bindings: clock:
 google,gs101-clock: add HSI2 clock management unit
Message-Id: <171441180193.306855.11401796662556688423.b4-ty@linaro.org>
Date: Mon, 29 Apr 2024 19:30:01 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Mon, 29 Apr 2024 14:02:17 +0100, André Draszik wrote:
> Add dt schema documentation and clock IDs for the High Speed Interface
> 2 (HSI2) clock management unit. This CMU feeds high speed interfaces
> such as PCIe and UFS.
> 
> [AD: * keep CMUs in google,gs101.h sorted alphabetically
>      * resolve minor merge conflicts in google,gs101-clock.yaml
>      * s/ufs_embd/ufs    s/mmc_card/mmc
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: google,gs101-clock: add HSI2 clock management unit
      https://git.kernel.org/krzk/linux/c/01aea123b11c7ebbdd64b2df3a4a5a7ad86a460d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

