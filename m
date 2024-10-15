Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C52B1B0F22
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Oct 2024 22:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729030000; cv=none; b=kvCZ7iDqbHetKWW1TMhQsf1D93sFw0lkJnoMmMp9DxF1TeQk0NJuSLvS4Teo0FUOTJFpLaXIn0zBVrEm0jgB75zFny1F/KA03oFSsmoeILd6OO4fEtzQ8nM30tbYJra8eDZ9FyagEyCydH6yTaBi8X2Hf1+4n0tN+sa+Yjz6Llg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729030000; c=relaxed/simple;
	bh=BJE4f1D4lRKL1gR0V2Ux34adfzE9M6v+2sRwffzZB50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTMPslxVqL8U0G9zxXNXCVrNX5BMzjxR/CdrtJ4AWRSC5eN6cc67iDxoqHUagyr2WEcihOK8JoXMlVfwPOnBni7GymIlhc1EJMUM0RNbne5S2MVpx8onzrl+Gyso+6BBAEOxekTYwCWT8sRHIuAcbJgK/wYaA/fDaf8x/1ZTVak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yO7PJ2b2; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yO7PJ2b2"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5743074bso2267691fa.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Oct 2024 15:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729029997; x=1729634797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Df2UGXMrSlqnXgDl1o8PQ91Gen6dUgFMpKkG/5j+dDI=;
        b=yO7PJ2b2FsCDhboc2GtB43Vcy4TmBKq+0jR/crXVAydjm83fCqVMY0VAS4mB3EUxNA
         vzniKMM8UKlZcX+YIbQk8dJdIB6WC1QkkKuta3gCI8tpLg/rJkjvV6Zx/jzZI98vHWZO
         g6f6U39xTT+nK+wjoBAWM0solnTo3wqKVd0+JjFR4BDi/rVeyKfrWMkeuJTCtxvJ5erv
         8Ujkll0uiqLWdLYhOqNIVh+kIsJmzpvnnTDVA5y1HDwZJQbGhRQ6ObluLx0eVkZqsmAY
         BofOnWzmOd6D3y2C39WEyfngvm+ucngrDiPr8VDZ2N6cC9ofT/g4HxYHvgO7FhNQDncC
         kGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729029997; x=1729634797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Df2UGXMrSlqnXgDl1o8PQ91Gen6dUgFMpKkG/5j+dDI=;
        b=dM1/WeWw3dosbH3AgQBoszb8i/FbRAJsGlPM9fH3EfmCAopCYtz4MVMWUZlpy3NB3W
         ieoHN+cu+XUW+N9s/P6hEFpyk3WH0Wqhqcf+iaJb+/Dmsr/I92GxIUeG/JfL5X1bQv9J
         OxfgpqnLV44ISZvcGtqtQMu9ibN2/rQLDeY2B1WN0ENlG43HDw2UtOKcHSYhJtDCuFis
         Z1wY6YVri5Tsiic4UDomBX0YJKsgxtHH+q5NYdADpbEc175hdzLqTNJqhpF1/mhaPHRq
         e8LhjXetS3nuJbk1kxcQhyuLlQdU5Fa7mntf0gtvpv4w/TLf3lvRS3h3YYJN+9dzW9G8
         nWJA==
X-Forwarded-Encrypted: i=1; AJvYcCXG6wI8r1zzxTGs15kWigByBPY/wKWK2yQQQxbXzwRlhIJqvhgEeBJnHk3zc4fh8IkceKEHdyEGST8ogXbO9wviGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN2iIAn19Jk64ZLLIQWwp4GLpqGtWHIt2me4hTbKCnha8vDvE+
	EXDIapNZ4kYfXpN3QK1wLHVhbZjiGwElVeiYxAqgo5QYoDcxzhKdAtsWQZxLyiKSzUiDBKTbU6X
	jQGfJTUYwhBZb6fnLxWX1rLRnqZCeQmN/rEAXUg==
X-Google-Smtp-Source: AGHT+IE02MJ5sLjtZ4n0KaJRs1Aik5DxDdANs4F0KVaTmjkcUN3BW1HGzLone+n39Az1ks2iqiI4fB2KQ8bjyI2qUHY=
X-Received: by 2002:a2e:4e12:0:b0:2f7:6371:6c5a with SMTP id
 38308e7fff4ca-2fb30f53e35mr45632151fa.16.1729029997149; Tue, 15 Oct 2024
 15:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015065848.29429-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241015065848.29429-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 00:06:26 +0200
Message-ID: <CACRpkdaJ7Qiar-nV+-HJ=7_thLK-Trrw79eA5M+Wuc3FLDpyTQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: samsung: Fix interrupt
 constraint for variants with fallbacks
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Jaewon Kim <jaewon02.kim@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 8:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Commit 904140fa4553 ("dt-bindings: pinctrl: samsung: use Exynos7
> fallbacks for newer wake-up controllers") added
> samsung,exynos7-wakeup-eint fallback to some compatibles, so the
> intention in the if:then: conditions was to handle the cases:
>
> 1. Single Exynos7 compatible or Exynos5433+Exynos7 or
>    Exynos7885+Exynos7: only one interrupt
>
> 2. Exynos850+Exynos7: no interrupts
>
> This was not implemented properly however and if:then: block matches
> only single Exynos5433 or Exynos7885 compatibles, which do not exist in
> DTS anymore, so basically is a no-op and no enforcement on number of
> interrupts is made by the binding.
>
> Fix the if:then: condition so interrupts in the Exynos5433 and
> Exynos7885 wake-up pin controller will be properly constrained.
>
> Fixes: 904140fa4553 ("dt-bindings: pinctrl: samsung: use Exynos7 fallback=
s for newer wake-up controllers")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
