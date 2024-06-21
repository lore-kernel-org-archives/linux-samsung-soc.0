Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B683884A32
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jun 2024 19:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718998822; cv=none; b=ThShsVzqSq6w4Enyl+2kX02TtAJyVkt3w7Y+lQ+OAXVlK47xVv18aK3kTtrcvnhbuz1c1KVwDGqeSwjkEyzXrrjH78n6UGLM6XSFudvUCe+DB/01jkuD3djxch/y/013tNMknpoNXudvQPKISjmiOGzJDnb8lpJkCKwCnlELq68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718998822; c=relaxed/simple;
	bh=6ZPeCGjV8WBzKchfn6bhJls+sDUkHecdyn5jbswwMA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y2G9yKKN2Hx8ySBE+uOzToAqbVMGeWKChVKYeWfBNDUkrA5z6MIz5qytetyfaehadyWWFbwbEPhnQSuKAZIQP6pcc4TZg4tDC+pR6bPKxzuf215GQIfM7J5VDIbtwxrA0P6iASAobUkd4m2p/PltDU+7Yas+IGZZmMkgDAAnpPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NdrVElxF; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NdrVElxF"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-630640c1e14so26000097b3.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jun 2024 12:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718998820; x=1719603620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbwyiyWva+x9FYZsLEbwDcBJqBAnnNSOVrVdnz/JzOg=;
        b=NdrVElxFQdKgDZffEK30KtUnF8EkQcdiH4pR6F9xg+kf3PV/XMU0BTo70omSG9QFe6
         K0AwFsYmwmsM5ikZNeUbvWF8fJCmZ3DXo/INLp7J1mNHxxSA3Y+nFOAPQ7FK6NSgDZwu
         THNaVoWMHG2DZYsT4EnDGXv15FGp9stvRPcRS6lzFjWdmqQnMafbxeL/HRUn2d06rtul
         TBWf2cad3lgIIcKFa0F/Q0Hrr/93ehezxTucLnWM1ywy4GkrZK2V8K9mO92z0XYgTwt6
         bgnLUfhpqmyLpKIp9mUZdbQmSiCMtrVpMb9E86M5cpRk3x3J4wsovqQqHv4pP/rxlis7
         T/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718998820; x=1719603620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbwyiyWva+x9FYZsLEbwDcBJqBAnnNSOVrVdnz/JzOg=;
        b=bbaPJ6ekTn42QEzfBFVhbOIoBrUxHNTFKrn+Kgvdw3ypmjwQKigLDiMJkNsuk7Osga
         N9m+9xkIvZxhwfB3lHUK2Pgtnnbagx0KZFJe5Vi22OKyxaviz1hET4rT98Tmpe6LbYeA
         IO77tYT2WAsn6UEz222iZPZ83xa0tT+tbYAo3rJsiXDWx2gy4cPncPhFVo2GY5OZSdqd
         XE/u6FESG0zORKQg5NIof7xWqlsiHafIKDmqXcKrgoUr5aNFf5MNhpO/zXfu8vm02o5f
         HX5bGvZRfUsRmwr1E+VRWguFjXpcJgp96HHO042SAX3bxn9ZG386R9qriHLo7KvFoarv
         E3Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWUeemQkK/h45D0D5u6jyFEDcpmFLmaCINPWdPjPWXBMQPXIrQn4Ps2t/diHNJWu4pFXD8dX26K+uRBS2GGrCKnTpSdeZ8T0g/4K4G64z4O1fQ=
X-Gm-Message-State: AOJu0YwOWDF21cW4Q+fKTLqfNgrDHw4UcOAaRHmmHxerUsOQbYr9h++l
	8/efMejhFhpbjrn3vX4hBDqsyE2WvneUb4tzRMiplID+tuk+XSltWtbvTxOGUkC0/OBaTMiIofe
	/Z1dZw5RU4A29JGJq14Mdolvve8sH2GuMVmE1SA==
X-Google-Smtp-Source: AGHT+IEmV0m+/TjcKpWT6y40NzpmbgGYoiiKNqdKPlOSZ6tUU44/DxfiY84Ds0g2/sBfdjZbnUd1cxbqC/UhcIk3SWg=
X-Received: by 2002:a81:f805:0:b0:62f:cb31:1be with SMTP id
 00721157ae682-63a8d543d67mr96963607b3.8.1718998819708; Fri, 21 Jun 2024
 12:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240621190049eucas1p28ba502d86e2f9380315c06add645517c@eucas1p2.samsung.com>
 <20240620231339.1574-6-semen.protsenko@linaro.org> <oypijdplsaruia.fsf%l.stelmach@samsung.com>
