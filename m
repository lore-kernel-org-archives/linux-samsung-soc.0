Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9E927C864
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Oct 2025 18:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759517316; cv=none; b=qBaeApcoXntUP1dTewQ+SozbwmKSVDFJhnJbG/odKto6wODECNdWZpojEofsPsORqg2CVzTnL5ZFgC9wQpTbS/uHuVNyYGPHnRCw40rRGh/4m91LbkwmzLGhr7KmDXLyyK7GDIHJBys8TEpRnO3WkFsURBzghflTHQD9tNbaYZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759517316; c=relaxed/simple;
	bh=en/x0H93MhCx6F52aBadN06D95FkYCaa6742Kw7U+ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGmDzEz10uzZJsd2fY3pf2b74z8p6+3xzgyml/W2t9DsWYgaWJ+O5fif3Uzkn1708x6CcUTpd9hqyaiJ7pGlfCvOr5IAZ8ZXA04Lq+k3+fENFXvM1zBwImwTjY3Va98qmVAHGavUV8tYH5IgJ27AvXKXPfYVS5cKo3TjGqaOmDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PkOVoTJn; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PkOVoTJn"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71d6083cc69so29025547b3.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Oct 2025 11:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759517314; x=1760122114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1A8SX/tE1r5hPNOb+fWr0swxWmTbVgPZeSebbUiLxY=;
        b=PkOVoTJn6x4QaGNXAOO4EVtZY57y3Z8SYxWs1PpzGsaj+4xG0fTej1hgLcrWm1N8EX
         AvELjmpeOLn9IOyb0E1v/fBV8LuJjJS9oBdrhdYCLgdzPxDqjy1HzOHAq/rhV8m4/7Ql
         xNVQnju5CrsXYNxS6/0j6R8cnQvCBuhhw95pVUGqNwFpZKm6zEpuXVm8YO1+u8upaBYs
         sYFzKd0nYEbkwdVKOIinPps/fO1MAUvzCUzPu5TC6AvUESOBF5cfbc7bXhH/eY6sDLVU
         YlsjpaNhgm7ZqXqnUw1grNLLr3pfkLypc5QfZ7X0Zq9E+SeiTUuorVZEh2A+F7KZqLg4
         KFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759517314; x=1760122114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1A8SX/tE1r5hPNOb+fWr0swxWmTbVgPZeSebbUiLxY=;
        b=v7B+KSGSw0BJOUGeUUMGmncdaAa+gCWKHPbCXM/f//zf6XI8GcSWbQOdNz0RA52FuF
         v3RYhVfPdb4WwBzDoV8bEjy11GaumlJKgIKhuvTpxJG73niPf6cz2/X3MeHTKJzUNboL
         aIR0vP7Tnmv/uSrj4B+mWxRdYqz1z6Ot7E8IzDk3U3PJSdqE05AxenPn+z0JiaHq/jSU
         M5p3XXLe+I2TpGyf5T1AiVjKZ+1F42D4hwmg4o1y7vxil4ilpcmnUtnYom3UgzIu5ALv
         QkPl+T4X2raBckxVqTgeVlNU/IloHT6i0GQYx7jomB1eGpwcnuuThQxQf5alnhGmNpK7
         5rFg==
X-Forwarded-Encrypted: i=1; AJvYcCW+hssS2m7ZRzbaOK5TWoAT9HK4QfJS8eG3v4zKJd4XuoyiRZ67+gJafbMiPzoI0bgp7ei1/M6BZPGrE+4OVo0sHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqu88a+M4WNUxSBWdLwKpGtiwJxr8RMv8bzwkUPKbpm5pSfEAN
	SAfLxp7bcoifIFhRBSprJh/Zmim46nGOF7du/c6/UCVgUWtmzqX3nhFF5axe5Vyj8hZJuq5QPUq
	8zvbYk+LuLaqLdjX4n7490GPj8GcPINyEAVV1PaiWs3RDopC02DBzGQM=
X-Gm-Gg: ASbGncsPGIanvI1a4PulcDmDMzypGBs3q4fiBpba6fW6S/GSL2IUsVKAYrUjkIhGNNr
	7UEAZFONYsAHSRkWWcLnAMR079nufahiT2eOCV+sXWA+pVJWJC0Pipn1obBvAHZwLvjvXikveRU
	5YrpZfuljwH6r9RbXvBbdYgooVjytkDTKmSPjGJCIDXCL9eCkbw8lQixRBTUVP4ap5cSOTSjlcn
	Mkwi99Q8SkbREPgcbuKQnTXGosSyHSQrg==
