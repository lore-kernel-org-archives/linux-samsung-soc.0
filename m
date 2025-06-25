Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C02221DB9
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 07:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836921; cv=none; b=CWJPOG+pL9C1R7XkqnNmyq2Ms08Kq39lbJxeC7W8ErUTD5sEC2SsTJ1T6/7GDjmCJIIlGoBepu+k5jwlyncad2qmOkYUY5/XXz1ZjVzWeMhhqlHBjxYL3q5y6Gnz673lPrsDzdhyMT+VyiuI1j7dToBHpFhStGG7SVe7VFVB5M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836921; c=relaxed/simple;
	bh=2DymnnvE184jkZ20uTvSiiI7+Y+QW2i9b6WEZQ2DOJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uTi7TxwJtrtExwGFzPVY5Uq/Y5cPlUSX+BBeCnIv8Doa2XcFDZlVsOMlhyrrRDKpG7+UfxXDAsz0TeN7VOfi1XeaFJndzajIf5PQ/4syvZRQv1PNeH/POHHZZ0cAX4p/GuzYevVmNMWXH1LouzJAW7w5++8kUdMWxD7GEBK0M9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=srAV+ug0; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="srAV+ug0"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso118978266b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750836918; x=1751441718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DymnnvE184jkZ20uTvSiiI7+Y+QW2i9b6WEZQ2DOJs=;
        b=srAV+ug0q+0w5chyQ7ijAx/duJp13PTzdHzxqz03njor3fxDjKTSaMxdvbKRTCT5gZ
         +Bxeh6VtfhG3bTomX+QdTe81HgGz5BzUDK4udiYfRDAk+ECP7BQim++DL+2cdKRD9aA4
         44nlCEEYK5P0Oodemdw27yZ6OKkgUBVIwqghmLBmMVYPmyGYZ6uKcLr1Hv+6qSuhGcCg
         nYjDl273AZtO8v+TZ1GmQwsTAVWSygvyVr6NnEbWVuhHAXFXlERpkKNdsp+kS4EX/9wS
         it+KDG+SVQlYaintKCAyowNqLIklO3lzyEQpnX/eptd3SY5uZmMOdaj11PQScdVElkxy
         0xQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750836918; x=1751441718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DymnnvE184jkZ20uTvSiiI7+Y+QW2i9b6WEZQ2DOJs=;
        b=Y74d43nPHgq6YBXKhMPl5my9KjQxPylpnTDuQlXcQ/oVKA8BxrQfcE/EcG8OXJXf0b
         FaUyN7kH0vZVQ9ZBsIl+RP0xxmX5hwO+2R4TTBLKeeQ16sizMb82eJLd4lzG+1mGE9fa
         WATpGO/1rPNUsxFTt8C0gpZRK3whzTeLy8Wy7DRkv35SjRx6rg5FXHoXlEKROJgyG9c7
         3bz9JsQAMN683TK6UyqjUsUhbbuPsXKhFxqcJsQmP0H4QqkKb1VqogKuwItqgYxV/LqK
         k3p+6xaFHv5FfvdH9or6jNPa3DRTRfIQoYU2cw0nUSi+HX2X7FLV9tzNCpb87jIIwHwT
         dZfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ1hxhzhKXrmEn/npiQ/QIVzJRFev8uY1Zj8tTKPKoQIdGq+f9gJf/+9OmQSJIjns36Duv6NaHLTbp4IToWpeqQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6cZx7eydtennedXt0xZaeI+iZkE7Sl1XK2QmvlNzV9h1uxxdt
	j9R6xuW6Rwx6S9NIC8WFoDYk0gzcyvnixwkxEgFnbUPltzCjpH4DAbCid41Lu6in1yqFAwHXxcP
	bdAvwB60NDmY37Nfh7zEZf9F47cwLcg4OnrJCKmSrpQ==
X-Gm-Gg: ASbGncvjQd/yQuPQGmQeO9ZAD+bQJunJX6AN1/oPyg0pbtlBMdDDtgUTgzY3zXliyJ2
	N6F8tCqw2o1ClWA5fXx62TnQKxjJmz7H9bdI3wH8L8f7SUafuBCBrC10IMSKEnGJ2PnwUzRjjWM
	WGu1KsSn1uQkCXq8VHlkJGX+nmdC7wz2o74YIFe/xWyesvITbreOStoCgq4xsPMWD8/xG9o5MHb
	lY=
X-Google-Smtp-Source: AGHT+IEyXKWCmKWZPw2kgX0twR9fcnM1z7nFPYHArFddxW4orcOtG+t3XPYgPsMNGRzQt/Onxf6tBPeKruUlJC8wqdE=
X-Received: by 2002:a17:907:7215:b0:ad8:959c:c567 with SMTP id
 a640c23a62f3a-ae0c06af8f0mr172746266b.10.1750836918190; Wed, 25 Jun 2025
 00:35:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org> <CACRpkdavsQJTfiwn-F+ML5MK6ADtr-31bBxLA4gV7MTAYR0YGQ@mail.gmail.com>
In-Reply-To: <CACRpkdavsQJTfiwn-F+ML5MK6ADtr-31bBxLA4gV7MTAYR0YGQ@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 25 Jun 2025 09:35:07 +0200
X-Gm-Features: AX0GCFtyVKN-DtXqrWSfe49kFtB1susJDcQJSJJYWx2PpacFz_0klmfgmBsfOl0
Message-ID: <CACMJSestPPEvsUrWaqz7yZ8OxZTMEOBY7htE7c8BV-VBumj1Lw@mail.gmail.com>
Subject: Re: [PATCH RFT 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Jun 2025 at 21:44, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Ahead of removing struct bgpio_pdata support from the gpio-mmio generic
> > module, let's add support for getting the relevant values from generic
> > device properties. "label" is a semi-standardized property in some GPIO
> > drivers so let's go with it. There's no standard "base" property, so
> > let's use the name "gpio-mmio,base" to tie it to this driver
> > specifically. The number of GPIOs will be retrieved using
> > gpiochip_get_ngpios() so there's no need to look it up in the software
> > node.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This works for me.
> I wouldn't be stoked to see device trees abusing the "gpio-mmio,base"
> property all of a sudden just because it now exists as a device
> property though... I kind of wish we had a way to opt out of exposing
> this to all the sub-property paths. But it seems tiresome, so:
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

That's not a problem - this property is not in any DT bindings and as
such is not an allowed property in DT sources. For out-of-tree DTs? We
don't care about those.

Bartosz
