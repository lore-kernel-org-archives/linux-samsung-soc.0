Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4CE3BF695
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2026 11:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869201; cv=pass; b=NtELVv/ABMl2w2f5bIvnMDjsnQysnAv7HYSnCXrLtRaeqkE8yhfxRe37EEYxisjBntMigCBL4kmuap/tNJJl7UoQ9z35DVN+1lj/92FvoDAbmkLYG6XE++DgFZjwDn1TvQTsm2n3JVfZDKBnTux1Ag8c5P8GkLi0GZjUHDAELuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869201; c=relaxed/simple;
	bh=dlgA3vHp/tCZZP6x+MyvcYNS73Ufva6+EVngsEM6VdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwqEc9+UbSY8f34Nlxq7HtSQQaZbZQ4YwF1hI9+vrUYIXxba3trFS3ogqX9oc5u/l3AQBSqpY2Lnz2o3jT+sNi70Van3/egkubzo9/eG16Mk/yhnJ2eq4lyvd+Yq4EnAj0o51jdvzFTvJqcFRDvzX+PPDaSwoAf/V6ktgnfpwm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hCsadkBg; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hCsadkBg"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a1307438ddso4669327e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2026 04:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774869195; cv=none;
        d=google.com; s=arc-20240605;
        b=ID6OPUp7jgpTPtaZZz9PVMRvamqKXLCj/WF+j9uGc03VGJ9kx7RDV7nVcVtahMMp26
         abmaZ08eijc908CN8vHayg4JOTK/xfNGpCV93iqQTDfeDkWAF/JB/NOmd2gSnWTjml/U
         /Q/xBM3+x51r4ecdnpIuq/5NT77I32pQquz4SGmFbZ3SIIUamP8RskbLr9DTXs7nWVZd
         PMvrDAjR85hcjL3uT3DDRg24ROiky63fNLaw5auNmCDTSWwmF+wjQtepaEwvwBfXbKeG
         wSU2bn3n3ZoiN+kD1VaaSUcc4865sHR1C1cqtPfsHJ6PPajCnKffPE6oiTCxJNayId14
         NhYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JOM+v3hkRUPIxwZnJzq8Dzd0DMU9QR03z+xYMXNAkMc=;
        fh=nCqy3J6e7VxsS2mmZ1BJil1Um2e2hTck5Gj/1Ozf0/0=;
        b=S20gIzlgoP5sehDGJ9lcBP9Pl1zQLtBnr1saQnrgZC+6PBSdrJjM6E7EMi1NglQ7od
         X/5y1+r/vteVpMTbWxBlShHGZLVlLG+giKEqqJWMRSW74EQs92HCtQO1VpUfZUuJqBb/
         7B1w7CVl+yqOSZf8ZIPVFYSy2bDRU8xJbjvQbEIU6yXhoHUgLKHcvbJtsoPQPV11xrBC
         AXkLs745GugrOl9sukoDdeEnCLKzW/o3QnyeQ+n7XP31VRwikW2zUj+CRWRkTEB61RXV
         IUurKncAnaRvTYEX3FnrF3R1jHhS/9pg7LHAfOtqf6YNQo1FZHplME9fcIEka5hRgoQv
         /mhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774869195; x=1775473995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOM+v3hkRUPIxwZnJzq8Dzd0DMU9QR03z+xYMXNAkMc=;
        b=hCsadkBgAmi+9tAT9KksvfkxwpsYqeTRsfRyUxAUIcHE8RGB9HD0sWgd8sCmWvcB1r
         UI07jD81jbCf75euSTuXQDsISj4krH1/XvuehjtCH1w7u/HcagjkA2LEIo+zn6FDTOCI
         LitEGYYLljS0josW8buvHBitH3eTJqQRQkQeGCWGa8XQI6J/veFyDR23q22xR4EsExfi
         p6BnlQ9Y2qj69Q3I8b1CK13Yynx7zcGYkjwzL70QcmMnWCLxEk1/mfDj6C7mOUVEhab3
         kXmticgIFLgroGP3qEsSkOrE78Hh3XmEGwTCunQBQAx9vYBV1K5YON0Wc6BPxk+rYBhj
         XT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869195; x=1775473995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JOM+v3hkRUPIxwZnJzq8Dzd0DMU9QR03z+xYMXNAkMc=;
        b=n8xRfOtDCMNsMUOgSHq49lxA068dqVL7hs3/NN/m35gIMOOpKE4sZS8nSN98kLeYWs
         CBlJGlMRzERrImSpraee17y0SblSVkrCEEtbeWkNJceiIOXkYSP2acb7TXxXkGvzDtya
         /azd52C3NKn1vkebaMjYXAJDnIosWK48XDqYARfo/X6SjvFml7JZz9zWG9/fwxX7qO3c
         TlwOA/D8JV3B/SOobQ3qy2FlMNUraZZA7IL2jdUau0eVX8ZXUtV1L0j0qAFMpvRpQqwh
         h371aUjGTAax3fpPKSOoO99sCro5s3PhBPalX+6NHnR4gVAPV62eJBygXLDo/OopYdQu
         hfZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgRDzitxNX6Rv9S0tDfOXEE9ccuhbEjHZvzEFs1kc5/97LMdbDsKC5Twk1lloKlMHfBIeIej0+BA6xuMzDa/GBMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzV5CktGljOzS8lZvpacSce+VJVfsg0ag0vf3fVlj7pvBKP2C+t
	b9Ls9mSJrRYnMF04lqooUQWjPHlTMUcJyh24VFsOVfPdd9OCOh9G7CxuxUi/KlVcARbCie8Mkj1
	tyxIL9kliS1/S703GXk7m+Gni/rZ39HIYeknBjYeqOQ==
