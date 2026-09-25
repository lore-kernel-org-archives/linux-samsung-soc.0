Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31D43E51E8
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Sep 2026 17:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790357225; cv=none; b=W4TiiLZimlRzwW/EEcIMvecUQ0oNRGVGtyzn+5udx7rNrudG1t/aFdqqCmQGc+O4MwjI8WrqcDWhUGzbOpKMGx65gteflil9qfZcgoxDh/JfnsOAqX8DDUQQdwDuZC2Klpz0vzIfnNvb4oG9PBQjpzC/0Swb+mrFAngJzky39sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790357225; c=relaxed/simple;
	bh=xDh1Ss17oGJ0UYJjAazKqzsfdZ+kwOSaB4uaBWStnx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oj//VIK4Ao0HiqlGQodD3LBn2/Rl/OWec0Vd9bxKgTIfuodHM4K9WaON2jZSE5JGttUMAfaO3PkwhWIYSzAYYqGPucqzdT6b7uOmjejt8Gmh+ZdPn7Ea+LiaXN5vX3pFBp6Ssop7Q9H5WNo9xfjr2oWoqGezlJ6NbU3TcczW5HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfFKqsvK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfFKqsvK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978C91F0089A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Sep 2026 17:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790357224;
	bh=nrCZY+w8ZAuOgUKyJ5bzQ3lA0kZX185uW8oYwG5RuQA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UfFKqsvK75p5eO5B5LPWqx7YmtHZp5SiX1PFOsrb/Rw7u/0QFbVRoYO3MBcG/t5cL
	 f0grYRNmRlCV/gnwPAuW3LI+ccOXT0MjTt7Y8FeHXxJ869jP4sIIJdGs5M2A3YPkRs
	 ukh/P2eflHnEpauu+zEccKoAmEXT4qeEDi7o0bJS06Qz1CCYGEgXO5YqMpVQhl3no4
	 lLRGB99pVq05PP0MRgcsH4//8wpFOz+qWgGYKGx2Z78V8f5l9jdhS4QzuPEDb8kFis
	 pnJBNA0VYqlKgjIBYJuffADzzi0g5B+u1BB7AUPs4ANGSHG8KVd1IE7vW4tmTi93D2
	 bENY6AcgbMT3A==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c1b8d7b5so1059353e87.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Sep 2026 10:27:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByPCFIW3Q+JsbGJFZhfX1XLsKEM04+O9Hx9x/Bp0O1bb+WO7KjvDOZdxL3YMY3+KO9gUrSkXqSecBuk2kYLmCBkyg==@vger.kernel.org
X-Gm-Message-State: AFuF++mLxEoUiUCZqsFVS3kqYW6uWH4WPOpHMpJ0cxOtBc+Hb8CVHGza
	thsIgv+l+VRr+cF51w+FJe/viuJt2YT5HmllV8l6jBHcGPuxZCLtcmE8Bh4xchGLSVeddZ9kyp6
	6+0zqfQsGS26xFw90scTKEV2aaXqs8cg=
X-Received: by 2002:a05:651c:43dc:10b0:3a6:95a:52ab with SMTP id
 38308e7fff4ca-3a63c0e006emr12420831fa.18.1790357222990; Fri, 25 Sep 2026
 10:27:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191156.185448-1-sumeet4linux@gmail.com> <20260912191156.185448-5-sumeet4linux@gmail.com>
In-Reply-To: <20260912191156.185448-5-sumeet4linux@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 25 Sep 2026 19:25:25 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0inzDfF5zNba7BHnq=-xTH1ucHvBv-bJSKXW0dTF71Q0g@mail.gmail.com>
X-Gm-Features: AclHuK-zkJzcW3eTrPbI8n4uwvaOkU97xV6DSlSAXWBceH5EJVI8blUeGSzDawM
Message-ID: <CAJZ5v0inzDfF5zNba7BHnq=-xTH1ucHvBv-bJSKXW0dTF71Q0g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] thermal: Use %pe to print error pointers symbolically
To: Sumeet Pawnikar <sumeet4linux@gmail.com>
Cc: rafael@kernel.org, krzk@kernel.org, amit.kachhap@gmail.com, 
	daniel.lezcano@kernel.org, thara.gopinath@gmail.com, talel@amazon.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, mmayer@broadcom.com, 
	viresh.kumar@linaro.org, sumitg@nvidia.com, peter.griffin@linaro.org, 
	myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 9:13=E2=80=AFPM Sumeet Pawnikar <sumeet4linux@gmail=
.com> wrote:
>
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to pr_err() and dev_err(). The %pe format specifier prints a symbolic err=
or
> name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
> falls back gracefully and prints the raw integer value. This makes messag=
es
> more readable without any functional change.
>
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/thermal/cpufreq_cooling.c        | 4 ++--
>  drivers/thermal/devfreq_cooling.c        | 4 ++--
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_=
cooling.c
> index 768859a7aed0..856d619370db 100644
> --- a/drivers/thermal/cpufreq_cooling.c
> +++ b/drivers/thermal/cpufreq_cooling.c
> @@ -661,8 +661,8 @@ of_cpufreq_cooling_register(struct cpufreq_policy *po=
licy)
>
>                 cdev =3D __cpufreq_cooling_register(np, policy, em);
>                 if (IS_ERR(cdev)) {
> -                       pr_err("cpufreq_cooling: cpu%d failed to register=
 as cooling device: %ld\n",
> -                              policy->cpu, PTR_ERR(cdev));
> +                       pr_err("cpufreq_cooling: cpu%d failed to register=
 as cooling device: %pe\n",
> +                              policy->cpu, cdev);
>                         cdev =3D NULL;
>                 }
>         }
> diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_=
cooling.c
> index 0330a8112832..9ada52cbf7dd 100644
> --- a/drivers/thermal/devfreq_cooling.c
> +++ b/drivers/thermal/devfreq_cooling.c
> @@ -156,8 +156,8 @@ static unsigned long get_voltage(struct devfreq *df, =
unsigned long freq)
>                 opp =3D dev_pm_opp_find_freq_exact(dev, freq, false);
>
>         if (IS_ERR(opp)) {
> -               dev_err_ratelimited(dev, "Failed to find OPP for frequenc=
y %lu: %ld\n",
> -                                   freq, PTR_ERR(opp));
> +               dev_err_ratelimited(dev, "Failed to find OPP for frequenc=
y %lu: %pe\n",
> +                                   freq, opp);
>                 return 0;
>         }
>
> diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/q=
com/qcom-spmi-adc-tm5.c
> index af72db6299cd..4554a6fa55d1 100644
> --- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> +++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> @@ -680,8 +680,8 @@ static int adc_tm5_register_tzd(struct adc_tm5_chip *=
adc_tm)
>                                 continue;
>                         }
>
> -                       dev_err(adc_tm->dev, "Error registering TZ zone f=
or channel %d: %ld\n",
> -                               adc_tm->channels[i].channel, PTR_ERR(tzd)=
);
> +                       dev_err(adc_tm->dev, "Error registering TZ zone f=
or channel %d: %pe\n",
> +                               adc_tm->channels[i].channel, tzd);
>                         return PTR_ERR(tzd);
>                 }
>                 adc_tm->channels[i].tzd =3D tzd;
> --

Applied as 7.4 material, thanks!
