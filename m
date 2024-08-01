Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B24140E5F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Aug 2024 19:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722542028; cv=none; b=KR+iOdXWjxJ/W77wfBwQRwWqL7vsigTCcaMz/c9ehoZyKva5AYIU6bdp1QIB/s6J0cj0W29xl3rbMBT/tQCP+3GpMkYDgGXyOF5q6P7yt7s0hwSwF5rMcJZaZ3t1ZIdj++UDgL5FFdoEvBY3qTrptxlG0mjj5e30j7+rw52WS9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722542028; c=relaxed/simple;
	bh=wLC+wyAvBIDqZxxTL+OJUZIAzsd6IEPTdtsg8MlEoSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPviU+PtXvP9AF3ibK+ORwdwPqhAs7jqXDku22SXItDxk2oA3RLKomWpV5xw9/G3mPunMNfgKKQtMKkvuC7nTDjPHIBKFKtcDwFGXjVh/0KcuaIvSfIvKLEKE6VisQ3VaYGE0APFCesZz9aVAALlrkxtdEmW+B2ncAa23Gu/C60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hXBl8tqK; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hXBl8tqK"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f01e9f53e3so106444361fa.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Aug 2024 12:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722542024; x=1723146824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLC+wyAvBIDqZxxTL+OJUZIAzsd6IEPTdtsg8MlEoSw=;
        b=hXBl8tqK6+q8HtOQyXmmrw/17FjrB8IX7CLMpa59IxPqFtSmFp5MHGuGO0rRDESTjf
         kTtXYyIsN5yNambBWKBwvv+ksi4ujZvB8igRGpIKzZJrYZ19QVa0PTQ8PJl9JTc8nVM4
         7AYWeWfuBWYRJTnYIFk/ZzLXPODSFX8bv6+JfuW96n15hzamyMvpP5YAP9d/30beeBwA
         rnx7H2EFqmN1husdFoif68Bfcq0e4ZHn3VVDvznSyIj2sQCzaLXVA2nKcrJ4KC7CoL4i
         j3jdTNsfoNMx8Lt7HaKfNtzX4uMNPxzUxLgmSEECnWLq8yOQwq5soaOBAgT1q9H+UQJ0
         I5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722542024; x=1723146824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLC+wyAvBIDqZxxTL+OJUZIAzsd6IEPTdtsg8MlEoSw=;
        b=ZwWlpwtJAOTZYL95wDUdJoFafn3X/LUwlZkspwvWWjbN0orVGXIAXIpi6mcPrkdTdd
         YI5DgO04ua32jX/r8HxMghR3N6LV/zZfnfuGzgBnvoyCdG+qisIXm5cGyQYHhWGVVY31
         QBXjwzUs+M4U+Q+hMKf4z20YPRMKjuhg3n9AuwWLbljuP/Y8c0zQPL/pVwstX0UfG+St
         gINu5RWTQ/wC67OsxV7nagNvLY3w3koxhLL6405McZk6pYOQe6QDzKYpu3MxZTfVlecv
         HSU7+1NbLXJQSidccQSJ9XSOUUYKIGXYdqb2TzoOoXLpZ7jXX7wAL3Gojp2TmRtGLxdR
         sZPw==
X-Forwarded-Encrypted: i=1; AJvYcCXSuSh3gPSi24ivZ1romSgS+7FdJiPl4Edh3YYWBcjqiSMM6v7OTAyVdY0UvO2E7rWrm+A9J1Nyx/Nsywip+I2h5qW/dlrUpRZzAEE48kQh2gY=
X-Gm-Message-State: AOJu0Yzz8qbVQNLha9JwgG6kMB0MLIBOgVb/QkOvCtxsdKrWNnOhrxR+
	84uCCVCLj+NQl0TtvwxEHm1B/ivBluBLTjcmtwiExWouhzqtLAiJH4mT1/pozfmLXJuq4pEgkhM
	0YCDLsIbEMXQJRRydytbP3KlVDtCXu8GPsGUmcQ==
