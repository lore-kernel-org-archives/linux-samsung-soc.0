Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF6915747F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718738809; cv=none; b=OwbGmjAgLpZBTmy5OASGWHUjT335CkveRqOZYnTgiAs6X9ERPtyG8oFUsQ/rlULT9VoKGC45y5ZhIn7UUhFwF8kzvNoVySYs17lrq2oHYAAgl604A4DWAs1aSPTsU2Wvx8KF9u/6RgeGU0rcRtoJurU5dM2e4oU1XqzQjPzL+7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718738809; c=relaxed/simple;
	bh=+FyiA+pYK8APwK75QeRcyo/HcZRVxSHlp1CzDFB8ZR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ewP4uTUyf8QJk0VTWZ2Z+Mz+AG99yfKc3eFy5bNUjxfC3lg1/PhJX/oNkmgflliewjyZ89VDHRm/giyTxGcmiaGOY0sFEPVBraAhJxJgaNHROgRkme0i1QjUmASIIo9/MsrSLH75PnCSCE1L8wETAcd9RufFRbd3GAnH7JuN5+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=An9P9Ci9; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="An9P9Ci9"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dfa48f505dfso6215577276.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 12:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718738806; x=1719343606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JdIhONv4P+97AjtXHbls42T4V6PxnxrDwc043W4vOo=;
        b=An9P9Ci9QQ1c5s7gcjCkRnfqnMy/q/1l90M1HEk38mkKcMwJZBQlZMctXfkqRwSUXs
         GoPq7wRdaI6U/3SLlTkld9O9xMIEW898NrHgJ5ZvD1Lr4OmxwqBuJAsW4yM+pHXzJxpR
         7nD63JgJO44ZJKs1g6sf+ebcMpAbxWguzEbmvWFUt6OuCOSTSw2BrzfsPEWdzsY7707j
         rWtNw7QDxpd2TlVGM3WjuBNYx87Rt4Hj18CLPXNFWmlDM/cNLmXbHS6zJMOeVvQP/YkL
         HANnyn/aSn8+kyhCDH07N21Yr/MZbZIFYuSshUVYPxj9n/ophLf8LjeOLU0DkbmqJDPG
         EPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718738806; x=1719343606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JdIhONv4P+97AjtXHbls42T4V6PxnxrDwc043W4vOo=;
        b=RdOvzWr/lNoaXy7fP/jmpMRnPb5CVwMGS2+W4OUvWiqK1F/Uq8EOfMsZp+IhNmQNyE
         dTst9m6VPqlF+CAcYXLRLgSRlKLWgkm9qKVIW3KMFjMgrZaOERfyNVvOL+iaoiqbXDx/
         giU/PlVj+nD/ogMubsQ3fF178iIjcHqfpVsPSZ+tey/eMeZ1UtRojVaKNdr3/zQCLEew
         owsB65/YlIaH6yYGoSUV3p+KnbWg7NJFBqvk32i7BsrSP2CMjPwMV+7YRXXQLsW2L2h8
         uRYtQE+O5NacTrHovaoCsEYgSyo87tv14Fo+8r5Q3rMwQ9I9qLx17Qc0/Ui8SDlSzrW/
         lwzA==
X-Forwarded-Encrypted: i=1; AJvYcCVD9lQbocw2S4zYr/ORaZOR5cmvn51RBXFmHGLYJb5Lu1E7qmz2z3WIORPJ7HFJmfQy2BPouvPB3DZxe9gsnhr5sp8q68q+Uxv4j4WU3AoLM7s=
X-Gm-Message-State: AOJu0YxHTp4yr248v8AEVbCq6ZmHJUhRCoNRh02AACJhp1ilRzvi3gyF
	bvfD6iyxqpQ70aAIdwcdipBwiGNNV6c6gksAPnrABkFHin+PMZh33QZsR21sUaBMc+Vz4MJ0mSr
	bbUUj4srlOaOWJoLQsJiZxby9zJVV02xmhSjYxA==
