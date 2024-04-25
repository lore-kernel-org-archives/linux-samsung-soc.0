Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8F885937
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 10:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714039380; cv=none; b=lFmj2AfFTEa98b1BDRK4UUgfBPIroXW9tzot8GeZY7sJkX4MJHL9aE1QIfFTUIQYzcx9djf8kWSobjgn8viElgyF6jhh+7p2pHglD7UIwoIdAz38jmict5VXcUFndslrpJlA1T2Mjjcjj8YcxJkriOS12l6T9TWlEUMvX0V+zew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714039380; c=relaxed/simple;
	bh=RXK4O8a02inRrvqwz+7mplvX4EsJM2wFihBc07BftBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cIa6rx/BAnrxXLET0b8I0lOXe8My5+QgrC2RZZkRz/myAHOJpnVBSL7SrDj0iHBV4nzte37WKZXHe2ZGCIQ1GTfJ6DR7gPz+YWzAy7pkhgrNG17bhPv8EE2iLUK0OUpO9EkVNVfNthvWnEnXzQr8U9/It/9gzq8x5H5ZUBj45Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=feb3JpOc; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="feb3JpOc"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5aa27dba8a1so493005eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 03:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714039376; x=1714644176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gnBt8gXInHVRlCUsFfbFbS4v9SLD3jExUtd9bRhp9Y=;
        b=feb3JpOcSAtvw2p5KoRkfpc9KXfOfI2LY+udP+t2Moy1xIeYt3z3I/k+0pmwfJYcmg
         +DtkT3yhzqihVOXvPNG23kOZnk6MhARaF342GkvBbzQ+OQAjj4g1Lu34HtgPYAtqQw74
         O3Xz7kbyjxowhprXM93MSVlS5CVavj2xqJMvSZwwaJG1A6Qxke5LF6PjJAAkA+EgCXvw
         34jnfA+HEMopkIIDJtduJB31FnFBh4yVkfTK0cp0Bl5gAdogwYjpGmdV+DPCKgbP1tH7
         EiLgUumITH/MdINpBYUKQ+51QyLam7wkbhuf/bYnTFjnX0Yo7QkU10nLQOuVVi0BTcjz
         eXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714039376; x=1714644176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/gnBt8gXInHVRlCUsFfbFbS4v9SLD3jExUtd9bRhp9Y=;
        b=NxvESdnX5FyDdyTdnlaJdeMQbE7oA+ANMjOjYQxqrjGASflmfGYXy8GG3fL+8EJUd+
         FmMUsIAwu4B6R9dqjnlGFmYISJ1uJzgs7Z8eLj/l+NbPXePlcK+YFgbn8LqXFSSTqBWB
         wTezG+VUfDgRBHlIjt2ABkMHtyQi+ayhTGIhKNH0+00fJZ8KpHVLSZqzltXeReJ+jBkK
         /OxEUu0oRM0RM+802q5BCs9MEDhdtR8la77wLB3jcgEqfLPne8XTFm4PJ3hj8teuNCoj
         ZvAe20x3WUCsJ9g9qxKkXvlvrzR1F8SdC+GWdd1Z4uNrKQXbNtCt5DEk89pENK5uKPt9
         k1Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXDpkmY7D6zF7MA7BLWTIwcT5TueBdlFcd+cBauyrHyraotcK7n9wb5FdVHNDoMoNast+aYPgz3fPCZGMaKwlFpW5Ec2GnEZdpJypwNIbmPpiE=
X-Gm-Message-State: AOJu0Yye3m7TIEn+K1nSaWcnG2oY6g8k/JzA/Jh1G1jMVyCzgwWcSX40
	haz4ZymPwkcqIgo40imBj9mh/OM9dhvtDpvHdHJGfFEKQ3Q+T0e6+/hqcrGevnjy120qtTvUGSO
	zekPshPdZasHiSBhHLACsyyi3jnLfdXHDJ0Wr9w==
