Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7EE3F39C5
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 12:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527191; cv=none; b=F9z24thO6i+Kati9V8J1yyhJNWV5Mq9wxx+kp87UwWTufHxpiUbW6ug7B0fDz8hj1yLUyTt7E7ExgByRGSvgiHgIcAXLmN+JPdbA1i4oexMd7ZabVgN219xKBRdLlPBitvM8nOT1OXYyRKVdbG4Jym31Wo7v8l+wzZ2ZxpK/ZgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527191; c=relaxed/simple;
	bh=bdVJ07nAphri25imo7nsgUcUOxQUMPVUR1ipYfK5CAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=By/kHfWgBXYkFZa5iT/bLXRCZ9WxLF7C/tuCP3G5AJSv81Tw512kidDOlCaI27CTtYL18atvkeKSKBQrNhnd45QOQfu8ABu3GeKrAHgV17nIALFL1LsIIwouvX9zp+F/KDkU/eGeNvpRTreHPl+pd9Jj4eBjCbnFe6TXPEi1zHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mB6RCqnZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mB6RCqnZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075AB1F00A3D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 12:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781527190;
	bh=3HwTZQKx3R5nFnMVQD0UnmKNX6QPykatQ2QJBzWpTuA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mB6RCqnZfoadfqstkbuB9D1ya4jx79P2NLyAKcqY+vTLunCOaY9NQk5dmAoVYTJos
	 Jemaf1tWnPw/tXIi5yvdpBarHzXLfLJN6VRS6efYEWF+SrH/stpK/uNX6pi7AB5YMb
	 GiK5oCaYzPRaV9uameTmnUMlA+/i76Us/dazyR21H3DG3ztnbCHszDXHVGPlJ0lNTZ
	 CIRxjNTaCBCTfTQxPGF0HXEx5ZH770t0kwvEk7I/rAhZkStRZt3h9O1NuAMU+5vMkY
	 wz0SVGSzvVopRGio0InHmHDU+F+q32rCiNvZPhlm9IsUlzwZTTYOrh4wSt/d/YV4mB
	 eFeeNksEBdTTw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa5be9ab1aso3030202e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 05:39:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+I3x0l/PUYf09PftH+2vcvBWf6HDHnz7suceVSEI2JH3HabbwMd/2PyxCse1K5E1SzdTz+KcVoZKxY80TxW7QhHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKAaikSJRo5LnVgurfo8omZl8Ee1RaDg+TyufpTVPnqGSw8K/O
	7O3FiXtcUuRA7ZMHJvrnqFKivrKlrC0aQXXzr+fBZGDZnOj6NMqXf74MWu5N+rZQbFCJl0Q4tpx
	0SA3wsvkbg9LlqI+ReKE7jCWXt69nIgI=
X-Received: by 2002:a05:6512:378b:20b0:5a3:f25f:cc30 with SMTP id
 2adb3069b0e04-5ad30dc0e51mr2166732e87.32.1781527188817; Mon, 15 Jun 2026
 05:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260612161148epcas5p33904df90bd840d20a6db05622aaa28b8@epcas5p3.samsung.com>
 <20260612163020.411761-1-alim.akhtar@samsung.com> <20260612163020.411761-6-alim.akhtar@samsung.com>
 <CAD++jL=mQUJCqVyqK746UdkZCsO+2oeO1MCQM4F-_pSOfpuQuA@mail.gmail.com> <007a01dcfc9d$aa94dd60$ffbe9820$@samsung.com>
In-Reply-To: <007a01dcfc9d$aa94dd60$ffbe9820$@samsung.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 15 Jun 2026 14:39:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLkX99o8B0jhU1UA8XtMPtEfJwvGHvi6fQ34HXdkN+hE+Q@mail.gmail.com>
X-Gm-Features: AVVi8CdJ5ZyduBAkMoAW0l1uu5Q5fbJbTHlK3_-9P33lCUu398OHaVFPyVfP_0w
Message-ID: <CAD++jLkX99o8B0jhU1UA8XtMPtEfJwvGHvi6fQ34HXdkN+hE+Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org, 
	conor+dt@kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alim,

On Mon, Jun 15, 2026 at 10:05=E2=80=AFAM Alim Akhtar <alim.akhtar@samsung.c=
om> wrote:
> > On Fri, Jun 12, 2026 at 6:11=E2=80=AFPM Alim Akhtar <alim.akhtar@samsun=
g.com>
> > wrote:

> > > +F:     arch/arm64/boot/dts/exynos/exynos8855*

^ Actually what I am requesting...

> > If you really want to single out a single platform like this (and I don=
't even
> > know if that is a good idea... how do you keep the big picture in mind?=
) you
> > should probably want to also add a wildcard for all the
> > 8855 device tree files.
> >
> I am also not sure, just followed what was done historically, other Exyno=
s8855 file will get added once they
> are posted for review, e.g. clock driver.
> Let me discuss with Krzk during OSS (Mumbai) and see how do we handle thi=
s or any other better ways.

I just misread the patch, dunno why, probably too little coffee.

Sorry for the fuzz.

Yours,
Linus Walleij
