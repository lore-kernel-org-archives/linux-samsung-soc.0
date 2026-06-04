Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C2044D6BB
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Jun 2026 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575940; cv=pass; b=itB5ZRK8aShP6ST6kZKrm0s78+nMJtioZFRfnOQtf/YL6W1Uc8oPzalKhUlh0Ssh8sdaxAmbbdoa7uRFDzzwbCMw+6G9Rn5ulFKqq4eo2l1AZu0b/zbDLh1Dvo6VM1la9/+mQa1QyyK6RGMOHogk8LmpO7wLJ80pgojYEK0SGcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575940; c=relaxed/simple;
	bh=QXg9S3LANuU2Vu2CwL7ml9RG3pg9mmdQqBn/HO6HYQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ng5X6ejTF2t5AcHdg6HT2z2v1UyEz7GLWy2YGeY/NUhXWZnGCCK3D9F22y2BA664XM4XK/MEM44PfNso6QrSBNHlqD4SLvBPKO9kEVu7NgsFGDxE+0y6OmMH6yhVDHr1dHe/VMhKg6nvGMV9SBgblVzbR8P7HbXHqx+9ziLnhPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VNrKS+F5; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VNrKS+F5"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso724556a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780575936; cv=none;
        d=google.com; s=arc-20240605;
        b=Kjgx80aPvmLRkgrLO/bNBejDaJVQCVc+GzER/c6gLSKPaHx1HVdSR9JLy5jnlDiWHB
         xMKHLH6zdjNiqd5UmEpIgnK+5BQ+d1mIULNGjLJ/3LNRXXnVF/5GI+EFA31MysMl5tzN
         zblni2H9MEuoFzFTd57zlMpqrWPQbmJ1CfxWBH8+326J/4BmwPoXZrRMyBnRFgRpVIL3
         7oz4QNpPpwONW9Vh0zAErKP5vWl1wbEFp8i39yhGwwwThq3BlvXe3C2m0hKJOirOiEN+
         tEuCzJnI26zr0+w1/f4Gc3m/MQ99Vf0UTI9DYMUKdva6928JKk+KlqcDYi7EN5kvRUKA
         ooqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=knW0aQIBp4ONXOIx4MTZpzmtpQjVdTKmzR82B1HLZdY=;
        fh=oxrhYRW5C9w+WaYRgXBxP+RdKHhx0J1SqwX3v2AOiNg=;
        b=NnkA7Nn/KJo+m9blXvjd56EfQh7BVRU5tEGRaZcv20hodJ8kYHIDCEWbpbN/m4rhW/
         Iefor2Hi7kYw7+gBN3YSSnuDAj+ghApOSNEBaxRrqYUMHIGA8eqSQVy+ZWWTZBGsSpRL
         nmte6GsXKaIxfwo52gA6unzV/qYtFn5jVmHeAgafqmqSDHmV2R7m0a4nL6VbvvEknj5N
         w3Vkus650ToeD/IyHpGxjExr/tbURxM1DmwnQNSTGl9zDan2+VvyEVdFHniokfh1RpIL
         8YfLQK1dXIxnaJ+6ZpTONiSBhWqhc1NLU95XN3+s1ccNesBXbHbIdNiEl8po/Msk7fBK
         2ZAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780575936; x=1781180736; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=knW0aQIBp4ONXOIx4MTZpzmtpQjVdTKmzR82B1HLZdY=;
        b=VNrKS+F5Q/MjcXlX0j/M0qvcolEc5C8XWATfjY3gaaCFWwg2vK2Evo3JIiAMObMPdY
         5inFXiO8SfKHFAuzsDNFOwybZV2xkgMrXpJxBzRgKvXINWORM0AVzr3LNLKefIB1xR9M
         OJDyeItVdF+aMiCL+PBnBbP+qS+Ao3Sc7SGxbFnLCN7HlYT1KYxSA3Cxdc3+2AAQwbG7
         IFXA5OCQXcSr+mDSwVxdUirtrs+ESNJlBPb4G9ZWZcPWdB6hv9I5hJYIBfgORf0zzKjb
         QU2tBJh+3O2/RFVFsJFDgFNowFbj7Dgn0ZL0eWjfHtZTiSyst1DLTalXaF/vlr8xDgyf
         0B4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575936; x=1781180736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knW0aQIBp4ONXOIx4MTZpzmtpQjVdTKmzR82B1HLZdY=;
        b=P8F/g7ka0NaQM519CxX9CRgbmNi2488WsAdEsk4oHmHSU3gZFsH+eNWhlUhB1j00c4
         0zOUsD3yYCcNvjy3uD6KU24aF4MJRTdkkFkzqxOscwLHe9EUZzQjFhY+SgpsFle2Gb/B
         8rBw9TU3j5ePgyMFfem15ivmpoDi00EZzY5W2UOyKIz+fnmfh3UWgugPARRs8oiUKzCD
         M8pVH8LWfRXXR4+kN5QCwTU/TSi5j7l41rkHXuwY1L6STef3byLTNOSVmemd/9eYfPAK
         QPnv/3A5+BB0lZ7Qw+n9ro1SvyUAaXNpKthcAeAauIZoFLD5dQH4s1wXry47luRHpib4
         UUUA==
