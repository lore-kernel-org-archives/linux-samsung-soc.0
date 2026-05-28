Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A185335564
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 08:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779955359; cv=pass; b=WpE+9EM4zSM4TIkjvFiGF8vM9HHr01iKKroC1LkcuqGA3fGOn+AsSPtBh0bh8EkuXPOd+UicWbm6H+0bXjsMd+kLxPxB4SDBl1ey1UZ+FmWTKUOJF/CvgC0vZ7vjcseLNung+KwiKS3lDNJlv6z/DlD9ugt0p50XSdBTmXCz4Lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779955359; c=relaxed/simple;
	bh=bG7XwxaEW2IACHakSY7DuqwFmH+ZNFy25Crj6OOZINg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XEpMIZlyKofybt4aWkDl3E4CcrwPwsLGWW/Qndhkbjl+f5Fun1p7tsaWpYhLxRI85Bc0ybIa3JBRuM2gReQDSUV9gGZkxSp8M158M+dOyhhdj4GJVvMyYyrhmIXcrnENn52XeSH+5DCAg2fkYW4WA9QNemEo8cLIGGRZhELbzoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jnHvpziF; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jnHvpziF"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68852a4fc68so9210573a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 01:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779955356; cv=none;
        d=google.com; s=arc-20240605;
        b=RmHH1PtRpRgVIUzOWxFavkeJGKMbJwmKMKHWBE+4o0E+0ACffNUkHPqN/pLnswbNzz
         sWhcrpzQOQMREcPODARfXZhzrj4d2Gujmf1cJ1rCdcyRxgqsoFx55fuzMVtkAmNjxyl1
         IebBmN+3bLo5tS1QFPtKWQxEzFgkYdmE35lbbBb15JLAN3UWaNN+Qc2zbUpE++r/Hd49
         JwCMJoD4z7cPkRUwkrjRHjBrQGMkB0OVH03KaN3aOQifOomc5hHlg1qwn1Ze13dU9mmY
         HnCwXmLNnoU468biZvbnjqLdvC2P/W44wQo1fsRIzmFAadF3jH9Ca+2GomEPKuPOetom
         1LJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YYtDazt9U95VcVF6VWujIonGGFD/naB0M81vsxEng7Y=;
        fh=c/S9mW1rn930OkAJD2riirznO7E+SZsDPxzqESnsbjQ=;
        b=hmMtOhT5uPwBiNnBKRIap5V8LmezXmSuKNeYp9OAVIf71ZrHIA9iXRhS8qmOK5ZKi3
         977YlbrcVyrROA2fvOaZdJ+8MTSIAVHCOOPNm+MHas3//ta2Lq4HIRay1mwpBlN0jSdj
         llSMrxjxOnBV8lVLi/DfkEm8IDNyUDRWsHsRQ0TcLxHJeNqDA914mgRzE5Y7WnwOSbw6
         ZxC3NpbwpveaeisZxp+2vN4bPpUiQYmnwoUb47rmw+5gRSGzeEI76u9gIgZOf3txxLx6
         IVgDoKSt1/kzs9ZKc2SBQO98pq6+iIF7JcOHnG/+sWrKm3TTjiCTTkjlQJ0FA/H4HbBO
         BoSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779955356; x=1780560156; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YYtDazt9U95VcVF6VWujIonGGFD/naB0M81vsxEng7Y=;
        b=jnHvpziF8ekQovl/+kfv2HLkAgGo6i9HZx4vXObioFLgGq4EenVdy4/x0HJuJVJQ4A
         +8v4Rx1UunKzW6VwZPw/45zmfLnLDlq6pXL2d7shKxFd0sEUichANLiEneZukaMIcGZ7
         Hv0ecc9qExm0vo6knjymxantdEr3cmq3L982N7PzyaJcqUsFX3IfQnTpLRzLuL9nKQNR
         tyhvup2WNUVqoHw3cUAvJDKusQkW8AHlTg0gPItoj13ESPRZFi4jfgI6mYTHMI52okdI
         PLIXO7ePEy7O8QvsiJbwc6g0YIAlsbdkGRpFNZXiIpp3UDa4S06TNRPZtVaxmNYq7uJu
         +2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779955356; x=1780560156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYtDazt9U95VcVF6VWujIonGGFD/naB0M81vsxEng7Y=;
        b=RMBEr2YFosArhh/2EsUitxzWhUti5H+as392S7PochCzchH/wKyhReGz/GA3/6uqYG
         pE9wmY5CE9463BqRDwoF2tFtgk7yg21tLb3i2jJSwn5Uneq8GoyNJ/5mCXvtJD9xpL79
         qVxxGJmroOxb5yZW7yKFNMfGfmEPSFricC93QEOfAwGrqZPK+MmVemoAKlKkv0OGOvoj
         /Yt3FsKdrgl3dxGWN/9f+V/dv7WujH9snVxz2MVy+9N7U0cq6WucujCbxdo8sJZG7ZfL
         Ejya8ns3py8yhjWGTPQVuSNDPZqU86Bi9gauGVzUxcuY5TA1jYrlmUbvxm6jvN6QCd9y
         K15w==
