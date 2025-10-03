Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDAE19D071
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Oct 2025 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759510766; cv=none; b=cUqC9rGgmVMSeVo8zDOk5Dzs19nbm3RCQY8lYJl75Uko4z67SmAlelkAkD9RxNy2VnjehzemblFaYlcodIv7neL+ZRfLDczbPcdB4FuOoP9simERG1Tb0l5ac49nQPSIEKInINQOl8BzB34TgbvrOhrD2uT+A78WgVRgxw3GaDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759510766; c=relaxed/simple;
	bh=DgPDGYkjFCaTNxc7D1DJckR55ZYwlv8zv8mAnZtpLoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LvGoHj04VSm/sofKnJ4pEiNHHe53PhYl1gdiKvP4JzaqPYhQZjJjydxSXnrQJG1Lh9cmaqDMlLmpYWbYHza5XpXng90igp9Sfox85xjPq04yayleXhXtLJGwTibXeVNhI07IZDyVnDjmgxevOkGyaBXSZwG88pKlSmkZOTMNPz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YwklWhDu; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YwklWhDu"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-63605f6f64eso2380292d50.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Oct 2025 09:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759510764; x=1760115564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ey2hQl2GChdmjWekqgYe2FevyryAIx9lLcUl4a62x24=;
        b=YwklWhDuHh9ioqPOC66/o73AAaw6cZxSmzzj7tuhydJyRLCWX9ovQzCzS0DVPXr6NV
         5dXmYTQTPYuFy+lg0Qpk09IDxSSCAvsh+qlTG2Wr+5HHy8LU3MTC0Vf5WjmOEZ5EshoE
         qi5JIV+RsC1pZD8MnAsl5i0HZrual1ZYaaNlAcE4L/6vtUi+0J49BqbL9dTczUWdhE6P
         PMKBWRYhFha+IVK/ghopzhowXNW4whKH93kMns28pNbAGfPZUTvPeUtYyUI2wyMfX/7V
         CPwklE6x+Iz5ByRcgtsgDmUhyvCs8KXHofD0ZAyZpO4IQ9FKggrUwWRv1ZSTqJcIIXs3
         /kSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759510764; x=1760115564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ey2hQl2GChdmjWekqgYe2FevyryAIx9lLcUl4a62x24=;
        b=kae5CcKm5rrBaLMNpKgdW+duGCrKj5n9iLo1Qe1l6FIo4J4oL2JLSS86SIVhJpRQWs
         NlrTZV+n+TbW8jUq06gDfG1F5hvljrN16wW4d2CRch+fgvaiFKYKuM8sZfAOanquM89/
         8vMhoVqttQ7Qwy2r7tSLboGEpYCjHLixsCKSwtpbs8bUcRh3lDSXmGtrOuPNe8pp4Dr2
         xciFsLC/XYmOy6IKy423ruQG4hoGmH47VdSNY3iPzl3URkMRc42aAsnlScAtsbnyTpJb
         WrXR8OgPwOof+BneqIdXkkUK4yay8HG9SKM2SGqNYBrxO0wRNijMasH6SUwK79q5aOrL
         GUHw==
X-Forwarded-Encrypted: i=1; AJvYcCWPtWUkWXxIdEipD1Yg0rZvDHUOm0jFaOfvpKzIJauItBhuUGBot+RfLG+41dOeQxxsBfOb75yjy+IItJrTOVfFlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylsmrmxVkbZOQ25pcux89PAJSdwNW+b18riTmmxqj2HUCgeGIy
	evoQFSgcJDUH6s+5Utw/laOOzD7Fkvj8AgeKCOcWdTaJU2UTXSRVNXNytQR1rA4wbD5XingecoP
	2qRDUwws9jixQfpV6PjfDaFLMvc7k7B3qeRdsv4u+pQ==
