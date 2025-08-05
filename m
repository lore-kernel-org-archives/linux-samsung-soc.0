Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3434C29B205
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Aug 2025 22:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754434405; cv=none; b=MLgvrP/eJEoG+OYjnZmhkNWK2w6DeBCPKvlp9lEi+HvbU0ZbLdfnOSDYyE1OYXqAfCGiaVGMnEBAZCdhHVsxJp6VyZF2zl6WYeHzZiqGCMSXiV2zeIZAfzZFnOfiHRAwW4naCi6LS0WJHQz+Id1PGpjUD0PKXbG1Yqci38RfG/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754434405; c=relaxed/simple;
	bh=hs+keelF6LjAXHQjXmPYefdmvCIfEKA3k7KvHBMdfoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cngKsTLoDc3K7ZU1+06OLlLjht8nNAR3WDD7fnVPn6u6xXfBTPo1ASxkBrV4TWUlpA9fTSSs3bCw3HfhmldqZkPqm+Gyqb1vbSHteoRTHrFSH0kOkdHilaK1N0IZDaFXX/kG8+fea4BNK/MNuIJNLSLQ4dbhLN8hunSavU3ILto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EZIXLcPs; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EZIXLcPs"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e8fe618dc71so3496095276.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Aug 2025 15:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754434403; x=1755039203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFwxA7VPMgX8JFoPPlt7yWjXlEeDLZQuyMF8h0TO11M=;
        b=EZIXLcPsvqmIsHu9GoansST5NTM0/g8+TbsaKQV+1XaDNj4n6ZCknJ0V0lIiIH+AOH
         W4d08pblfWpLGHxRu551fGoCjZSUqBe04tbnZui5V7JJMMkPO4ndxnej6jSXMigbgEZf
         u6JlAYSsDalPhtEzszpo3NFZSFlIMY1XLOANB3KN6OP3zPsfjvgLbbdJwqt5pBi+r1ZX
         Lt1WXeTgBjyEvh2hpQphteBAZ/8Ja2YxV+/VwuoG7raTE+m1FkvF3fmWLXH4qgIq27on
         gBWAUHYHivr6TWd1MYLQQX5rxmnClh6APqa7nPyZckGUS69TjGmOrVtEer5bM0HK+uax
         kg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754434403; x=1755039203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFwxA7VPMgX8JFoPPlt7yWjXlEeDLZQuyMF8h0TO11M=;
        b=VfmGxnNBR4b0zfoxZmwBk7kOZZB183/bK07CLiURMx+oz/NyT0iwkRY7OiXvgUUQAE
         FwgU6d7AYi87KcX1T9N4jGMRgvMakiOamnlnCB34F9hiJDEz1F47NuLv+IIPL3NJIBpx
         734NLJULfUGYAmkKaLMFV37CygjlJIS6I6DIialtqYhmg50jCLYyLA3uMfSzJgg+wKUP
         8J3GtNSJ/Y/RvUhP45ldanWYmjYHlZ1cWduWyDzBGMS61JBfa08DkwkSM7Dshg3xYq4u
         qc1jidIIdETV1It4MGvCP1LxkWoHZpk+laQWUqPgfnAmF+Fn5j8BhiKBRB/Oaxews4xb
         UUsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY2Enr3/Qgdpag13QsNc+1k4yi2fkLs4rFAkOTZA6vD0P5Lp3hhqYM+GFSuK4Dzw8FmgCak3LEe+cAESAi0DgehQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE2AR3eBhEg9AFGW9/0tDyvINS92xrKHzwO7QOtAB3mOEVGJkw
	JUsL6nhp7BSvELfYjsQNZuPDWxMSM1ySpUAbJQF8te4j9BjTQn4WQAnQ1TNgF+RKcbK4GxSW6W/
	eYFXHofm1m/Kah7/ugQbkwhtSG+00nzEIUH59zmuTJw==
X-Gm-Gg: ASbGncvcntvvPzmz+eZK5n7bG3AZ8rdn3QldTyGcmPMMcyjoKXo9nR5Au+8vvn7nlWq
	TqD6HCqYEDoVBh1bA1DhOE63BRNHmLxKBG7VFHbXAWkwJHObiL2cYoFb0JXJbhGtvP8PCAaaXaW
	qF33vooSV2hnVEy/AuKsr3ej7f2abwIWwhWj1XfjC6xx1yLKCZ6zlOXu9fzS8RnvMmmIywyNysX
	AyzYQ==
X-Google-Smtp-Source: AGHT+IFPQD46MAxnRPc4XD80G1FRckOzbsES2lh1jn0CLQnQJq0WjxlFx9sY5Jok9vm71L88exnNcyi2+UjLvaHGm4k=
X-Received: by 2002:a05:690c:3349:b0:71a:2961:e2c8 with SMTP id
 00721157ae682-71bc97b1c7amr12964657b3.10.1754434403162; Tue, 05 Aug 2025
 15:53:23 -0700 (PDT)
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
 <CAPLW+4kVMo68DAO0y_=m3k81Xeh4wYV9+KX3fg=5S7xwOh0O7Q@mail.gmail.com> <008501dc05da$36362600$a2a27200$@samsung.com>
In-Reply-To: <008501dc05da$36362600$a2a27200$@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 5 Aug 2025 17:53:12 -0500
X-Gm-Features: Ac12FXygs7x0aZJlJlnwWjTdQedCFmhrYOQr3itTJ2SIN3Q4cTe-cGU5fCA1CyY
Message-ID: <CAPLW+4mNejXUMW0VqZW8hieNUFmDqS_-qqE=p+bV4TnwM_TWgw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: sw617.shin@samsung.com
Cc: Guenter Roeck <linux@roeck-us.net>, krzk@kernel.org, alim.akhtar@samsung.com, 
	wim@linux-watchdog.org, khwan.seo@samsung.com, dongil01.park@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 2:26=E2=80=AFAM <sw617.shin@samsung.com> wrote:
>
> On Tuesday, August 5, 2025 at 2:03 PM Sam Protsenko <semen.protsenko@lina=
ro.org> wrote:
>
> >
> > > > +       u64 t_max =3D n_max / freq;
> > > >
> > >
> > > Make sure this compiles on 32-bit builds.
> > >
> >
> > Can you please elaborate what might be the possible problem -- just
> > curious? I admit I never though about 32-bit case when writing that cod=
e,
> > but don't see any immediate issues with that too.
> >
>
> In my opinion, it seems that Gunter Reck's explanation is correct.
> I've found out that the error of "undefined reference to '__aeabi_uldivmo=
d'" may occur when compiling new code on a 32-bit architecture.

Indeed. I was able to reproduce that behavior when building for ARM32 too.

> If you don't mind, I would like to proceed with maintaining the previous =
revision below.
> From my perspective, this approach appears to be the most reasonable solu=
tion for supporting both 32-bit and 64-bit architectures.
>
> @@ -411,8 +411,8 @@ static inline unsigned int s3c2410wdt_max_timeout(str=
uct s3c2410_wdt *wdt)
>  {
>         const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
>
> -       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX=
 + 1)
> -                                      / S3C2410_WTCON_MAXDIV);
> +       return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
> +               (S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
>  }
>

I don't mind, although it's quite easy to fix the code I suggested by
replacing this line:

    u64 t_max =3D n_max / freq;

with this one:

    u64 t_max =3D div64_ul(n_max, freq);

from <math64.h>, as Guenter suggested. But I'm totally fine with your
implementation as well.
