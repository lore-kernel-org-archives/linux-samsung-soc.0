Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C286FBF
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Oct 2025 06:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759733132; cv=none; b=i8NSIw2ZjDDkVSqfrvLD8hbR+jzWo1NDyt7aNFceIk2RZededjRpkttWAuu7KVPtss2sCEWq35MELenmQf1chz+uGoFItt9uxAJKmRfyFdffIf1CzdjWe7vZtZlZtaJKefs5EIPaJ9JhtLm7adtIGzcIDu8oC/BSeO31Xb59trQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759733132; c=relaxed/simple;
	bh=NMuoAimQl5z1QVIEkiLJdaqZSbw3bEnf0VXzo5Y71N4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nuOJaP1Ga9TbqY0UjNZJqqCRvrUrXvdk/fxRO1sDeVhsrM+E851AL3LGxFw9xmvfKke3DCgdtFbkKH1gz7YO6lI8jqbtgHNZGRliLa4s0KUzdfIvOMaoKLY+F3yjDzj/PfL2uc/hQAexey5XC64m1/Is2QnRySu5WTd5gx/5RGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kyIOCUMV; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kyIOCUMV"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso682762066b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Oct 2025 23:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759733129; x=1760337929; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NMuoAimQl5z1QVIEkiLJdaqZSbw3bEnf0VXzo5Y71N4=;
        b=kyIOCUMVMlzyQK6ZRfkZvaclJKM+X/VaOctz23CLMfsvKi82cRS3P06wzjQLeQkMWq
         7+q8KeYYLM01yVMb8InxH9iRXUJhwo9AMmFTagEoRiK/NVbsN1smtclH0Ay8SlUOn5x3
         nNqtGNAJK4MPmk3z8h2FmVhE+p2MxYX+WIcEloBlHDTJluWEDzmHrz3EjF40k9nzBnBH
         Sc5gYRP3w3FdR4+8psdfAraAG2LPdpaf0tTzEABZtmr/Dw/0oo+KVsF+m5zqG3SVzbsQ
         XFgXHdUq6rl2riFXceouzYrgZh/wQEtI+UKqQtLL7FsPDkN9lHQOThgoerU2rtTSq/V5
         tGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759733129; x=1760337929;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NMuoAimQl5z1QVIEkiLJdaqZSbw3bEnf0VXzo5Y71N4=;
        b=dQeJU3rg/8Mn4K6CTxGpxLJT8kTHe5PJhyMb5nHEHda8sdyVP6nFbHB7+JakQ1ZV3D
         GCv7/604vexKLh0EQIqbtrCUMMaNSYG/2/v5u1wYEmP5hor6ipfXOBX/pEaWz4ImGKgI
         iq/Pp+cwQLVkt7IEh1M7uQVlGPpQ4247iSbG6Pwjt8CffUHHNXZNk+9QWfL8OA0uRqOb
         WYARepAsa/qrlqDuOCjJbHi7sy49oEQUDNcomZUXRWPYOcWstbBm1yVTF6AdQbufJyL9
         DcBFt9kXSLHltBzRdB1l7kUtdePpglYmg0IvGMfcSzOL3NMHY7YfUujStAjB0aW2J59i
         9CqA==
X-Forwarded-Encrypted: i=1; AJvYcCUNGE6XS2zUQgJwfQ/HOmOUusTKdn1gBN2LqFB3FdXlhLJJuXlqxC0SBbuouiQ06NTzbxw5jAskjKfPx7ySwBXkKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfF/OUuqD1G0TodBBYMOSoZeT0hX7lZrvqD9GzPfEbQ5goYdlx
	lH+PalZ/8mDsu7gwMwLTmeTmMoJQTzvBDZHNRHPPqe6Jst3pMkkkMWyxXlwWqJGChio5qF5Lu9I
	TXuPX
X-Gm-Gg: ASbGncsglEmm0VHzbYd4vRvPO9uC5K4PMa7jUz1vTfOlDFaFohaY8wUTmDRKelBHaVZ
	t3Cs9o7szt20SLthYtTCf3x90ji1FKu1+tdEHS/Tj4RaEUx+QdlNdtbZYm4QEyrCpGTG6eR8Yd7
	dPfasqnr8nLKXrhCjKJUxZPcLQw1SM/147IrB3RmQi14RrzQeecas+r2GQa5wITKcT5IMprLySR
	ee2RZ3RV7+3oTTg9n8xYBpZjKj5S+XW+OqYeV+uV6VgrzazeC8ka6+RGb/F3jzvwj3Zaef2T2c2
	108mHJKazwyXqUbOVGfZdP//pWLQLiVSlU4MayMdkPAskZPzEplrkhi4WKhjGXndvQMoZ8AQnRj
	i/lMo//zOGr4WyfSXLt264kvDUH2IGe9l61OcM6gUvOTYghLJg5BIcZNzmixQv2SN
