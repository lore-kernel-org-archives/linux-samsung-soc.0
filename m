Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9911448E0
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Oct 2025 19:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759864688; cv=none; b=BilSE+fezi7z9b/Xib1NHp5kEZIjU+zkiz2zCOjWuiKQ8qDBTksW7twy5ZAxZjlNB+UNZJbPM2rbi0e7y0zkN3OuUpKmz2POB+9e2B4RYqhWm1om0FGl4du6bAqSTeqOdwC2A7DbAXlHzShZRTFbshpUqRXFCCDqI2MLE9jOhU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759864688; c=relaxed/simple;
	bh=c3t+aHhOX0sarnkVktCMNDd+aJo1Oiag+yfGXxQfFjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rpIMxf5ZTI6whwkmiMqDX9TgKq9vOoe4VyncIO4YiFK/QlanpJ7uab7npctHx7M02f1higCUyTrTrHJ5VSFfV7YFq2Se/8sxwi2gu1+JviMsPNRmEmJa2cc6veG6glgFj9zWI22wCZn6qyCvBmTcBI+Fkf86uNglvNLQakn+BBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s7f2+KZM; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s7f2+KZM"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-749399349ddso86770537b3.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 12:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759864685; x=1760469485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w56vpyq36HF8RpsGhMYvJCK01J/8OiGiiJ7vKt8zJro=;
        b=s7f2+KZM0pERfV+X1Edolsait8/hONhFfWX7TqGZpPVxdPZqnAptkkyhddMeeRQnyr
         kr/wPh1/C6sIekZLIRH5ToP8GUDiloNLjzUS+MF+CtqZoST6p8eQANN6RMvznO8Scnrk
         SLRysQY4Efst4PnRp/scmYwTHyUm8m4Bp2FP4hdJreA5wgzEEQ7iLB43oYVKvwZaEciS
         GlBfGmUOt3ZLTW1KSWCbxVlNGyv8I4+uK7T0+NWOLU32CFfRM2veu/9hHvx+WjseojjE
         BiDsnFkWVZA1POhbBw6AZhIWMy1HTUWuEoNmFgoLNdLcPeDim35CkpptzEXXMpuod9JW
         vNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759864685; x=1760469485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w56vpyq36HF8RpsGhMYvJCK01J/8OiGiiJ7vKt8zJro=;
        b=ZD+pESf4Ns0Yr47pCP5vfsKJ6jp6HiyWwnkhh3y5vfOUH1bI3IyH0LIchVJSN21dY2
         I9OiCOKVngnmPnUS3x+Vi/+Lf+R+zE1r/GtxJGf+bOD6CiszucazMZcuwqzTN7kHCApj
         ojmP2WvqRisiN27NErzZ16SIQiG4I+vBSjSj5YmmZi+TMjACvi/4weYjCD2yCX1p0vZE
         FdGS8xiPWEM5omLde/X8C6sBhS/JtzprTOGQuc9rGGMFDzGLaRbWrky+IitfejIyIHVM
         SS8LzkbMPRwVGDNg/FX4+9dN8dc6D/j43xrlMz1ShhnaP5aaltHTYmD12Zp0xjkfdP1m
         bqRg==
X-Forwarded-Encrypted: i=1; AJvYcCWdM7N1S5cro1KchohQj2MdLfacgdtiZoV/c3iyng7xBomcE9Pnsc/lAWQ8uvCUDGGx1cJ1A/NRq+Nu3rcRIifT7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWbH/nh0pC1qm0SMYgSrSvG/5e1dcNn6/O/mE1m5JxbyRxoej2
	tAAM8Xt74R0mSUr9TNHYR8ED9vQ8qVaCz+fcevgGkBgAID7odZvnaNhBleEvsZniRN9HVOu5Dbb
	g7poyFR/mStIJfhVvrXqJERm99WuGlyhHmf0OuJjshQ==