X-Google-Smtp-Source: AGHT+IHndtFUg6vXwBUXgsob9n+JNYGBEcQY4DfmP4ImNmaJTWf+jg8hVFn/sXD5+Db7beDD2tVpe3hNGAAC1fVvjKI=
X-Received: by 2002:a05:690e:159a:20b0:629:e2b6:1302 with SMTP id
 956f58d0204a3-63b9a07171emr3538166d50.17.1759517313818; Fri, 03 Oct 2025
 11:48:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001-samsung-clk-pll-simplification-v1-1-d12def9e74b2@linaro.org>
In-Reply-To: <20251001-samsung-clk-pll-simplification-v1-1-d12def9e74b2@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 3 Oct 2025 13:48:22 -0500
X-Gm-Features: AS18NWDI1BVNzUqPI3mtS3fLkYdD_e2NR51_7PRPjz7yrCpIAz-K6sw_QYnhZ94
Message-ID: <CAPLW+4nqSntq=vEY4JL1=YZ+3Hb5EAeOB0aob+B6WGs97Zh3rw@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: clk-pll: simplify samsung_pll_lock_wait()
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 10:13=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> readl_relaxed_poll_timeout_atomic() has been updated in 2023 in
> commit 7349a69cf312 ("iopoll: Do not use timekeeping in
> read_poll_timeout_atomic()") to avoid usage of timekeeping APIs. It
> also never used udelay() when no delay was given.
>
> With the implementation avoiding timekeeping APIs, and with a caller
> not passing a delay, the timeout argument simply becomes a loop
> counter.
>
> Therefore the code here can be simplified to unconditionally use
> readl_relaxed_poll_timeout_atomic(). The difference being the last
> argument, the timeout (loop counter). Simply adjust it to pass the
> more generous counter in all cases.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/clk/samsung/clk-pll.c | 31 ++++++++++---------------------
>  1 file changed, 10 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.=
c
> index 7bea7be1d7e45c32f0b303ffa55ce9cde4a4f71d..a7e693f6983ec073bedd633ed=
8da7efafc1a20bb 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -17,8 +17,7 @@
>  #include "clk.h"
>  #include "clk-pll.h"
>
> -#define PLL_TIMEOUT_US         20000U
> -#define PLL_TIMEOUT_LOOPS      1000000U
> +#define PLL_TIMEOUT_LOOPS      20000U
>
>  struct samsung_clk_pll {
>         struct clk_hw           hw;
> @@ -84,7 +83,7 @@ arch_initcall(samsung_pll_disable_early_timeout);
>  static int samsung_pll_lock_wait(struct samsung_clk_pll *pll,
>                                  unsigned int reg_mask)
>  {
> -       int i, ret;
> +       int ret;
>         u32 val;
>
>         /*
> @@ -93,25 +92,15 @@ static int samsung_pll_lock_wait(struct samsung_clk_p=
ll *pll,
>          * initialized, another when the timekeeping is suspended. udelay=
() also
>          * cannot be used when the clocksource is not running on arm64, s=
ince
>          * the current timer is used as cycle counter. So a simple busy l=
oop
> -        * is used here in that special cases. The limit of iterations ha=
s been
> -        * derived from experimental measurements of various PLLs on mult=
iple
> -        * Exynos SoC variants. Single register read time was usually in =
range
> -        * 0.4...1.5 us, never less than 0.4 us.
> +        * is used here.
> +        * The limit of iterations has been derived from experimental
> +        * measurements of various PLLs on multiple Exynos SoC variants. =
Single
> +        * register read time was usually in range 0.4...1.5 us, never le=
ss than
> +        * 0.4 us.
>          */
> -       if (pll_early_timeout || timekeeping_suspended) {
> -               i =3D PLL_TIMEOUT_LOOPS;
> -               while (i-- > 0) {
> -                       if (readl_relaxed(pll->con_reg) & reg_mask)
> -                               return 0;
> -
> -                       cpu_relax();
> -               }
> -               ret =3D -ETIMEDOUT;
> -       } else {
> -               ret =3D readl_relaxed_poll_timeout_atomic(pll->con_reg, v=
al,
> -                                       val & reg_mask, 0, PLL_TIMEOUT_US=
);
> -       }
> -
> +       ret =3D readl_relaxed_poll_timeout_atomic(pll->con_reg, val,
> +                                               val & reg_mask, 0,
> +                                               PLL_TIMEOUT_LOOPS);
>         if (ret < 0)
>                 pr_err("Could not lock PLL %s\n", clk_hw_get_name(&pll->h=
w));
>
>
> ---
> base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
> change-id: 20251001-samsung-clk-pll-simplification-3e02f8912122
>
> Best regards,
> --
> Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
>
