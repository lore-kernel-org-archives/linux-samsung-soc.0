Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0177F77F20
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 14:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707315120; cv=none; b=iAd6aRfIxp9yOP22Z4xZExz11wtWCGBlfudHJ8RYvTEjiUDgjVYKRYEXgQU4TBer2gNF1cdEwidy7SnMcVLNT7GCba8yC9cw1c1zG9KGilg1R2mqFomHK03QQ0jya5YJmbpXedWxrk+9DfrVedQJC/kj6OqZ2GgH85xvVnSqKQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707315120; c=relaxed/simple;
	bh=nzkjMj0bCnuVMEZVy8mkyoMHQ9P0e3IYhsa7ydwwFko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jIIOpkiijH5ecOZ5gHmgFoecY4cQmECPvpzImFxcmOi69rwcSpuLCj5T2wrCbNsLDmiE8aLKDgXs5EmPmIJlOO39YjypLArXBije0y0yeDyx3v+L2HNKM1VECFvedJ+3XwPWY2g4a+ukzPeLR6WR392hQy80kB4LiFiaFIB7SYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uht1RhXR; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uht1RhXR"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6869233d472so2606616d6.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 06:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707315117; x=1707919917; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tCe/2EWP6QyZNDgQYAyU30S8OaPYPa61/dD76E0Ooo0=;
        b=Uht1RhXRiwsbtVHXbQMpR4P4PFoqqKKg6J5ZR+Jnm0fDHA7qYGHcPLtSJglXG2Otyo
         mP6GIQ/lkSbmbw1FdgKoNoQBoB+jHfTSab1abzrNGTmJJXGFKB4b6qlxgcqlgFPL9DFV
         U3AUU1XfpPGhmNhl2ONaMLTblYObES5YEvpjooIPssDAOpku4yteaPqsQZtR7f3MmJCP
         +o0nBAsQgkRQGZS6FqRi6wGHUmcamb3okkFmE51lgoTDlSuUsf4MuxBoQqrbmsfbjtHk
         qwPiuA6P4zqWkCNzbRKryIl6KajasxEDeXX6vI9xIgHubfBlYHXFsiNT5YGi5PmK19FT
         o4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707315117; x=1707919917;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCe/2EWP6QyZNDgQYAyU30S8OaPYPa61/dD76E0Ooo0=;
        b=fgzhmIHfRx28bNRCjGFdTYbdzhurg7rcgBoadcs7JXFLhf7ASVOrIMgPb98UdOSsGI
         UKsyX4VsfI5y57bHwkdoFCC1AIqeAMiJfVU9O1Cwc4JSICFJ96LVrR+HF2YDwCgdVZVx
         EWAWyJDkZQVCCmYsx0yust7BYbhEXWMwtV4pEksmWNmYvi7Vq6177MhtdyUSnHNj6GuY
         CEjRrOGFjnlJ4A0xpSD0N62YX7/bbiSy3EPFdf+HY0k7OyIQT8PygrM7RAqB1B7n7yk7
         bvcKv5ZdWSZuXAH5uwUV71Fw/TBqocP33qeWlHTFpD+MVkcn+Lujs/An5JcDtnW9OCvh
         J8sA==
X-Forwarded-Encrypted: i=1; AJvYcCWsoZ2h4ZOft3AcIAQk66AtHVpDOgmHc1Gomoo1Vqez5qnlfHe1hn/yJxyf7hdOM9V8nPRbpaJzEUCr3ag5DkMdC1GcuqM38wFlb4mCIn9tNlo=
X-Gm-Message-State: AOJu0YyrAAvcoO4l3WxHt7NKCpD2slTvVCPi8zZvCrS8DvuXYsgHt40x
	1urdhvf2fgP3rU1GSZm97/IXJ4jFpvPIZAMqqhRXw4LqIeiz8nhNXcgoWjGPJc/raCAiqtOim1C
	VxtuiMCBuIGkyBZXM0yghA4f3tMrZjdmBr9LeSg==
