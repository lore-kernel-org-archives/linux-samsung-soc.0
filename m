Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8151285058
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Mar 2026 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773915262; cv=pass; b=B8t2i/q5v7cbAADBAdBVztgjilRmFa9Sg9aWZoAxtPgUlhOLIZt9v8RzjAyZJeOn6x9T0NVUUoLUc6VDAuBfBv8aPxYbbVm66gdz7M9iqb2w0yW8NGFj5c4bkBjAssz9PEKFWZqC+iKOeuQdnixa//kqR8A11L5TnQrH4XFgWLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773915262; c=relaxed/simple;
	bh=v17TFrkeat0+iYNY8nfXZ5t8sCUXRNMA6XJWPzLyY4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kiKol7D4Rthz2huJCcxHsE0lzR+zWDXQ6iVUyZcta4ldBlKdj8zYGmTooNY8zeo5opjjCxrrCWRw7uLhI5pAwcop/fSoFoKvRpwKoWMoxMa988TO06Y9iNwZUnGITgkH9itmA4VE/d7JmxIwfonh+4AXvLDzwBPOFSggc3Lbixk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DCrnyDXv; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DCrnyDXv"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a278b4c1a5so663394e87.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Mar 2026 03:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773915259; cv=none;
        d=google.com; s=arc-20240605;
        b=IFY/cecVYp05nLaC4upG+kha9WDtfL/tdqgB6SF3+1/q0KgQ7/dQu0stpHq27AXw1p
         n4IyNBdro5ycAkF3O6cy0YAb8GaNiPUm9fmQWJ+B0RrtwlhD8IqyO1elQUQr7tZgtKvF
         L2z+6+XruvoriwUsswUvSBOt/4Drz69PLeRdP+x6lRrZjVVJzzxJi5luLDIxHOglJ91p
         9cj0FygQaRyMhqbq8VbYQZJRZgH5JNWYODXacc+Z03Om8qRfh9uvyuMNujylrliBdafS
         S9I/uDz+sU21ENgDHLHQ18/+z/Wq2SbWMW+adLxE7QC2cOjr1j5hG+3SxJkf2L4/cRk3
         P7uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ujZTJk7VIt/xvASexQ2VToUKfUsb3Y+OQiXRRgGyWt0=;
        fh=KPZTlnkyBNPVmREz3Qn4/Fg2GPIKP/4c981uqpdNMfg=;
        b=NEmJF0uqNaCyMHLPzyZ0FWgNUYrXMaptU/a2FjE0EKbKRgXuOnzxhSEq069MdudYUI
         OZcPOH3gYiVHYo2CxNE02WsuNHMHuTE/1c0qZYeC0TuZVwc4nekh8/zTo8mFvMye50D9
         RxnokSZC8EzNm53+EVtkVSMZgC5DXVOdJ2GStWYY2aV0YDWYk4IMn3KX6UGIAO4UrLr8
         91lMx4B2hZcHFkAW9yM3BulbBfyF2NS/2NivxcTi1aQaU1z6rXZyVLvtzQPW4DkQu7Md
         wmLySFP7/ujZcdmmQ8izNymQJicATulDeH65hGYPj1BgFMiT97H8yroZRPOQzJIbk9Q1
         foaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773915259; x=1774520059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujZTJk7VIt/xvASexQ2VToUKfUsb3Y+OQiXRRgGyWt0=;
        b=DCrnyDXvFNLAHsbEWSzR0ZXcgGPpILgzIhAOXQhwFHdxpDFriY3A+MBIY37ur4aRg6
         KRJtjDhpZ1A8zBHO1qiMsFaCL7sRHS2can6e3mLtPNbCAqeNnCMaIrXK7ipzz6wI8rF6
         JvwvZfhOoMg+NPm6QchtiFKKyuFqFdjbEKAZe/U+Cw3w+lEKPS6PTgpjUyJiqh4OigHz
         P/vKXBoh/OyNkY1JZuMLV3I8mb03EMQQMdGVC8+MCKQG3JrBR1jDqDx3FkRUcxgm32xa
         HOAhLH0cCKn2J3XaSoy0khI0Dt+0bmGY6mc+s2goEmhFiFHfXdGZS8WR013bek5S/PpL
         2Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773915259; x=1774520059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ujZTJk7VIt/xvASexQ2VToUKfUsb3Y+OQiXRRgGyWt0=;
        b=A9afQvfCa0prgH6d+YSegWh/Fs0T2M/734erGgLPK7WRJ/1TyJSh6Y9UhLYgzyhhAj
         P4dNE4yFvkDvcXDNxCcaHRc3b/aijEQ4VrdS1wa8VmTY67MpRLZSp4cvtfo+q6j0DITa
         lXaRWGpEGQkwzeKL/PH2YtxJgtdz8i742OlAJzb2WY8bY6p79qd8Nov3+gI5kp/d5INg
         taOqAm8z9boPk7Mzr0UTBwsQMENPVal1H6rvCToSzvGqXzUmhMDZE39a9ItD/JnR/Sse
         TxLEJ3Et2rCerYFEp6/IP96Cf5gHX1Jm/98/KCvp9LyUinZO7WJWY29HSyPWJ+Uncr1l
         5Opw==
