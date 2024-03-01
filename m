Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242E41FCC
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Mar 2024 00:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709253250; cv=none; b=mWQ4QYpbHn+JaEQ3d7BFMP44KVZnhrtd0C7wqQYFT1QefbpEcvatBZxqosyYmWEuH1C1nLxcDqv7xG1Km9KdhRFtM7AZbonYaTuf0fVW6053T3vnU+HB6Zz166ba1ZdxEfBnLJB4f7MS/gqfkH+Jz+GfIedIzlQUkaey96PgECg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709253250; c=relaxed/simple;
	bh=oPPqS797xDYUweWK6+HpZH6RKCECnkHEB/M92xm1Slc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYGXYz3u+PTjfGQS6sVSaUpaf5wLjp7IZWnrMY4w/McvNEGe2ai45AgvmwYoZlu2By5Gjo8u1xlfanme6YS3aOQHmGey+AHgyJnKMtOTNu7kZb9V/q5w9/gt8DxLJnhdmct1Hh57H9qNSPgrd7yHfb68yAqpThI15mpl595BYqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qUuJddeg; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qUuJddeg"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so1712642276.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Feb 2024 16:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709253248; x=1709858048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSdkimAv7FIB+VJJwLXHXIBUn34V60qyMzBCrZfAS3c=;
        b=qUuJddegDqcIzVq2Y0ZOt1COZVM7hZZo6cGfGmUKTNDAf9R2brvi8irGot2qVUzh0D
         rUNn77zIzLxUHF4xis0fgrwlo6me/P1mA1QOy+Kte8STZKjcs/KlLzvS0KgU6W9lh8gC
         t2qyuYJU93/DArK5XRLp+ujJ8zCYwbMS3XNNf9LCU869yPLEnK5dA9pmoBcxPorwfEgk
         pjtxV3HunexUpMlCiTMOfz02/Wwla+ZTEqf7Ti+UgrutUzUJFMtcvzjAEX863TvHLEHQ
         in0ArXLvALg8QQVm4JwKCbK/h6DAQszxlJtg+fkpv5Uy2cJ03TCA68tM+jONEfBQN7cn
         fdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709253248; x=1709858048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSdkimAv7FIB+VJJwLXHXIBUn34V60qyMzBCrZfAS3c=;
        b=sDGBbubiHBjr9DrAyqgom1umqFi/SAgQWCLczn41a4RHE3vsZsbypIoM0N8+e3Vl+j
         xBMGWUEhTGwQ2kD5lSGZstEVFXSrywu5D8RGWAmiP99O0eGB9EcFXb/Ib5B3WvV8YvUV
         IJWB7DMCSiaFVfDQxSKgjpJfnMLDJRqAsofGtYPWQSPsU19S+SckOtH5Ny1MrpOIz4EI
         3IPzQbatFpR2ke9hbp+rEVoaEFp0udK1RGx3ABoK6vXzjEYEzdRQ1ltuutNUirIESAuQ
         s/908SkWv4sJHysvcTg1xz859z4FFLTLe7aEBM+W5pwrovGIgZ+MbvjT67swkXBPjqVD
         N3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWF6ePxZSHaE5SlofAdDtiKIQDGA3xoJBy0ZtmXF47R8rzF4jIYD9B55WwzB7gOuiCd0luXeiiqwS8l7l3fDMvUsGLlmphBgGNoWYpUcDZOabQ=
X-Gm-Message-State: AOJu0YzSeBNhcAiwkhhfgMHyV0KeVlxoDgM0mNxaqqxc5zrJkT5bb+1Z
	JJZlXo94plkWX8/7gM3m+0bS6NVJlQ0UQdU5nVxhzMrtazu40GGP7T2xqm0U3XIAZehYC8XjPFS
	Vyvojn72g26EYVJtQfXwC3IBRqrH3qaczgMkdPQ==
X-Google-Smtp-Source: AGHT+IGO052qMGTy68AezpL00xWMIAmsXAfDl6npoL87lHFYKm8VLeaKxYL2/jBLwapx2RWtJY3sEYVhLmstVrwPzY0=
X-Received: by 2002:a25:c2c1:0:b0:dc3:7041:b81b with SMTP id
 s184-20020a25c2c1000000b00dc37041b81bmr66412ybf.36.1709253248163; Thu, 29 Feb
 2024 16:34:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-14-semen.protsenko@linaro.org> <eb968e2b-495b-44dd-aad9-3cd5eac72bdf@linaro.org>
