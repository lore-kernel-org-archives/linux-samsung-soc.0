Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACED2AD0B
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Aug 2025 05:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754370217; cv=none; b=hKRZ5XoeQkpK1aMiWzXshlD0e4dg/GS/JxXtIR5+cmHGCAzd1G4Kdfer2ftICHC2FfSdFjYG/u53X4vFom5ARdSff2lBH7MT0xWYt+w/qY0kQobt5fzgQMjcAGELenGylA+TMmFV4YmwDCUd025PK0EgZO/5K59tI0HdxTtdC5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754370217; c=relaxed/simple;
	bh=8eUuiOAVr7JSZ5ksqVPkUqhNwo/8hc8bMdYjo7FjjO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ezvQGmAJlvtKRb59GjoNirDAxG3raA4bhtqrRquZDEsyR8ajpAqE8hR+5xaMNK7EphWd0kSIgWOxeaWGuLIsh7NuGQLBszEprt9UhlkG2MAfSEZqcDn1m4I9GBtbPwOyl4d3wAnb8mkAGtzCcxOcOBFL+v6itdZ0UyFSkZywvoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rRcX1HZB; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rRcX1HZB"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71b4677044bso55683267b3.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Aug 2025 22:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754370214; x=1754975014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eY5N7v+zWU8+UjZUkDsBJT0AwO4FrfcIvgZ3TXySOJk=;
        b=rRcX1HZBhz+7gXxh6R1MLbFhNa9oTQ4Dntav+38dfyqV5pUds8W2C7+1/KtHNMcwPb
         CyAgiabfQoq9NcTo1jphPnQbX7NlyXOUQGy45O0SE1cn+VDlw8U+E4ZHXqYtNn6/GKdh
         9FC20lNjghCCXK0rbyp3RsCQEleZtPhyDU/eoGlu5mEzSVPoXrrDaLGPANaDh6SO6aLH
         1UOI1N/EMz/NA7v0POXf1aYeqGvgQhB7a46YYwPUPHlRoZtqmRLYCFSZPu8ZSkaW65qs
         T1XkWjZB8/G7Kih7pBIkK0gduSeuP3kXHBGrhHKb3/RrntZ/XW7kl5vN5eeuRInjvODd
         ia0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754370214; x=1754975014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eY5N7v+zWU8+UjZUkDsBJT0AwO4FrfcIvgZ3TXySOJk=;
        b=n2PVfy0nE/xP6qAr9dO9dI+rupp4vpOJkAh79pj5ZotF89uF19cQJnGbPz3FRflfhK
         aGA/rJlLzTkp86CoaiIhwmNxZupeox+vZHeJw2hj2MlCPhY6I48ltag6RIE/gaDqxw8/
         vRnbouEU9zSPpvT/+CZ6Nj6wwvC5zi3HZ+oDkRd6MGP3yvMjP4tOLFYRT7hvbiKQcmaE
         MQL7/ED7UVlDkILL3ijT+L3h17qyyb51xHrUEUcO4LeBCiL8txXiYpb7dDIU7agB85a8
         7PCYhbuu9yhUf5Nw29cA70qr/B86ACxtkqBhgSqm7tSLCoVs6HYJlK2EgCzs2FxemJGb
         GvEg==
X-Forwarded-Encrypted: i=1; AJvYcCXMhaQh+HBzNbWTWK45WSlreAWkzXRnyJDRK8MLruJhs0D4JlqFdWTvHkLy4/tv+xj86lP0nyhXr0/O96+C4rvH+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRAw6WOBAriJQxhYCND7t8E5bsiSaFjWafm2IKXIKtYefuDmb8
	duv1R4OELKE69tRNBd/FMFXWFDQcasKLTcKjfRDktL9cDKRm5BODimqn6R8Z5OMAUgFJ+PCaM/l
	ya0HO6V5wJEePQMXphZilj0D+ib0j/g2WsgWS5OmYnw==
X-Gm-Gg: ASbGnctXfbOJUZsmR15NB/hHok0hWFIuHuCAMEzFNsyjhZNGoXerBaGKQVhgrMT340z
	Ek7kn89B3/M/wwkPH/VmZt9pEsvBsLAAVkCYLA02SZkgPmCBzvJdSPxgL/wn3jXvx5/oAzM4PkS
	4c/i9UXYzHdUjls+QlQcKLuYlzCr70ikHytc8Lg/z1MSH3lmrqkheYE8DNcxYTrQRkXP5Obd7xc
	921+A==
