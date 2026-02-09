Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F09366040
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Feb 2026 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770630974; cv=none; b=dkeJnts6gUtqLkwOYquWTBhda0CPOK8Tr+bYeiXpvAe4qHgWYanlggHx9WH0QmVfs8oE47/a4SKwoUARctmOgv2O8FPfXEoOZ2I9rLTjAvzSKEo3NoxcAo73ii+tuAjH8dxrwnRL+QtTxev/+kKj4sT50Cx37G6BJ/Zjab0MiGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770630974; c=relaxed/simple;
	bh=Xnhz3h8XvqboqUflpGjiP4XMV0lZE7h7GD2kPZi/uOw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k8hL9s7n35bkiIYTaOrRv5pXkF6WwH0/RYGdczdFu/qSkfpkmiAAEPXNr80vOe3aOAr+njEtRF2kywKUw/TzPIHewSRyYW6L8mCHVmDMtwG2EXL58zPFPc0Hy6M+d67oTYgtraEvWTlEOmNvvNbOikxc4MTAiDSvvYCJWtbAHXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcY3j6H7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcY3j6H7"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso42203465e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Feb 2026 01:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770630973; x=1771235773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVgv/ApvtPT8cTKfn6etBvdAtAGXr656rVlWgGYQDx4=;
        b=BcY3j6H73TpgyrfQyQ35IVz4TCMOOaiFlnXYf4NFyT+MKx+pvEr0yiOe4KUjHmvCnm
         mp6D0TQK9uOsoLS7VXH4qi2t3Qlmy3U6YCNDkf6Aqtmz9bXLjFVszkF7HnrQAN4Kgswl
         M9/HkJH/ie05iGwqUQ2Q6WbhORT0JG2r4YwQHRxjijkyqeGvfDMme2dTJQ9N0Nyd5w3M
         8qs8r7RGJqOAKYjT0AayAc4jf6npykbz7iisoFJMgbrZv0558GYSc6rPLcH0NfB3VAlM
         zjyLQu2A+8Sq5QYtSLZGzBGTu4Fnew0XzqdI3G90jlVjf4Eb5ftvh4JhwtSv5j8o0yr4
         mduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770630973; x=1771235773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IVgv/ApvtPT8cTKfn6etBvdAtAGXr656rVlWgGYQDx4=;
        b=cBQr/Am1AW3BNWE3TLogMAXK5Imd4EmgSiX7GBLpY6qBMFZt9BGW1enOd0ucjBPrgS
         hFQdMzL0cdthKdAM5u5ST1QVHyLkSfJwDWVD34gYUvM6OnmBDjt7OBex7xunUEgCbzCv
         ofKmORoYLn7sZvt2vty1ag/Rd4553WhWMByXljdLyvC0zoj3shTbQqNGISgyXrYIcg4U
         lcK23w4jQnwlMCBY9v71Pvx8S44GqoziwaBSCLXO7aNkxivc9v13aqnSfLLjnYiiwjAC
         9vIQg4Glj4RxQMJ0Bw4qUcq8RAuAIPFc+v+Ffjv/jRCIyPE1IDEU/yg1QVXD0aXTiKua
         E/gg==
X-Forwarded-Encrypted: i=1; AJvYcCVn0BhmV++QQxzLxr+RdJuBmS6NYYQijCtm9kkgXAaG3nO732jL6aVXnt9QVk71y0YKeP7y8ipVfx+qti4CgyhVUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ9F54ApRUebeegcceKKRmC68af1l4d94wwDcxV7I/oK3gPZBg
	2dCRXz4Kys7GbAMmKwm8d7NXkGUeR5Pjw8LTVYb13BUTYB+o7V8Ndtq+
