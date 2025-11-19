Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3350354ADB
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550337; cv=none; b=KNtxQ3chQrym1DjspFVmUsFP7w3+FuvCHPvdeqMlcIgFHYzX5zYwTvZDilh9qXOztCLK0ItHB1Zt5JarLCYDp+cEF0TYePE2jLPQDRIDpwyKzObPrxHiTFpNq8tWFlq8fgVOBzncEppCSlsR/P6g53vFY9lq3FFtJ+QzeR7uXWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550337; c=relaxed/simple;
	bh=suLMms/cC5PWL/dT/dDRBxYiO9gO4357/Gv7VoKpjN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TTghT9h1pSrH67lf+F5271FQ4NpguvQJkegJzc45ywnf4dWLQQThv6ZvP10Ml2w9JCnvMBk8YyVLbKzPzpzZ29fgV9hJHF631dOggwdASsZL7rtJ3fE2WHoPuaLVbPxo1C/6IRKpLkn40BfkDREcnBuFCMWm5huhx1IecZ8V+Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7c730af8d69so3831315a34.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 03:05:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550335; x=1764155135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01vJ+iTaEhlqFfqqNaTQ+Xj9o5ybGoOTheiB42bAFn0=;
        b=UAuNJmcFfiYmh4mNgdef11whe7K3wOwljxT4q65E0O421MsVYhyMEx/MbwlkGyA4zL
         7570oM4XN1BhjKR62b2hsLsakZuqMDUXOOrD1F6yKgpvfpfiqLkUAnz66Rb/xW1Yxata
         f1eVDFaAoQvEcakDRjxwivrNM2s82eB3dOOT34seM39OayiCOm9mQtcN8NzIFJuELoG/
         /0U7aWN2V1ik74UXVjFH5lREPtH1go0SWQodj34qCGThaZlMTdAr4tSpc4rAFhqyKbzg
         xOo4D9Zwe7DwI9LxOtgPLUCRZQazpDChg94aBDhJO0HzuoqkjU1xeNAC3WjYUeNrN2PB
         fGFw==
X-Forwarded-Encrypted: i=1; AJvYcCXJfkYLSdV4KYhLrTidMqxRKSDnKTpHBk73rfPUp1LL4LPSX6ydggEvlpgPaiojdbqaRUjOvONFtlxN5RYxnh+rNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzskff/PfSuOO3gQlbn8W03z2uXh2bSk7Tg553bZF3nsDM6w1w3
	ywrzrBlZYTB3Cg331aEoRsG+aTG13UedQDEAHbBNqoGaiZ40CHLoMNVnxldwNIWO
X-Gm-Gg: ASbGncuj4NBcuJeX9FtGfJU6eKejNCpqNaEFBqVUAhDQzbv+nB7UXbMuFcz3adyRm4H
	CF8y2iPd3zm+3l17Wg4obS8680uBH51IXgoiVMxRvfwH4WAoz+IZizqVgauBI1GJ7a9PtGbbkKG
	nx796Z3pC3J9e5bxkh/av6feTi7nzwmfdSEIURFYSsbXoykMu+3uUFlhyTKQ1P9CZKEkySrrnYJ
	T10sE46fDkgUqaVCHkyvAUgjZpAA2IFC0ts52M+cZkLvFgpncAbpgY2rz+rvgHBHXjVngyV2SqW
	TjHBwTrGWiMHwaXWY9I0OkmvwMoZ+TDw95NSfSU6B41IYMxp1/2OIlfUeQNWHEVGFInss4TLLtZ
	B/EVPGL4Dhv6/Ojj5IpFTnYTuZ0CJT7ECrGpi2mm3Muco89tPWMEVFQOpf4zVi1q3lLRXiHP9aF
	o/Itvn1dZcbSJmZy30281zVtRcUCZMLz0rEwSMn+PAAw3VuEDQ8RJA
