Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D03394476
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Mar 2026 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264468; cv=pass; b=D5K0cvuJ17Ejze0dU2hUhhB3ffoi21umtZgcbu7/XMT8Z0aZPWROCvaGd+FWK/JRIXXEaiZTXOdL5dvFEYmSr2EDgoFmowQYejc57DchfHm/hzaCsS5cSHxWnMeS6HSKrfWSQ+hFg4JDhJ8ZI3vFzz0jC3p8qWvsEPjZhaY2hcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264468; c=relaxed/simple;
	bh=YsJoLrLCtXBI6DtmBAjdk5zdQPkh2dEYsn5jbiErAYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LlpCR4DPJo8/AuFHPNY/KfYOcwGFsVBFo9qc13C4BT36zQXDfMY7SGoN0lj0snRqNMTOoLuMVo2A/sdCm/DL6dyZ7C3d/rKxWwGmJuDa477vSfayb3Ihh/ls/HXI8wMt7pAoi+WQmmYq5rM+Jkkq3/x20zMsLqCw32sch9NU9Ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bn82Ql8b; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bn82Ql8b"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a13a06fc85so2843750e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Mar 2026 04:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774264462; cv=none;
        d=google.com; s=arc-20240605;
        b=IeQvzqb2rfH4ko729OOZQ+mgdea76bLbOk7In2GMGo9hSInGdhSdjRwtO9+yaQlMIX
         tBpIR+LJ8gTW691T/oDdO8YFrDEoyZF5rxPN9wrARlPya97BJxbmG5K9LVx8YbBrOvjs
         955I8s88EbZlU7kVQAOL0YmwzuyonJ229ZnZF39PXcZ63AvS4oKjB8MKsFe/m7ow+CZt
         F/5SKxskYtEsckR2rBiOZhb+DoDQTnoVQYteb+H1rkN+ZJXZpOMk2EDv3qh6UzeDUYI4
         gWWGm5tbBuJyDygvfln1Hukk3dhAsQH6Tl5z0uFQLXOHlzFWm73RIcPkhIJXWSo45lKc
         AXCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+IJUWFVuRtnRrcxOAe+qH0nHesEXlr9bnFCdCu3nBCU=;
        fh=0BxYMn4PsY81AHs/0mmt/MlReMGxnpUCFr+Cjlbtg5Q=;
        b=U82nBHy5ElagevQLP4wJXXygZshR8D7l0Y0u1GwueNCSXRZe5IppCP4jzdOkEUxkuT
         gEudvskK7rjGdCG+tggS0czXG4ZPQwnzz8lpVIpK0f9ym1e6AeC8uEuHRqJEY8Ufu7Kl
         g8P1/EAsh3+a1uYqSf0MHqnua4u6SOazbeQ99OabgKRrPsURfE6PCertVb6+Mv1mOKGt
         up7mXdLQrV3pKelCOT4a77ZrcPfvYxphSzubvcXFuVM4C6SXc1ZqesO1wyl5my+o3V9J
         qj3s3KiA3nDePTRFlHWa1unpOMzxk7OtZ1dXJKZWvgQuJEXi5Km35uokz7nSdQxRhOsS
         dA1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774264462; x=1774869262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IJUWFVuRtnRrcxOAe+qH0nHesEXlr9bnFCdCu3nBCU=;
        b=Bn82Ql8bEbzB7ovYrS2cyKJ7rqnYq5cuNEGH8ulsVoNTcEZ3cTXKEoNT2IH9h6RTF0
         7jZGxZSi1sN30QazDNR5Y9JpYA01kKZhXFxN26S2LOJv4xR4z6oTxQVs4qFTqgizm71O
         UBoj7hDw2QnR2iKLbKF7xec1NC/Olc2cCY4m+dLf+7cPHr7KLwU3zGdRL06RydJmTYUW
         CVTXAMMna7cDto7DWo0QrTV6Qki/b0DvMVVlTmFbVBAspDh+b0CmzQMy1O8DDxRn8Iao
         GL54wek7J00SOpMExdOYoAz1/jm0/R2EpodH3WLal9z9sECTSFWbAC1+ppymJuyIdz99
         6yaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774264462; x=1774869262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+IJUWFVuRtnRrcxOAe+qH0nHesEXlr9bnFCdCu3nBCU=;
        b=c2MQBlc3QpkBl6CZ3Qm93aTN9R2WhTfQmuY44p8fTWscLRnS137NBeHBdjT5VFuP8H
         1IykwPJY3nnkqHT9VwAG8gfAICV83RtikNxg5LjqUXybgQu0qZ9cN3Qevwp5IapKW5u7
         hKjlit6GYXS1IavVOkEPE+zcI9ad7PYipWHdNWFITMhoc9AIwhgg2bouFOXqwq3uap3i
         lfW6/NeFMr/8iI4Xg0r2jLg5drnLNBUYkdj8I6EVx4NyGhcYwOhAtcSaFMWi2pFqDak2
         tv9HU4MsWzO12bG7JQVs5HsLpOgvJ9jH9Sd+GSv/zxGuxhicClNTflHQ7NUo+7z3FOpq
         pOcA==
