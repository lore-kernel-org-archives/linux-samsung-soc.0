Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CE4158535
	for <linux-samsung-soc@vger.kernel.org>; Sat,  2 Aug 2025 04:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754107919; cv=none; b=N1fWls/B+JQd3PerFj6xg2VcbLxhY09ThEbDqg8eHYjmUO/OuhHrsvGSJMBBninYGjUJnzjvOWDr2zzDGjRsYX2XMVaiJschHUy22CxjnPh1sD9KbeGKMXNqVAh8LxS6EPuPBjlzvvyKA1zaYgjCWot3GUEVAo8attklmPL5IPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754107919; c=relaxed/simple;
	bh=lJKRnlysUD8MFDQfZoBVJQlFexCUCMcqAdy6vCaSzxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AR/WY1+ZiJUsKPjeNq+US3s19lqaEQ6aen30jaJDvmGcS6l8NRB4AaLZfNvU7f4cOpM5C0XDlciCrTmhtwveuHHf8dzXOk+2Diw1IcCflgIyIemVXtNjeGTKJ6k+UFEFvgrI3bVfI43CIwhOzykhWvk0SRm3ky/7w8ieEeLOPaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CIjig7F3; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CIjig7F3"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71a39f93879so39648407b3.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Aug 2025 21:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754107915; x=1754712715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYp4mXKhOVGUhhKWIugNhHcZ1ORze3B3p0bRipFlplY=;
        b=CIjig7F3Dtlq4c5T9Ikl2c2bBjh6pJaMFyU+KImT8R2vXxu34MDFVmw9wZ0/V4qpgV
         Uw4hAbe7w4SGCG5w3XEoJo1qHPr/u8VIj6/XyU/wWKcEJ2lCReYU7/7yn7bH7S0SzQIz
         Y66CQ0YgDhaei344hRUh0FtFrp9g1MK0ufbWaDkdYJSBgk239J+HisOFE8Cqxv5/pHe5
         YlZupAbzCtloL+4MszhCNYWt9yGI+QeVE9eK5PNMYkvhcplJQuobx1kupvBBiiZByPTp
         hiY2xkV4d66md1913w4SxnRB1rqQXYSSPb8+4r3l07hHTXOWyH5sEafxZeinu/WKCBLB
         IlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754107915; x=1754712715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYp4mXKhOVGUhhKWIugNhHcZ1ORze3B3p0bRipFlplY=;
        b=C1sbXWMSkgA78og1wBIZzvPjjDaNdVcup9t7KZ40dWAEuF3+eFnnR0v0vr+f5mFz26
         Vy+iMsUqLYI77Hip8UJ4g42cSCHZpmMiaywPrGN+hhVZkB+flb8HWWha01heL2kvUQP8
         gyfNF1H8BWdWtuCTiDIi7fQ5/YUbsLunpPRsXsZttrKZVor5w32+T7OZ4/L5pzWFYlS0
         fGNeO7K7drWSHNTMEMEMOwCnPq+6v/BFF1bWOYgJXzvXBrDyjpOsMRADzfhSMqWyUX0e
         DrifMyUXV4AbuGuWgnqOclxD1Ywis6XX03axC+oLHyRvoMt5UUMzUVwR7J20Rq5Q5bxc
         bWUg==
X-Forwarded-Encrypted: i=1; AJvYcCXSt85IDtUT5++lRKhHWIVKnQzph6iAUz3p2hcTQlJeQDvoTc97zEPIYf0dW2jJo5sXLHf3sJtTnzefkQesKTtQSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhlTiBaa2iHxdr7atBbhF71Nt9Yy1Lq8KBjXBsxLm9Z5u/WaSe
	s6uX8JSRSkXA4uXBNN4+kTNY6a2RHjHVmaMPTIx/rAuciVXm6yKlCiN6lPHW9Z27jIB4J7aUyMH
	g/OedCspsrbPbTqWW9BVw+eSGEKzmF7zYpQjXfSl3Pw==
X-Gm-Gg: ASbGncv5mHcD6Y4qEwNxU/G6O7vOPwBmMkKCdlsaNKba9Ysn/47cBhsHuDYhF4R4OwT
	WGQucWYMwrjWIMJZQ4RC/jCMvZGQ67CRk+fCgN9VZT1SlhjmXwCgdM66fUocmX8wINDD4EXyW1z
	z7p3yLdVtX9+WpoS16HMzM2qVD+hrqDhJ2gHcm6Uv26G+oEfbDcFG0yzkRM1fJ12xmlml/ZMd89
	XSicw==
X-Google-Smtp-Source: AGHT+IF9ctIxKBr9nfRXs2qCE2fyDGDHNm3LJDq8aN0iByZsWyGIn7LQZuF9bXAq3rhtwRAuKAX7NxEh1CJ8dlCDFPo=
X-Received: by 2002:a05:690c:55c8:10b0:71a:20aa:2265 with SMTP id
 00721157ae682-71b5a71c1e8mr83900667b3.6.1754107915222; Fri, 01 Aug 2025
 21:11:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250724081336epcas2p38e95932ddc5c702e05a6436f05582993@epcas2p3.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com> <20250724080854.3866566-3-sw617.shin@samsung.com>
In-Reply-To: <20250724080854.3866566-3-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Aug 2025 23:11:44 -0500
X-Gm-Features: Ac12FXy2WLL3xRYhDsxothu9WYIfOUZEaNDjOS1ze6he7jduUVYVbSmd09OsrAk
Message-ID: <CAPLW+4nRh9DEnkhunG68xvGdaNJswC8fN4v4uBA1Aaao_5pxfw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, khwan.seo@samsung.com, dongil01.park@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 3:13=E2=80=AFAM Sangwook Shin <sw617.shin@samsung.c=
om> wrote:
>
> Fix the issue of max_timeout being calculated larger than actual value.
> The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
> S3C2410_WTCON_MAXDIV is smaller than the actual value because the remaind=
er
> is discarded during the calculation process. This leads to a larger
> calculated value for max_timeout compared to the actual settable value.
> A ceiling operation is applied in the calculation process to resolve this=
.
>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 95f7207e390a..31f7e1ec779e 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
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

How about something like this instead?

8<--------------------------------------------------------------------->8
static inline unsigned int s3c2410wdt_max_timeout(unsigned long freq)
{
    const u64 div_max =3D (S3C2410_WTCON_PRESCALE_MAX + 1) *
                S3C2410_WTCON_MAXDIV; /* 32768 */
    const u64 n_max =3D S3C2410_WTCNT_MAXCNT * div_max;
    u64 t_max =3D n_max / freq;

    if (t_max > UINT_MAX)
        t_max =3D UINT_MAX;

    return (unsigned int)t_max;
}
8<--------------------------------------------------------------------->8

This implementation's result:
  - is never greater than real timeout, as it loses the decimal part
after integer division in t_max
  - much closer to the real timeout value, as it benefits from very
big n_max in the numerator (this is the main trick here)
  - prepared for using 32-bit max counter value in your next patch, as
it uses u64 type for calculations

For example, at the clock frequency of 33 kHz:
  - real timeout is: 65074.269 sec
  - old function returns: 65535 sec
  - your function returns: 32767 sec
  - the suggested function returns: 65074 sec

I've prepared the test program you can run on your machine to play
with all implementations: [1].

Thanks!

[1] https://gist.github.com/joe-skb7/c2b2290bb0b0572a4018d81fc4ba1f3e

>  static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool ma=
sk)
> --
> 2.25.1
>