X-Google-Smtp-Source: AGHT+IHS9k3wGDNUJpGw6Ps4Bd7ZCPfVuQoX3AjcvIdbwevxCgqr7mvO6Oj62N2aQjM1fIlC1WOU4A==
X-Received: by 2002:a05:6830:449f:b0:7af:1d61:1055 with SMTP id 46e09a7af769-7c744555e75mr12799584a34.21.1763550334896;
        Wed, 19 Nov 2025 03:05:34 -0800 (PST)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c73a283b6asm7645710a34.5.2025.11.19.03.05.34
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 03:05:34 -0800 (PST)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7c704bf2d9eso2954939a34.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 03:05:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0sZ1Vy7vck2GG20B3jt21nmuzBfWZ7miKp+ESSkTOHRIqq/Q4raGjZYlauEOoLKLfsPVOL3FVEEkF2XpwSfpDaw==@vger.kernel.org
X-Received: by 2002:a05:6122:4582:b0:549:f04a:6eb3 with SMTP id
 71dfb90a1353d-55b1be64f5amr6929551e0c.9.1763549959520; Wed, 19 Nov 2025
 02:59:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk> <1a4d2276-75e1-4aa0-8ff2-c932ce5d6edc@kernel.org>
 <CGME20251119085902eucas1p223cb580bdd4cef2698382835c77210e8@eucas1p2.samsung.com>
 <CAMuHMdXgq=Zv3GQes_d_eyCcB7m--PaEGSQJtUWiRjj-7gBVkw@mail.gmail.com> <765d114d-6a03-4535-a644-5e7581dfbccc@samsung.com>
In-Reply-To: <765d114d-6a03-4535-a644-5e7581dfbccc@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Nov 2025 11:59:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5ixRpE+yPbggBG91+516YD+ARkaCLN-gM8bQLvtqrYg@mail.gmail.com>
X-Gm-Features: AWmQ_bmyj7uEfaaHTRs_Dlhmh8ug_B799_bBc6DeLqXxY0jfIRw0Qy-WNEKxB9g
Message-ID: <CAMuHMdU5ixRpE+yPbggBG91+516YD+ARkaCLN-gM8bQLvtqrYg@mail.gmail.com>
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 19 Nov 2025 at 10:55, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> On 19.11.2025 09:53, Geert Uytterhoeven wrote:
> > On Tue, 18 Nov 2025 at 20:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On 18/11/2025 20:34, Mark Brown wrote:
> >>> On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
> >>>> The Devicetree Specification states:
> >>>>
> >>>>      The root of the interrupt tree is determined when traversal of the
> >>>>      interrupt tree reaches an interrupt controller node without an
> >>>>      interrupts property and thus no explicit interrupt parent.
> >>>>
> >>>> However, of_irq_init() gratuitously assumes that a node without
> >>>> interrupts has an actual interrupt parent if it finds an
> >>>> interrupt-parent property higher up in the device tree.  Hence when such
> >>>> a property is present (e.g. in the root node), the root interrupt
> >>>> controller may not be detected as such, causing a panic:
> >>> I'm seeing a boot regression on the TI x15 platform in -next which
> >>> bisects to this patch in -next, unfortunately even with earlycon (though
> >>> just earlycon, I don't know the platform specific runes) the board just
> >>> dies with no output:
> >>>
> >>>    https://protect2.fireeye.com/v1/url?k=7efe2b91-216202bb-7effa0de-000babe598f7-79b85fd5422be185&q=1&e=a2b4aea0-c947-472b-ae80-9160750f84a2&u=https%3A%2F%2Fvalidation.linaro.org%2Fscheduler%2Fjob%2F4252918%23L409
> >>>
> >>> It does seem like a plausible patch for this sort of issue though, and
> >>> the bisect converges smoothly:
> >> All Samsung platforms fail as well. I was waiting with bisection but
> >> Marek was as usually very fast:
> >>
> >> https://lore.kernel.org/all/20251118115037.1866871-1-m.szyprowski@samsung.com/
> > Yeah, the various ti,omap[45]-wugen-mpu nodes have interrupt-parent
> > properties, but no interrupts{-extended} properties.
> >
> > Does the following (whitespace-damaged) patch, to restore finding an
> > explicit interrupt-parent, fix the issue?
>
> This also fixes Exynos case without any need for the changes in

Thanks for testing!

> arch/arm/mach-exynos/suspend.c. The question is which approach is preferred?

It looks like several other drivers are affected.  So I think it
makes sense to handle the presence of an explicit "interrupt-parent"
in an interrupt-less interrupt controller node in the core, instead
of in each affected driver.

> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -685,6 +685,8 @@ void __init of_irq_init(const struct of_device_id *matches)
> >                  desc->interrupt_parent = of_parse_phandle(np, "interrupts-extended", 0);
> >                  if (!desc->interrupt_parent && of_property_present(np, "interrupts"))
> >                          desc->interrupt_parent = of_irq_find_parent(np);
> > +               if (!desc->interrupt_parent)

Or "else if (!desc->interrupt_parent)", to avoid repeating part of
of_irq_find_parent() when an "interrupts" property is present?

> > +                       desc->interrupt_parent = of_parse_phandle(np, "interrupt-parent", 0);
> >                  if (desc->interrupt_parent == np) {
> >                          of_node_put(desc->interrupt_parent);
> >                          desc->interrupt_parent = NULL;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
