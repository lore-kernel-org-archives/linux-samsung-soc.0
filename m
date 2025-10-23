Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE73312819
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227254; cv=none; b=FYXkQNzPlnmKRD/YI++1oaUYXNt1WCB9FgTF43xQdQcNcGP3PbiSHslasQETq1GH18KTZAB/pmENkVtkbYLp7NC+B7UBLw3/kWY7jL0S4LhRmUGBHYuwi0weY8oDJ0oFFDfQH8mW0nxgZR9CEiJSVEEsgRehRSYtP9hwB2R8ev0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227254; c=relaxed/simple;
	bh=2YtJ6LRyOGedFxwzkzDH/Zo54OflUP87J7mbaNdzMkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MMM5qEmiwyQZZlv12OhSs0mrm1p0lGMW2O0AEwRFLaj7Syc3XFC4ee5ZthOLgQo5xTjdxaKrRaWWp7iXxR/ZjmZydvSvWgKxkqw+JHGBPTDiyQ/WkJevflUtKUQb0yBm4jVSc4UyE46HvFSCrUjIgQiHoEvUFnn9zxMlYyKfl1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ja2Eu7OG; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ja2Eu7OG"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-63d8788b18dso917959d50.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 06:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761227251; x=1761832051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgz0MPvCEEIvnpRdxEKizmyGPKxuxFkbXXBpVNZQA2U=;
        b=Ja2Eu7OGV8fmhnZdia+rMmYTql6h0cSvLZ32B2KTgdoKGSfCUrOd5PdlnRkD4SoMna
         lTgyFTfMO5+GqKljBviRqhve2HNNApKaiyJ6WsWvQKozV3672XhyO1bl+n1YStYlbdq/
         eklTNaJkrAYYDNcizz/7nofFYIZuEOvEEAC8utmkroV0QA71++AFBtAEBRugVJFQwNEr
         utLzuUCDIOjHiJaoAsnrgldc56ocllALnqJ2BQcMNl+nFPfJ0dWEAmczAcQO4EPWqZ4l
         f4Bi9X/drxki7yaSIgxRzsDhQoYVhdWRvpHHCvWPXnewJnaK7y45dgtpJimU89K7vLzK
         1mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227251; x=1761832051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgz0MPvCEEIvnpRdxEKizmyGPKxuxFkbXXBpVNZQA2U=;
        b=ZTCAe9dZ9F4hP1mc4ufUiJYuTjGTd/qPPsHmFaeCj91v+DDciPgbWVW4mBAOipO7T+
         AEmqTNrCjk/DJ589ABB7444jOsVn3VW3OAXr5hh80Y0l2DEr3Kg7SRie3p/01OoJYIj2
         8d6uyyBjEW74yB3Dv0k4QhF2fgg1Rh7D3XwsSUyotZLmOrBdg1dCO3PGifgnDugulOS6
         2UsaLNCS5Hb92FBjKyE1g11QbYWRPCY5t7WUuYMVAmqygIhZVpY/CRcDM5pzCELhfBL5
         yrc0QS+0qXCU2pUR44W0kV8zSvB97M8RBnrK6Jd7/0OhNMmaug0Q9CY6/6AgQSFxEEvf
         5pjg==
X-Forwarded-Encrypted: i=1; AJvYcCW1STLFi7uo00N9STX9DYZv03lKQsRbGKhoTHy/nDnTy+Hh/mqyuCzQRZEhuFxJ2G471UUo9yEl9HYuyEvGd5ecVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBpwQNnotq2PIFRfbu0bpZ7Tgqc0fl9vVF9zUVbfhEK/2RVQNP
	LeoauGddF49izuA4w2EV6j5wm7bDIg5MiNR1/xmrZBtDBfxD6hDXrSdMoGADaEAZBhijSW0GYIT
	3F3K/0tvNUl/9PUFbpLWSAK7tHNfLBkBXxejTgjtcfg==
