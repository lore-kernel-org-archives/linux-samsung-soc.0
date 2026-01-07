Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99977310635
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Jan 2026 09:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767778072; cv=none; b=nPLF48nXnmLHOXHJgMDh5LrSaJm+W9sPoXxEbuKQgO6fHOxSzelzRnluACFEysmNozlSuMV7/9fcx1KREQ3TbUEqn4YJjQFJfXXhELkfG0QpNfNd04LK4prq2oFHAijWhXLmZywQIS04Iw6ez/rEZBBcRxCmn+DW5qzn76H2Dtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767778072; c=relaxed/simple;
	bh=s9kdm9Cpsfog1txHC6+3qJtrUIxz3gqYU88O+Wpev3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVx1Y7+wKu472S1Uxs+4KzXkhYxJa9b37nYbGT6IH35zo++BpVwyAxIaTRpEBJsyCOR7qIBIUwuftLciwSe8e+7QuHLCKLcClOu86DQEG0JHQUUQ8LXySZod9vDjvOdUPawQ1/FLN5nua6Zy9nM6f7/3L1dFdbVjiMos8PZUBss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PkNdO39Z; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PkNdO39Z"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64d02c01865so2833502a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Jan 2026 01:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767778069; x=1768382869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUQ2FZFamqfueQvHyQVTRqAwPzH7oh4++3k/htlzBQE=;
        b=PkNdO39ZgazAU10Y2baWsh0/NQplwsXowmqRcpufCoGrCxU+Uznx1o6Vmr1RH630Su
         XMjS5CQn9uAWu16ij7MZ6QLVMcwdANAxLoDYZH8/GGTlBdP2SltFIZU4A2DyL0kNIAnR
         c4kI07MEW8mEpYW8q3UIYEmRdqwi+ns9MjBzKdO6BzKwtd0+ausYJMRH1On3UolCKngu
         PiMG+6r4/yy9a+PACZioUEOQvSOZwyzS02hWmJ8HebMifWCJK9oOKPwCpoxjx4dmsjxY
         0A1GSm8RN673qsE/JErFYmOX6ByMlEHt3xy8ASSRRPre90L7MEFw+rZSgbuJ3EU5ethP
         sk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767778069; x=1768382869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rUQ2FZFamqfueQvHyQVTRqAwPzH7oh4++3k/htlzBQE=;
        b=w0B3KDU8kg9rSGDvk6ahsXcGy38Zkps9nhMTUwS86iX74rCR1GKSOoQLnZoDLbR6fW
         uaZo9vrdXax9sVHzQa8/XsEpsCjHhodI51mC76f3LS3kkZGOjuWg+e0Lado+f2ypdO92
         PnRy6tawhStpQEgdosP9jZI3r5DGlaDdgQDx+wbxWmddvMszni8VxbBlmrynkFwVPK1z
         wpN3FmQt6D5PyYhVE8vRArJ4axFwxB8IG/yhDH9G8nAPz3OCzsybQEgiL0RLGWExZAi1
         VzvxqH/zT7TUKK5y41gaIUQymsb3F0nAVNLxbiFGgcAyixIGrPnz9rwZXmC3tN7WvoBA
         b2yA==
X-Forwarded-Encrypted: i=1; AJvYcCWMT7XuxKvcRcXoX7oIPJzix6ejRsaYlS+q9Wl/8rHGrALc32NyV54PbOIGx0gFBW3ApbuaY188WaFZIKAZXVUEcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/EBoaYI8Vdk5WwQyfvmuEUs6i2Ayz3by7Dkc7ppRkrW9e28ic
	uYvpZ0LrDOpXdUp6X1Mc6oS+ZWted7oC/Dt9wsd68zmb7MHj/lYlEdOTUqMaUBElBWnrvbTGeSu
	IeQRj/xVTpjathaQQ//A+jhnnLuRaJLCmVSR9+a2lwQ==
X-Gm-Gg: AY/fxX55pRBP3wOrRcJXZ4+QkOPJBXuzddPiFM6iH9DMF2ZnAhdDFcVlDN70O+lmN9U
	XKcZnQuNy3FYAsVCKMebBy91K//JDo4cnwaRZhgISkW4g2cHivGZurrVh9agADSZ9DN+QsQoKd6
	XEniDgxv5qC/bXMRMny9HGgL62OaYUI0C2Vx2nL53hUPZy8Rs3q9i51l/LVbsPG1HeRXUrA5C01
	SXbQ7LghGZIa742g0krH7odjweJHjUZNcDNwwZduaxlJNUcc/cI6sItTV5Y5zyHs799n6aG