X-Google-Smtp-Source: AGHT+IHTququzUXdRYxmWga6jdeEDyr8tuog6wuuZsVRVAyevBPEtWT5IgftQmigUcf+ViQMnx+u0aSVoD3jLYUNnZ8=
X-Received: by 2002:a4a:5103:0:b0:5a9:cef4:fcea with SMTP id
 s3-20020a4a5103000000b005a9cef4fceamr5787147ooa.1.1714039376342; Thu, 25 Apr
 2024 03:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423-usb-phy-gs101-v1-0-ebdcb3ac174d@linaro.org>
 <20240423-usb-phy-gs101-v1-2-ebdcb3ac174d@linaro.org> <cf7200d3-f60a-446b-b9cc-1f63e3c90740@linaro.org>
In-Reply-To: <cf7200d3-f60a-446b-b9cc-1f63e3c90740@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 25 Apr 2024 11:02:45 +0100
Message-ID: <CADrjBPpQEbxVbDwat1fn=2tYk9r-0up0+SARFZA=qkoeFYz1Mg@mail.gmail.com>
Subject: Re: [PATCH 2/7] phy: exynos5-usbdrd: use exynos_get_pmu_regmap_by_phandle()
 for PMU regs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, lee@kernel.org
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, kernel-team@android.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

+ Arnd & Lee (syscon maintainers)

On Thu, 25 Apr 2024 at 08:47, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 23/04/2024 19:06, Andr=C3=A9 Draszik wrote:
> > Some Exynos based SoCs like Tensor gs101 protect the PMU registers for
> > security hardening reasons so that they are only write accessible in
> > EL3 via an SMC call.
> >
> > The Exynos PMU driver handles this transparently when using
> > exynos_get_pmu_regmap_by_phandle().
> >
> > Switch to using that API to support such SoCs. As this driver now no
> > longer depends on mfd syscon remove that header and Kconfig dependency.
> >
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> >  drivers/phy/samsung/Kconfig              | 1 -
> >  drivers/phy/samsung/phy-exynos5-usbdrd.c | 4 ++--
> >  2 files changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> > index f10afa3d7ff5..bb63fa710803 100644
> > --- a/drivers/phy/samsung/Kconfig
> > +++ b/drivers/phy/samsung/Kconfig
> > @@ -82,7 +82,6 @@ config PHY_EXYNOS5_USBDRD
> >       depends on HAS_IOMEM
> >       depends on USB_DWC3_EXYNOS
> >       select GENERIC_PHY
> > -     select MFD_SYSCON
> >       default y
> >       help
> >         Enable USB DRD PHY support for Exynos 5 SoC series.
> > diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/sam=
sung/phy-exynos5-usbdrd.c
> > index 04171eed5b16..ac208b89f5a6 100644
> > --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > @@ -18,9 +18,9 @@
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/mutex.h>
> > -#include <linux/mfd/syscon.h>
> >  #include <linux/regmap.h>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/soc/samsung/exynos-pmu.h>
> >  #include <linux/soc/samsung/exynos-regs-pmu.h>
>
> This is getting out of hand: shall we expect to convert all the drivers
> from generic syscon to Exynos-specific API?

I think certainly for the various exynos phy (usb, ufs, pcie, mipi)
this change is required. I can do some more checking to see what other
drivers are twiddling PMU bits downstream.

> What if one driver is some
> shared IP, like DWC USB3 controller?
>
> I already commented on Google hwrng driver:

I think you mean syscon-poweroff  but I get your point. The
syscon-reboot / poweroff / reboot-mode drivers are examples of drivers
where we may wish to use them, but today we can't as they are using
syscon_regmap_lookup_by_phandle() API.

> I prefer to keep the syscon
> API and change the syscon driver to expose proper regmap. IOW, use
> generic API syscon_regmap_lookup_by_phandle() and the type of regmap
> returned is defined by the provider (so node pointed by phandle).
>

@Arnd - any more thoughts on Krzysztof idea above ^^

@Krzysztof - I did speak to Arnd about the idea you proposed (or my
understanding of it at least), which was external drivers like
exynos-pmu or altera-sysmgr.c could create the regmap and register it
with syscon so it can be returned by
syscon_regmap_lookup_by_phandle(). Arnd's initial feedback was he
would prefer to keep the complexity out of syscon, and have the client
driver support multiple backends (so syscon-reboot for example would
support using either syscon_regmap_lookup_by_phandle() or
exynos_get_pmu_regmap_by_phandle() to obtain it's regmap). There were
also some concerns about syscon having to probe very early for some
platforms.

Thanks,

Peter.