X-Google-Smtp-Source: AGHT+IFONdbekTpwnL2WS7ErPLZEcsqo1cwSW7hXmMwSQYIVBF2tuoVF58D1gjgEfjuqJwVzvhsa6qRhElUBpc3dfMc=
X-Received: by 2002:ad4:5943:0:b0:68c:9d2d:6ae9 with SMTP id
 eo3-20020ad45943000000b0068c9d2d6ae9mr6339727qvb.8.1707315116782; Wed, 07 Feb
 2024 06:11:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201172224.574238-1-alexey.klimov@linaro.org>
 <20240201172224.574238-2-alexey.klimov@linaro.org> <CADrjBPpqHx1uoVZCYDX51kW+JdOr_-+4oryOjXcUMFkmLGTBLw@mail.gmail.com>
 <b199ba24-403b-44fa-b807-9b98f9e98913@linaro.org>
In-Reply-To: <b199ba24-403b-44fa-b807-9b98f9e98913@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 7 Feb 2024 14:11:45 +0000
Message-ID: <CADrjBPpNukp+YQ0AmsZAE1f=MEk_auPPZit=tV8gk4szQ8MqRg@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: exynos: gs101: add chipid node
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, alim.akhtar@samsung.com, 
	linux-samsung-soc@vger.kernel.org, semen.protsenko@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, klimov.linux@gmail.com, kernel-team@android.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your feedback.

On Tue, 6 Feb 2024 at 10:10, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/02/2024 15:36, Peter Griffin wrote:
> > Hi Alexey & Krysztof,
> >
> > On Thu, 1 Feb 2024 at 17:22, Alexey Klimov <alexey.klimov@linaro.org> wrote:
> >>
> >> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >> ---
> >>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> >> index d838e3a7af6e..156fec2575bc 100644
> >> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> >> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> >> @@ -283,6 +283,11 @@ soc: soc@0 {
> >>                 #size-cells = <1>;
> >>                 ranges = <0x0 0x0 0x0 0x40000000>;
> >>
> >> +               chipid@10000000 {
> >> +                       compatible = "google,gs101-chipid";
> >> +                       reg = <0x10000000 0xd000>;
> >> +               };
> >> +
> >
> > I was wondering about the 0xd000 size here, as most upstream platforms
> > use a chipid size of 0x100 or 0x24. I see the downstream gs101 kernel
> > also uses 0xd000. Looking a bit more, that is because gs-chipid.c also
> > has support for dumping other areas of the OTP SFR bank like asv table
> > (offset 0x9000) hpm_asv (offset 0xa000) and hw_tune (0xc000).
> >
> > I checked Exynos850 and that also has ASV tables at those same offsets
> > above, but it currently uses a chipid size of 0x100 upstream.
> > Exynos-asv.c driver is part of exynos-chipid.c upstream so it seems
> > reasonable to have the increased size including those SFR registers.
> > Currently exynos-asv.c driver only supports Exynos5422 upstream.
> >
> > @Krzysztof - From a process PoV what is the best/correct thing to do
> > here? Have the increased size in DT that includes ASV parts of the OTP
> > bank from the get-go?
>
> ChipID so far had only size of 0x30 or something like that. What you
> refer to does not look like old ChipID but full blown OTP, which also
> includes ChipID.

OK so in some previous Exynos SoCs chipid had its own separate memory
mapped SFRs as well as being present in the OTP area?

>  Although I am not entirely sure about that, either.
> Depends whether they share clocks, for example.

This address is the OTP area, and I can't see chipid regs mentioned
anywhere else in the memory map other than OTP. Unfortunately there
are lots of separate docs for different IP blocks, so it isn't just a
case of searching a giant SoC TRM pdf.

e850 though looks to be the same (the address defined in DT is the otp
area), that is one large PDF and the chipid regs aren't mentioned
anywhere else, Given the chipid reg offset is the same (0x10000000)
for exynosautov9.dtsi, exynosautov920.dtsi, exynos850.dtsi, exynos7885
and exynos5433 I suspect this could be the same for all those SoCs as
well.

>
> I don't have any GS101 information so I don't know what's there. It
> seems you ask me to give you decision based on guessing... If you have
> one block, so if there is OTP, which contains ChipID, then define OTP.

I believe there is one block that contains ChipID, therefore based on
the above info we should define full OTP size?

> Not ChipID+OTP.
>
> I think Exynos850 DTSI is wrong here. That's OTP block, not ChipID.

Yes agreed, and quite possibly the other Exynos SoCs as well.

Thanks,

Peter.
