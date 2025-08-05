Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D593594C
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Aug 2025 04:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754369475; cv=none; b=N6MWQzmpkcK5hfa14ehY9OcDYL8kHmSPox21+BDKhiZIHO6mGE9FG6Ew6QA5iuluLnK4DuqX1btxyP8dSc4brZqyUa+XjdBgBwvOxXDEo9iG3qFBZ/pn5S3JfNXVev4EtehOqz/m8i04MSlw1hadXGaFu2OSNO8CDr3yGD7dkaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754369475; c=relaxed/simple;
	bh=v0Ft1DFU0RL+7vSEod4nlD2k84JOMABcIK1ssZxiqnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFXE4pLw3fSgp4MFKKvz4/yGKLFoxrRktUJWKX8PS9HR4DYefMG9OuCTFBDZo0gYFugDpoiWlWs0L6RgXORnwpiytER1r1NjeHdVXCWS9uBoWQzEBYPs/8u63reww+VmaYwNEg6G4+iDcVE4OHjlSvoVOn1mQLdp5mLFsHz1UME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kTDagdNd; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kTDagdNd"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-717b580ff2aso46551097b3.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Aug 2025 21:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754369471; x=1754974271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goRDbiInExYlg2FZrZ7REiNXbKoKaAvkFCx3YBMBwsw=;
        b=kTDagdNdCOFVgdDkh940Si786d/amhH1VeVMmdWOJcti1havtIZdiEa344OpRNaXWX
         xawk0H6Gr62J92x/IGQJuJ7cLUEhRWF0LKv2fsAfZG1JbpYLs94G7FcEl1/g2bGIXFX6
         wkk0ZkN34kFhvjs1pn3z0RFOgBD1AsL7mTQtoY/+Sym0u/hyJ1UHwwYQmRi+rvuNFMFp
         xjKgkimpTnoRmOMvxhNGjIMv8Tta8ULzP6dKaDTL2b1chV72b38DIV5ry+19NXaRRMtL
         bfZz0A0evTDZlAzJCn6IYTeziY2tLzw8hCapFlvYD1AfUqQXNTrRoiLfJkQS2aZfgmzV
         6fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754369471; x=1754974271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goRDbiInExYlg2FZrZ7REiNXbKoKaAvkFCx3YBMBwsw=;
        b=quZ+9EVCrE1wrVc9LzxNcleAMqg9u3uSXx4CA6XNWmg8Nz9RJuraB6tXzq6EyYW2GK
         lZtuDx8hAZWRrulDSgCi6s5DP2wJZcH3uwFVj0TV7QIKdHkP799toCZ7kDpBuwugcdSa
         UJVbFLDAY79nUMumSxODeRiAxN3jJt5G1bs7ldAykqqKceS0thQJS6mlKH9yXxivFjfN
         tTFYzFAPrklUZhZEEFjQaxxIhT/2lOdmWekA2RAWbulCzPN9fm2WeLskme1UToO0ku7z
         uNoyA3b64QZNM2A89d0R3vN+91mr3SSi1TqI3FSgmEeUYVqVaHAS8R64qzg2pMv/YbH6
         8+nA==
X-Forwarded-Encrypted: i=1; AJvYcCUlUzwo9/ErxFsZukDKZzigCcPcGfy90M6Apk2S8tYXdowkqnphqTVCXLeH4l+mhFSEZ7EZpoXvgT2vJKXfFqi2TA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaOq2o2tFpXQcQkJEEOl89xYG1c31J3bR/Svqcss7MuUcXBO3Q
	Ll9a5UEuiuQNn8APyAkjT/U/W5XhNYPGP7BicwFSkT9SuR29v1bFk0lOoDNbqOcXP80xBqoFD44
	14Rr0SflRRizgc9BAVFXbU+Wp6eWPbhR34UzTVnxgsw==
X-Gm-Gg: ASbGncv6a3yCHLc410Iem9XRH2v5Wsdk6IDDDb2xNlU1UJdlsjzBKB4MSOkSXmyVpgK
	C3stT5sybWsQ4W7pjYpooPc6ZwEgYFRUuMzUFb9E6K8yCqm61f/PlFvN1s86yWEnl+Bm1Rwd1k4
	ahwkV90+iCwIz7C/tHUnCl0f2W3z02J0r5lr6lEnP+Z9FnT1eSZQw9Tbb7WTc4NG6ObPw1GrHCG
	rBAwg==
X-Google-Smtp-Source: AGHT+IHeQ9gjfgM8r8LCqDBzIZurZmcUaTL4L7HOV3CKVzHJvHoNvkFagl++11B+nx8hPTcRNP2NnteS7qwpSI1JFek=
X-Received: by 2002:a05:690c:14:b0:70e:7ae4:5a21 with SMTP id
 00721157ae682-71b7f0c56fbmr121732557b3.4.1754369471580; Mon, 04 Aug 2025
 21:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250724081337epcas2p31f594b6e9ab87e24c94f11dea4070956@epcas2p3.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com> <20250724080854.3866566-4-sw617.shin@samsung.com>
 <CAPLW+4mo-Fw5+KmwHdZGAM4uNpOWL6QakTgP-wMSxR=+dMGqsQ@mail.gmail.com> <000b01dc05c0$a50f5f20$ef2e1d60$@samsung.com>
