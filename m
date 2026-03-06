Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DFA3F23C2
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812061; cv=pass; b=S58Bjoj3GiqWES/+hznMplW5KVwptuJmzxju139H9hwuSjWJuntQvkP0zJX26BBioLae/Xhxotf/1zQSys05UndTMIInuPaYoJ0eSGl2YcPoBNxnlVBwLlo3I0hs82F00Wyb3SFB+OIxf+P02wWQpvrhi/qGm2y6i1i+EgOcqV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812061; c=relaxed/simple;
	bh=aGRGwhJZcZdvpbIr5j6VxFzfRNr55VjDk3hvYSJyKU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R/Z2w6oJDY/88sN75KLGdOsgdvJ1sTnGheKr+ccD2Ad3/qVQ8GVJdMhLTiUyibCldZUvvBQwvciHPHT3TpAkMBb2JWc7jEWDhS8U/09AJcfHX0dBcf+KNkqtZvyivaguIc9g5YkqjmyltX0hak5sULVwxqM/KgIkevRmyaaNAlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KJvIVRf4; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KJvIVRf4"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-661cfb9f3aaso380101a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 07:47:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772812057; cv=none;
        d=google.com; s=arc-20240605;
        b=X5HxI9XxScCXXOWEXRC4Lp7ooUxYUtTrKdVUEzEVvjweHDib4m7GGAmRqnWbfd9P2P
         5Xuvl57aVp+Oe7p+66ceFyf9Iko1VxgfF6yy3kJLVH1ltmJ9jFHMOQEiWuBEs1x7FmPO
         kZwyLTNZ3ycAbHgJn2+N5UT7HDOAeji94yFkK5LgW5Tpp5p4BD7knWoChe1AlqiObaI8
         ShzyUIcHdB8g6/J/waqM+D9zmTKzzESZKDUYRxtm7euS6P3ipKow49hdn8TJ0soKWY45
         UoTgG2RtNGzVXvtnzfm/1UxJ+CrTaUlIeRJS8IUpj8hLiELdx5Cz2++MlzVlmHQuQdp0
         VzOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MAibUuNCn/6BbfV0vtODnkSnkQDwc6wpTn7lzKFXoH4=;
        fh=Q8bsMdmHnBXhVy9tw/SNj1snYP1Fu8tErZ/ZZ6uWO3w=;
        b=ZMZNvZzkuK3PeGoBjo0Ucp+BpNLij03Rs92h4W1gG9eu3lgcE14YDLerCQ2NGiFW8M
         YUm9w7ArYJNg9oqlu5Wkv83G165Onfcy3RQkVJqusiYh8TKHb9LUuxauM7Cciny63IWw
         O6m0cA1nE8tIEQR1SGG3/2FkgqGC1JzqsFQ5Y4BkmfkonkFsiAl1xAJbLgKxuZzFkXWO
         ZhcyA/ami/CxZ8pP9XHo+4bbyZY4cna/+yUvb0Dlp1LgDfwyz7mAzDORDeJAsm1+9yDj
         ffN3N2NXaNgSykxwsv4PmM5zv/JJLz97Fy2ycvOh6W5AXNnKYvPbXuFmtMeoWWXz4F8S
         9zbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772812057; x=1773416857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAibUuNCn/6BbfV0vtODnkSnkQDwc6wpTn7lzKFXoH4=;
        b=KJvIVRf4Himd/yea/TRGFcD3GZaq2GgwGSTWNV57q7DgShmdL9CVgi9Zua49KTaTjH
         qIfeyMDopXFtLW+hiQi7uBCB2bwkETKgIC3LkytwMjwejhFPOq9o5crlfq4L0MNyROza
         MV7xvRNOFjAeBY9S87449o8tqnsH1FZy7yM/YN8LRawpQ8IthjoxUdarvqyAGFvBKLSZ
         W00bdS3yUfVrVSQnRSsh59p8KiSEPIBcJbdELdoVZJJfXMIkDi4IpBzfQAgJAiIARCkb
         r/skE6qYKz0VMvzDt6ljTwsXv1X6RlB8ji8fTCOq/wGGDrZCM4trhu1zTGOd7KloybSQ
         G3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812057; x=1773416857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MAibUuNCn/6BbfV0vtODnkSnkQDwc6wpTn7lzKFXoH4=;
        b=JsfzD0gqhqOyExxycs0PA4ou7U3N71S2V9sQey6+fNw0AKss6vypf+q6puqI7MDHvk
         Y9w1aBisSrP1c49bc0Ex/onIWL1q/LO9llNlTFQ/N3rVZGQBHkSAio7o400LNn5CbYgV
         SBa6gymi7qguM/Zp7f+uQX2t8BK+ABdRta8N5Cq0Wra+ycskLoD+QOotVJtsrLsRL5+n
         NyT+fpmSdU3gKbNXCIDUqbg7jrl+IAHBv5fYHZv3vMvGs93nkUQw/+GtYSwRZYlRqiIx
         w9C19hmejwKWy9VIBoGEA+SbpSSp6fbjDptECqSgUSxMJyIwA87NtiVGxAPWj+7FVDpl
         2JKg==