In-Reply-To: <eb968e2b-495b-44dd-aad9-3cd5eac72bdf@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 29 Feb 2024 18:33:56 -0600
Message-ID: <CAPLW+4=zjqHreRW83Ag_g0zdNYMfU06JWjmJGm1nkT=Th45whg@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] clk: samsung: Implement manual PLL control for
 ARM64 SoCs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 25, 2024 at 10:09=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 24/02/2024 21:20, Sam Protsenko wrote:
> > Some ARM64 Exynos chips are capable to control PLL clocks automatically=
.
> > For those chips, whether the PLL is controlled automatically or manuall=
y
> > is chosen in PLL_CON1 register with next bits:
> >
> >     [28]  ENABLE_AUTOMATIC_CLKGATING
> >     [1]   MANUAL_PLL_CTRL
> >     [0]   AUTO_PLL_CTRL
> >
> > The bl2 bootloader sets 0x10000001 value for some PLL_CON1 registers,
> > which means any attempt to control those PLLs manually (e.g.
> > disabling/enabling those PLLs or changing MUX parent clocks) would lead
> > to PLL lock timeout with error message like this:
> >
> >     Could not lock PLL ...
> >
> > At the moment, all Samsung clock drivers implement manual clock control=
.
> > So in order to make it possible to control PLLs, corresponding PLL_CON1
> > registers should be set to 0x2 first.
> >
> > Some older ARM64 chips don't implement the automatic clock control
> > though. It also might be desirable to configure some PLLs for manual
> > control, while keeping the default configuration for the rest. So it'd
> > convenient to choose this PLL mode for each CMU separately. Introduce
> > .manual_plls field to CMU structure to choose the PLL control mode.
> > Because it'll be initialized with "false" in all existing CMU
> > structures by default, it won't affect any existing clock drivers,
> > allowing for this feature to be enabled gradually when it's needed with
> > no change for the rest of users. In case .manual_plls is set, set
> > PLL_CON1 registers to manual control, akin to what's already done for
> > gate clocks in exynos_arm64_init_clocks(). Of course, PLL_CON1 register=
s
> > should be added to corresponding struct samsung_cmu_info::clk_regs arra=
y
> > to make sure they get initialized.
> >
> > No functional change. This patch adds a feature, but doesn't enable it
> > for any users.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> > Changes in v3:
> >   - none
> >
> > Changes in v2:
> >   - none
> >
> >  drivers/clk/samsung/clk-exynos-arm64.c | 44 +++++++++++++++++---------
> >  drivers/clk/samsung/clk.h              |  4 +++
> >  2 files changed, 33 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsu=
ng/clk-exynos-arm64.c
> > index 6fb7194df7ab..55490209b9a9 100644
> > --- a/drivers/clk/samsung/clk-exynos-arm64.c
> > +++ b/drivers/clk/samsung/clk-exynos-arm64.c
> > @@ -25,6 +25,19 @@
> >  #define GATE_OFF_START               0x2000
> >  #define GATE_OFF_END         0x2fff
> >
> > +/* PLL CON register offsets range */
> > +#define PLL_CON_START                0x100
> > +#define PLL_CON_END          0x600
> > +
> > +/* PLL register bits */
> > +#define PLL_CON1_MANUAL              BIT(1)
> > +
> > +/* Helper macros to check for particular clock regiter by its offset *=
/
> > +#define IS_GATE_REG(o)               ((o) >=3D GATE_OFF_START && (o) <=
=3D GATE_OFF_END)
> > +#define IS_PLL_CONx_REG(o)   ((o) >=3D PLL_CON_START && (o) <=3D PLL_C=
ON_END)
> > +#define IS_PLL_CON1_REG(o)   \
> > +     (IS_PLL_CONx_REG(o) && ((o) & 0xf) =3D=3D 0x4 && !((o) & 0x10))
>
> These should be static functions, because it leads to trickier code. See
> also checkpatch warning.
>

For my taste macros are more compact in this particular case. But I
don't mind, will send out the reworked patches soon.

> Best regards,
> Krzysztof
>