X-Forwarded-Encrypted: i=1; AFNElJ/dfrcDNp8anyuRE4ddDGFX/bzDSqnJVqL9Di8O2UkuVlwNzpas4p2eGjLT8wUqgkqK3z/p/I1lZM+ae8aYkNds7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YytskUN6fz6jOffqpW6oVe2j8y+qX7aNNaa4RXsgKFszuVD0ZwI
	msYStNCh/IXvVuCbZbc+TbDfGk5S/I3h3vRroPYb4mYjwVmh8jP8MvJbMn5/yOinA7Fmz9M1S0L
	0Wz7DIFlrtzd8gf+UVe+iswqkoUJL4RziAsiqE7J41g==
X-Gm-Gg: Acq92OEE0RH/6StvnzhXYVoYF+6h+AUnEydOLTXPZMwfZ2tDoOWKhEcg3OvVEqEumk+
	I7UMLpers7U9n9n67KTIPfhAhHOWwKc4wFnS1CuLiqmAlhnFIoP/b4B6HPvTlqIabvkG4+9kg1Z
	pCWW42vSRhaIVmYOtzed4/v12OkgSa6Qm/0eOH+q2a3+RvkJyDn11xfYR2ISIV0KWS+jzsXHyti
	mhnvfxM47/Qe9IHhMqZxxgBX3+lzqhKsnTCDkwaMZwN3Nc8sSiM9yGcHPzGi/MzLafdv4c0yvT5
	LbF1GcPozFAg2bHjxcEVHOoFbZSsruwGD0CLhZ+UyZ+NP2nwlwvy
X-Received: by 2002:a05:6402:458e:b0:683:f485:c63c with SMTP id
 4fb4d7f45d1cf-6889c4321c4mr13969121a12.1.1779955355656; Thu, 28 May 2026
 01:02:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526061321.6123-1-grandmaster@al2klimov.de>
In-Reply-To: <20260526061321.6123-1-grandmaster@al2klimov.de>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 May 2026 09:02:22 +0100
X-Gm-Features: AVHnY4IF4snH_x_Zty3iJL9-gZoieI2TfzLBtrQPLtenatLAkZtKV7qhQYKta-8
Message-ID: <CADrjBPrsynS5qfJrrVAFwY5kzoM4VcesMC0z0-aKcH-vaGL+PQ@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos5410: fix refcount leak
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, 
	"open list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 May 2026 at 07:13, Alexander A. Klimov
<grandmaster@al2klimov.de> wrote:
>
> Every value returned from of_clk_get() is supposed to be cleaned up
> via clk_put() once not needed anymore.
>
> Fixes: be95d2c7d918 ("clk: samsung: Add support for EPLL on exynos5410")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-exynos5410.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
> index baa9988c7bb7..0cd9b0392cf5 100644
> --- a/drivers/clk/samsung/clk-exynos5410.c
> +++ b/drivers/clk/samsung/clk-exynos5410.c
> @@ -269,8 +269,12 @@ static void __init exynos5410_clk_init(struct device_node *np)
>  {
>         struct clk *xxti = of_clk_get(np, 0);
>
> -       if (!IS_ERR(xxti) && clk_get_rate(xxti) == 24 * MHZ)
> -               exynos5410_plls[epll].rate_table = exynos5410_pll2550x_24mhz_tbl;
> +       if (!IS_ERR(xxti)) {
> +               if (clk_get_rate(xxti) == 24 * MHZ)
> +                       exynos5410_plls[epll].rate_table =
> +                               exynos5410_pll2550x_24mhz_tbl;
> +               clk_put(xxti);
> +       }
>
>         samsung_cmu_register_one(np, &cmu);
>
> --
> 2.54.0
>
>
