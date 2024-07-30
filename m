Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BE61A0AFB;
	Tue, 30 Jul 2024 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722351778; cv=none; b=UheFhZ4rfkjQKgyiNuuURVAhjLBMWTygatrtZQpwnN35YnQ+vnW2GV9eCHn+Y0xm72fct72pCt5iPRNECGzxHTY7irL2M9sdcRT/rbFcaLgoTquISJnUVrWnP/i5sVZCGPxaK3WZgbaFafpW9RvzQa/yzpGYbYhJRUnLwgyiDOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722351778; c=relaxed/simple;
	bh=UtLhXed1EAl1HP3euKEP6ISMDYxCv0BERFGTZ+R4QSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EkkVB7u4/34c3Db8yL7HbIhJYTfy8YdcMZV+OxO6jWZ1nGL3nlBT326DMYfN1WTNGjtukR+qcd3pIt6odow/l4PRXlPEyzliEQtIhF+T/E7Yvb/HIlcrCTnE972yAy22WR2Bz8OH4mF/lFzvZ2LNcOBeo0axg3Mv7SA4jp+0Tgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZP8nkYAm; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZP8nkYAm"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5d5c8c1006eso2643775eaf.3;
        Tue, 30 Jul 2024 08:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722351776; x=1722956576; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2V6tq3VzX4qW9qvNRr8EzNpeMveAojHv6dOw2jkh0AQ=;
        b=ZP8nkYAmKqsLSEzj7Pyqd/HVvzIEW7r7IZR+LQ+bSwhyL9qkDc0DAiR4p407Ys5m7c
         BP4lXXZPOvl2DFpcoRgtNrFJQTmUmw2xDobs1bCFgB+dGegJlXyeihUFKMpJQegyNY3J
         MHb7Zy5N1M32UICk+ho3yo3z4zSCDa3ZyiI4Jf9zD9p4zvGyFNv5ohoAL4adxVbHxFpr
         9Pds7nzHkJ/K5MqEeaqKZhequBOypUkboVUUkpMGIsT56GH6yPqKi3qB/FxZybgXzzFU
         STCg45n2fDpBmOiY6nhHTHOZu0obLEmXVD6wxj3FeeKDEyHj5N4pRZ36M+ZPPqlYN+RV
         uBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722351776; x=1722956576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2V6tq3VzX4qW9qvNRr8EzNpeMveAojHv6dOw2jkh0AQ=;
        b=RtOh/c7+77r1YkC+Xahth+NC6LcaOr4z8Uy1tSdnyt4j8t/8F9nlkRtvwSYW3u5egG
         qz9sYzY4LEwkgnjwhDu/EVkJPMMG4q09L/4CKrVOq2SBPDF1s1mpu2LoN59bKbZr86MH
         qH0Fm3LheYh41qvFyBE9pU+pi8gmXgPFu2KNXXnM77yI16cG+9vnqjgC5wQaie8VdYEI
         HnjK7u9/9SZ0vXmgSrPuzkiMhAl58jkhX4n6Zx6HtBBKebGAbCfdoruq5T3jIW0ScAMe
         Dg2lTv9pKxdjxE8QRALDgDsjay/B7jemz69N/TFVhSmRXANEvLsNoA7GqakFYAh8MMcr
         Ujog==
X-Forwarded-Encrypted: i=1; AJvYcCUb4H4t5A9+Gol2eKmMVIb4/BjPCL7pcXRWBDltWJtn44B9i1MzFXsTYxgypIkp4GfNL18cU+y2v9Wec8ic8htFvCZtVDX/dQ0Z5Vnwexg0kLPiiHalMGl0ETw8WGhMWvhrvn1xSi/NyfwlGheQkI/ekgG+yAEfxUrJbzBtPQIw75XpiZM+j/s8FBNQ
X-Gm-Message-State: AOJu0YzSjrk9BohqtgbI6GbqGURs6P5DtkhybhIBBPqGeS+9kifS8mpu
	dAgMIVM47y0WrZR9qR0A1eHh5KoiPUpWAv3WT8FLh38I5i5n7LIvkPEKIVXh4fkRFss3qzXW4o3
	B2p5dDHUkvkOpXNEjrEkeDs6yEBmVxLgE
