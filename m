Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B6F15749C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739546767; cv=none; b=JLYnafg5d+9E5/mFCaFdVqCWre2wwng7ak53zWG3DrB9+yn/58E9PcnLFUSfKfrBdNasfqAld2utoQGJvVrWxjns44A/XsHNNOUNP/qmVtlxr7KjABOuFj+v9BvcJRXGJtzs/LCBinL5Gp9QIqa9VskMh2xDmgLDHO0AFZRoP0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739546767; c=relaxed/simple;
	bh=aTKpNIO8BVUvvqOEl+Eu3gFI8x59iG70MSZOgbD3qR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DoaI78c1s5d96z9+aoY0OtL1yJt/FYfRr11e1TBZhlC9hAkktuqIyyLVKn/mZFM8DczHmJ95vNHz/LZpQGjX9n12+Pa7nTaq1Lkwu5isTIdHMyaVyqVksn2euwdsYuAZ++YesQYFZMEITqwnHLazuNDJz2yfqKyDugnAL9HmmiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qF8e0ZKg; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qF8e0ZKg"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so1787306276.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 07:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739546764; x=1740151564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40kfap8VDfDH8hk27H/hMJFx9uMBhXw6N31yql9KOwE=;
        b=qF8e0ZKgKmi0OXccMLxqRLdA+6u/1IuSy8R8VEQ0riJkjbEm+SnlA/zsFux6EBxv1h
         Tp3qphAt9K6u/1kw49vt0sm5lF1uNIW81eH/uoJ0D4L7rOudT8brqQXhF/aRsc/5RFED
         1aFdSjLn3v8P9FZwsUnVgwV4V11ibOrUq8X6Q2Bt0UKcRPTd1dEqo6/4dJJTbHr9HAJX
         FwbIZNioJUuW7bVX0X60Vi9nsJUhdlLxKX59Ao41HdrVMwkuFfLzk2d0kOpI9m/rKnLA
         oYonzF1Pv528fog3d8/qf6P+3G1B+mi7aCNKit+d9LgrX7qMk4RWvbjJ6T48zLB1dSdD
         NMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546764; x=1740151564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40kfap8VDfDH8hk27H/hMJFx9uMBhXw6N31yql9KOwE=;
        b=vHtsANuV+fqpLUzLh7jx9NGpOiJzNAl0XNClO8NGBEYCDxuSjgtHYCcJ5/TJH9TcKj
         0Ql32zkQTbL4TgVMFBGmX2pwAqP9dEAT59Shg4E2agB7uaJIUcnMgDDhYlSMaFc7jKiA
         hyr9KTYqBqaXYoy/E1wCrqE0v6+dHoYM5B3eTX8/QIleG3emvrDCE3hGPsgWPSerqt1y
         UX5/hm11epGPJa746J7QWJaJRTBAgLB3zWMdkSwx8kLLC7LFAXKAkL0vQqFDmPQXdKVI
         Wk3OFVnNPnKP2zf0n23BCVyKfHePjWc2ttfzLmw7x5XEnCKF1+kwaq1c+DRcVEZl4BhR
         WcqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX01JKyPVgSXoQKz5oot3iDy22UEdDCOZf0YpdpkWEFr+Tkbr4F9VWVOLeuB27cnKPkx5XOiWtZemd8g6k93QB5sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5KK+GBnoRryE5vwT+W5s9rHvqE5WuHsyZdzLPGdCzam9rFQ53
	MS1GQkoJwZpbuogkG/xS6sVi1drn8gypDVOMnLpNEIHTrnup+pJDyXRoR9R1m7fP7uTjC3ewcIA
	VY9Qzxm/Cn2ZEVi3EzJqw3dOa+TDbD+eUW85IDMY67FznYLHQO7E=
X-Gm-Gg: ASbGncsXlvJRhsLTt0Kd4xxePnWFOEMX0pMwlEGHUabSBekd1etdIJvRduC/pFb9DAt
	dgkAmYMB9Im3a1c/NDSScMWKUiQh+MXiWwQVLKKPDcJi8L8HkW2NMncEc/ZQvQD3QncMbmh9RuP
	SndiELAO7fQQWNAO6mL96F1t1yOgj4Q7k=
X-Google-Smtp-Source: AGHT+IHZ2AvHwjAm58HmrUXzBfbtKaNh3ZhqjYj/r3cal992zurt7vRZq2oTP2grTR9IpbqtQfo+RsuwG6l/eqWLOA4=
X-Received: by 2002:a05:6902:270a:b0:e58:37fe:4a17 with SMTP id
 3f1490d57ef6-e5d9f1965cdmr11696325276.46.1739546763637; Fri, 14 Feb 2025
 07:26:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214043343.263-1-wachiturroxd150@gmail.com> <20250214043343.263-2-wachiturroxd150@gmail.com>
In-Reply-To: <20250214043343.263-2-wachiturroxd150@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 14 Feb 2025 09:25:52 -0600
X-Gm-Features: AWEUYZm0a9iYbwJFulT6QDwvSZFUTkts4BDa7xViN-gwjOa66CO2DAjmCUVdtNI
Message-ID: <CAPLW+4miogww5cgf=Vd_A0dX0=JaH+CV2G8__3Nx6B-Wddu9PA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] spi: dt-bindings: samsung: add samsung,exynos990-spi
 compatible
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: andi.shyti@kernel.org, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 10:34=E2=80=AFPM Denzeel Oliva
<wachiturroxd150@gmail.com> wrote:
>
> Add "samsung,exynos990-spi" dedicated compatible for the SPI controller
> on Exynos990 SoC. This ensures proper representation of the hardware
> in the device tree.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>

If someone gives you any tags (like Reviewed-by, Acked-by, etc.)
during previous patch version review round, you should collect them
and add those around here. Only tags for the final patch series
version (which is picked up by a maintainer) will be handled by the
maintainer.

> ---

Please always add a change log for each patch version under "---"
line, it helps reviewers and maintainers understand what to look for
while reviewing. Something like:

Changes in v3:
  - none
Changes in v2:
  - changed this
  - changed that

>  Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Doc=
umentation/devicetree/bindings/spi/samsung,spi.yaml
> index 3c206a64d..1d3c95bd2 100644
> --- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> @@ -24,6 +24,7 @@ properties:
>            - samsung,exynos4210-spi
>            - samsung,exynos5433-spi
>            - samsung,exynos850-spi
> +          - samsung,exynos990-spi
>            - samsung,exynosautov9-spi
>            - tesla,fsd-spi
>        - items:
> --
> 2.48.1
>
>
