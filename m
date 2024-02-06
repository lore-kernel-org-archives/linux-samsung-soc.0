Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8896512D76A
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Feb 2024 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707213453; cv=none; b=gzrto7G6zOVcpJ3SsjZjL7aCIGdAmuDtYXUVUZ6mlPZSzP4VVv5/pFlPedCsMKhPHZ1QShi2HPXmJWepLgAp/TkbbE33xh5JfHNZk2c0Ow84FHOW6IkagmOmPNXVNyJC1/BV1KzMHglON1G8f1xC66Hvb0CMcCguRrLIIX5njko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707213453; c=relaxed/simple;
	bh=NpPH85owZ20SCl7gPDrD1ciS1nl+zM/WUwZ0z1dCHO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7ETltSEOXKURX/4dWrATa9JeozimmedZhHzBOMpYz/YFySUbKWKt75+yhuzgd22aRuZawqYiBmMam4VqiorSiFTcByftNjw/P6H45MGHSHNQjlumauZovUaoaudgOvYtU3isVA/QZON3HuXVKo+CsmB6HLJIL7b88wgXOr748Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EG9HtWog; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EG9HtWog"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dbed0710c74so4659882276.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Feb 2024 01:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707213450; x=1707818250; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Eq2wg0lmtUf7Y9KbMkjM4LSzECZ5og9xajY9d90SZeA=;
        b=EG9HtWogWkY3LttZ95TAM5ISxGu6ZbqC3fGmwfQAZQbpGGpXmIROgzJZcbqFzGPFlW
         3yVGcUt6o9UUa/LpB5o/WvUNqhlTLy+rMDzg5WjfJq6bYna/9JxiFxs1xkYeXm98mUB7
         RjOAI77umQ2omLoLOB+CKee5qFSxJ+ttbbIw6HH9SsneW6ZFTadO8Hdj/cpbZn+MR6Xq
         jioj6nuk9VvcBNRE8AqPFUyU7eQnDmzeg+FUZGIyKmfevtjbUDG3vGUAQPQ4ZJkhRpWy
         K9K+tGfvbSdxdWw66XsLf+DBaCaulj16nntdI4RBwt9VergnalW56yj9sU81mpkdOFy3
         BoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707213450; x=1707818250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eq2wg0lmtUf7Y9KbMkjM4LSzECZ5og9xajY9d90SZeA=;
        b=rk+BQn3iBORPDWwSCXg3GInSKXfnsXh5Tve3alp3TyNvRsN22v3uJ15j/GOcg1ALwK
         4lmad/ew1HgWIOvywJAOURCKUmJLrRjUsP/fMTYw6uco3YjNpF1T7MslE4m+CXPcVX4j
         3SgQo7VfbKEoMeJzR+BYRIcn3MfaeHRvF6mcuAPl7qadNjPU9ZGV2cDbtD7h/asGj01D
         hsLCjRD8s0E1RYEMMLhFDyByFzbB8d0OmADrITvphIzeZ2U7wX2r9oomk0rwhEQ18MvI
         5qKzzBW8vTB3K5xs/GSNDP5WRD2a2hfSWeOL7TOcSvxJ4Mvsu9n4SxSyjKqqHsqXV244
         vvNQ==
X-Gm-Message-State: AOJu0YxTaxPUSZQyu2nHTakVdh13GlFrkl6N+P+W8mdwvbEqL5AJq/zy
	3w9CQMRNPrnMyxP92Q2LEWMaHCtOdXTNb4lDh8HXuA7U85qhun0CYNQOZuo3cIS+KcwHfQ9bFzN
	M6IM2cVKW7BA+VdAlVu80HgJ1f30vM7X9za2TnA==
X-Google-Smtp-Source: AGHT+IG5u0RUlCzKGSN5/5B0/qLQhE4mJ3srJl6aZpIRhRrSpKuDOaDOTP0OKh3xCd6YwxwgJxwWKTKO4NRUn/AvJf0=
X-Received: by 2002:a05:6902:102e:b0:dc6:83c:dce7 with SMTP id
 x14-20020a056902102e00b00dc6083cdce7mr1271773ybt.38.1707213450425; Tue, 06
 Feb 2024 01:57:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206085238.1208256-1-tudor.ambarus@linaro.org> <20240206085238.1208256-3-tudor.ambarus@linaro.org>
In-Reply-To: <20240206085238.1208256-3-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 6 Feb 2024 09:57:19 +0000
Message-ID: <CADrjBPpLB0RJO6xH=0+jvc=EnaNX6eCg2JV2DNkDdFAoS1mJQw@mail.gmail.com>
Subject: Re: [PATCH 2/4] spi: dt-bindings: samsung: add google,gs101-spi compatible
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, semen.protsenko@linaro.org, 
	krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	robh+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 08:52, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Add "google,gs101-spi" dedicated compatible for representing SPI of
> Google GS101 SoC.
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> index f71099852653..2f0a0835ecfb 100644
> --- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - google,gs101-spi
>            - samsung,s3c2443-spi # for S3C2443, S3C2416 and S3C2450
>            - samsung,s3c6410-spi
>            - samsung,s5pv210-spi # for S5PV210 and S5PC110
> --
> 2.43.0.594.gd9cf4e227d-goog
>
