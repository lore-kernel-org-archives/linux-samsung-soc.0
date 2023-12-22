Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76212554E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Dec 2023 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hqj+d6I6"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6d93278bfbeso1318332b3a.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Dec 2023 08:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703264364; x=1703869164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACmJFfilUh4/qCtQEksIqI4mnR+VgyeD/6SXnBrVOJA=;
        b=Hqj+d6I6hmeQNs+9mKrGPEUak4mUwsLFCioJqEdovdl14b+VcLd1MLR1yfZxXmz/TW
         N2eVAICJHE2PNoNdL2PQvPY4MOMyaQB11h97DHeEopwndk/t2iOfIED5yd1X5JO57D+E
         bvs4UYT6TC/GDT+0XwNzsUTvG5Q23U+q91Sevb/stG7CVl+PlTUBKUgy+bLTIO9D5JWN
         WaoyaRNonVdcup5X3PLrQhwYcdBJT/nw8VwrGYZQKU0d+zenARnRozNzr9/HbmwCnHBC
         zmUTpqTOMQJ20ARa4pHE55nN+x1ggbxbPgco3HdfEy0YW0PUTpad6fqX+27Kmb/Ks30M
         0V2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703264364; x=1703869164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACmJFfilUh4/qCtQEksIqI4mnR+VgyeD/6SXnBrVOJA=;
        b=fE4ZDQGAIhVkdQtyQrk74oq94hP3ZTt07+9RdQxvb8SqQr4qT7iS7OKA3zUhhi/Lyt
         FpiRMRrPGhuWpfJNneBDkyiqvavc0rDs8+Wn5sVPuPEmBztIWTRoPftEoH8AYdH2FCQq
         o4xQJVFnylzWfWqN4LRnEysH6AxDa8+Z371HesOY4iaZFnqh/FFUbCoQGzU5bs8heNN/
         nNvlg6nDfM81hFD9aWnwMiQF5xh/iiJP5GQlhii8TraDmBvZ3ela5iZPViF5VS22mlgH
         Go7klBhlPgacXgnkkYLIR8vjTdVlhU1TLGvGIDkP/dkavU+zcul+pAOsdyctQFF0/tAE
         ojsA==
X-Gm-Message-State: AOJu0Yy0NAdMkZEibahxM2aqJjSdXPW9JwfZjfS4LomTNhCv900IDaHH
	uaMmL6q/DeSPyOtf3lVof6PUEX6lo3UE+Ucazuvf2kZ66xdOvg==
X-Google-Smtp-Source: AGHT+IETjYzmZQ54QRmOOdNnqTmsUeKaHxfY1knEuI973zH36pzxQOvWL8dUk4vz7UBrKL6Ztrec7BnrNi8GE/FyEWo=
X-Received: by 2002:a05:6a00:1822:b0:6d9:5ea7:5ed8 with SMTP id
 y34-20020a056a00182200b006d95ea75ed8mr1251619pfa.23.1703264364134; Fri, 22
 Dec 2023 08:59:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231222165355.1462740-1-peter.griffin@linaro.org> <20231222165355.1462740-3-peter.griffin@linaro.org>
In-Reply-To: <20231222165355.1462740-3-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 22 Dec 2023 10:59:13 -0600
Message-ID: <CAPLW+4konUmivej17mjxyMJF7kBfQ9qZGMzr=Fq6ROiGtEASzA@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: samsung: gs101: register cmu_misc clocks early
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	daniel.lezcano@linaro.org, tglx@linutronix.de, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 10:54=E2=80=AFAM Peter Griffin <peter.griffin@linar=
o.org> wrote:
>
> Update cmu_misc so it is registered early, as it contains
> the gate which clocks the Multi Core Timer (MCT). This clock
> is required early in boot, otherwise exynos_mct will fail
> obtaining the clock.
>
> Note this wasn't previously an issue as exynos_mct wasn't
> enabled.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/clk/samsung/clk-gs101.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs=
101.c
> index 0964bb11657f..590119a25c18 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -2478,6 +2478,15 @@ static const struct samsung_cmu_info misc_cmu_info=
 __initconst =3D {
>         .clk_name               =3D "dout_cmu_misc_bus",
>  };
>
> +static void __init gs101_cmu_misc_init(struct device_node *np)
> +{
> +       exynos_arm64_register_cmu(NULL, np, &misc_cmu_info);
> +}
> +
> +/* Register CMU_MISC early, as it's needed for MCT timer */
> +CLK_OF_DECLARE(gs101_cmu_misc, "google,gs101-cmu-misc",
> +              gs101_cmu_misc_init);
> +
>  /* ---- platform_driver ------------------------------------------------=
----- */
>
>  static int __init gs101_cmu_probe(struct platform_device *pdev)
> @@ -2495,9 +2504,6 @@ static const struct of_device_id gs101_cmu_of_match=
[] =3D {
>         {
>                 .compatible =3D "google,gs101-cmu-apm",
>                 .data =3D &apm_cmu_info,
> -       }, {
> -               .compatible =3D "google,gs101-cmu-misc",
> -               .data =3D &misc_cmu_info,
>         }, {
>         },
>  };
> --
> 2.43.0.472.g3155946c3a-goog
>
