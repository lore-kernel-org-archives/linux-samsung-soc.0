Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3E518E11
	for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jan 2024 10:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706091681; cv=none; b=mwIns2DGZCRTIwcE2cCbSlTq0Kk7pDpbt74lCOqmqdNS+LLDqpnOk6OXxgh/gA8H9oey8G1FQETFxrZfN1RQAsWed5pNBRyQluD8/MFbzJO3la0LvrqlJ1r98dt2WgeCp+fezcw0FX+y8upVKIhr5+HS3Dk0hS7Sz5iWnfIQ2Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706091681; c=relaxed/simple;
	bh=ewX7gY72o0cl/yYtspnOPfn5OfSuWve6SbfDlOaK0u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNihxwywP4NerIEnvSKZfo633OwTwRvg3yy+q8D5ZUhzLzFMEnFFmAjhTXXsockxzpIU1TGq/WD89bIqC5zzbv8dsqTRnFDTbJMRn5UpnIWuqgyIqxz/tMySiRK8E28GeUPrvaNBYFeR1UrnHVbAzbEbnAkg98swlipDRzrvXgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hCMnp+bB; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hCMnp+bB"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc371b04559so1730166276.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jan 2024 02:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706091678; x=1706696478; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oahrr0zPn7dyTHABN+YgjB62XpZ+3yBv/LwJfePBLo0=;
        b=hCMnp+bBiLITDg/sLLkPFHu+Thcyva66Ve2kaglOP9lRu2AoY5ZVF/E1iCtcP4P41k
         nyccSxaoxN3Ym3YL5xPCvicX3b6E2We1BoCRsBxazoTTj0newp95SNpgBZwzkqTq/rK9
         5zzoPlYy7Z5sOkSquetM/YhdREcGum/clcYOWkV8/f1pQ7uszClp+o2yqpnPGqQko5Cp
         2WqjyBoFLAhihKusRdWHe7diY0DIK4W1TFWWQ9GU2h1jqHWW3rwmbi/QrU49UoyZ15xe
         nJ53Q1lClK4Te5HJi8C9BcPwrU8Ao/sbF6GFaVnSIr/OUsfDg6W1IcN1v0BLTb21nhHq
         UNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706091678; x=1706696478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oahrr0zPn7dyTHABN+YgjB62XpZ+3yBv/LwJfePBLo0=;
        b=IbK/CZu1MhQ5byhO24o6VWfzoPoHrFNGT8jl0BMzFv9QFVeWhDSznEO0Pc6AQ61mwK
         TbffxoXJwrFYNUZJusWAAgtxS+WLVr8aEcj2238gMmMQjofzMCfwxgbd3W2laHDP9RJe
         ffgznTG0ZSsB/UH1NiKWLJwbqKe0ivQtAEl57pY7ZLiHdsoYGEOUGIZMbny67Hd18Din
         6kzLI94RQRIc/ejiFCuy/iserfUxqr55+fJqx9E08jWgefomHg/uzk66k6tRKwCyp4IM
         GkkAXkd+gux7GzSU8YZ8OiKHHa11X9DPmk39/K4dAUA40t6IqS38Hm1RhzFYZ7/X4p3a
         Kw8g==
X-Gm-Message-State: AOJu0YzLuCH3lacqGl0ScWoaOFv/nT+gWiMb21AhzvcRMaO9xyBX33UB
	IIT27oYzj4Z7fwaLlvCnqHm3oP9txjVjqRJcGkWcrAooL+pLhDPAJRndLm6DPcDNt4CQ+78eRNk
	At44etIbO27JARoBY0/ln+4SFwtFqi/zRm7CRaw==
X-Google-Smtp-Source: AGHT+IGVtGg/WkPzc49U9WuM15rlSuAsDRUaw6mcw+yY8QDg2i3KDIhJyIoiFrhlnelKM6n+BFEPpnW1/A4dbXsMEAc=
X-Received: by 2002:a25:c402:0:b0:dbf:6240:d8a8 with SMTP id
 u2-20020a25c402000000b00dbf6240d8a8mr457643ybf.17.1706091677756; Wed, 24 Jan
 2024 02:21:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122225710.1952066-1-peter.griffin@linaro.org>
 <20240122225710.1952066-3-peter.griffin@linaro.org> <dd8402e7-f8cc-4ddd-a748-e176b6b534a9@app.fastmail.com>
In-Reply-To: <dd8402e7-f8cc-4ddd-a748-e176b6b534a9@app.fastmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 24 Jan 2024 10:21:05 +0000
Message-ID: <CADrjBPpchS0NdqS-mRmmatOksGHc4KdRniJXGDPTS1z73eU9kA@mail.gmail.com>
Subject: Re: [PATCH 2/9] soc: samsung: exynos-pmu: Add exynos_pmu_update/read/write
 APIs and SoC quirks
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, jaewon02.kim@samsung.com, 
	chanho61.park@samsung.com, Sam Protsenko <semen.protsenko@linaro.org>, 
	kernel-team@android.com, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	saravanak@google.com, William McVicker <willmcvicker@google.com>, linux-fsd@tesla.com, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Tue, 23 Jan 2024 at 08:11, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Jan 22, 2024, at 23:57, Peter Griffin wrote:
>
> > --- a/include/linux/soc/samsung/exynos-pmu.h
> > +++ b/include/linux/soc/samsung/exynos-pmu.h
> > @@ -21,11 +21,39 @@ enum sys_powerdown {
> >  extern void exynos_sys_powerdown_conf(enum sys_powerdown mode);
> >  #ifdef CONFIG_EXYNOS_PMU
> >  extern struct regmap *exynos_get_pmu_regmap(void);
> > +extern int exynos_pmu_update_bits(unsigned int offset, unsigned int
> > mask,
> > +                               unsigned int val);
> > +extern int exynos_pmu_update(unsigned int offset, unsigned int mask,
> > +                          unsigned int val);
> > +extern int exynos_pmu_write(unsigned int offset, unsigned int val);
> > +extern int exynos_pmu_read(unsigned int offset, unsigned int *val);
> >  #else
> >  static inline struct regmap *exynos_get_pmu_regmap(void)
> >  {
> >       return ERR_PTR(-ENODEV);
> >  }
> > +
> > +static inline int exynos_pmu_update_bits(unsigned int offset, unsigned
> > int mask,
> > +                                      unsigned int val);
> > +{
> > +     return ERR_PTR(-ENODEV);
> > +}
> > +
> > +static inline int exynos_pmu_update(unsigned int offset, unsigned int
> > mask,
> > +                                 unsigned int val);
> > +{
> > +     return ERR_PTR(-ENODEV);
> > +}
>
> This won't build since you have the wrong return type.
> I would suggest you just remove the #ifdef check entirely
> and instead require drivers using this to have correct
> dependencies.

Whoops, will fix it in v2. We need those stubs for platforms like
ARCH_S3C64XX that don't have a PMU but use some of the same drivers.

Thanks,

Peter.
