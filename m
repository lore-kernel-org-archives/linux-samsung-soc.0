Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61CE1DE4DF
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jan 2025 13:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170883; cv=none; b=QrG+kNEbEq06pk/vNY/hRlr6DCDpKx0a6e1N6Fv7GPAb0jgfWKSrvwOMCfzJxIFHOs9bZr7Ev7BlBkzszcB2QB49qf9Fg6NdkE0+gZlFWOeuyJwGwQ6BVFsYlfKArJetOH0fhgZp1PXFlJ7HqZvlmqFjkabXbFrmy1yHkOeo+70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170883; c=relaxed/simple;
	bh=vnrymAa/mjGJwijHsxfBgXeucmKCT/GD6DSYdMDGmO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3+CFGEz+fWJtAVaMDe0Kt3zcmvrOIDD8paCbxcg0bivtsBcQvQRhNmQUHpWoEdC5xtCjEvctQnPHGVa31bMejmUkZnaEzQ9fqotLTJFgIEUvzIxoVyf2XCqioIhw3y705cscuuBUV6VKocZAcJfB37Cp1Y9GWhk3Bc8JUvTZSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bJKTDZqG; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bJKTDZqG"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3eb7ca55c3bso6971670b6e.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2025 05:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736170881; x=1736775681; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vnrymAa/mjGJwijHsxfBgXeucmKCT/GD6DSYdMDGmO4=;
        b=bJKTDZqGbUKg0C+CARcwypPIjZqUhpbf4gkvJ5ZLRh2qyHSuk8/7cRFv0nR0zXoWDn
         iqghSrPvCGsK8zg7yL4hKEM1jgtUh2wVtOyPHGLJLW/cCfIkd+NaZ910O70i/Js+sc64
         7TVyHPIkq5pJljaIzuLG20Di3V2HU2nL57iuuoc6oOA3w67y9lcCbKhEG3ZVXSrN2FVR
         coIZcgAt0ucjdA4VM0xHjhUwYX9IuFXmIzKQzhGEcnUdHm/tzEH2nTZZ++281j+esJGB
         MIEOMbJ6EjBtLdXH6nku2QAYxIBIqs+3r4BPo3GjFBaUfiN/lptdIC0MksH/wXoA/Irq
         s6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170881; x=1736775681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnrymAa/mjGJwijHsxfBgXeucmKCT/GD6DSYdMDGmO4=;
        b=SREjjd6l0rLTzQE/lbY5ALnSO4DrHn0iKvsh8P2JI1r2BMY7HdfVXWC7XwchiVY8oM
         7spM88A+x54rBsvfpr8J4+xiRyKOaYKorFIjC8nyXxvHgi0LB3zNKNaITORcG/cclhqR
         d6vFRYKultOQ2k35lq9/mrlZ7cZ5f54THoZQAOPcGIJFFbFW0KXtAEjNlENjg36oPScs
         uiEEQHkEbVW5rzD+/SOGpFIAXqlbF26skZ4CUlc7dTMFoAQ0IQ9cbGdNk8CU5JP7YZn8
         799SnvfctoDgG9QgdhRJ/5QJOYhtKkPW6I5CV9hY/DPGq52LKKX3E6XdnDI2tNDoc1/c
         fzng==
X-Forwarded-Encrypted: i=1; AJvYcCUqLj90SAoWUYD8em4fG0Nl1hTNdOqHeGdXkDc67g3lBV8T89+sCdCU3C081ZUybQnC+nCIvxEsXD52wPOcTf4CXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/aUgL0s9zJTkv2kcY5MP7iAOOHbcEYSjg27i4Fmi0u9jUvyxC
	yUCKc0XalKmFlVQH06Z9en0FcuZ/ChDCMZ7pkuVYNBEcHjbroksiogkgt2WiKF30Z/DPwgElIH0
	CAaUKLWAUF8XphV+TUuN+r8Ddw65KDeda4wNoGg==
X-Gm-Gg: ASbGncuKmlfaVR1m7WULhT9GuuzZYPc7EMbC+g1QcRilRVzO1Rqvj+sA2D2qhNY+bLZ
	KhKOdpN/8LDDAr9Z6gvMpScHwubVt7477OYx6FCg=