X-Google-Smtp-Source: AGHT+IF5LKvLdZzdAViTxk7RViSTqKC2qm/6JryMX1R7EgHQYJw06oODfHSJfpAYnXNH4vquVf5Gn6dslXjcCQDSgGo=
X-Received: by 2002:a2e:9203:0:b0:2ef:2dfd:15db with SMTP id
 38308e7fff4ca-2f15aaacf0cmr11335671fa.19.1722542024234; Thu, 01 Aug 2024
 12:53:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
In-Reply-To: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 1 Aug 2024 21:53:32 +0200
Message-ID: <CACRpkdYUHtfjL2jfGxjV1eMZGkk6NXaArbHpc5mhrY7C9rSi6g@mail.gmail.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Richard Sandiford <richard.sandiford@arm.com>, Ramana Radhakrishnan <ramanara@nvidia.com>, 
	Nicolas Pitre <nico@fluxnic.net>, Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
	Nikita Shubin <nikita.shubin@maquefel.me>, linux-samsung-soc@vger.kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, "Jeremy J. Peper" <jeremy@jeremypeper.com>, 
	debian-arm@lists.debian.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 7:29=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:

> =3D=3D=3D ARMv4 =3D=3D=3D
>
> This is used for both StrongARM and FA526 CPUs, which are still
> used on a small number of boards. Even the newest chips (moxa
> art, ) are close to 20 years olds but were still in use a few years
> ago. The last Debian release for these was Lenny (5.0).
>
> Dropping compiler support now would be appropriate IMHO, and
> we can drop kernel support in a few years.

I am actively using the Gemini as my NAS with OpenWrt and there
are several users of it in the OpenWrt community.

I don't know if there are enough of us to keep ARMv4 support in
GCC, but ARMv4 support has been added to CLANG (along
with ARMv4t), and I have tested to compile kernels for these
devices with CLANG (for testing CFI!) and they work fine, so if
GCC drops it, we can still build them with CLANG where it apparently
isn't a maintenance burden given that it was recently added.

Maybe CLANG has a more adaptive backend?

> =3D=3D=3D Highmem =3D=3D=3D
>
> Most Arm machines are fine without highmem support and can
> use something like CONFIG_VMSPLIT_2GB to address up to 2GB
> of physical memory. Machines larger than only popped up
> around the time of the Cortex-A15 in 2012 and for the most
> part got replaced by 64-bit chips within a short time.
> In addition, there are also a handful of Cortex-A9 and
> Marvell CPU based machines that have either more than 2GB
> of RAM or a very sparse memory map that requires highmem
> support.
>
> Linus Walleij has done some work towards being able to use
> up to 4GB of RAM with LPAE (Cortex-A7/A15 and later)
> machines, which I think still needs to be finished before
> we can remove support for highmem.

This is either really hard, or I'm a bad developer. But I keep
churning it.

> =3D=3D=3D Gemini, Moxart =3D=3D=3D
>
> These both use the Faraday FA526 CPU core that like
> StrongARM implements ARMv4 rather than ARMv4T with thumb.
>
> The chips are also over 20 years old, but the kernel
> code has been updated and is not a maintenance burden
> by itself, so there is no value in removing these
> machines until StrongARM is also gone.
>
> On the other hand, removing both FA526 and StrongARM
> platforms means we can probably remove ARMv4 (non-T),
> OABI and NWFPE support more quickly if we want, or
> we can wait until a few years after gcc drops ARMv4.
>
> OpenWRT lists the gemini platform as supported in
> https://openwrt.org/docs/techref/targets/gemini, but
> none of the individual machines have builds for the
> current release.
>
> Need input from Linus Walleij.

Yeah we use these devices. I don't know what counts as big
enough community to be considered, it's at least not just
me.

Gemini builds are in the official OpenWrt repos:
https://downloads.openwrt.org/releases/23.05.4/targets/gemini/generic/

Yours,
Linus Walleij