X-Forwarded-Encrypted: i=1; AJvYcCVlRm5E1kJTVTA5HcLOEVZVVLhjO6b3ZO+C+tzZ+sbMV3feex5m7cdYoWK5Lf9CbFB2dRnYScL4MbS924Vj3Akatw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP9i+txnAl3r43S2oyQ/aN8uXB/dc9vZvSxxXP24kMl5c3hs5J
	rU44P7y8fc7EHrJXg0hXMnxIUzzidn84jmPZuqea71X/z+mnXZQq7grHtI4Bxew8qumuS5iCHmi
	G1k63QGApNkzQgkk+kvXypA1jePekCRiN2/THJsJetw==
X-Gm-Gg: ATEYQzzrfXd6H8qiuebQpzawL6x7eJJR+gR/rkJ3mt8Uf0XV4RMr+A98VuAaeeadPhD
	B4JN3ire1TeN2TRhYmYYmh1x7GmykNvwyVZWW9ewcrkPcz0dw1RjIeS6+rgUNM4PJ5dAR7P6YKa
	bx0DCJVlqaL7WeUL5C56qsWYu/HK3jc2ysf63d8Hj1iaJxtbqGZMaI6Sny26zcQatFbc9CFtAxl
	YMYwu+rjFRSp59in2fFHL91DVN84hPio9b/XtetXrvKTFzE6nrtpSgaCaOuwdvnGSAwCstJ4lgZ
	F5ldSF2S0o82Pez/kbh3BN1nafl6e6U39SUZEKO2EA==
X-Received: by 2002:a05:6402:278d:b0:659:4295:96e with SMTP id
 4fb4d7f45d1cf-6619d45c877mr1269842a12.1.1772812056473; Fri, 06 Mar 2026
 07:47:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-10-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-10-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 15:47:24 +0000