In-Reply-To: <oypijdplsaruia.fsf%l.stelmach@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 21 Jun 2024 14:40:08 -0500
Message-ID: <CAPLW+4njmKxXSMqNazX6t6LS=fHNh6Pi8_icF1=aPw27G0J3PQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] hwrng: exynos: Add SMC based TRNG operation
To: Lukasz Stelmach <l.stelmach@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Anand Moon <linux.amoon@gmail.com>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 2:00=E2=80=AFPM Lukasz Stelmach <l.stelmach@samsung=
.com> wrote:
>
> It was <2024-06-20 czw 18:13>, when Sam Protsenko wrote:
> > On some Exynos chips like Exynos850 the access to Security Sub System
> > (SSS) registers is protected with TrustZone, and therefore only possibl=
e
> > from EL3 monitor software. The Linux kernel is running in EL1, so the
> > only way for the driver to obtain TRNG data is via SMC calls to EL3
> > monitor. Implement such SMC operation and use it when EXYNOS_SMC flag i=
s
> > set in the corresponding chip driver data.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> > Changes in v3:
> >   - Added appropriate error messages for the case when init SMC command=
 fails
> >
> > Changes in v2:
> >   - Used the "reversed Christmas tree" style in the variable declaratio=
n
> >     block in exynos_trng_do_read_smc()
> >   - Renamed .quirks to .flags in the driver structure
> >   - Added Krzysztof's R-b tag
> >
> >  drivers/char/hw_random/exynos-trng.c | 140 +++++++++++++++++++++++++--
> >  1 file changed, 130 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_ran=
dom/exynos-trng.c
> > index 6ef2ee6c9804..9fa30583cc86 100644
> > --- a/drivers/char/hw_random/exynos-trng.c
> > +++ b/drivers/char/hw_random/exynos-trng.c
>
> [...]
>
>
> > @@ -103,6 +163,24 @@ static int exynos_trng_init(struct hwrng *rng)
> >       return 0;
> >  }
> >
> > +static int exynos_trng_init_smc(struct hwrng *rng)
> > +{
> > +     struct exynos_trng_dev *trng =3D (struct exynos_trng_dev *)rng->p=
riv;
> > +     struct arm_smccc_res res;
> > +     int ret =3D 0;
> > +
> > +     arm_smccc_smc(SMC_CMD_RANDOM, HWRNG_INIT, 0, 0, 0, 0, 0, 0, &res)=
;
> > +     if (res.a0 !=3D HWRNG_RET_OK) {
> > +             dev_err(trng->dev, "SMC command for TRNG init failed (%d)=
\n",
> > +                     (int)res.a0);
> > +             ret =3D -EIO;
> > +     }
> > +     if ((int)res.a0 =3D=3D -1)
> > +             dev_info(trng->dev, "Make sure LDFW is loaded by your BL\=
n");
>
> This is good, thank you for adding it. It can be even better though, if
> you don't skimp on message length (-; I mean, I know what BL is, I can
> fingure what LDFW is because you have explained to me and I can see the
> source code, but somewone who sees it for the first time will be only
> slightly less surprised than with v2 error message only. Come on, you
> can make this message twice as long and it will still fit in 80 character=
s (-;
>

Guess my OCD got in the way and I just didn't want to break the line
:) But yeah, LDFW =3D Loadable Firmware, and BL =3D bootloader. There is
an "ldfw" partition on eMMC, and I noticed Samsung usually uses LDFW
term, so I figured it was not a big deal to throw that abbreviation at
the user. But I totally agree on BL part, it might be confusing. I
don't have any strong opinion on this one. If you are going to apply
v3, can I kindly ask you to change that message the way you want it to
be?

> Don't change it if v3 is the last. If not, please, make it more verbose.
>
> > +
> > +     return ret;
> > +}
> > +
>
>
> [...]
>
>
> Kind regards,
> --
> =C5=81ukasz Stelmach
> Samsung R&D Institute Poland
> Samsung Electronics
