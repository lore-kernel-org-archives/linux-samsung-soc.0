Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E482B149C7A;
	Fri,  6 Sep 2024 07:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725606235; cv=none; b=kD6ZbqYyn130ztlIMpLhvcWXMeQIj3bjxzq5QeYlxgPzFTBRtFv9Tp06GCvCBrde35K5wqy/rbJruzm9XaqGnqG8kyQdEfPKWW/nEHToniXOaijlX9srkcrwENPeLjmIcONkZ8YJsQPIfHTKShrgWnxSLmfcI9lbqVMXPTl5A+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725606235; c=relaxed/simple;
	bh=s8UUzacwVnl0YLmN5UrXoJ76kzWxcTkevPcaDv1C9uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QefyB6xim2265yu23aAy9wCdjKECpd638V8zeTeJk7YSy9oZ/ZgNNwEwNbixaQB4YVn1vGCZtz1LMUAMlDiEDsYSXPkCQri8h1b5xA9rlkEu0yyBeUXXDboYX2MmgyvGSZoCB55rIoZXGWRetutVJGhW6xYY26QaoreiHg9y4Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkK8Bh84; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkK8Bh84"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-502aeeb791eso154582e0c.1;
        Fri, 06 Sep 2024 00:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725606233; x=1726211033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQP9fjoMvNzGodLR3rN9WzzZsDn7pee0FftrcLS8K1M=;
        b=CkK8Bh84IBIAlflZMDh0hPLdcfy8zxVX0rGcC9LyLXNYshkV0Y9AYC5Cd9HIUDqA+0
         6MTVx6nLN5BCrW8lY2iKOslLzzFWxFiAlfVKcxzyMSOBnNIKmGw6rkUxAuzgZwmXttBR
         riJoasqd83tgd4ned+twCvusme59BvLp5BSUX1SeuDETNWPnUj+0Zw7gWGGRWVVQSG62
         8aSOXpQ2etl6KEunZ7QjCcP0TKqSCF4kqeGNDasU7XYsJ4FxIRSPv7q66cFO0CiWlsPF
         ryZPrjmAlY32a7+v7+nJ6UFc3uS1EgA5bs/LFYXSyj5MeSXKyi7S3BnlT1VRjudDCkCy
         ESdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725606233; x=1726211033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQP9fjoMvNzGodLR3rN9WzzZsDn7pee0FftrcLS8K1M=;
        b=hNz1YRtECeB/++sQnqIyuf2RbMspP0FuYSMc1GyS1EIN4y2KM30CAExSiQf7OMudnI
         pYONWWhn6YanaMig1s56akONPqyfC5IgRHrqtXWyLZxvTpHxvWxu8LayjYU2xOeB3ZO+
         u6gPBql2hZcFyh4dsECKRqbTD7enXn1wXzXxaj/WEWLumSzJ46uAd2rlE9HHFVOd2rlL
         +bRH6BehAq4se/Ii0qvUhxxubIpGyVXO1iRsAMFVtOiB5NyqHmFp2Qyei/szhFlKTYV5
         qaDeL+/+mDGnyGb/QNX0VuJrZvSjWL+UZwrIjO0prWk27CcPwsYF+6HVV/KYZkuMZx8v
         Bx2A==
X-Forwarded-Encrypted: i=1; AJvYcCUW5FIwuOh4WMLHPNI1LHHSNFwYTXAo2NQViqzH5NNzbeWjopT5nA0j7OqMNYSU200/zTMsgSsZe/nk+d60GjtCRZ0=@vger.kernel.org, AJvYcCXgOO9dUWSgcxzFyUzqmRT2Pg9pBAPFd2BETDx+JKHoXpjtUOXJynO/tQl2JDq+UKRUvdbIxP4xJm3ithg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQpfh6PYa1cuQdL5LLenZd5z8vAK8KJuot5voLcCXWQZMBklkQ
	yaie+kiPOcUQjC216zAnSOt1jjpLF3cwy6dm9K7typ2B1a3w+5slo0aOtGBdat0KlD5jGkokYG6
	uysEITdcwGcbwO8vBaNDDXwiOWUA=
X-Google-Smtp-Source: AGHT+IEN0qBLQeDG0XiyrY9rkcl5CaIfbG2bEDTzc5WKY9yWSHevLvtPPzoQbYADc+yvKuc3+2zikyihFR5elq/nn1k=
X-Received: by 2002:a05:6122:904:b0:4ef:58c8:4777 with SMTP id
 71dfb90a1353d-5019d455718mr1421444e0c.4.1725606232696; Fri, 06 Sep 2024
 00:03:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240814035701epcas1p21fdecb1ea56edb88951ea789a2123dd4@epcas1p2.samsung.com>
 <20240814-remove_define-v1-1-7947ae6f747d@samsung.com>
In-Reply-To: <20240814-remove_define-v1-1-7947ae6f747d@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 6 Sep 2024 16:03:15 +0900
Message-ID: <CAAQKjZPc1St2gOF=nVqShtdaXdG_B2h+7hF4vdNFfnvFmPvGGw@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: Remove unnecessary code
To: Kwanghoon Son <k.son@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kwanghoon,

2024=EB=85=84 8=EC=9B=94 14=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 12:57, =
Kwanghoon Son <k.son@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Function usage exynos_atomic_commit was removed in
> commit 41cbf0fdaa28 ("drm/exynos: use atomic helper commit").
> Remove unnecessary function declare.

It's true. Applied.

Thanks,
Inki Dae

>
> Signed-off-by: Kwanghoon Son <k.son@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.h | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.h
> index 81d501efd013..23646e55f142 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -254,10 +254,6 @@ static inline int exynos_drm_check_fimc_device(struc=
t device *dev)
>  }
>  #endif
>
> -int exynos_atomic_commit(struct drm_device *dev, struct drm_atomic_state=
 *state,
> -                        bool nonblock);
> -
> -
>  extern struct platform_driver fimd_driver;
>  extern struct platform_driver exynos5433_decon_driver;
>  extern struct platform_driver decon_driver;
>
> ---
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> change-id: 20240814-remove_define-580075bceaae
>
> Best regards,
> --
> Kwanghoon Son <k.son@samsung.com>
>
>
