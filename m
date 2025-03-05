Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352121E5B91
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Mar 2025 19:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201560; cv=none; b=g02vd7dWzubW/iWym2+rgRie1D6gxM0JC8BV2LiBSg17dWuOKRADXmMJSq841sE/gSs23xRycofhxRmaJFg6s7wffyLBwWjq48LDbapmhss7uXMFX9KWDrlxFwIIETzgwLfGSEofUIv32XHW6kF0gbiIA5swK1TDypmUKOf/5pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201560; c=relaxed/simple;
	bh=Z7PsFIVvWNKCnh0FhMc2FHab1fDB2A1BFAq30W1FyJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dG/z7j15oBE8PdubNFxcwAQjEmULFz7QXAWc7tv1nO1JOor0WweW4+kV1chhdMx3TsDMrkV/Ft3RoohHb9ftbleOEPpW2jONDrU4dVPAWSjGbgAzDXZk5LY4gdzgFv3qDEDgggsCIWoaCeWSaF3eL9Z6mBAz/3tbkFH4WXkMbh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W0rYW1jX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W0rYW1jX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bc2f816daso4558335e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2025 11:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741201556; x=1741806356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/7bb++1x3K8R82/vHvBTybNECeoo2FfhBX5a5/oxy4=;
        b=W0rYW1jXDQJiajUA0+vAUhWKmKL/ox5kpwIaj7ALWnpMMka52oZ+dUEvGzrrRH8oQV
         hsq35tRmCvkFnKCnQ0Bb5Gdz/5wClngYyJP5Hq857LD4CxkaiVE3VRUcuukncFq03m/b
         6AB7K6fd+MzdGm0lCBLakRmObjx7IJsZ11cnheCmcugotEvm5jrelBzqzRsJP22WEDSL
         YSGKsaZfAmNjUIdWbOliOkRiozbbKmUIt71XX5AerPl4OwoDDi1oKrq1p5oJciUDfp3S
         ORSBVkby6Ryvm2PzE5JWqb+UB6mbaqphWZ+wrNz98cnqWxPPzHCQtRBDk510xnT7fOCa
         QMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201556; x=1741806356;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/7bb++1x3K8R82/vHvBTybNECeoo2FfhBX5a5/oxy4=;
        b=S5l+r98pvIxp7XHkdRyGWjcZtiozXZ7Ae8UESsYEIcGLIls2VsxDj0m1LZfpaNY6zc
         If1t/gwtOZWpW1QeR0uApcm3jH8kM6sDCkZpVx4mwtQ37JeXAKccnleohH7hZEtmWxbM
         nw/jdRjW8zykUyo2ID517kIitKrstdJ6mqlww/KjgKz8flSGxKnML/hZHoF4eVaDzCy5
         R5ZPcA6n76K6L7ueME1oYlMIY5FbNMHJFZglwtkewxnq5QCZPPzrVRncsIvM1xhtX+gf
         xNfITWTGUa+SJuIqSDK66l7POz7q+593Gg9HS/RTQ4OhBzlrDGzEZAaMzvJTdR5wRm88
         nY0w==
X-Forwarded-Encrypted: i=1; AJvYcCVyzAlAGreC2Ci1n4UZLePQGIXMi+3luM9qzFu9uiRKyknHygM//PdyLz1v+1AwYaoCtLzQKK+r2sr9alNxmNALOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAbnXFfGjlJkjXM+pbwnB4hE3OgEGWygaTWVGYnh4zgp1W2mSM
	vDZfUGQbMqU28qzYowEuLkCmwXzmpFcSJi6vGpQJrQCRQGPSqRaRf1x+Gb8aDoo=
X-Gm-Gg: ASbGnct5BBvmJMbPDlR1M5oP+R1YY7IdPffeBpc9bm/qFiBM9SyWsBeLEie/S7tu2XH
	4nCJ9NanrId7dRnppe6hixut6j8GuM7MYEf2Y50HOYw/yrbH+YxzGYbbJW6WNCtKZsTUv3YB/kG
	OwSEzuZZl5KyBXrnktL9lH3F6h8QX0yfnfIC9ZIWmvEs0TiYXZZH5K/IaEfNULa+8G7vYmrBpnI
	P4yDQCkfzzdtbyT3HFX2CyTO4be+hkCTVgFrWqUe/dmbUzKs7TbloMpDVKaLTEjftD3XTRDBn7f
	kM8KtZbZafgMghsyAH2hwTPPapOCUAXwCILfCgCa71BC6o8/cjUgXmUJsGAH
X-Google-Smtp-Source: AGHT+IG2bHpjMm5lR3ttmKg8e6SD4XfgjQ/Sq+OZGDiXmqknlKp3DfcVARj9uD/iCvt9N4GVLWP9Hg==
X-Received: by 2002:a5d:59a4:0:b0:390:d8ec:1779 with SMTP id ffacd0b85a97d-3911f7bedf1mr1576634f8f.12.1741201556285;
        Wed, 05 Mar 2025 11:05:56 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47965e8sm21491662f8f.1.2025.03.05.11.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:05:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20250301-exynos7870-v4-3-2925537f9b2a@disroot.org>
References: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
 <20250301-exynos7870-v4-3-2925537f9b2a@disroot.org>
Subject: Re: (subset) [PATCH v4 3/7] soc: samsung: exynos-chipid: add
 support for exynos7870
Message-Id: <174120155205.74217.13161571019009381202.b4-ty@linaro.org>
Date: Wed, 05 Mar 2025 20:05:52 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 01 Mar 2025 01:16:51 +0530, Kaustabh Chakraborty wrote:
> Add the product ID of Exynos7870 (S5E7870) to the existing list.
> 
> 

Applied, thanks!

[3/7] soc: samsung: exynos-chipid: add support for exynos7870
      https://git.kernel.org/krzk/linux/c/13a24175005fad410464bee482ed58af144ba250

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

