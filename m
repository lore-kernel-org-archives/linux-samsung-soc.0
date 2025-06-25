Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1DD28E607
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847015; cv=none; b=jTmCoQ0rE6ZnkORHHAAW7wQR22V19GRZwC+P2Y+tpJ2TalZFu8VLsFug9LG5ekrSpuOlVURn6StMyKN6TNv+FUxOZ2SDuqBY3cP6OPCtZG52vTAsfSOb//rF5HuJepN02cT9cQFvLI7lSBqr3n14gAwe1F2CGek0hU7qUja85oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847015; c=relaxed/simple;
	bh=1sh8kXgYTvfKaZBBuJeUkf6bmJ4SWj3nocH76LTnKq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cc6G6VA5PvxIcw/VXN0Ak9+jao5RP2oBh0CZTxCDh9AMmWpouysBORMQQeHpSgI8QrXHYVTAOemHVsQJjeULX1An/v+BZCDMc6FxFGC3sycjVvBx1mtOIMuZ/pBDSU8lL9/wvdCBjsHUePhi0v1d510xLf4m92N3eNAf13im86g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yql8mRcJ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yql8mRcJ"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553e5df44f8so4872284e87.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 03:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847011; x=1751451811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sh8kXgYTvfKaZBBuJeUkf6bmJ4SWj3nocH76LTnKq8=;
        b=yql8mRcJwY3Y+rpSX1P+5fEjBetyrNxrIdbhFbzNCk2GD8YOJx59m8VsX9Up8/iuBf
         0IelKbwsl9AmB1NV6ixUXOq5hR1/henSkC4DnH30xjPeMB+xZp4uUxuirWaXYU8pai4u
         9Qa0vPobbA9FD/xHeeH+39qAPa7W7355CkLNP1ky2BUagUWqf4Tl5TIE/AeyiUXAhzco
         yXPULIHe4ThtB/teMQPtnhStMvv90R3+1m9iYtipHTM/GAjSH586btyjarUTm5jOaP5z
         Da+TkCuEqauiZHhyTVxY01qzsyOIEkHttW5nC6UukEVALWS8GuVXpTBzyMH3GcG3jc0/
         s6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847011; x=1751451811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sh8kXgYTvfKaZBBuJeUkf6bmJ4SWj3nocH76LTnKq8=;
        b=V5RRrFG7aIiyhwfcGlFlkAvZD4AZtj4bO8kuca8hP4vKOGvnskERx4qUpAvGIZNB2W
         KJ6oQ/o5fnHUbrZ9WHsv4v6p14tMTro1+LQZ1HGJ3hUEHh/V48GkUJRATo7BGDvj5Erj
         1wurOT6V7bV2ic61+1lfYFCBwi4OrYBvB+lVCw4o2tgCfhUmG6TOW5fdEryX8p+B56x1
         0fzm4Up93DzlF+HaXcE6g3miM/afBueobq/B3hZA/zGhHhR686e1n4rcDaUf64GsFbJO
         8VNHKihqMYaO4MP9eiw04W+bOC/COMao90R23dh58uRWzjayMx+B+v1ekLbru83sOY+8
         U/gg==
X-Forwarded-Encrypted: i=1; AJvYcCW9ZP6GzVMY6zA9NQ9lh901m/8mUMXeiotDMweVGW6V6NqYRTwHDldLC+Lphd94Lw3U/237MgUyYIMgYwDixJAmOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwfUSINkyk/DvQeMLkrX5oEr56GYpqke4HCSjBPRblkkFPXdxu
	FUgfkmjux3cmeH/WMnIMBYCM8q8drCswdf6vYDyrdr4QAd8bUqz1E48s2wmXYKyQrAthl722j31
	vZOdbFr4ScPT4K/4DiT/eDVzdtC3JhR9+dwFiFwT6zg==
X-Gm-Gg: ASbGncufLdaSO+iTaGH88XoOiCD7c1p3IdzAkG8kNvDLl6DyPQHm2JFJ0RyyO0iErKZ
	0s6o7/VD+T0aoIVgRGV+5GnpTMMbMR/50yFtq8UzSFEUHi8Jon8PFk3jugsxm1gnggdE4aK7bd/
	Rrsmy9KT2l0GhZJRDaNtbCTEqrNWO3vXYqBY/sO5CQct4wG5/3bPe8ln1HUO2oc9IZ9PkgemiXe
	ZMB4fptfAra/w==
X-Google-Smtp-Source: AGHT+IFsA01oZJysyFytGEZV1KUrxfeUbLuJrVHSkxducs0fyVngJr8hucT3oo65yMfEXJOqTlQNr2rbLXOC/gXoNDY=
X-Received: by 2002:a05:6512:3d21:b0:553:65bc:4231 with SMTP id
 2adb3069b0e04-554fdce2db8mr788175e87.21.1750847010701; Wed, 25 Jun 2025
 03:23:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org> <CACRpkdavsQJTfiwn-F+ML5MK6ADtr-31bBxLA4gV7MTAYR0YGQ@mail.gmail.com>
 <CACMJSestPPEvsUrWaqz7yZ8OxZTMEOBY7htE7c8BV-VBumj1Lw@mail.gmail.com> <6c64751d-67f6-4c30-a312-af289d9f432e@kernel.org>
In-Reply-To: <6c64751d-67f6-4c30-a312-af289d9f432e@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:23:19 +0200
X-Gm-Features: AX0GCFuLFVrQAKskpbSfd1dqDb1DXrhBttUu-cs1kru6ZNBZYnVnFCLPa9cHjd8
Message-ID: <CAMRc=MdEZkjoDR83JFg5OPP07_DkAfeZixN9C+uxhkqkxaKypg@mail.gmail.com>
Subject: Re: [PATCH RFT 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 10:54=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 25/06/2025 09:35, Bartosz Golaszewski wrote:
> > On Tue, 24 Jun 2025 at 21:44, Linus Walleij <linus.walleij@linaro.org> =
wrote:
> >>
> >> On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> >>
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> Ahead of removing struct bgpio_pdata support from the gpio-mmio gener=
ic
> >>> module, let's add support for getting the relevant values from generi=
c
> >>> device properties. "label" is a semi-standardized property in some GP=
IO
> >>> drivers so let's go with it. There's no standard "base" property, so
> >>> let's use the name "gpio-mmio,base" to tie it to this driver
> >>> specifically. The number of GPIOs will be retrieved using
> >>> gpiochip_get_ngpios() so there's no need to look it up in the softwar=
e
> >>> node.
> >>>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>
> >> This works for me.
> >> I wouldn't be stoked to see device trees abusing the "gpio-mmio,base"
> >> property all of a sudden just because it now exists as a device
> >> property though... I kind of wish we had a way to opt out of exposing
> >> this to all the sub-property paths. But it seems tiresome, so:
> >>
> >> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>
> >> Yours,
> >> Linus Walleij
> >
> > That's not a problem - this property is not in any DT bindings and as
> > such is not an allowed property in DT sources. For out-of-tree DTs? We
> > don't care about those.
> That's not true, we do care about implied ABI. Try changing/breaking
> this later, when users complain their out of tree DTS is affected, and
> explaining this all to Greg.
>

Wait, seriously? I thought that the upstream bindings are the source
of truth for device-tree sources...

> Rob was/is working on tools checking this for such implied ABI, I think.
> For of_xxx() calls it is obvious, for device_xxx() or fwnode_xxx() it is
> not, therefore please add a comment that this is not allowed to be used
> by Devicetree platforms (or that this is only for
> ACPI/platform_data/whatever). I don't have any other guideline/solution
> other than a comment.
>

Ok.

Bart
