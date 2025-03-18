Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACEC1DED53
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2025 20:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742330229; cv=none; b=mAxuFUIoF7CZCPDQ+GxLJPDjMdDyQXDnuoBbG3S4NDcIDut81hUUG/y3vJnBMvImWLg0cLKFVxxqmHfTwK9Ndjk24SDNE5PRZZuB4CKNvtuCbRUOKWDKdYiDbM8AOto1qpwV7uDiOiu537TooZEKL3v4jabM8s8z1ZIvL1nltME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742330229; c=relaxed/simple;
	bh=lNR5VvElIEgV/xFpc8FqtIXn/kLNjMvbzxoCJsOYSPM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Um2EqQeul+8AnU6W5xkeGXHRVLprxK2e00t737sMw2tbEFiE7hUJ34PoNJZybTvGfqBHr0YIwxCjLAZwDtSNaXWG1kzAyQo2EqN30zYbcwahTqArAcfF31AEjYBLBSWpqXgUplnWaCQBM4gzEC/LYec1DpTvojptartlqvM+TrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DV3rC62O; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DV3rC62O"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso317125e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2025 13:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742330226; x=1742935026; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jfIx/dOVNK3Zui69zoqhnyuZ295+o15UNvhExnoCsjM=;
        b=DV3rC62O8JJlkN/WYAujnvPSiaa2OwWxrBFMwJMeYVa79AAakDH86fAtWSstC/UHNz
         FlVBrJnKGVnwY6sOy/xc4sX4AsPNL7awAr3ru3btwH0OJb7XQw2mRivd5fPaFu+64cGq
         RUU/iqMx4rWmYLrSCUjF3wL3zHCsWmIbxamGYGjVyZFHR/l8zaiuGOOryMYS6U+yJ2oI
         zkF9cELGhR2t28/fwJC1jSrYR4Ih7hPIz7l+/NhINz81QLV7TCjZmPlVx/mwASirq7b1
         zXIVEfSNgkRMuqoQKl6N+5ltFcxBTPToWgPcOI+Hl/SWSGDOa/cda6/f5YPyqtz8P53Z
         cPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742330226; x=1742935026;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jfIx/dOVNK3Zui69zoqhnyuZ295+o15UNvhExnoCsjM=;
        b=PspzRBloOini4WWvJf85Xw2Z9CHxUcWzfMnQsWDlyX1cS3PhX8C6ir2R4iahAuRNs8
         LZbIbphnqJZIqliaTXAP9GRNCOms3P0Cr+M7idBLZ7AB8ZaREb6udGT3MaiyQs+eP6hp
         pVjTyMlohxJ7TrEFbWXw/OailIVhfjM4I0TMobaCw38Z9UlOK/px0huSwufakkJThYCG
         H7RvB/FLQVmM1Ca0y2oVwssqnIMdZXtEPLMgT1BwiyQZtEDGakVg0m8oD0TkzBMBnk04
         +/sk5LGKFk95oACEZNJB8XO/nz9PsMQ02GgI/8XQ4DCqmL0dKqC39O+4Om7V30+pOAIU
         PAcA==
X-Forwarded-Encrypted: i=1; AJvYcCV1SBHVMj9MdVPey7ld6R2d1YQ8izlMZzF/DDp15YR7olml9KqZRY4GdIa53+23dnyQPi+ZkjN3gXDMfpghdnvsDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYk7U55ovGINZklPLGDvZP7ekS5SK3CoBn9/0MPCqt8pRsNC94
	qxgPEl0TRI739EJ4tis8R9aNF6WfqUxTQ6BiDb2mMFOzJugm1bXMYlbzG6kEVuc=
X-Gm-Gg: ASbGncsfO0l0jRUxq+XPWpnYWB4AlLAusDr+BwuwHX+6hJ9gml6H1knyQOvr90Ihjt3
	PKcwLEu+VR5zB3MipmYJb19ZmJpsv+JArhRTHelb9aZCTl7reWW/QN8pRjDuQ+KlfPWlhGA9jno
	saCcsTxgRCOiRms8w6CaCxqd0WGSlSLY2eFRQX/61JWAXHIVaKo3i/CgiroI9WGQXxa59SPgTDm
	vq5iaLgVcjvgn+teVlddB8qJUQkorxfy2fp11frBFADWbO0zjHIg8+QQy6YeafmzQN5bxZyH9ri
	42HDmho+36sQ4T7rJl5hJpwnJLJtu7CuKO00UstI2W2WZ0R4
X-Google-Smtp-Source: AGHT+IGKaVnWmA6ubAmSh6+AGtDNLhVaSjlQLGrz3oxVZZzlKeEgo0GAHVg/nYm/WzGxiXM4Eel1zA==
X-Received: by 2002:a05:600c:1c9b:b0:439:4c1e:d810 with SMTP id 5b1f17b1804b1-43d43034b2bmr1001245e9.9.1742330226048;
        Tue, 18 Mar 2025 13:37:06 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d33f5771dsm54780805e9.38.2025.03.18.13.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 13:37:05 -0700 (PDT)
Message-ID: <2d38d2f242bbcce452f6c29f4ee79aa9c5703b7d.camel@linaro.org>
Subject: Re: [PATCH 3/3] firmware: exynos-acpm: convert to dev_err_probe()
 in client API
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>
Date: Tue, 18 Mar 2025 20:37:04 +0000
In-Reply-To: <801a9754-cd57-42c6-9569-16d9a99bfed9@kernel.org>
References: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
	 <20250314-acpm-fixes-v1-3-ab03ca8e723f@linaro.org>
	 <801a9754-cd57-42c6-9569-16d9a99bfed9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Tue, 2025-03-18 at 20:23 +0100, Krzysztof Kozlowski wrote:
> On 14/03/2025 17:40, Andr=C3=A9 Draszik wrote:
> > dev_err_probe() exists to simplify code and unify error messages by
> > using its message template.
> >=20
> > Convert the remaining dev_err() in acpm_get_by_phandle() to
> > dev_err_probe().
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/firmware/samsung/exynos-acpm.c | 10 ++++++----
> > =C2=A01 file changed, 6 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/=
samsung/exynos-acpm.c
> > index 48f1e3cacaa709ae703115169df138b659ddae44..03f907a95c6acd66d89cd8a=
f2f52e7c6dadf492a 100644
> > --- a/drivers/firmware/samsung/exynos-acpm.c
> > +++ b/drivers/firmware/samsung/exynos-acpm.c
> > @@ -701,12 +701,14 @@ static const struct acpm_handle *acpm_get_by_phan=
dle(struct device *dev,
> > =C2=A0
> > =C2=A0	link =3D device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUP=
PLIER);
> > =C2=A0	if (!link) {
> > -		dev_err(&pdev->dev,
> > -			"Failed to create device link to consumer %s.\n",
> > -			dev_name(dev));
> > +		int ret =3D -EINVAL;
> > +
> > +		dev_err_probe(&pdev->dev, ret,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to create device link to con=
sumer %s.\n",
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(dev));
>=20
> I do not see how it is simpler. Three lines (statement) is now 5 lines
> with two statements.

This was part of some patches converting to scoped cleanup, and
there it was shorter. Shouldn't have taken this change out of
that context...

> What's more important, dev_err_probe is supposed to be used only in
> probe context, while this could be called in other contexts.

True. dev_err_probe is nice though in that it gives us unified
error messages.

Happy to drop for now.

Cheers,
A.