X-Gm-Gg: ATEYQzwb38UjauwcwTJxLSPfX3/Hj1VobQVLr1NoQNApgwrsVsYHu3MT3x9uip6cGZF
	VhiT6SFzfHPU1KSgHh9MbYrYQFeRNs5hch90MPMsrYn8zvH6BaMZ0f2gA8eYieSkBRB7cwoWUU2
	XGUQ5E9WLD4FE2iwc12bRiqEcLfnhl3j8d3rAnMdMKX6snAWziILrCThPq2KKyMLUt4abgBnGsP
	5rQhhR3B1rqpLWDwzfy1Ia5tgwRfQEpjkcM0wHMvtvkhuZ2qnS4KYZLVVoiTQ01Wi/HwI5cmTMs
	hZCClQ2MQg8w3UTi0IM=
X-Received: by 2002:a05:6512:685:b0:5a2:9d61:f710 with SMTP id
 2adb3069b0e04-5a2ab92634bmr3995988e87.28.1774869195094; Mon, 30 Mar 2026
 04:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
 <177409907930.268981.5882592990447577348.b4-ty@b4> <CAPDyKFoz-sm0pfvn5iSYFY0mrW38vaGRZsFvrVPqsv7BsYxeWQ@mail.gmail.com>
 <1fbf5c54-8793-4585-be33-ded77019adb2@kernel.org> <CAPDyKFrK3NLwaii-9FEmyaTzUAuVkMkLL3rWBQwQvT-M+PzEHA@mail.gmail.com>
 <3bb6b71e-947b-4248-95ba-79852f743c1d@kernel.org>
In-Reply-To: <3bb6b71e-947b-4248-95ba-79852f743c1d@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 30 Mar 2026 13:12:39 +0200
X-Gm-Features: AQROBzCzpsR16OKFH2Q1YSJwCONrrQEcDC_w0lPdIFqdSp0pO1DGRu9LhJ5vXKQ
Message-ID: <CAPDyKFpOPC2stAJ262jdap-=ByY09AeQ0kj6p_9FTGJBx+Tu-Q@mail.gmail.com>
Subject: Re: (subset) [PATCH v8 00/10] pmdomain: samsung: add support for
 Google GS101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Juan Yescas <jyescas@google.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Mar 2026 at 12:17, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 30/03/2026 12:13, Ulf Hansson wrote:
