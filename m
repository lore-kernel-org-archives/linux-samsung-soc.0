Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE8A13776F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jun 2024 11:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228186; cv=none; b=UvWIg0WvT5PlavfDsmE3HUQhZlfQvajHFUHT9NJm3qBGH6VbSUuyraFFi7RgcaCcBd3w+/AlVlRF7dQuGJMpQfO6ZK5lZArkmztFAqBeCko4/UQ4lAto6jwgRz6vBs4T/xXMdCX7Tuup8ALo6MadQCkQFbtU1eFl06wL4XA+oSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228186; c=relaxed/simple;
	bh=S4Oa3Fi8IQljVdEYLI5O8zdfZsxp5YbWq8vVORk/zlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jn3kn/i+eg36CD4vwIb4i+ZPIbqGsp8A8Cqrl3/+9wLZTMwFtcBChrzrpFnLYaAozY13pM4lkWlD/Xh5zfm0EF+POoq77vlWpxEeeYysXZwLLNuEygBrCWOiRBnzU/esOYMkzn98t1onoFxv7KrM3f+Gzq713nm+TgSB74FTU7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zu3kIjxz; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zu3kIjxz"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5b970e90ab8so2412080eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jun 2024 04:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719228184; x=1719832984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u30lLX5MsP/IKxn1NfwcAHsSmZJS+FIZz7/OFIlaO7I=;
        b=Zu3kIjxzOftbaS3NAFWR008Jt3PeySACnJTg9Mo7KISu4z+38omBIFJvQyN++lv7cB
         zU0dAVDZs14c8ST/sK65k9V3nxxHPyq3Avm16Upe1dQjbaYvj8xrF8ZrY2TFCnnWDJ+V
         80Z9WBWkYVYcysLKNPrAistos06qhS5o6UZxaxOxKcKhJig5CTTgXwBEK0SSJCjqhbUM
         WpprSZV0Nj1nhIK6sdCd/mdHnjekAtUazD6Zgfbof4AQwlf6cJ+nu9krgbZGJY024tJC
         gbZgKtR2LdKjt1FglyrDKbvAxwApN0OG6Pq+WQu/gfmTErf4WW6MEv8+ASXQ9TvGUXYW
         /vEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228184; x=1719832984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u30lLX5MsP/IKxn1NfwcAHsSmZJS+FIZz7/OFIlaO7I=;
        b=KU1/O9ujmBCad1w2XUd/94PjhzI9TEsoZmKNgyTBHqEVsynwl76pd/L5YxUJ3Y8kLL
         uqw81c7EzOzycuSU7n6rLvF0Kyz5y/Z7ccFdZmLuKjL4RDLmmE2jafjG386RDkurC6uQ
         Gr3xgLuPcGGzMq24P5yzbu7axnTgh6/PLSDXdIKKYWePfh9dMnxFiBs8hllyCNgLDTYA
         3Z3ql2eucXld1/UwOusOOcfs2WYRJ2ID8Qh/uFZc91EoUPXkzt6eIIkpv69GkpMzjxjp
         oJ7mQZu9jAUFaVPNcaV2338TzJwCKgdkXWHqcH67Ns7oZKAPy4wBdofsOCVB2xtkNjhm
         hv5g==
X-Forwarded-Encrypted: i=1; AJvYcCVuP3wX3+gC2qcwcn1yTceSaSIVdiWnTC0jFmtjVH1DTtW188vZ21PdThxT/u5oUGbf33t062JjRkH61rvMKxIqQqeGvy9fhTJ6EsKTmN0UBS4=
X-Gm-Message-State: AOJu0YxpCCKL1uNTdu7e7N9tUK+SJbjMBLnLiLcsZbJ5Sw/aR0TLDU2+
	DjwqSvWDSCd8Cg4l0/YPd+9WtV5H8NOTUohe6D5mMs08eO1Gd7OD+nUxTfklwiLCK6UVGmm6tOH
	PvosuFobYBzXaCXr56X2E+gVyQulJythr+QTwig==
X-Google-Smtp-Source: AGHT+IEMLOPKjw5oHjHxY0zCeeuDJx6nBikXHAv0mrWk60i33NBz4cPxYEwhe+RUgp41xs0jTLpfBU3mUf65mTiLoME=
X-Received: by 2002:a4a:345d:0:b0:5bb:3ab6:94d8 with SMTP id
 006d021491bc7-5c1eed472c1mr4618521eaf.6.1719228184148; Mon, 24 Jun 2024
 04:23:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org> <20240617-usb-phy-gs101-v3-3-b66de9ae7424@linaro.org>
In-Reply-To: <20240617-usb-phy-gs101-v3-3-b66de9ae7424@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 24 Jun 2024 12:22:53 +0100
Message-ID: <CADrjBPod9w5L_SNFCa8+=kzasnf8g6MmGC6m9E+kF8spu37Z8w@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] phy: exynos5-usbdrd: convert core clocks to clk_bulk
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
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

Hi Andr=C3=A9,

On Mon, 17 Jun 2024 at 17:45, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Using the clk_bulk APIs, the clock handling for the core clocks becomes
> much simpler. No need to check any flags whether or not certain clocks
> exist or not. Further, we can drop the various handles to the
> individual clocks in the driver data and instead simply treat them all
> as one thing.
>
> So far, this driver assumes that all platforms have a clock "ref". It
> also assumes that the clocks "phy_pipe", "phy_utmi", and "itp" exist if
> the platform data "has_common_clk_gate" is set to true. It then goes
> and individually tries to acquire and enable and disable all the
> individual clocks one by one. Rather than relying on these implicit
> clocks and open-coding the clock handling, we can just explicitly spell
> out the clock names in the different device data and use that
> information to populate clk_bulk_data, allowing us to use the clk_bulk
> APIs for managing the clocks.
>
> As a side-effect, this change highlighted the fact that
> exynos5_usbdrd_phy_power_on() forgot to check the result of the clock
> enable calls. Using the clk_bulk APIs, the compiler now warns when
> return values are not checked - therefore add the necessary check
> instead of silently ignoring failures and continuing as if all is OK
> when it isn't.
>
> For consistency, also change a related dev_err() to dev_err_probe() in
> exynos5_usbdrd_phy_clk_handle() to get consistent error message
> formatting.
>
> Finally, exynos5_usbdrd_phy_clk_handle() prints an error message in all
> cases as necessary (except for -ENOMEM). There is no need to print
> another message in its caller (the probe() function), and printing
> errors during OOM conditions is usually discouraged. Drop the
> duplicated message in exynos5_usbdrd_phy_probe().
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>
and
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Tested using my Pixel 6 pro device. USB comes up and it is possible to
use adb from the host computer to the phone.

regards,

Peter

[..]