X-Gm-Gg: ASbGncuHX/+rGzxMYRb8UA35WHkSOe7gFmyHk7/j+KFfRRiPChfA2tX/YeqgnTcm6sG
	dp77JBCozacuxLdleqq6s+pnJR4os1+ltN0auZpOQmZbvbMuCCE/vK7Xrxy2HZB5LGoO2WeblGz
	nxF9OzWJM4Y64MXzu1Ee1RgDiTWnrVO6TiqkU0Y/dks2B2b8iKPEM+E6XxXEdROBx3wNo03WI79
	+t3nRs9x3lsCI9m9tynFd6Vq3QnDY3S0g==
X-Google-Smtp-Source: AGHT+IGMX2m5vC5IgwIyyLUsmiZiXribIWN75UHjEqcGSweB7XgIU8ixi33FHOzX5pt05B8rZ7NfuKMui5fZiPzZq0Q=
X-Received: by 2002:a05:690e:429a:20b0:632:9d08:e3ec with SMTP id
 956f58d0204a3-63ccb8d82damr755481d50.25.1759864685141; Tue, 07 Oct 2025
 12:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
 <CAPLW+4kAzXmd7mv279wMJCT0gVP5A+2Xe0q3MgX1OENH5PC2dQ@mail.gmail.com> <a09b6b493b41bff39000df61dd14693af8b0f053.camel@linaro.org>
In-Reply-To: <a09b6b493b41bff39000df61dd14693af8b0f053.camel@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 7 Oct 2025 14:17:54 -0500
X-Gm-Features: AS18NWDVKcO3PeRXDNI0DF_p50lDT8d8A_Mox4i1JZNZGvpUO0f_-kjnkIWXx_o
Message-ID: <CAPLW+4mitF8rDcKdp3Bgs7sF88WbV981hEkM0LiTqYKSLN2_Jw@mail.gmail.com>
Subject: Re: [PATCH 0/3] soc: samsung: exynos-pmu: gs101: avoid SError for
 inaccessible registers
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 1:36=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:
>
> Hi Sam,
>
> On Fri, 2025-10-03 at 11:59 -0500, Sam Protsenko wrote:
> > Hi Andre,
> >
> > On Thu, Oct 2, 2025 at 5:33=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszi=
k@linaro.org> wrote:
> > >
> > > Accessing non-existent PMU registers causes an SError, halting the
> > > system and rendering it unuseable.
> > >
> >
> > I wonder if this issue you describe here is similar to what I'm seeing
> > on E850-96. When I'm trying to read these files
> >
> >     /sys/kernel/debug/regmap/dummy-syscon@0x0000000010020000/registers
> >     /sys/kernel/debug/regmap/dummy-chipid@0x0000000010000000/registers
> >     /sys/kernel/debug/regmap/dummy-system-controller@0x0000000011860000=
/registers
> >
> > I'm seeing "synchronous external abort" during regmap operations
> > (judging from the backtrace). Do you think this series fixes the same
> > issue on gs101?
>
> Yes, but for the system controller (PMU) only.
>
> On E850, it appears to be the same and there are many holes in the PMU me=
mory
> range. You can confirm using debugfs by manually skipping invalid ones, e=
.g.
>
> dd if=3D/sys/kernel/debug/regmap/dummy-system-controller@0x00000000118600=
00/registers \
>    ibs=3D15 count=3D1 \
>    skip=3D$(( 0x28 / 4 ))
>
> should give you register 0x28 without SError.
>
> while
>
> dd if=3D/sys/kernel/debug/regmap/dummy-system-controller@0x00000000118600=
00/registers \
>    ibs=3D15 count=3D1 \
>    skip=3D$(( 0x4 / 4 ))
>
> should crash.
>

Thanks for the details! Guess I'll wait for your series to be merged first =
:)

> >  If so, I'd probably want to adapt it for Exynos850
> > later.
>
> +1. Note though that a custom regmap is used on gs101 for the PMU in the =
first place.
>
>
> Cheers,
> Andre'
>
>
> >