X-Google-Smtp-Source: AGHT+IEduTuEZseWNbGt/HU9F4n3INiuidyT/x7Xo2+M297lJM1Anr/sZic1bIS2Nt26fa0tzVqfu0VqHl5zFZ8BxGQ=
X-Received: by 2002:a05:6820:162b:b0:5c4:7b18:b8eb with SMTP id
 006d021491bc7-5d5d0d94f40mr13133973eaf.2.1722351776057; Tue, 30 Jul 2024
 08:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730091322.5741-1-linux.amoon@gmail.com> <CGME20240730091412eucas1p18feced3968a5f87dc8fe05f78d5c7659@eucas1p1.samsung.com>
 <20240730091322.5741-2-linux.amoon@gmail.com> <09e9cf0b-27fd-46b8-8631-87d798afd19e@samsung.com>
 <CANAwSgT_TOFwP80+H8-CdXDLLu+u2XZMr2dnxcsSDe8S5yeYCw@mail.gmail.com>
 <a41a6143-ef2e-4d86-b102-eaf442985173@kernel.org> <CANAwSgSbSgXwOQLrVrHD7jpDe0=Bq7r2K8p0JjvZJMPpVNq4XQ@mail.gmail.com>
 <d72d7927-079a-4a82-a298-db9ed70a816f@kernel.org>
In-Reply-To: <d72d7927-079a-4a82-a298-db9ed70a816f@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 30 Jul 2024 20:32:39 +0530
Message-ID: <CANAwSgSgK5hmcLg7sChAs7QL0x7wufHpWDZJFyw6tMiiOuDZeg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ARM: dts: samsung: Add cache information to the
 Exynos542x SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 30 Jul 2024 at 18:53, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 30/07/2024 15:20, Anand Moon wrote:
> > Hi Krzysztof,
> >
> > On Tue, 30 Jul 2024 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 30/07/2024 14:06, Anand Moon wrote:
> >>> Hi Marek,
> >>>
> >>> On Tue, 30 Jul 2024 at 17:14, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >>>>
> >>>>
> >>>> On 30.07.2024 11:13, Anand Moon wrote:
> >>>>> As per the Exynos 5422 user manual add missing cache information to
> >>>>> the Exynos542x SoC.
> >>>>>
> >>>>> - Each Cortex-A7 core has 32 KB of instruction cache and
> >>>>>       32 KB of L1 data cache available.
> >>>>> - Each Cortex-A15 core has 32 KB of L1 instruction cache and
> >>>>>       32 KB of L1 data cache available.
> >>>>> - The little (A7) cluster has 512 KB of unified L2 cache available.
> >>>>> - The big (A15) cluster has 2 MB of unified L2 cache available.
> >>>>>
> >>>>> Features:
> >>>>> - Exynos 5422 support cache coherency interconnect (CCI) bus with
> >>>>>    L2 cache snooping capability. This hardware automatic L2 cache
> >>>>>    snooping removes the efforts of synchronizing the contents of the
> >>>>>    two L2 caches in core switching event.
> >>>>>
> >>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>>>
> >>>>
> >>>> The provided values are not correct. Please refer to commit 5f41f9198f29
> >>>> ("ARM: 8864/1: Add workaround for I-Cache line size mismatch between CPU
> >>>> cores"), which adds workaround for different l1 icache line size between
> >>>> big and little CPUs. This workaround gets enabled on all Exynos542x/5800
> >>>> boards.
> >>>>
> >>> Ok, I have just referred to the Exynos 5422 user manual for this patch,
> >>> This patch is just updating the cache size for CPU for big.litle architecture..
> >>>
> >>
> >> Let me get it right. Marek's comment was that you used wrong values.
> >> Marek also provided rationale for this. Now your reply is that you
> >> update cache size? Sorry, I fail how you address Marek's comment.
> >>
> >> Do not repeat what the patch is doing. We all can see it. Instead
> >> respond to the comment with some sort of arguments.
> >>
> >
> > Ok, If I am not wrong  icache_size is hard-coded in the above commit.
> >
> > +#ifdef CONFIG_CPU_ICACHE_MISMATCH_WORKAROUND
> > +.globl icache_size
> > +       .data
> > +       .align  2
> > +icache_size:
> > +       .long   64
> > +       .text
> > +#endif
> >
> > In the check_cpu_icache_size function, we read the control reg
> > and recalculate the icache_size.
> > if there mismatch we re-apply the Icache_size,
> >
> > So dts passed values do not apply over here,
>
> So you provide incorrect values in terms of them being ignored? Then do
> not provide at all.
>
I will drop the icache and dcache values and just pass the L2_a7 and
L2_a15, value
Is this ok for you?

Earlier, I have tried to verify this information in /sys and /proc
to verify the changes as ARM does not populate this information.

> Best regards,
> Krzysztof
>
Thanks
-Anand