X-Gm-Gg: AZuq6aKp3iqM1XnN0lqHuV7HlE8qOJO3cRVh59qYGtXljjfXEIM8wJPIUbmNRLE8DgB
	TwGKb/wpIUMP7qk9a9oGCIG/1pC4M3gurgUV/gerUxFyp7Mwui4sn5HjPFiL6K7xat84A/FlR4K
	DOzCttJFcgp5qSy7X/9/PhUk5owR2bK/iK5dcrldU27w0C7oVUe6+nnshvMpGqieeAOT2tNahqS
	JSM1AuhWLrcMOtvL+9lRzaf//1Mh9bcrm3tY4Q507DhAoemcppcbB61LRBAis1xpA/Xwe+oXx36
	0Ch1mxUa3XZHIsDYW6v0lg/yBqhNSniEHMFW6h0hthlJaGzUEd2ZZrBY6S79P2d7BPDJpQHFb8Z
	9QLInTeQPrEhRA2cvvBvoDyoQquLgX9lhpkwi13OTEyOXLgPMdr0WdxgBETP9ACDRd4v2sMLZLU
	3bRg35eya+LoP49zfmQw6HSw0xlvyKqL2jio8vJWTP+eI8LN0tOWJd
X-Received: by 2002:a05:600c:474c:b0:482:ef72:5778 with SMTP id 5b1f17b1804b1-483201dc4efmr164588285e9.8.1770630972561;
        Mon, 09 Feb 2026 01:56:12 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320728774sm224222235e9.14.2026.02.09.01.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:56:12 -0800 (PST)
Date: Mon, 9 Feb 2026 09:56:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: =?UTF-8?B?xYF1a2FzeiBMZWJpZWR6acWEc2tp?= <kernel@lvkasz.us>
Cc: Lee Jones <lee@kernel.org>, Kaustabh Chakraborty
 <kauschluss@disroot.org>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, =?UTF-8?B?QW5kcsOp?= Draszik
 <andre.draszik@linaro.org>
Subject: Re: [PATCH FIX] mfd: sec-irq: fix non-constant case labels in
 s2mu005_irq_get_reg
Message-ID: <20260209095611.12e4d438@pumpkin>
In-Reply-To: <20260209040358.2123413-1-kernel@lvkasz.us>
References: <20260126-s2mu005-pmic-v2-6-78f1a75f547a@disroot.org>
	<20260209040358.2123413-1-kernel@lvkasz.us>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon,  9 Feb 2026 05:03:58 +0100
=C5=81ukasz Lebiedzi=C5=84ski <kernel@lvkasz.us> wrote:

> Case labels must be compile-time constants,

They must be 'integer constant expressions' which it stronger than
'compile time constant'.

> but the original
> implementation used array element values like irqf_regs[0], causing
> a compilation error:
>=20
>   drivers/mfd/sec-irq.c:218:9: error: case label does not reduce to
>   an integer constant
>=20
> Replace array-based case labels with explicit S2MU005_REG_* defines
> for all four interrupt status and mask registers, preserving the
> original logic.
>=20
> This addresses an issue in the S2MU005 PMIC support patches [1].

Makes one wonder how the patches were tested.

>=20
> Link: https://lore.kernel.org/all/20260126-s2mu005-pmic-v2-6-78f1a75f547a=
@disroot.org/#Z31drivers:mfd:sec-irq.c [1]
> Signed-off-by: =C5=81ukasz Lebiedzi=C5=84ski <kernel@lvkasz.us>
> ---
>  drivers/mfd/sec-irq.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> index 44a1eb074a08..73a611ba0502 100644
> --- a/drivers/mfd/sec-irq.c
> +++ b/drivers/mfd/sec-irq.c
> @@ -215,9 +215,15 @@ static unsigned int s2mu005_irq_get_reg(struct regma=
p_irq_chip_data *data,
>  	};
> =20
>  	switch (base) {
> -	case irqf_regs[0]:
> +	case S2MU005_REG_CHGR_INT1:
> +	case S2MU005_REG_FLED_INT1:
> +	case S2MU005_REG_MUIC_INT1:
> +	case S2MU005_REG_MUIC_INT2:
>  		return irqf_regs[index];
> -	case mask_regs[0]:
> +	case S2MU005_REG_CHGR_INT1M:
> +	case S2MU005_REG_FLED_INT1M:
> +	case S2MU005_REG_MUIC_INT1M:
> +	case S2MU005_REG_MUIC_INT2M:
>  		return mask_regs[index];
>  	}

That looks as though it ought to be an if statement (or two).

	David

> =20

