Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F76727E7EC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2025 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740921; cv=none; b=pnVdQT6Urp8JS49HukRIasD7eUWgnoPrRuTq2/QpmrM4Xjf+dM8bO4zRJgcG+gHFem6Ui87CFJoEnJl2p5/X7E60L0j4g1b/rVxIGhmDpwvQUBbHIctENQ5KdlgN78zL09TrskfsnVPfpps4GygWG2gNATR7yfPSg72DCZyGvRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740921; c=relaxed/simple;
	bh=a2v2y6wL0kyXRH8MKApGqb3Kz81NcBCJAVjIEqK7s/w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lL+fLJ5uiyPlZWad9DEhZqoiMl/VFhODXN3eVCB/CiyVMzhgmn5gLME+iTJ4qZA0lMdUBmk9b/A/bUWuK0svb1Topp0aLywqKzp1Q45SGbd82wNlNZyx7/dRoaehJr0T5zDqbtWeWxuM0YVTG9RT0FUfk//8SC6x5rroVsGZpho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xz51RLys; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xz51RLys"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450ddb35583so1581225e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2025 08:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749740918; x=1750345718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfogaeDXFu8NsSm9XLGcZrTDHnRVDxhctoqJhgjWD2Y=;
        b=xz51RLysxZ+mSDr+1/yg/1W3PPed9UqSCwCBDPA4fjObBOxjoHitJhfuEBgKo0BqSq
         dduFNk15ih4SS8lmAmkXpUQJ6CABIFzLblFVgoa6vV8GebCi5MefvT2r7+RSF0RXJQ6N
         FkMuUIPurKFfJellTWi78mO/HrsntjFGJr+pqoTM9rdGZ6dtnNA7nIEklEvEJyr0oKaN
         ko4Hv/9Zfut3qiR2QHYcSQ4/lFJH80EGEm01TBoepYUSKTlSCxQkoUq+fy+5TLftlvZ6
         KTbzYdwNUxWtKi88AaMhsGztlA1Rixoc/lw937GK0LO6UP14VZwIBVbnrPOqVMvwBKNT
         C7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740918; x=1750345718;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfogaeDXFu8NsSm9XLGcZrTDHnRVDxhctoqJhgjWD2Y=;
        b=CNQSjsZdzzydpdTGeAlALEh39tdX9N8qfKk3XAsiT0JRCuWGwMYcLnY/DnINFa77M4
         Ufj1XyNhpOqwhn+WiPXrm69eUMEH6EWZp2dOSsUaiYqPSSYtgULK3QeTfx1EagIomMOk
         Uj4GY1yFOkxz0RRDuV2LzRrwtYRBH8XRgTGkpGldd3fqyqqdj5J/Dy6gSYz/W1qYlcC4
         iI0RSWWd8np6NwJLWzgZv0p0L8pJIlhqQGN43cLBszeHbhhb6/Ra38sJwXtTzSwOaIsX
         kMUPiKWh5g8VwOLIRSYq4Y0OJBE5GlZE8RR2v4IQdBP0fZwRGjQU4yNsZFoEW0w+UY+l
         O6zA==
X-Gm-Message-State: AOJu0Yx7nyAyU7pdXsO0Rs3SpNU85t32kihPxOf+3rajo7eNfOceeFvm
	Tkd7mUFyRo6q0MxvwkTlFIeICbMEJW5NLNPgZEtSzxqERFvBEElGmmox2E4/n+1A/wf2TKKcK3N
	xl+/t
X-Gm-Gg: ASbGnctsnzTu6yQx3a+RnX6uIQu/YjaVgSuvULTHmWaXOz+Y4IINrAqOCf+eXAMXw6X
	wOR7M818KF8UGDwbj5bNYmJ9XwVYmDkXYukgshFDDKao47Y3i0wH6pCmIZGEdSjUMRdAneP3qio
	2Kr4FV8LYXR7Go2NNEO6OCU9BjfhZbLEoEEcYU1Vi0h0Cgfhwhe0ACcfnhDJaJrSVUZMurvZPt2
	DH4qtQxyy3LJMUbmEvEFx4mXipUh6b3udw79jzQEAbABbDsbdWQUeZA2syzGhOllR1yPQjN5Xvy
	KYPaHPRZYlkuLZgWUQXy76fvbHBCPfxeKew05Zyg1LKcVI1lNH/3IErquT21HBwNq6e/fB5ixll
	T5OMAym3lisEaLmmBXQ==
X-Google-Smtp-Source: AGHT+IGsHolW/1zgZsW15i4xzcpT6QiGNVGcfarQaCKUIeuKHVzXBnh/SKJKOYXQYnzFBUqMAybUug==
X-Received: by 2002:a05:600c:4e45:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-4532e8e40d2mr12583245e9.8.1749740916809;
        Thu, 12 Jun 2025 08:08:36 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1925sm24251255e9.12.2025.06.12.08.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:08:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: exynos: add initial support for
 Samsung Galaxy S22+
Message-Id: <174974091358.105902.6680955080416928440.b4-ty@linaro.org>
Date: Thu, 12 Jun 2025 17:08:33 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 04 May 2025 17:59:03 +0300, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds device tree files for Exynos 2200 and Samsung
> Galaxy S22+.
> 
> [1] is a dependancy on the aforementioned series for the usb phy drivers
> and bindings.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: samsung: document g0s board binding
      https://git.kernel.org/krzk/linux/c/a67a28f59fbaeebbc37186d60a6c56e16b99829c
[2/4] arm64: dts: exynos: add initial support for exynos2200 SoC
      https://git.kernel.org/krzk/linux/c/11715fcf1ccab759d43ee1ad3b1b5bedd7559b48
[3/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
      https://git.kernel.org/krzk/linux/c/5430fd9e0794a21b08ccdc01ddc942b09830c1be
[4/4] MAINTAINERS: add entry for Samsung Exynos2200 SoC
      https://git.kernel.org/krzk/linux/c/6c1497a4bd72438360d977f37837d9638b702f33

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

