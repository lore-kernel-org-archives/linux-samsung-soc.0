Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE61D1272AA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 17:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714411810; cv=none; b=mOnG9JnEWN+EfUtLVD6coGlfITbeE6SlURVikj98TeiOpl8Z4Ty9CjPTAu0aUsMGXpXRAUeHV2RC0Dt8jaPXZ77hYXAsBjAWUsPQ9H04PyBGJhcmi/S0hqT6O3HfjTy7gbDNQ25sBhQZQSnIJTq6BobipK4/kR41p3h824S3r08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714411810; c=relaxed/simple;
	bh=NAYUwQk3+viNKWYj0Ci8K+1OFeyRtiPWNJCpAFbxutE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q9VHgZRUzznv4XiZPh7wxDYZGZpaNaQW3ZhOPFNi5dOnpFGTzdRadpG26DHd0DGEfbw8d75KUnLqae7veBJ9A6C1KzzNgpGNDRFG7YEyD4Ia/i4/yFEemHhtMf1wCJYdnyr3iVzXC0N6fCaUwRuRwlfmBlclNBuZly4PaWkpnlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qU0w7UQI; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qU0w7UQI"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a55ab922260so636102666b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 10:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714411807; x=1715016607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApsAmNtF7WojJxJovU3iPiwCDNKhiq4dAAzkVUAsKYM=;
        b=qU0w7UQIvkuDG6eBbYmcmPjuRY7wXyXLMbO0RsF9XzsK17Bb4EqTCV5bTVLfXWnX6s
         sPnNlZuKHP9rn3eF5FU0kiI7j5FDlvI8MnDllgl6SwqaVbRdwSLlxBLplOp0QBmK6wNN
         jTfEm/afsMabJP1NG14sfjFCu6b6v8r0m2gYBa29WyvjbFKmMq9+GUN+jECFTH2C8muR
         6gUr5fSgXdIIupNI/iXpThcYOJ5zUa2GMp4AWiJIQuXUA1/9j5gJlm+d+KAT4Odlyq4H
         4czTYlsWGDZ69TaBse6NkTuJGh0iw68kPGWvMG1K0xd9bX9VQWPIByjg92u2R5oDa/xv
         DIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714411807; x=1715016607;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApsAmNtF7WojJxJovU3iPiwCDNKhiq4dAAzkVUAsKYM=;
        b=smQYp03Grn1EYTs4tVl0jtsU6c6+QysW0zkl6OYdw0f/CiSbiXmv6RyActSwaKGG0z
         QZzHFwGXg6xuBtNcFduVMOSOdoHUOLv9sgJCHdHyROkd5faEns/qzEF0/9GV/LJzeosU
         NGF9Oykd+dJQHXDAsPBz15HhY7gNBklx5beV+MIr/jz9p17yV/ftOLzg2OlBFAtw2as9
         a2AYwdJEOvgUH0K429d9N7yxcFw7n+vz9ksjUKInhGxNJRs85m1xjsH3zGFJapKEZs/s
         o81Hb33HtRXxgdUzwB8k3O5VkvUexidOW4bHqQQiqQG+1g1l4BilXkuOgvMomxOgQSnZ
         oe9A==
X-Forwarded-Encrypted: i=1; AJvYcCUBY37oNJQaCcD3HZQgjHotLKbhdZoh451b4IaSippU2qbGf0COI9blLMzlDbtQt8QdZGlttdaOfiDi6VTKRMHzTdp2JMA2hg2ieBEpu1D35+M=
X-Gm-Message-State: AOJu0YwOGtNJWX1ort9+FTa0Aa550BtkQOtA4nQBUFC3fk0s2+amoVvs
	5TvafTfVnQsUbD1/PmUNIz3mer+qjU+O89Va4PGpC6yrZ/biZOyMXEEKuJEIXSo=
X-Google-Smtp-Source: AGHT+IF6Jf+FDVXZFYTzzEsiJyYjXEo46zQqXDIGe//XlnoIxz3tHXt5cCHfbrryZRIviq2Dbj2hgA==
X-Received: by 2002:a17:906:f18d:b0:a58:7298:fdfe with SMTP id gs13-20020a170906f18d00b00a587298fdfemr9105221ejb.53.1714411807391;
        Mon, 29 Apr 2024 10:30:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906298a00b00a58ed644d6dsm2770173eje.127.2024.04.29.10.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 10:30:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240429-usb-dts-gs101-v2-0-7c1797c9db80@linaro.org>
References: <20240429-usb-dts-gs101-v2-0-7c1797c9db80@linaro.org>
Subject: Re: [PATCH v2 0/2] enable USB on Pixel 6 (Oriole)
Message-Id: <171441180540.306855.2701742264944278377.b4-ty@linaro.org>
Date: Mon, 29 Apr 2024 19:30:05 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Mon, 29 Apr 2024 11:35:48 +0100, André Draszik wrote:
> These patches enable USB in peripheral mode on Pixel 6.
> 
> We can only support peripheral mode at this stage, as the MAX77759 TCPCI
> controller used on Pixel 6 to do the role selection doesn't have a(n
> upstream) Linux driver. Therefore the role is defaulted to peripheral
> without any endpoints / ports.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: exynos: gs101: add USB & USB-phy nodes
      https://git.kernel.org/krzk/linux/c/14d15fcbe0f1fac5979a0b01160f3651340e38b4
[2/2] arm64: dts: exynos: gs101-oriole: enable USB on this board
      https://git.kernel.org/krzk/linux/c/b93b3140e82a0e48442087c38346eabfb92c63af

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