X-Google-Smtp-Source: AGHT+IG1oZhqjscU5pfjiY1Q7UEpsk3imnmFMsZ67z7dBWGY5jc3R9ttC3dArQUXZ4i83be1Xm4e66GVmgTedDEMPjA=
X-Received: by 2002:a05:690c:6f0f:b0:71a:251e:36eb with SMTP id
 00721157ae682-71b7ef66861mr146668157b3.21.1754370214226; Mon, 04 Aug 2025
 22:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250724081336epcas2p38e95932ddc5c702e05a6436f05582993@epcas2p3.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com> <20250724080854.3866566-3-sw617.shin@samsung.com>
 <CAPLW+4nRh9DEnkhunG68xvGdaNJswC8fN4v4uBA1Aaao_5pxfw@mail.gmail.com>
 <000a01dc05c0$9f0ab110$dd201330$@samsung.com> <18adfcd0-e955-4c3f-a68a-6a2f75ebd24d@roeck-us.net>
In-Reply-To: <18adfcd0-e955-4c3f-a68a-6a2f75ebd24d@roeck-us.net>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 5 Aug 2025 00:03:23 -0500
X-Gm-Features: Ac12FXwhfK5c6hCAFDVH8lXtPSm0rXJFOVWdmBpTpuOp_j1X3bUQ9DkVKABvZIY
Message-ID: <CAPLW+4kVMo68DAO0y_=m3k81Xeh4wYV9+KX3fg=5S7xwOh0O7Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: Guenter Roeck <linux@roeck-us.net>
Cc: sw617.shin@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com, 
	wim@linux-watchdog.org, khwan.seo@samsung.com, dongil01.park@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 11:47=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 8/4/25 21:22, sw617.shin@samsung.com wrote:
> > On Saturday, August 2, 2025 at 1:12 PM Sam Protsenko <semen.protsenko@l=
inaro.org> wrote:
> >
> >> How about something like this instead?
> >>
> >> 8<--------------------------------------------------------------------=
->8
> >> static inline unsigned int s3c2410wdt_max_timeout(unsigned long freq) =
{
> >>      const u64 div_max =3D (S3C2410_WTCON_PRESCALE_MAX + 1) *
> >>                  S3C2410_WTCON_MAXDIV; /* 32768 */
> >>      const u64 n_max =3D S3C2410_WTCNT_MAXCNT * div_max;
> >>      u64 t_max =3D n_max / freq;
> >>
> >>      if (t_max > UINT_MAX)
> >>          t_max =3D UINT_MAX;
> >>
> >>      return (unsigned int)t_max;
> >> }
> >> 8<--------------------------------------------------------------------=
->8
> >>
> >> This implementation's result:
> >>    - is never greater than real timeout, as it loses the decimal part =
after
> >> integer division in t_max
> >>    - much closer to the real timeout value, as it benefits from very b=
ig
> >> n_max in the numerator (this is the main trick here)
> >>    - prepared for using 32-bit max counter value in your next patch, a=
s it
> >> uses u64 type for calculations
> >>
> >> For example, at the clock frequency of 33 kHz:
> >>    - real timeout is: 65074.269 sec
> >>    - old function returns: 65535 sec
> >>    - your function returns: 32767 sec
> >>    - the suggested function returns: 65074 sec
> >
> > Thank you for your feedback.
> > I'll make the code changes as follows in the next patch set:
> >
> > static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *w=
dt)
> >   {
> >          const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
> > +       const u64 div_max =3D (S3C2410_WTCON_PRESCALE_MAX + 1) *
> > +                       S3C2410_WTCON_MAXDIV;
> > +       const u64 n_max =3D S3C2410_WTCNT_MAXCNT * div_max;
>
> Not sure if splitting this expression adds any value. Why not just the fo=
llowing ?
>
> const u64 n_max =3D (u64)(S3C2410_WTCON_PRESCALE_MAX + 1) *
>                     S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;
>
> Or just use a define ?
>

Oh, that code snippet above is just a suggestion, please treat it as
pseudo-code for this purpose, -- I just wanted to illustrate the idea,
and should've been more clear! Yes, definitely should be revised and
re-tested. And yeah, I agree, one single const or define would be
enough, no need to make it too verbose. Also, the naming may be not
the best, e.g. cnt_max might be better than n_max for example. But
I'll leave it to Sangwook Shin to decide on the implementation, just
wanted to communicate the idea.

> > +       u64 t_max =3D n_max / freq;
> >
>
> Make sure this compiles on 32-bit builds.
>

Can you please elaborate what might be the possible problem -- just
curious? I admit I never though about 32-bit case when writing that
code, but don't see any immediate issues with that too.

> > -       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_M=
AX + 1)
> > -                                      / S3C2410_WTCON_MAXDIV);
> > +       if (t_max > UINT_MAX)
> > +               t_max =3D UINT_MAX;
> > +
> > +       return (unsigned int)t_max;
>
> I am quite sure that this typecast is unnecessary.
>
> Guenter
>