In-Reply-To: <000b01dc05c0$a50f5f20$ef2e1d60$@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 4 Aug 2025 23:51:00 -0500
X-Gm-Features: Ac12FXxJPNFLaHj5nje0A_AcDG6Ll1OXb556rCVkvn6Yb_8cbt1jdRu-9Ss-iOU
Message-ID: <CAPLW+4=sJM4UwsqfC8t=swzhGU=BdRn3T6GjJje0unZSgNg-ng@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] watchdog: s3c2410_wdt: Increase max timeout value
 of watchdog
To: sw617.shin@samsung.com
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, khwan.seo@samsung.com, dongil01.park@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 11:23=E2=80=AFPM <sw617.shin@samsung.com> wrote:
>
> On Saturday, August 2, 2025 at 1:37 PM Sam Protsenko <semen.protsenko@lin=
aro.org> wrote:
> > Not a strong point, but I'd break this patch into two:
> >   1. Add 32-bit counter feature (without enabling it in exynosautov920
> > implementation)
> >   2. Enable 32-bit counter feature in exynosautov920
> >
>
> I'll break this patch into two in the next patch set.
>
> > >  #define S3C2410_WTCNT_MAXCNT   0xffff
> >
> > Suggest renaming this to S3C2410_WTCNT_MAXCNT_16, to emphasize the fact
> > this value is for 16-bit counters. And for consistency with the below o=
ne.
> >
> > > +#define S3C2410_WTCNT_MAXCNT_32        0xffffffff
> > >
>
> I'll rename this to S3C2410_WTCNT_MAXCNT_16 in the next patch set.
>
> > > + * %QUIRK_HAS_32BIT_MAXCNT: WTDAT and WTCNT are 32-bit registers.
> > > + With these
> >
> > Why not name it like QUIRK_HAS_32BIT_CNT or QUIRK_HAS_32BIT_COUNTER?
> > As I understand, the quirk means that the chip has 32-bit counter, so M=
AX
> > bit is not really needed?
> >
> > > + * 32-bit registers, larger values to be set, which means that large=
r
> > > + timeouts
> >
> > Spelling: "to be set" -> "will be set" (or "have to be set").
>
> I'll modify this in the next patch set.
>
> > > +       unsigned int            max_cnt;
> >
> > Maybe make it u32? It definitely refers to a 32-bit register value, so
> > will be more explicit that way. Not a strong opinion though.
> >
>
> I'll change this to u32 in the next patch set.
>
> > >  };
> > >
> > >  static const struct s3c2410_wdt_variant drv_data_s3c2410 =3D {
> > > @@ -349,7 +356,7 @@ static const struct s3c2410_wdt_variant
> > drv_data_exynosautov920_cl0 =3D {
> > >         .cnt_en_bit =3D 8,
> > >         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET=
 |
> > >                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> > > -                 QUIRK_HAS_DBGACK_BIT,
> > > +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
> > >  };
> > >
> > >  static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 =
=3D {
> > > @@ -362,7 +369,7 @@ static const struct s3c2410_wdt_variant
> > drv_data_exynosautov920_cl1 =3D {
> > >         .cnt_en_bit =3D 8,
> > >         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET=
 |
> > >                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> > > -                 QUIRK_HAS_DBGACK_BIT,
> > > +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
> >
> > Yeah, I think it would be easier to review and handle further if this
> > exynosautov920 enablement is extracted into a separate patch.
> >
>
> I'll break this patch into two in the next patch set.
>
> > >
> > > -       if (count >=3D 0x10000) {
> > > -               divisor =3D DIV_ROUND_UP(count, 0xffff);
> > > +       if (count > wdt->max_cnt) {
> >
> > wdt->max_cnt + 1?
> >
>
> Yes, 0x10000 represented 'wdt->max_cnt + 1.'
> Would you like to suggest any revisions?
>

Ah, sorry, I didn't notice you also changed >=3D to just >. All well and
good, no change is needed here!

> > > +       wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT;
> > > +       if ((wdt->drv_data->quirks & QUIRK_HAS_32BIT_MAXCNT))
> >
> > Double braces don't seem to be needed.
> >
> > > +               wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT_32;
> > > +
> >
> > Style (minor nitpick): this block can be more explicit, i.e.:
> >
> >        if ((wdt->drv_data->quirks & QUIRK_HAS_32BIT_MAXCNT))
> >                wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT_32;
> >        else
> >                wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT;
> >
>
> I'll fix these in the next patch set.
>
>
>
