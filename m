Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0114818CC1D
	for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2024 14:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734878841; cv=none; b=eOEe1qTz9bbZ98U7FRq3jQJbVs3EmaiKkO7xBRhriXStu2au/gw/g5joT2XjNf0PllUq0IGQ3s4vUMFgLb6wloKgPxIzIDSzGQdyooKQ634FxpONWTpeV6/+zLo8erqO82llGu8DsIuKEQZDsMpTG7wiaWnYSnCK9ByYCrZzCQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734878841; c=relaxed/simple;
	bh=woSSopwRnElbelpPMs1jT3Qe4qW97goolW3OP2OkN1U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SxAZS7LMOIOW9WTcDjIZSgvInyjGf7YFvlL6cb07xnbiHlRLEYDSvxjSF90XvC7JVZswR2ucZYGpnt0I2UTgCGKwwDz5lwPeAvW2ib1WSRRiurBKge307B7xC/hFbE2pEtMXwEuM5lsLsQFo0IKkZvaxGc1LQyKC5u0opl/Xj0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PnhvYlfF; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PnhvYlfF"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa67773ffd4so59337466b.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2024 06:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734878837; x=1735483637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOQ/XEh+IEpTSwG/pPspXvcZX55H6TJ74NlDqWEG6xw=;
        b=PnhvYlfFiTA+RnarSz5cOJz8WRMZW/b9KVEVHo3AHnQPtqbx9ylAyEIzoqsOisuRd9
         KVQ6tLFKDILkO8kB5sdi1pqdFaKHUcywjKUrEMpHTtlTIGzUTgCIpYW6a46aS8vuOWxP
         afl/dlftH3ZR2jbd6PkpWgt9s8QunIXTm4v7Y2YiKvQKFOiXuCjLygqKbHl+PJxMpLkN
         ofFre2FP1MtF5cU+rkGUTUhUyRoCCPWz66AWjQa4HqsFHbdcwtYiTp6bPFPjRPJZeHZw
         YIj465Bgkm3DypboLU0zQMUdP9x3JB8g+RA43utkFYPVqQpMgcmrKt7yoCoCylPQy37f
         8sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734878837; x=1735483637;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOQ/XEh+IEpTSwG/pPspXvcZX55H6TJ74NlDqWEG6xw=;
        b=wUD7N63LB85gJfv9+EEJWYNCNzqyNuIN1sf7E3sIsRfrLfwiTJEzwyDSdJbERbPI5P
         11H1DpZQwbT53u/+nwKOCBWM9CsBTrC5/yx6E0sPzooRdsEK5xlsUlXqHV2Y1xUtQZRg
         glBKMDc0JNgT6xUqirLLG/CwwzW7Iwo+n+aZgksb55ukyWRFLGI7z/hF/bAjD+Eioedc
         3Lle8pZVlCbbQ0tdofqpuP9SQLTUkbllCsEjQFw64n4RG11J69pca61NLPQ7kmy5o5C0
         3qBrtJMh/eO31DEXUwg63qVTk6E1r9SFjMQaszWDKKdt7jE55yT9YD+S63L5R2AE6K7z
         /TMg==
X-Forwarded-Encrypted: i=1; AJvYcCXHt4yIYz3rL5MIJtBN8RX+IJnATJbqdETy2b2VU7DgzAzGJD/UV+UYHfeSepHCPMheVhvp9zC8QqxFn5POlQ2k1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO0dMRqoeUoz4cKJHK23+EXNfTTSB0PPyIj2dc6hO0YAD+hmiY
	3Ra+cgfMCUSZq5+x8950TBNmv28opFuUbCQcDs92X8rlDvJe1q23RfRBfYdJu08=
X-Gm-Gg: ASbGncsA8k5oOrLxfQrruLrlLGvaPhA36v2KW1FFmAELChZEx/nJ4Umxpgcq10vxY15
	glC5uq0XudglgKI/3lhbVvKsLXZMHLq6fB04ExENjOy0t5b0KwQk1stcda/0k7nI4KZO4hLklXN
	KLJce82khO3hg7Q5DkknTrIOUI6s5HtQh66VGPGKMUbYNBDpN5LLHBR9r8oOXLQmVxtTJOZHHMT
	QWnBBECosKtb96iHzRBiQ0P1lORKHsmvXj6sSDl6KA2FacO51RH1saLE5BDKpoj8C1rTThTVWwW
	ZwZp7BmsEjcynbKUB05fhOjI7u71Bas=
X-Google-Smtp-Source: AGHT+IHtQGYsCivCQdxdxbhIMcr1C6rTSuDeTm2poJaxHYzRC9Hx9uYNv/i6n4uQrNAoTdj6lsN2iQ==
X-Received: by 2002:a05:6402:3596:b0:5d0:8e70:cf86 with SMTP id 4fb4d7f45d1cf-5d81de05c1emr3525793a12.7.1734878837303;
        Sun, 22 Dec 2024 06:47:17 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae3b3dsm396496866b.82.2024.12.22.06.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 06:47:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Markuss Broks <markuss.broks@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
In-Reply-To: <20241214-exynos9810-v4-0-4e91fbbc2133@gmail.com>
References: <20241214-exynos9810-v4-0-4e91fbbc2133@gmail.com>
Subject: Re: [PATCH RESEND v4 0/2] Add support for Exynos9810 SoC and
 Samsung Galaxy S9 (SM-G960F)
Message-Id: <173487883501.18913.4157239259617984127.b4-ty@linaro.org>
Date: Sun, 22 Dec 2024 15:47:15 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 14 Dec 2024 16:56:45 +0200, Markuss Broks wrote:
> This series adds initial SoC support for the Samsung Exynos 9810
> SoC and initial board support for Samsung Galaxy S9 phone (SM-G960F),
> codenamed starlte.
> 
> The Exynos 9810 SoC is also used in S9 Plus (star2lte), Note 9 (crownlte),
> and perhaps more devices. Currently only Galaxy S9 DTS file is added but it
> should be fairly simple to add support for other devices based on this SoC,
> considering they're quite similar.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: exynos: Add Exynos9810 SoC support
      https://git.kernel.org/krzk/linux/c/698be6fe8f89b5edf533a85fba7258339c8b72d6
[2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy S9 (SM-G960F)
      https://git.kernel.org/krzk/linux/c/63da297f0303c39025172cccafca7b55b169ec3c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