X-Forwarded-Encrypted: i=1; AFNElJ9TbFZ+izHr7bGtJaG6Q3irdBZz7TDStHALV24VN13RlndwIevr8TMTb9zapdBYJ6bU/g73qe++RlUEKLj1fwlk0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjnhwTzxk+2YJhJWI2L+iMfa1tGELU78kgmfzgXu8Vg2CcG8J0
	kk2nz6iK7P71cIMlO1+joq7rR3HSQYW0xF5O7wG7GbD1pQyhqnGKhRAxlcKLXY9v3Rj+1Pmb8GB
	zOzv8plmsR0bLa7KlMoqIkwOWCSKIub+8FrL84VQ9Gw==
X-Gm-Gg: Acq92OHgFp+I9qg3BnCsI8WABJcJNNNt1kAWyuY3nIpW7jErCtPzqTrtcMKrJyTwz1X
	+3L9bEqJmxxjF2FzuYygR4JzY8EK/uH170uQq7GFFtl2YYXHqjDobj1h25AC6unaPfP1bDFF0wk
	vohvnyocuRnBg2qBkXHdc3QW4Kj7wR2E24BtQpGcGnEg8Qk5nQd9S8del6BdVqmSX7p8BJpU37E
	LY3DUsdAp1YtEkfd+YtNNUS/n7XVW/oWxEovmm4xGXOjwHYtqzvCmPr9RkCkBTmj7gEjz3xAhzP
	jM4u1+t6g3lWfc5eTMLZIcDyCQT0oCPccxb1lHaFfaBUIQwq
X-Received: by 2002:aa7:c3d8:0:b0:68c:3439:945f with SMTP id
 4fb4d7f45d1cf-68f0f3ef6c9mr1109192a12.12.1780575936462; Thu, 04 Jun 2026
 05:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org> <20260603-acpm-tmu-v8-5-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-5-0f1810a356e6@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 4 Jun 2026 13:25:23 +0100
X-Gm-Features: AVHnY4J8PoxEVn9YHkIV62f2JcL-eq6_poQLFyumkGxMP4pQHp8fyUwqwpP8j1s
Message-ID: <CADrjBPqXnv97XX2y-_YKi4=NCJw5CcaBd5b9ibQEHLZ5N6ZYkQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] arm64: defconfig: enable Exynos ACPM thermal support
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, jyescas@google.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 14:00, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
> to allow temperature monitoring and thermal management on Samsung
> Exynos SoCs (like Google GS101), used on pixel phones.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d905a0777f93..3fe76a4c2633 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -793,6 +793,7 @@ CONFIG_BCM2711_THERMAL=m
>  CONFIG_BCM2835_THERMAL=m
>  CONFIG_BRCMSTB_THERMAL=m
>  CONFIG_EXYNOS_THERMAL=y
> +CONFIG_EXYNOS_ACPM_THERMAL=m
>  CONFIG_TEGRA_SOCTHERM=m
>  CONFIG_TEGRA_BPMP_THERMAL=m
>  CONFIG_GENERIC_ADC_THERMAL=m
>
> --
> 2.54.0.1013.g208068f2d8-goog
>
