Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485D61A8414
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2024 12:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733919232; cv=none; b=VwxU4imq9IUitUO+1En36bodtKi2tQAjk+OmH0gQackSO2YooL15as9XuHuD9vcBWaRpeUH/zLjKTdMn5ST+cFlXAYcIW8IYPLQ/k2dOxO7br+dEHlPfyotRLc/EywmvX8XfDYyaW0N3d1Y+hW+yTo//aE7oZso9aB4FfWmF8pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733919232; c=relaxed/simple;
	bh=MJr4gynFaxN1UupeCq5uQNeM5rVyPoWBQWTfG4Xdvf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eDLU+hHYdmQgj0ldSlxH/F5ecwpeo3xR2vtaCFhIQ6TLbt7BtotPY8aBmwiOw+ACiQvCCK607FI/qbsX8zeB854Jmlgq3eZeDs6wH9hiIyAuW4G6FWdYK8WbrHhFFZSFn9+FdRz5Hca2Zq2ogv+IYSE8U7QiGXqNCrIV77vSaGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lcBIahKG; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lcBIahKG"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3eb38f8a178so1702537b6e.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2024 04:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733919230; x=1734524030; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UDZY2QeYHN/iyr/49RZQKSkzZE163jbKdkdUiW04MRw=;
        b=lcBIahKGPxMkzCdd01MgJjYuumDNpmLxuITTMLhpnFofKxCbTOMmrC/CDeJfOn6fO1
         PbIn0oLiBw18l/MvAiRbPRO1VObyTo+FkA/tZejLyqPc3ljwFLKd7gQ8UFgK5U1vaeGA
         2GAxIrvAKwOg7vlCdrx3ajyjAITfSycngBLpOTQ0hNGCZgKrpzLLXrfugZAUhHarXZrg
         5kymp2xIr0Wda0DCCBYbeT6z8aHgxHYEfvPxaLcAoY8iL/aTBboH75wo0KwusaxnzltN
         HKY44Rc/9R04PEZG+3He1/zG2Spg4US+gLZjOCh14h0p/YJZzDnbIbKJquFxSoRDSscq
         stiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733919230; x=1734524030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDZY2QeYHN/iyr/49RZQKSkzZE163jbKdkdUiW04MRw=;
        b=FXR0jAcB2rPyRtmSHmizRpg1qnSD1cjOa5tbtjH18UvAuhryjKhUfMHq8G7bW1O//o
         hMGXuaVIGcywD6H7GtnmiFxS6FKIL1DYRyI/cErxtDHHBvIdIEoFSsPrOJTPQeTAdTuE
         4pz1xxzMJuLtqoKdMkgtf1+YmnUPygCHQXrZeKuJ2fWsxHAqNsXGchlbaG5eYP4UhvQ4
         41QWZ2+IU0sdUGfbdZS7/qSqcarTXkPOjq00iycbU6/CyFQ5zYat1nVti/mtIwmQGyyQ
         zni8MNtDpnU7b3GaEw2CFpTQSz5V1OJgifY/S5Y85ADliS2hJWnhwhmBwY2FLBmCxL9K
         61AQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0d7hGB4VNl+GblGN1MmwomLjtA7tCl1ypQ64EIeNOuSVNiZY3dz6RUhAStOJaVAM5+26V4mXktK60WIUMncuJUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt84ZAtFaQAHVD8JWQVINGJQGJWB8WDe4ZY5GL1iDphPWwsJU9
	uwKS1/F1SEpWhf0v47NPTNrVlRIJ+7AplOlHNwqzLB9jvLOH1zYJpx/NLCeY9c3XDy2CfzUJtiG
	FOwQYI87xsY8R3DedXuKQyJzSQqhcQzmRwEGTbA==
X-Gm-Gg: ASbGncvv7WjcnuNJyoriO4PK6CISplfzC1QKcxGgeHwrwuQGPJS3i4qt9HJRri9Ba83
	ix0IiWRiFmrRqTpqJ0CvQAeZqv2j/9obgZOY=
X-Google-Smtp-Source: AGHT+IG4lAagFo6z1ppiAYrOC7C4TN5pY0zUDuuH3woRWIw4oGjlKvx5/ZHHH9rcjl/Kqtx3EgozCxAjSqTP69gAblc=
X-Received: by 2002:a05:6808:189c:b0:3e6:6097:847d with SMTP id
 5614622812f47-3eb85a8b199mr1689009b6e.7.1733919230314; Wed, 11 Dec 2024
 04:13:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-3-tudor.ambarus@linaro.org> <ce757b8e-4e6c-4ba9-9483-b57e6e230fdf@linaro.org>
 <vxqi23hxw7bmtfs5wk3u7szganpv5aa74b26xrvpmbehkltodw@dpum7zrxdz44> <2eedbbe1-6b4c-427b-a369-5b08dc27deaf@linaro.org>
In-Reply-To: <2eedbbe1-6b4c-427b-a369-5b08dc27deaf@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Dec 2024 12:13:39 +0000
Message-ID: <CADrjBPo_YmTuuW9c3LtWzMp7Sf4365e2bxuuYBUiFPPc42d1dA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] firmware: add exynos ACPM protocol driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	javierm@redhat.com, tzimmermann@suse.de, vincent.guittot@linaro.org, 
	ulf.hansson@linaro.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

Thanks for your review feedback.

On Fri, 6 Dec 2024 at 19:50, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> On 12/6/24 14:28, Krzysztof Kozlowski wrote:
> > On Fri, Dec 06, 2024 at 12:39:56AM +0100, Daniel Lezcano wrote:
> >>> +# SPDX-License-Identifier: GPL-2.0-only
> >>> +
> >>> +config EXYNOS_ACPM_PROTOCOL
> >>> +   tristate "Exynos Alive Clock and Power Manager (ACPM) Message Protocol"
> >>
> >> Given the importance of this driver where a lot of PM services rely on, does
> >> it really make sense to allow it as a module ?

Yes, we want the option to build it as a module so we can use the
upstreamed driver with Generic Kernel Image (GKI) [1].

> >>
> >> Some PM services may be needed very early in the boot process
> >>
> >
> > If it works as module e.g. on Android, it is beneficial. I think the
> > platform was booting fine without it, at least to some shell, so I can
> > imagine this can be loaded a bit later.
>
> Usually the firmware sets the frequency to the maximum in order to boot
> the kernel as fast as possible. That may lead to thermal issues at boot
> time where the thermal framework won't be able to kick in as some
> components will depends on ACPM while the system stays at its highest
> performance state.

That isn't an issue here as the Pixel 6 bootloader leaves CPUs at mid
point frequencies during boot. I would actually expect most modern
phone bootloaders (since the launch of GKI at least) to do something
similar as it is a requirement for Generic Kernel Image (GKI) [1] that
all the SoC drivers are built as modules.

[1] https://source.android.com/docs/core/architecture/kernel/generic-kernel-image

Thanks,

Peter