X-Google-Smtp-Source: AGHT+IGqbaxYVflPhQwlvzE4KWt9YOkvCpxShS92JNaxOYhBBBWeZkGh8ms2wjKFHVFGM9v06iNJOg==
X-Received: by 2002:a17:907:608b:b0:b45:8370:eefd with SMTP id a640c23a62f3a-b49c146e6c8mr1381123966b.5.1759733128600;
        Sun, 05 Oct 2025 23:45:28 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9f50sm1068769666b.9.2025.10.05.23.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 23:45:28 -0700 (PDT)
Message-ID: <662c6a56055a295e3f9bd594b8751e405590abff.camel@linaro.org>
Subject: Re: [PATCH 1/3] soc: samsung: exynos-pmu: allow specifying read &
 write access tables for secure regmap
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 06 Oct 2025 07:45:27 +0100
In-Reply-To: <CAPLW+4=mVbXex9Sxm2oEq0j3RJ0_KtXRq2Ttt5cfQ_dxXTuhSA@mail.gmail.com>
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
	 <20251002-gs101-pmu-regmap-tables-v1-1-1f96f0920eb3@linaro.org>
	 <CAPLW+4=mVbXex9Sxm2oEq0j3RJ0_KtXRq2Ttt5cfQ_dxXTuhSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Sam,

On Fri, 2025-10-03 at 12:22 -0500, Sam Protsenko wrote:
> On Thu, Oct 2, 2025 at 5:33=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
>=20

[...]

> >=20
> > diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exy=
nos-pmu.c
> > index 22c50ca2aa79bf1945255ee6cc7443d7309b2573..9f416de03610b1727d8cc77=
616e5c87e2525cc69 100644
> > --- a/drivers/soc/samsung/exynos-pmu.c
> > +++ b/drivers/soc/samsung/exynos-pmu.c
> > @@ -635,6 +635,9 @@ static int exynos_pmu_probe(struct platform_device =
*pdev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 pmu_regmcfg =3D regmap_smccfg;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 pmu_regmcfg.max_register =3D resource_size(res) -
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmu_regmcfg.reg_stride;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 pmu_regmcfg.wr_table =3D pmu_context->pmu_data->wr_table;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 pmu_regmcfg.rd_table =3D pmu_context->pmu_data->rd_table;
> > +
>=20
> Seems like pmu_regmcfg declaration can be pulled under this "if" scope
> -- just a thought for future.

Yes, there is room for improvement. It might be even better if a platform c=
ould
provide its own regmap, rather than just a flag and the code here copying a=
nd
updating pmu_regmcfg.
I wanted to keep changes minimal at this stage, as there might be other con=
siderations.

>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* Need physical address for SMC call */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 regmap =3D devm_regmap_init(dev, NULL,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (void *)(uintptr_t)res->start,
> > diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exy=
nos-pmu.h
> > index 0938bb4fe15f439e2d8bddeec51b6077e79a7e84..113149ed32c88a09b075be8=
2050c26970e4c0620 100644
> > --- a/drivers/soc/samsung/exynos-pmu.h
> > +++ b/drivers/soc/samsung/exynos-pmu.h
> > @@ -27,6 +27,10 @@ struct exynos_pmu_data {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*pmu_init)(void);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*powerdown_conf)(enum =
sys_powerdown);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*powerdown_conf_extra)=
(enum sys_powerdown);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* for the pmu_secure case */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct regmap_access_table =
*rd_table;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct regmap_access_table =
*wr_table;
>=20
> Maybe it's worth to add #include <linux/regmap.h> in this header, or
> at least forward declaration struct regmap_access_table?

Thanks! I'll add the forward declaration, as not all users of this header n=
eed
regmap.

> Also, would be nice to have kernel-doc comment for struct
> exynos_pmu_data at this point, but it might be out of scope for this
> patch.
>=20
> Other than those minor nitpicks -- LGTM:

I'll add something for the next version.

Cheers,
Andre'