X-Google-Smtp-Source: AGHT+IGHKiwrocjYAkZ/iOzeatUlUn2r26VhWPamSSinhyvoES0t4wnDgtP29xdNAxPt8Q+yAhE3L15ITeBiE/jrEBs=
X-Received: by 2002:a05:6808:3012:b0:3eb:5f1a:d083 with SMTP id
 5614622812f47-3ed88fe34f0mr33261669b6e.20.1736170880716; Mon, 06 Jan 2025
 05:41:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
 <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-2-c72978f63713@linaro.org>
 <1408dcd1-9a46-4cb9-8443-5aa51d61ed56@kernel.org> <CADrjBPre_zjh+i=_YKYiptiMWT74eWC6LDCveA=dJaQQVwkS0g@mail.gmail.com>
 <ce9408aa-96a4-498d-8603-01534d9632a2@kernel.org>
In-Reply-To: <ce9408aa-96a4-498d-8603-01534d9632a2@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 6 Jan 2025 13:41:09 +0000
Message-ID: <CADrjBPoLhc9Fy1FYr4w33n7bJH0XkddAyQL8zgHhj+7ONngu5Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: mfd: syscon: allow two reg regions for gs101-pmu
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your feedback!

On Fri, 3 Jan 2025 at 17:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 30/12/2024 10:10, Peter Griffin wrote:
> >
> >>
> >> Maybe you have here two devices, maybe only one. If it is only one, then
> >> it is not a syscon anymore, IMO.
> >
> > I was going to suggest modelling PMU_INTR_GEN as its own sycon node,
> > and then either: -
> >
> > 1) Updating exynos-pmu driver to additionally take a phandle to
> > pmu-intr-gen syscon, and register the hotplug callbacks.
> >
> > or
> >
> > 2) Create a new driver named something like exynos-pm or exynos-cpupm
> > which obtains the PMU regmap and also a phandle to PMU_INTR_GEN
> > syscon, and register the call backs.
> >
> > Is there any preference from your side over approach 1 or 2, or maybe
> > something else entirely?
>
> No preference, choose whatever results in simpler or more readable code.
>
> Option 1 assumes that exynos-pmu on GS101 will drop the "syscon"
> compatible, although it still might expose syscon through drivers. Just
> the standard binding syscon does not feel fit here.

I agree we should drop syscon compatible for gs101 as it requires a
"special" regmap. However other Exynos based SoCs will likely want to
re-use this pmu_intr_gen CPU pm code and they will likely have syscon
compatible in their exynos-pmu node (as protecting PMU registers from
Linux AFAIK was a Google hardening measure).

So just to clarify, dropping syscon compatible on option 1 is because
it's gs101 "special" regmap, or because exynos-pmu node now references
additional pmu_intr_gen syscon?

>
> I don't have the hardware/user manual, so I don't know what PMU_INTR_GEN
> really is.

There isn't much description in the manual, but AIUI pmu_intr_gen is
just a way for the OS to trigger an interrupt so that the APM programs
the PMU registers instead of the OS programming PMU registers
directly. It looks like the system could also be configured to not use
APM (it would need different firmware), in which case the OS would
just program PMU registers directly.

I only see these GRP(x)_INTR_BID_ENABLE / GRP(x)_INTR_BID_CLEAR
registers mentioned in downstream code in the context of
flexpmu_cal_system_gs101.h (which is basically lists of registers to
program for different power/sleep modes - which looks like what
exynos-pmu is currently doing for older chipsets) and
flexpmu_cal_cpu_gs101.h (which is used for cpu on/off) related things.

So even if I split the CPU pm parts into a separate driver, it looks
like programming pmu-intr-gen regs would still be required to
enter/exit sleep modes.

With that in mind I think it seems more natural to grow the exynos-pmu
node & driver.

> GS downstream code has something like PMUCAL, which looks
> like separate device.

PMUCAL is just the PMU registers with a whole bunch of layering. I
believe CAL just stands for Cpu Abstraction Layer and seems to be used
in downstream Samsung driver code when they have a bunch of "generic"
driver code and then what appears to be a lot of automatically
generated header files for a particular SoC for reading/writing all
the SFRs.

The CAL suffix is used for PMU and also for clocks (CMU). Most of the
PMUCAL code is just accessing PMU and pmu-intr-gen registers (if APM
is configured). There are some places like flexpmu_cal_system_gs101.h
where it seems to be used as a convenient place to read/write
registers all over the SoC memory map (CMU, SYSREG* etc). So unpicking
that into all the various subsystems will be interesting.

Thanks,

Peter