X-Google-Smtp-Source: AGHT+IHiv/XFqOWBUi/CNmLl6EwV4ivEMM/garbS3U0jXJNjchmOMi1m/XfEc/owU/7EasgEeZaY3c7VeTK0LzQnHO8=
X-Received: by 2002:a05:6402:4309:b0:64d:65d:2315 with SMTP id
 4fb4d7f45d1cf-65097e8e3b3mr1716117a12.30.1767778068941; Wed, 07 Jan 2026
 01:27:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
 <20251222-automatic-clocks-v7-3-fec86fa89874@linaro.org> <39019203631fdd183fb5ddaa7fada5da5f2a31ad.camel@linaro.org>
In-Reply-To: <39019203631fdd183fb5ddaa7fada5da5f2a31ad.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 7 Jan 2026 09:27:37 +0000
X-Gm-Features: AQt7F2q63jqr_CpXwSvIXdsTqXahUYQlfSvLBPEss-eRzMgkwuCaYjXxjzncKeY
Message-ID: <CADrjBPpZY9QfX7YEfM2tkAkt5qGpzYuJ0JkLMK0v4jujO3mRhQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] clk: samsung: Implement automatic clock gating
 mode for CMUs
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Wed, 7 Jan 2026 at 07:22, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Hi,
>
> On Mon, 2025-12-22 at 10:22 +0000, Peter Griffin wrote:
> > Update exynos_arm64_init_clocks() so that it enables the automatic cloc=
k
> > mode bits in the CMU option register if the auto_clock_gate flag and
> > option_offset fields are set for the CMU. To ensure compatibility with
> > older DTs (that specified an incorrect CMU reg size), detect this and
> > fallback to manual clock gate mode as the auto clock mode feature depen=
ds
> > on registers in this area.
> >
> > The CMU option register bits are global and effect every clock componen=
t in
> > the CMU, as such clearing the GATE_ENABLE_HWACG bit and setting GATE_MA=
NUAL
> > bit on every gate register is only required if auto_clock_gate is false=
.
> >
> > Additionally if auto_clock_gate is enabled the dynamic root clock gatin=
g
> > and memclk registers will be configured in the corresponding CMUs sysre=
g
> > bank. These registers are exposed via syscon, so the register
> > samsung_clk_save/restore paths are updated to also take a regmap.
>
> The implementation described in this paragraph this causes pm-runtime to
> stop working for the CMU if auto clock gating is enabled.
>
> See below.
>
> > [...]
> > diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> > index c149ca6c221725195faeb76b0d73374c3b48261b..06ea5deef4ee2ffb87dcd14=
102561886ea80b7bc 100644
> > --- a/drivers/clk/samsung/clk.c
> > +++ b/drivers/clk/samsung/clk.c
> > [...]
> > @@ -357,6 +489,37 @@ void __init samsung_cmu_register_clocks(struct sam=
sung_clk_provider *ctx,
> >               samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_=
clks);
> >  }
> >
> > +/* Each bit enable/disables DRCG of a bus component */
> > +#define DRCG_EN_MSK  GENMASK(31, 0)
> > +#define MEMCLK_EN    BIT(0)
> > +
> > +/* Enable Dynamic Root Clock Gating (DRCG) of bus components */
> > +void samsung_en_dyn_root_clk_gating(struct device_node *np,
> > +                                 struct samsung_clk_provider *ctx,
> > +                                 const struct samsung_cmu_info *cmu)
> > +{
> > +     if (!ctx->auto_clock_gate)
> > +             return;
> > +
> > +     ctx->sysreg =3D syscon_regmap_lookup_by_phandle(np, "samsung,sysr=
eg");
>
> With this, the CMU driver (e.g. cmu_hsi0) now gets a reference to the res=
pective
> sysreg (sysreg_hsi0), which in turn creates a regmap with a clock handle
> (CLK_GOUT_HSI0_SYSREG_HSI0_PCLK), and the clock is 'prepared'. Hence the =
CMU
> providing this clock (cmu_hsi0) is not idle anymore, and runtime PM for t=
his
> CMU can't kick in anymore
>
> I see two straight forward options to fix this:
>
> 1) The easiest fix is to just drop the clock from the sysreg DT node. The=
 sysreg
> clock shouldn't matter now, as the whole CMU is in auto mode now anyway.
>
> 2) change above code to use device_node_to_regmap() which ignores resourc=
es (the
> sysreg clock in the example case), and manage the clock manually during s=
ave and
> restore in samsung_clk_save() and samsung_clk_restore()

I think option 2 is likely better, as it isn't an ABI break. It would
need a comment explaining why we use that API when a clock resource is
defined in DT for the syscon though (we don't want the clock managed
as it affects runtime PM). Maybe Krzysztof has other thoughts though.

runtime pm isn't currently enabled for gs101, so auto clock support
hasn't regressed anything. But AIUI Andre was close to
posting/enabling it, and this issue would block that.

> Any better ideas?

None I can think of currently.

Thanks,

Peter.
