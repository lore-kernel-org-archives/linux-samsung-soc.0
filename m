Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FCD3B791
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2024 18:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722018505; cv=none; b=aYzyKHb57fQU8NtxsjBOjPivx2XIIcaIPYGaxO/zhQJ5eOEPksOSwpSJoX+80eesRhUH4IG/HlZ33iY0WhlMF5CPqSqxeLHPIgofB8xSqQtwi7RmZBiNFSWLgvbxeylLMdED0Xk0M2mw4fivZMhjYAcWtj5YDNJf6mUVoDX/VSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722018505; c=relaxed/simple;
	bh=/hCmtFduoZjXr8wWkO90G+e2CChiWzFqbkWEwH9Pngw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUQTWe94SsNzRI3yjajLdWhx8wN5+fXtpYbda6MlxE1ZZJZ0pGs74eNow2qiPJrmDxycgy3NqzFgcMEd7qvNHppAc9VoBoYPzbjcViXUgt11U5aJ+Ppji2tVkdxydzl3Pf9TtuVsgiwNF0ZQ7GiY67Xf0XQk/OWoVTnP2MF88Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xrSKK7uk; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xrSKK7uk"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-663dd13c0bbso24270687b3.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2024 11:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722018503; x=1722623303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ar5LSSW/uWQjcFvb9wqwW1qn7+87e4drkqRv4fjdD+M=;
        b=xrSKK7uk+sf2Y8AqvxVCdkRpQ7f+kQT8uq3IcR2w261Q6GUJHm/TsPHyiNqEP4wgwK
         eIQGo7jMaXvzsHDZktMyFAaZfLjujZ7E79EmoWo9sH7GHziUry9bwWNa6zbGsj8XsqO7
         2TN+b1nyN4g+ZNNidcGKhiQNOXste9PbZNy8QjXp9Tm6NWNS2qPi3SRu75Iw7Prc4S9y
         Qbvj0MbqSuL0lnN4UT3v6RuK9BG7sjK3v4nLenAo7IwsOkJx1+6xZ5FZrfXXbMNEYUaE
         Wa5DKg0coI5dWAu5dpUu/pni0/C/od+XwZSDGsoMGI+a69YqTIHcj/vkGq2eOkqgT50q
         +EqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722018503; x=1722623303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ar5LSSW/uWQjcFvb9wqwW1qn7+87e4drkqRv4fjdD+M=;
        b=oE0cSHuh/YaZ9G50nEEDoDKI4PQ/ujRi4AFfOPUjQkckZrh3J3y5y9SC2yc0gH6Z3l
         mXdNwohTYdZRjJ6goCesKyp7XnUORSek3vP8kIMQ2CrX5b67o4AsEQL+N6O27rjkHNyx
         GzExzZwx+AvdhY4B870A7OYAdydkvczdofirnHua1+wxe15Zf3Tglsxoy0gYFayZ33o9
         6UB8XjJ8lBabontYimv8Tq8TVr63QBqlS2ieMJwiu0yMxkMTddJcU4SvDYAZj9TXNTMz
         GgHwAvO3NE6aepLInzo/PVTr2J4muJby+VtyxeDUDcXWa9JokOUniCOFXkdVS8/jRpIz
         Y5Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWVPavpAekPssPkZA04lQyayC+ITqS16MMkrwuU4U41w4+vZR7ktWDRnAdvC5wq0REzuDkD9nqP1JVZxTqCUo4bW+DivW1JG1l9mFAJ8Awr4JY=
X-Gm-Message-State: AOJu0YwM89rFgaDtrKqYglK/3deKVF87X7WWadMnNELfTPwjnaxTKg61
	86rVi6tUSP0/lo2htTfnzCnFxhUdvvtQ6FogqmjGKWYm5MeYEneAJhTc3G1cg9ruFGlCQNh3hG+
	SPoNyYLmSo0Jp6Cz0zOQhKxZJVSJguKkCEgs6LQ==
X-Google-Smtp-Source: AGHT+IHato9JiGqKZuTQ6+mFoYDwEL2j8h3hjQq7YdUcOaEIWebF9rgyOekGPj+j55VxlIaNZlt7JqiObKs/Wop42TU=
X-Received: by 2002:a05:690c:dd1:b0:644:b209:4de1 with SMTP id
 00721157ae682-67a050f3e25mr8147617b3.2.1722018503391; Fri, 26 Jul 2024
 11:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240726110139eucas1p24eb41978fdad0d37a95c2c829180a203@eucas1p2.samsung.com>
 <20240726110114.1509733-1-m.majewski2@samsung.com> <20240726110114.1509733-5-m.majewski2@samsung.com>
In-Reply-To: <20240726110114.1509733-5-m.majewski2@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jul 2024 13:28:12 -0500
Message-ID: <CAPLW+4mL=sh+n_Wq30yTPuTb9UNKNX2YcgdyObdnoqwhHie8eg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: thermal: samsung,exynos: add
 exynos850-tmu string
To: Mateusz Majewski <m.majewski2@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Anand Moon <linux.amoon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 6:01=E2=80=AFAM Mateusz Majewski
<m.majewski2@samsung.com> wrote:
>
> Like most of the SoCs, it requires 1 clock and 1 register.
>
> Signed-off-by: Mateusz Majewski <m.majewski2@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> v1 -> v2: make the clock required in Exynos850.
>
>  .../devicetree/bindings/thermal/samsung,exynos-thermal.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-the=
rmal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-therma=
l.yaml
> index 29a08b0729ee..b8c0bb7f4263 100644
> --- a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.ya=
ml
> +++ b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.ya=
ml
> @@ -27,6 +27,7 @@ properties:
>        - samsung,exynos5420-tmu-ext-triminfo
>        - samsung,exynos5433-tmu
>        - samsung,exynos7-tmu
> +      - samsung,exynos850-tmu
>
>    clocks:
>      minItems: 1
> @@ -131,6 +132,7 @@ allOf:
>                - samsung,exynos5250-tmu
>                - samsung,exynos5260-tmu
>                - samsung,exynos5420-tmu
> +              - samsung,exynos850-tmu
>      then:
>        properties:
>          clocks:
> --
> 2.45.1
>