X-Gm-Gg: ASbGncuQBxdxNuUq5TPpIRhxac0uYbsY4vCLXq1XJqVWCt5nRp1s7PxcIly7VolU68R
	AVSJkS72bnIXOVWrRWGnIvf7ST0hmXZb5yUoO5JW5bsDMNm0ja3sd43v0GnpaNhIUQXR0fRZqh+
	nW9VgfHG9DsAI9raIXkuvUKqNyHCoFr2hF/Rfs//EsN+yg/oG93XIpyI5saNgJqQLC6olb4Rslf
	uXtaJiCZBwN4vOaUFFG3EZeOQQ4DICVrA==
X-Google-Smtp-Source: AGHT+IHOSCaya5j1WrgfD13q7VBprpuwNz0wIhGHOie5nbBRnqRTXp3Veun2JVFCeXU/wA/r4XvdbDN8sLUyI69MuWU=
X-Received: by 2002:a05:690e:5c2:b0:635:4ecd:75a4 with SMTP id
 956f58d0204a3-63b9a107887mr2589211d50.50.1759510763543; Fri, 03 Oct 2025
 09:59:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
In-Reply-To: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 3 Oct 2025 11:59:12 -0500
X-Gm-Features: AS18NWAFV0JyqToeLM3t4qinDcAm8LWFKJnGlvlSB4Xv1Ko_x1ir3nxFWFGI1Xk
Message-ID: <CAPLW+4kAzXmd7mv279wMJCT0gVP5A+2Xe0q3MgX1OENH5PC2dQ@mail.gmail.com>
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

Hi Andre,

On Thu, Oct 2, 2025 at 5:33=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:
>
> Accessing non-existent PMU registers causes an SError, halting the
> system and rendering it unuseable.
>

I wonder if this issue you describe here is similar to what I'm seeing
on E850-96. When I'm trying to read these files

    /sys/kernel/debug/regmap/dummy-syscon@0x0000000010020000/registers
    /sys/kernel/debug/regmap/dummy-chipid@0x0000000010000000/registers
    /sys/kernel/debug/regmap/dummy-system-controller@0x0000000011860000/reg=
isters

I'm seeing "synchronous external abort" during regmap operations
(judging from the backtrace). Do you think this series fixes the same
issue on gs101? If so, I'd probably want to adapt it for Exynos850
later.

> For gs101, we can avoid that by creating the underlying PMU regmap with
> the read- and writable register ranges in place, because on gs101 this
> driver controls creation of the regmap.
>
> This series updates the Exynos PMU driver and gs101 in particular to do
> just that. For gs101 this is easy, as the exynos-pmu driver creates a
> regmap and we can update the regmap config to pass in the registers.
> For other SoCs it's not as straight forward, as syscon_node_to_regmap()
> is used which doesn't allow passing a custom regmap config - those SoCs
> are out of scope for this series.
>
> With this in place, invalid registers (by drivers, or even plain
> debugfs), are now simply skipped by regmap, leaving the system useable
> in that case.
>
> Cheers,
> Andre'
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> Andr=C3=A9 Draszik (3):
>       soc: samsung: exynos-pmu: allow specifying read & write access tabl=
es for secure regmap
>       soc: samsung: exynos-pmu: move some gs101 related code into new fil=
e
>       soc: samsung: gs101-pmu: implement access tables for read and write
>
>  MAINTAINERS                                 |   1 +
>  drivers/soc/samsung/Makefile                |   3 +-
>  drivers/soc/samsung/exynos-pmu.c            | 136 +--------
>  drivers/soc/samsung/exynos-pmu.h            |  11 +
>  drivers/soc/samsung/gs101-pmu.c             | 445 ++++++++++++++++++++++=
++++++
>  include/linux/soc/samsung/exynos-regs-pmu.h | 343 ++++++++++++++++++++-
>  6 files changed, 797 insertions(+), 142 deletions(-)
> ---
> base-commit: 5eb97efbe6a375944984e7fb69bb632d2879c841
> change-id: 20251001-gs101-pmu-regmap-tables-8726ac9f853e
>
> Best regards,
> --
> Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
>