> > On Mon, 30 Mar 2026 at 11:54, Krzysztof Kozlowski <krzk@kernel.org> wro=
te:
> >>
> >> On 23/03/2026 12:13, Ulf Hansson wrote:
> >>> Hi Krzysztof,
> >>>
> >>> On Sat, 21 Mar 2026 at 14:18, Krzysztof Kozlowski <krzk@kernel.org> w=
rote:
> >>>>
> >>>>
> >>>> On Wed, 18 Mar 2026 15:27:45 +0000, Andr=C3=A9 Draszik wrote:
> >>>>> This series adds support for the power domains on Google GS101.
> >>>>>
> >>>>> There are a few differences compared to SoCs already supported by t=
his
> >>>>> driver:
> >>>>> * register access does not work via plain ioremap() / readl() /
> >>>>>   writel().
> >>>>>   Instead, the regmap created by the PMU driver must be used (which
> >>>>>   uses Arm SMCC calls under the hood).
> >>>>> * DTZPC: a call needs to be made before and after power domain off/=
on,
> >>>>>   to inform the EL3 firmware of the request.
> >>>>> * power domains can and are fed by a regulator rail and therefore
> >>>>>   regulator control needed be implemented.
> >>>>>
> >>>>> [...]
> >>>>
> >>>> Applied, thanks!
> >>>>
> >>>> [01/10] dt-bindings: soc: google: add google,gs101-dtzpc
> >>>>         https://git.kernel.org/krzk/linux/c/10084aeadadfab72648f6ed1=
cc78f7cd87b861ba
> >>>> [03/10] dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into s=
eparate binding
> >>>>         https://git.kernel.org/krzk/linux/c/3ec3c42b426fe5e2b48ff19c=
551dec50bc78788c
> >>>> [04/10] dt-bindings: soc: google: gs101-pmu: allow power domains as =
children
> >>>>         https://git.kernel.org/krzk/linux/c/c8229a5160eea145b796f543=
17d6e659cec9b080
> >>>>
> >>>> Best regards,
> >>>
> >>> Usually I pick up the power-domain related changes for the DT binding=
s
> >>> and host them via an immutable branch called "dt". If needed, SOC
> >>> maintainers can pull it to apply/test the corresponding DTS changes.
> >>>
> >>> That said, I am open to whatever you think is best here. Perhaps it's
> >>> easier if you can drop the DT patches and provide your acks instead o=
r
> >>> if you can share them via an immutable branch for me to pull?
> >>
> >>
> >> I did not pick up any pmdomain binding patches. I picked up only soc a=
nd
> >> according to cover letter there are no dependencies between anything h=
ere.
> >
> > As I understand it, they are all related and some even depend on each
>
> I raised exactly that questions but no answers.
>
> > other. I think keeping all four DT patches together makes sense.
>
> Why? What is the dependency?

I defer to Andr=C3=A9 to clarify this for us.

>
> >
> > Although, as I said, if you think it's best to funnel them through
> > your tree, please do and then share them via an immutable branch, so I
> > can apply the pmdomain driver changes.
>
> soc must go via my tree, but there is no reason to take the pmdomain
> binding patch. So I did not take.

Yes, they belong to soc/platform, which is common for most
power-domain providers.

To allow us to merge/maintain power-domain provider *driver* changes
separately, we needed a way to manage the corresponding DT bindings.
That's why I am hosting the immutable "dt" branch for these, which
soc/platform maintainers can pull-in when they need it.

Of course, doing it the other way around is also possible. Just let me
know what you prefer.

>
> But anyway, I just noticed that I dropped everything: this introduces
> new warnings which were nowhere addressed or explained. So regardless
> how this should go, please do not apply anything - it's broken and
> author is silent.

Right, I will await your confirmation!

Kind regards
Uffe