X-Gm-Gg: ASbGncsXYL90842nzt7yMNDKifLlOJo+q7kZ7cPH2t5e2l4cuUVyN9oFhbp2suZ3gs+
	oPYQePtFgnTg0wy20BHnZchZ66Tzi/hfgKfeFecqzGysu9wmNjy5tSEEAvKGjubSJTCnzeE/M7j
	Hs/pHO4VNFj4lJTEmhNkcjCsKF3chbk7TyUJlgrKeuiiNr0zOLRi+Q6XYh4BTiWudiblJx1nBpE
	K/29nG3Nj3XxavDWrIbl5W1nlGTYZHoJCXCzYLiYEdOZkKi+9GH38y73miInw==
X-Google-Smtp-Source: AGHT+IEDCfqv4pG4v0i8RCV2WYShTzR+pW/qVzfUKwEjCpv3rEpG8LtgRQWNRSjF/bG233OV5m2cMcbi37urgECEqnQ=
X-Received: by 2002:a05:690e:1598:10b0:63c:e90c:a6dc with SMTP id
 956f58d0204a3-63e160d9059mr18376155d50.8.1761227250806; Thu, 23 Oct 2025
 06:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
 <20251016-gs101-pd-v3-8-7b30797396e7@linaro.org> <CGME20251022110738eucas1p2cee28096ca5c9c6a802e2190d88ccf21@eucas1p2.samsung.com>
 <CAPDyKFq2esPos=D-eVz6w1VXq=4LYi6fx54K4TvsUi4JqUJOaQ@mail.gmail.com>
 <57bacc06-8a5e-4284-a520-c5d2a56545e9@samsung.com> <CAPDyKFrCS1PGwPeZd2ahZ=wKXCqPj93qAJ7V-ELELLA_OwgdSw@mail.gmail.com>
 <cca286f5-bb43-4914-864c-b5e5c73270c8@samsung.com>
In-Reply-To: <cca286f5-bb43-4914-864c-b5e5c73270c8@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Oct 2025 15:46:54 +0200
X-Gm-Features: AS18NWABfjM36klv5hIIGT-5MwjE_SPbRGTiI4LQB-iSMF8Ct_lzzibZCZxPGQY
Message-ID: <CAPDyKFppte-Rh-xNybEz8dshrD2gfqJHUpiL1bPWzZ6pBig6+g@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] pmdomain: samsung: selectively handle enforced sync_state
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Oct 2025 at 14:17, Marek Szyprowski <m.szyprowski@samsung.com> w=
rote:
>
> On 23.10.2025 12:02, Ulf Hansson wrote:
> > On Wed, 22 Oct 2025 at 20:39, Marek Szyprowski <m.szyprowski@samsung.co=
m> wrote:
> >> On 22.10.2025 13:06, Ulf Hansson wrote:
> >>> On Thu, 16 Oct 2025 at 17:58, Andr=C3=A9 Draszik <andre.draszik@linar=
o.org> wrote:
> >>>> Unconditionally calling of_genpd_sync_state() causes issues on
> >>>> platforms with child domains as the parent domain will be turned off
> >>>> before the child domain was even registered during boot.
> >>>>
> >>>> This in particular is an issue for the upcoming Google gs101 support=
 -