X-Forwarded-Encrypted: i=1; AJvYcCUjVOqSqrZweXgIjYuKJmDzj/90H/pfOZndgba8Wch2ABW27EtUPCpG5GrL+is02hRpQBh+3nevdEdd7CS3OZQqBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPCmL/OK56g0lIazStK7CxBxFT00BDWRtO0MHhezBC2tPro1ra
	JniDWjBAQuEa0oRlhb452V05iviJMbs+zPdL+ZrDJp9TptF5Vi3yvg9Bynp8bCxKepB/XJh6KSZ
	Ooih0bjwGTAU77FQWQLiEJEwwpXql+I+8UQZKPVW8kw==
X-Gm-Gg: ATEYQzyvODy9E0NKUk1BWyl9lRXIKJNf1P8MM5KkEW3cveWgZtGrlvPmidFdu+rxxjv
	iJoYSBqDYmiGXZHVuY45Rb9mGgwyZqFpvyQTVKJjmxQRPQz6ZYhAR5r+u14JQSkaAPh7EGGofD7
	P5NeHJrgxwrEYVwFD5v+ybk3pqNpJhZUPVO5O7z44L+uPPuFAhO+w1SIjfBiPWMSwN+KVPb/3HJ
	Gd9zrUzmKFh+N22jrlM9iwlP9ad+zRC2cT7SvKWebGwXDJ7JArbHk/YKn+PXeRTGGnG8IUiImk3
	8+jX1VAN
X-Received: by 2002:a05:6512:31d2:b0:5a1:db06:764c with SMTP id
 2adb3069b0e04-5a2796b6074mr2602865e87.40.1773915258920; Thu, 19 Mar 2026
 03:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org> <20260318-gs101-pd-v8-5-241523460b10@linaro.org>
In-Reply-To: <20260318-gs101-pd-v8-5-241523460b10@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Mar 2026 11:13:40 +0100
X-Gm-Features: AaiRm53xTSuLVdH9AhqcT-kXTsfPbIEbom5uTjkqz8fSS91buviGLW-90zzWxN8
Message-ID: <CAPDyKFrprMSLOBMB_BHbi=j6UXV4dXBn-H8M1BsqDWNSCJwvuA@mail.gmail.com>
Subject: Re: [PATCH v8 05/10] pmdomain: samsung: convert to using regmap
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Mar 2026 at 16:28, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On platforms such as Google gs101, direct mmio register access to the
> PMU registers doesn't necessarily work and access must happen via a
> regmap created by the PMU driver instead.
>
> In preparation for supporting such SoCs convert the existing mmio
> accesses to using a regmap wrapper.
>
> With this change in place, a follow-up patch can update the driver to
> optionally acquire the PMU-created regmap without having to change the
> rest of the code.
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

[...]

> @@ -36,31 +35,42 @@ struct exynos_pm_domain {
>  static int exynos_pd_power(struct generic_pm_domain *domain, bool power_=
on)
>  {
>         struct exynos_pm_domain *pd;
> -       void __iomem *base;
>         u32 timeout, pwr;
> -       char *op;
> +       int err;
>
>         pd =3D container_of(domain, struct exynos_pm_domain, pd);
> -       base =3D pd->base;
>
>         pwr =3D power_on ? pd->local_pwr_cfg : 0;
> -       writel_relaxed(pwr, base);
> +       err =3D regmap_write(pd->regmap, 0, pwr);
> +       if (err) {
> +               pr_err("Regmap write for power domain %s %sable failed: %=
d\n",
> +                      domain->name, power_on ? "en" : "dis", err);
> +               return err;
> +       }
>
>         /* Wait max 1ms */
>         timeout =3D 10;
> -
> -       while ((readl_relaxed(base + 0x4) & pd->local_pwr_cfg) !=3D pwr) =
{
> -               if (!timeout) {
> -                       op =3D (power_on) ? "enable" : "disable";
> -                       pr_err("Power domain %s %s failed\n", domain->nam=
e, op);
> -                       return -ETIMEDOUT;
> +       while (timeout-- > 0) {
> +               unsigned int val;
> +
> +               err =3D regmap_read(pd->regmap, 0x4, &val);
> +               if (err || ((val & pd->local_pwr_cfg) !=3D pwr)) {
> +                       cpu_relax();
> +                       usleep_range(80, 100);
> +                       continue;
>                 }
> -               timeout--;
> -               cpu_relax();
> -               usleep_range(80, 100);
> +
> +               break;
>         }
>

[...]

As a follow-up patch on top, please consider converting the open-coded
polling loop above into a readx_poll_timeout_atomic().

That said, the series looks ready to me, but I am awaiting an ack from
a DT maintainer on patch4 before applying.

Kind regards
Uffe