X-Google-Smtp-Source: AGHT+IEgckfSzpfRkRk3dzsXY6WG0jQp3J3r598HIt7lADXYgT+sH/QiHeZPNODRKExgkh5yZnVfoB+gxVSZC+8vuoE=
X-Received: by 2002:a5b:c4d:0:b0:dfd:c928:cc9f with SMTP id
 3f1490d57ef6-e02be142117mr988991276.26.1718738805816; Tue, 18 Jun 2024
 12:26:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618003743.2975-1-semen.protsenko@linaro.org>
 <20240618003743.2975-5-semen.protsenko@linaro.org> <CANAwSgSaYip=oqtLfTzFMq_HWGJMMbEXOqKWC8ANzxNZmBFXTw@mail.gmail.com>
In-Reply-To: <CANAwSgSaYip=oqtLfTzFMq_HWGJMMbEXOqKWC8ANzxNZmBFXTw@mail.gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 18 Jun 2024 14:26:34 -0500
Message-ID: <CAPLW+4kGH+WJS5x6ujGacD_uhsUb9Mi7w1F+ocnc6hZz628kew@mail.gmail.com>
Subject: Re: [PATCH 4/7] hwrng: exynos: Implement bus clock control
To: Anand Moon <linux.amoon@gmail.com>
Cc: =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 11:26=E2=80=AFPM Anand Moon <linux.amoon@gmail.com>=
 wrote:
>
> Hi Sam,
>
> On Tue, 18 Jun 2024 at 06:08, Sam Protsenko <semen.protsenko@linaro.org> =
wrote:
> >
> > Some SoCs like Exynos850 might require the SSS bus clock (PCLK) to be
> > enabled in order to access TRNG registers. Add and handle optional PCLK
> > clock accordingly to make it possible.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/char/hw_random/exynos-trng.c | 22 ++++++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_ran=
dom/exynos-trng.c
> > index 88a5088ed34d..4520a280134c 100644
> > --- a/drivers/char/hw_random/exynos-trng.c
> > +++ b/drivers/char/hw_random/exynos-trng.c
> > @@ -47,7 +47,8 @@
> >  struct exynos_trng_dev {
> >         struct device   *dev;
> >         void __iomem    *mem;
> > -       struct clk      *clk;
> > +       struct clk      *clk;   /* operating clock */
> > +       struct clk      *pclk;  /* bus clock */
> >         struct hwrng    rng;
> >  };
> >
> > @@ -141,10 +142,23 @@ static int exynos_trng_probe(struct platform_devi=
ce *pdev)
> >                 goto err_clock;
> >         }
> >
> > +       trng->pclk =3D devm_clk_get_optional(&pdev->dev, "pclk");
>
> Use devm_clk_get_optional_enabled to avoid clk_prepare_enable
>

Thanks for pointing that out! Will fix in v2.

> > +       if (IS_ERR(trng->pclk)) {
> > +               ret =3D dev_err_probe(&pdev->dev, PTR_ERR(trng->pclk),
> > +                                   "cannot get pclk");
> > +               goto err_clock;
> > +       }
> > +
> > +       ret =3D clk_prepare_enable(trng->pclk);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "Could not enable the pclk.\n");
> > +               goto err_clock;
> > +       }
> > +
> >         ret =3D clk_prepare_enable(trng->clk);
>
> Use devm_clk_get_enabled for this clock
>
> >         if (ret) {
> >                 dev_err(&pdev->dev, "Could not enable the clk.\n");
> > -               goto err_clock;
> > +               goto err_clock_enable;
> >         }
> >
> >         ret =3D devm_hwrng_register(&pdev->dev, &trng->rng);
> > @@ -160,6 +174,9 @@ static int exynos_trng_probe(struct platform_device=
 *pdev)
> >  err_register:
> >         clk_disable_unprepare(trng->clk);
> >
> > +err_clock_enable:
> > +       clk_disable_unprepare(trng->pclk);
> > +
> >  err_clock:
> >         pm_runtime_put_noidle(&pdev->dev);
> >
> > @@ -174,6 +191,7 @@ static void exynos_trng_remove(struct platform_devi=
ce *pdev)
> >         struct exynos_trng_dev *trng =3D platform_get_drvdata(pdev);
> >
> >         clk_disable_unprepare(trng->clk);
> > +       clk_disable_unprepare(trng->pclk);
> >
> >         pm_runtime_put_sync(&pdev->dev);
> >         pm_runtime_disable(&pdev->dev);
> > --
> > 2.39.2
> >
> >
>
> Thanks
> -Anand