> >>>> all operations on child domains registered after the parent domain
> >>>> misbehave.
> >>>>
> >>>> Add a flag to the probe data to be able to sync_state conditionally
> >>>> only, and enable that flag on the two platforms currently supported =
by
> >>>> this driver.
> >>>>
> >>>> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >>>>
> >>>> ---
> >>>> v2:
> >>>> * use bool for need_early_sync_state (Krzysztof)
> >>>> ---
> >>>>    drivers/pmdomain/samsung/exynos-pm-domains.c | 5 ++++-
> >>>>    1 file changed, 4 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/=
pmdomain/samsung/exynos-pm-domains.c
> >>>> index 638d286b57f716140b2401092415644a6805870e..15a1582aa92103a07335=
eb681600d9415369fefd 100644
> >>>> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> >>>> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> >>>> @@ -20,6 +20,7 @@
> >>>>    struct exynos_pm_domain_config {
> >>>>           /* Value for LOCAL_PWR_CFG and STATUS fields for each doma=
in */
> >>>>           u32 local_pwr_cfg;
> >>>> +       bool need_early_sync_state;
> >>>>    };
> >>>>
> >>>>    /*
> >>>> @@ -69,10 +70,12 @@ static int exynos_pd_power_off(struct generic_pm=
_domain *domain)
> >>>>
> >>>>    static const struct exynos_pm_domain_config exynos4210_cfg =3D {
> >>>>           .local_pwr_cfg          =3D 0x7,
> >>>> +       .need_early_sync_state  =3D true,
> >>>>    };
> >>>>
> >>>>    static const struct exynos_pm_domain_config exynos5433_cfg =3D {
> >>>>           .local_pwr_cfg          =3D 0xf,
> >>>> +       .need_early_sync_state  =3D true,
> >>>>    };
> >>>>
> >>>>    static const struct of_device_id exynos_pm_domain_of_match[] =3D =
{
> >>>> @@ -179,7 +182,7 @@ static int exynos_pd_probe(struct platform_devic=
e *pdev)
> >>>>            * reset during boot. As a temporary hack to manage this, =
let's enforce
> >>>>            * a sync_state.
> >>>>            */
> >>>> -       if (!ret)
> >>>> +       if (pm_domain_cfg->need_early_sync_state && !ret)
> >>>>                   of_genpd_sync_state(np);
> >>> The call to of_genpd_sync_state() was intended as a temporary solutio=
n here.
> >>>
> >>> Potentially, if we would be able to distinguish what PM domain that i=
s
> >>> causing the problem on the Exynos platforms, we could set
> >>> GENPD_FLAG_NO_STAY_ON for that genpd instead.
> >> Well, this of_genpd_sync_state() "workaround" has to be applied only t=
o
> >> the power domain of the display controller device. It can be replaced =
by
> >> the following check on the legacy Exynos systems:
> >>
> >> if (IS_ENABLED(CONFIG_ARM) &&
> >> of_device_is_compatible(np, "samsung,exynos4210-pd") &&
> >> (strstr(pd->pd.name, "LCD") || strstr(pd->pd.name, "DISP")))
> >> pd->pd.flags =3D GENPD_FLAG_NO_STAY_ON;
> > Oh wait, perhaps better to just power-off these PM domains before
> > calling pm_genpd_init(), if that can be done safely?
> >
> > At least that would guarantee the reset to happen before the display
> > driver gets probed. Instead of relying on genpd_power_off_unused()
> > (late_initcall_sync) to do it.
>
> Well, yes, this works too:
>
> if ((of_device_is_compatible(np, "samsung,exynos4210-pd") &&
>      (strstr(pd->pd.name, "LCD") || strstr(pd->pd.name, "DISP"))))
>           exynos_pd_power_off(&pd->pd);

Okay!

Should we (you or me?) send a patch and change the code like this?

>
> >> I assume that this information cannot be coded in device tree to make =
it
> >> somehow generic...
> > Right, in principle we would need a new DT property for a power-domain
> > provider, like "broken-hw-reset", because we don't have a reset-line
> > to pull.
>
> It is not a matter of broken reset at all. It is a matter of software
> configuration and the lack of 'protocol' to pass the information that
> the display controller is configured to display splash screen from the
> system memory at given address and newly instantiated drivers must to be
> aware of that.
>
> Turning display-related power domain off simply resets all that
> configuration, so drivers can start from good known 'unconfigured' state.

Alright, thanks for clarifying! Yeah, a DT property would be wrong for this=
.

In fact, there are some drivers [1] that make use of the genpd on/off
notifiers to manage a reset of its device's PM domain. It works, but
it's a bit messy. Perhaps it could be simplified with some new helper
functions, if more consumers drivers need something similar.

Kind regards
Uffe

[1]
commit c11fa1204fe9 ("drm/msm/a6xx: Use genpd notifier to ensure
cx-gdsc collapse")