X-Gm-Features: AaiRm50ckxtcAQiHBaxvyD5wpcj-AQFCGJHbC5hh7xV8KbjQj7W4u1kNphkwgtU
Message-ID: <CADrjBPr1jGX_-G0H2s8yKSNJYLawvdkYKZqQRwFhV+jy8cZWVA@mail.gmail.com>
Subject: Re: [PATCH v7 10/10] pmdomain: samsung: implement domain-supply regulator
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Mar 2026 at 10:30, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Some power domains on Exynos are fed by a regulator rail and therefore
> regulator control needs be implemented for Exynos power domains.
>
> On Google gs101, HSI0 (USB) is one example of such a power domain.
>
> While at it, add a to_exynos_pd() to avoid direct use of
> container_of() in various additional places, and update existing code
> to use it.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/pmdomain/samsung/exynos-pm-domains.c | 53 ++++++++++++++++++++++=
+++---
>  1 file changed, 48 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index f59986b56213..ed7a5807555b 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -20,12 +20,15 @@
>  #include <linux/of_address.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>
>  #define EXYNOS_SMC_CMD_PREPARE_PD_ONOFF                0x82000410
>  #define EXYNOS_GET_IN_PD_DOWN                  0
>  #define EXYNOS_WAKEUP_PD_DOWN                  1
>  #define EXYNOS_RUNTIME_PM_TZPC_GROUP           2
>
> +#define to_exynos_pd(gpd) container_of_const(gpd, struct exynos_pm_domai=
n, pd)
> +
>  struct exynos_pm_domain_config {
>         /* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
>         u32 local_pwr_cfg;
> @@ -39,6 +42,7 @@ struct exynos_pm_domain_config {
>  struct exynos_pm_domain {
>         struct regmap *regmap;
>         struct device *dev;
> +       struct regulator *supply;
>         struct generic_pm_domain pd;
>         const struct exynos_pm_domain_config *cfg;
>         u32 configuration_reg;
> @@ -64,12 +68,10 @@ static int exynos_pd_access_controller_power(struct e=
xynos_pm_domain *pd,
>
>  static int exynos_pd_power(struct generic_pm_domain *domain, bool power_=
on)
>  {
> -       struct exynos_pm_domain *pd;
> +       struct exynos_pm_domain *pd =3D to_exynos_pd(domain);
>         u32 timeout, pwr;
>         int err;
>
> -       pd =3D container_of(domain, struct exynos_pm_domain, pd);
> -
>         if (!power_on) {
>                 err =3D exynos_pd_access_controller_power(pd, power_on);
>                 if (err) {
> @@ -126,14 +128,45 @@ static int exynos_pd_power(struct generic_pm_domain=
 *domain, bool power_on)
>         return err;
>  }
>
> +static int exynos_pd_regulator_enable(struct regulator *supply)
> +{
> +       return supply ? regulator_enable(supply) : 0;
> +}
> +
> +static int exynos_pd_regulator_disable(struct regulator *supply)
> +{
> +       return supply ? regulator_disable(supply) : 0;
> +}
> +
>  static int exynos_pd_power_on(struct generic_pm_domain *domain)
>  {
> -       return exynos_pd_power(domain, true);
> +       struct exynos_pm_domain *pd =3D to_exynos_pd(domain);
> +       int ret;
> +
> +       ret =3D exynos_pd_regulator_enable(pd->supply);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D exynos_pd_power(domain, true);
> +       if (ret)
> +               exynos_pd_regulator_disable(pd->supply);
> +
> +       return ret;
>  }
>
>  static int exynos_pd_power_off(struct generic_pm_domain *domain)
>  {
> -       return exynos_pd_power(domain, false);
> +       struct exynos_pm_domain *pd =3D to_exynos_pd(domain);
> +       int ret;
> +
> +       ret =3D exynos_pd_power(domain, false);
> +       if (ret)
> +               return ret;
> +
> +       /* Ignore regulator errors - the domain was disabled after all. *=
/
> +       exynos_pd_regulator_disable(pd->supply);
> +
> +       return 0;
>  }
>
>  static const struct exynos_pm_domain_config exynos4210_cfg =3D {
> @@ -283,6 +316,16 @@ static int exynos_pd_probe(struct platform_device *p=
dev)
>         if (ret)
>                 return ret;
>
> +       /* get the domain power supply if required */
> +       pd->supply =3D devm_regulator_get_optional(dev, "domain");
> +       if (IS_ERR(pd->supply)) {
> +               if (PTR_ERR(pd->supply) !=3D -ENODEV)
> +                       return dev_err_probe(dev, PTR_ERR(pd->supply),
> +                                            "failed to get domain supply=
");
> +
> +               pd->supply =3D NULL;
> +       }
> +
>         /*
>          * Some Samsung platforms with bootloaders turning on the splash-=
screen
>          * and handing it over to the kernel, requires the power-domains =
to be
>
> --
> 2.53.0.473.g4a7958ca14-goog
>