X-Forwarded-Encrypted: i=1; AJvYcCXvUfZIRdHuySjMTHk3mMqoG7VjPv4QVD9eirpJlv5uSidH51mz4LePoRwjWD5QJUr4Ex+2TD8hV6kP2ib0DpSFZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhFPI9skeal1wH7R6y4Cg7MCxIZrG+5B9n/mzxjFf7bw5T8xTN
	bVjLSTouPcepaOYf4KcsFOI6couEcE3c3MU7guMdsxUZw8g5pruXyX2a1Aj3FiX+4k2trys9ULR
	pF8EQhdEBrrA+kBUYmU/+QNEaK9POILN0ogeersgTFg==
X-Gm-Gg: ATEYQzxTfiZB9W+0/bxTCzlrnKOi41OXgOfRMGo2C9/XBuW2Ihs+gny5VBxEf9wmwwz
	uYrGx9S/9skPgvuVtl05ElUHiBzQ5RaF3AEW/2yp+6WkJhB/rlF6rmhXeqrH8yanRrtbR+35ZNc
	Z3fZqaDtsmmnIjNRludzcXUixfF6V6ukth3P/wwkagHeWT+P5K/YG9FKaazOWKC7fE3teIgSWfk
	e6XfK1s2ltL1ycLQzoCRnh5ZcTlQk7/++k207j6yFMzarBPvskL0qFlA5byFx5m4cb6cYjzu4Rq
	qOy43gTM
X-Received: by 2002:a05:6512:10cf:b0:5a1:2b2b:479d with SMTP id
 2adb3069b0e04-5a285b6125fmr4577456e87.31.1774264462090; Mon, 23 Mar 2026
 04:14:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org> <177409907930.268981.5882592990447577348.b4-ty@b4>
In-Reply-To: <177409907930.268981.5882592990447577348.b4-ty@b4>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Mar 2026 12:13:46 +0100
X-Gm-Features: AQROBzDb0FyhDsEJ4InmRtciuv9Wo1DbFap7YBMqRE1Hh3qfHVm60c1Z9Vi7vPA
Message-ID: <CAPDyKFoz-sm0pfvn5iSYFY0mrW38vaGRZsFvrVPqsv7BsYxeWQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v8 00/10] pmdomain: samsung: add support for
 Google GS101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Juan Yescas <jyescas@google.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Sat, 21 Mar 2026 at 14:18, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
>
> On Wed, 18 Mar 2026 15:27:45 +0000, Andr=C3=A9 Draszik wrote:
> > This series adds support for the power domains on Google GS101.
> >
> > There are a few differences compared to SoCs already supported by this
> > driver:
> > * register access does not work via plain ioremap() / readl() /
> >   writel().
> >   Instead, the regmap created by the PMU driver must be used (which
> >   uses Arm SMCC calls under the hood).
> > * DTZPC: a call needs to be made before and after power domain off/on,
> >   to inform the EL3 firmware of the request.
> > * power domains can and are fed by a regulator rail and therefore
> >   regulator control needed be implemented.
> >
> > [...]
>
> Applied, thanks!
>
> [01/10] dt-bindings: soc: google: add google,gs101-dtzpc
>         https://git.kernel.org/krzk/linux/c/10084aeadadfab72648f6ed1cc78f=
7cd87b861ba
> [03/10] dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into separa=
te binding
>         https://git.kernel.org/krzk/linux/c/3ec3c42b426fe5e2b48ff19c551de=
c50bc78788c
> [04/10] dt-bindings: soc: google: gs101-pmu: allow power domains as child=
ren
>         https://git.kernel.org/krzk/linux/c/c8229a5160eea145b796f54317d6e=
659cec9b080
>
> Best regards,

Usually I pick up the power-domain related changes for the DT bindings
and host them via an immutable branch called "dt". If needed, SOC
maintainers can pull it to apply/test the corresponding DTS changes.

That said, I am open to whatever you think is best here. Perhaps it's
easier if you can drop the DT patches and provide your acks instead or
if you can share them via an immutable branch for me to pull?

Kind regards
Uffe






> --
> Krzysztof Kozlowski <krzk@kernel.org>
>
