Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8192E7F03
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 19:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794405; cv=none; b=Sh1Ms7uZwg2zOOwf/MZTf0USePMmQpVl49Vp/UOwqpVTjlZwQfYGXOE7RUU9Z/iWrITlzm5FV2RiIzV9Oi4F2+OQqtgpMEJkxProRysOThIqcNVZMcRMkUdXdHPDsVkQ5vFsiINZLHM9RcaCbLJGLId9yt1evqpmD3u8NqWw2ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794405; c=relaxed/simple;
	bh=p48sMTmP/Wq8ruqfMZ8LiS7A/PulyMV9Lx/kALaANNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4/X4DzWzPjn35c5tNi2ZtmVmuISX8OXkBAi9DXc0PXyqEhLchkHC4JMUGfMDG8D6+gWkX4q+O8eZGOz4N47t8RgR392v+HM+tYEiyxhCtxX7uHkMKvyqbh4ErCaWU7h879DrmZI0D0+e5RRbd4jHtuW6gGRB/beiaTV6e9Go/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VZK64ZpQ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VZK64ZpQ"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5532a30ac45so213176e87.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794402; x=1751399202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p48sMTmP/Wq8ruqfMZ8LiS7A/PulyMV9Lx/kALaANNI=;
        b=VZK64ZpQTEt9hL2LxW8l6wfKpbOHWR3TNjMgYRQTap1lD84dGIejNLJ9NU56lEA9sQ
         OY6YCr8BDg0/opw7Uu5vmWNmD9vGtbUP5Rzcuv2T5GZO2IMwggT2Uu0WpiTzWnBV+UMt
         MGou6zlqWylzILsmpc4yaS9mXK8up4RL2oeoHof18cN33eLXVg4DJkIxQhx1DJ+izAmz
         QHHFW2CPXhg4JdtfZntdB9UYrDOEHQnOr+vYupVvl3xWqE8H5K93AdAMOEMwQt6iJJ92
         R036d1iCOQeh6p2WTN7GRq660y685JFgbRizPKVNFM8YfOoegUuOdmifJYXhJzmnPcvs
         XPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794402; x=1751399202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p48sMTmP/Wq8ruqfMZ8LiS7A/PulyMV9Lx/kALaANNI=;
        b=St0bRZbY84DcpF8PbaxOg9IH6xv6vFOU3OAt907HkpLuMCsnXCgHRY9YQ1HzYEJmBB
         2gB+zOHkuwuMNtNNtD/y8rwIpLsf0q9t09a8f6vwmnH8FwigtApMV8FgoQk/X7Vh8pdc
         sU7J3PDIlHxqINifAfWGEOMAgxBD/s4FM6Fh43/PkzYEdbpav4pn9RuSPnOaNVhdqgai
         f4rb10BjhQC6gEPhpS+X1DoGgfcyhOjOrDkPeLg29GqgLCxn5/ohj1x2mpA259I8BtoW
         czKHYyV+M7t2VAzawu7xvma+WI4tuFu3FISX1stGtNkRcrQY7i3zuuXwGUpLART5ZOWV
         zIhg==
X-Forwarded-Encrypted: i=1; AJvYcCWkos/mMZJFACAVSRU5f3OIr4ECuyxsXEsaDI1EDFHJdMtSf5rWNzlbr9PqXegXEJfoj+lpzZav1U08j9StLUvpZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNVXNnG9s4egIGHrA2zUXTxr7UUxt2bDgjNh5E0bbbw+fzTLqF
	n/rV/3nk5TGO5BvalIEAgso4PvNznjEJOFzKuUk613b4hmhcFVpb6jZyckBwfafNezwCvySZU3e
	9AqOOsJuORHTQ2tHkR+BWW7OC9oyJvnLBZCHzSk7WoQ==
X-Gm-Gg: ASbGncu+quPbwleETGisXZTSmVZtm4i30Y0FeAQqxF9JWtJ97k1t57y0xtMkpXaYyTN
	+lu6O3rn+YjhviJG4Nl8rVHVLaUmnJRMyWgS5EnuB6at7+ovzIX5lOMy9NNd44IxZI2tZCBWUzu
	mDDxA9bDSraVLyd400lC99+WkGcwoo4hpl4A33ri/SA8J+1B7lhf9F4w==
X-Google-Smtp-Source: AGHT+IHdpwQMLs1O1YXsE7OYJDSqDv174xvDSUigjOl1MX3lK4+jDay8aiOLOcZL8anmxuKl33tiqVeqknlI9Y/jdlg=
X-Received: by 2002:a05:6512:1114:b0:553:cb0b:4dc7 with SMTP id
 2adb3069b0e04-554f5c85c83mr1548662e87.9.1750794402146; Tue, 24 Jun 2025
 12:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-5-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-5-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:46:31 +0200
X-Gm-Features: AX0GCFtNgkCX1W_AdlK11ZGEmJmRv7gODCrJ0s33UaorzXY8ZeRx0-2XaShZXAw
Message-ID: <CACRpkdZ0zsBCXLqdXKoY5Fyn835xqunesRLrAMxUu6ASWU7iBw@mail.gmail.com>
Subject: Re: [PATCH RFT 5/6] ARM: s3c: crag6410: use generic device properties
 for gpio-mmio
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The GPIO device in crag6410 is registered with struct bgpio_pdata passed
> as platform_data to the gpio-mmio driver. We want to remove the
> bgpio_pdata from the kernel and the gpio-mmio driver is now also able to
> get the relevant values from the software node. Set up device properties
> and switch to using platform_device_info to register the device as
> platform_add_devices() doesn't allow us to pass device properties to the
> driver model.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
