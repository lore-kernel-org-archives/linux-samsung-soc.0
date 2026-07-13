Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1EF3B8111
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jul 2026 23:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985312; cv=none; b=K0EN4IGz9LVCuG8vxE3RRa7tzPUqjk64T9GJ90gscSWc9INQl7/KKfSyM4CU5fy41YheyGqIWjnJBdmQV8Fw/Yuef29eFGn/PUQZt45T7a4vhtn5LFtVpNuCC7uIe6+3tlt25vX5IubPeq7Ik5KPLw+MYWyu7hMjxW0gCHRHEis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985312; c=relaxed/simple;
	bh=DwO6y+Ab0cx+SrTxwPQilr6LVoLTkmY/M+Nb0LYw8Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGrJuCSM9GhdYAUrAE6K+KzH1KsQJnt4hG6qOWwStjau1SiV8UvbdruQ8QW50kJ3FtTslRJeNggZEypCw7m+TFPo8nTylPotL86GHPQxLjVidT5N1BitqH1yLeT/ZZ9N9WdrLzkPFQBg4GF90VxQV4A+9Yv4uoez8t2AH3/L9jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHqlKbVq; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHqlKbVq"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8423f236418so344326b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jul 2026 16:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783985311; x=1784590111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MbmA7lPtg8lHve0ezKTNG03RsW6RcvxCYabLXJ2hr7U=;
        b=FHqlKbVq+t0yECzCAxWIuLv3XhObgGhbLkLH6v5x+QgA8NklRsZ8j8BY8J/PaGceGx
         V0obtKTtfdeR7gxwhuAftx1n4KURarSFt3oA3GXliYmtT7FFcD1AhkAEh/JoS/rEd65J
         5NCkALHCqqrZpYGR9RtkJxESLwGqgjMGruP15Gwu7f4Gmt2N4Ki1OpO3QvyPd6tw3vNA
         N/8g3gB2qCU+UrTeWw07+ebH3R7beXw9ijD5ux00bS+kOmPwHSRgB+9wH2GiY3Z5IAVO
         6PAWt3hpqzslab38mJv3/1E/VMQgplFEzDPz0kE7TReRRbRVU7jaq4fOMeZvChRHWR/v
         kyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783985311; x=1784590111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MbmA7lPtg8lHve0ezKTNG03RsW6RcvxCYabLXJ2hr7U=;
        b=rkKBrKvPAAVvGpvuLxnHW3VuS1G5irkER6OjfEzu8LZqruwLWJmzG5kSa9yP3C513+
         2d1ImPzeOYRaepzRw3s3dbTFq1zigG0Y33Z703+Xahcoj1PRZGiczuNAuCeHvj1vDvNh
         ntkg9VMlI7IMmcWvaguSZkWmle4TyhdKTX6tgpUC2miveSd4Ex+kAHat+/RZmF81bJxY
         xIbGEzi7RVucT09fHo1S2xLVC1sKAEOiddYYMZh2+MkQttxzTx5l8028HytUGYx4FGck
         37C9Nt3nz5KEH3ozamRJ4rQ5YDikrQXNwSXCoLO03xgR7kfOXlDmivmu86TczHRn0HF9
         Gm9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrXLzVlmT6vhG5WDGNHC5HNz8vXnPCzheUl3zcAakeEEXXho3JQD/irT+WQkyzpYsD02EKH1REsWbbkS2X5BQ1uIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp59G8rvjWy8qkxiIwzsTpv5GB+JGz/K2UjjqaFhBY1uda4Z3P
	xj6iGPrCCZ9R9Ea0BDry0qHdJlwpCs9iG9L3Ry2EjGtcyPHNl/R9qj+C
X-Gm-Gg: AfdE7cm0ygLvb4THOGzfyzn95H449VspWbFx+NTnYi3Ui7JOGemzGW4WXJxfBLtqtsC
	cHmgNkI5LPimm8VYCUKsHuYg5yQYj7QV6EnIefWZ3dcjO2+eGxkVS/D17DMLY3YEWuMNamXDPkJ
	eMjKufPbHmh9+ebtVCNgKXO57d4X2bxgUpozAYEDPhSHwOvkX2jEMf/ItfbkT4VkOJ5ooQr8JIX
	TxnIwDwctN9QmtWSw8biicJiGgzXEl3erNThVPW9JM/2WohSSZgN1gDUtwajtMwU3mDw9sXTroV
	SHB9ccyNid3/dvG12KWtSHUZtKcDqwjcXEjRp7jWnYwLKPn1Q02mFHUy0hpO1UEBXLmLuKR917o
	ci3pbbmYDVkZiImSHMKHZ6uo2ptALb3X75JREr5LMoizKYjygPRpPgIYuycctPTo+DxtV1sMXDu
	EBaMmfzdbU3aCLj2RkU4xXMtUDTAJc/SFYt41hFKP0tpHhFqELp/wqiA==
X-Received: by 2002:a05:6a20:244d:b0:3c0:b766:750c with SMTP id adf61e73a8af0-3c110b751b0mr11657167637.58.1783985310413;
        Mon, 13 Jul 2026 16:28:30 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e15f:5d5f:580b:f2e9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b987fc629sm28553811c88.0.2026.07.13.16.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 16:28:29 -0700 (PDT)
Date: Mon, 13 Jul 2026 16:28:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com, 
	Conor Dooley <conor.dooley@microchip.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/10] Remove support for platform data from samsung
 keypad
Message-ID: <alVyvlknt7HaRgs4@google.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
 <20260712-musical-shrimp-of-fruition-b921df@quoll>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-musical-shrimp-of-fruition-b921df@quoll>

On Sun, Jul 12, 2026 at 02:30:50PM +0200, Krzysztof Kozlowski wrote:
> On Sat, Jul 11, 2026 at 07:12:41PM -0700, Dmitry Torokhov wrote:
> > Hi,
> > 
> > This series converts the Samsung keypad driver and the Cragganmore 6410
> > board to generic device properties, allowing the removal of legacy platform
> > data and GPIO lookup tables.
> > 
> > We rework the Samsung keypad driver to stop using platform data, utilizing
> > a new compact matrix keypad binding. To support this on the Cragganmore
> > board, we add infrastructure to associate software nodes with Samsung
> > gpio_chips, and add software node propagation support to the wm831x MFD
> > core to route DVS GPIO to the PMIC regulator.
> > 
> > Finally, we convert all peripherals on the Cragganmore board (including
> > keypad, GPIO keys, PMIC, WM1250, SPI0, basic-mmio-gpio, and LEDs) to
> > software properties. This allows us to eliminate all legacy GPIO lookup
> > tables and fixes incorrect GPIO chip names from previous conversions.
> > 
> > Mark, it would be great if you could give this a spin on Cragganmore.
> > 
> > The majority of changes are in arch/board code, with a couple of input
> > matches and one for MFD. If everyone agrees maybe we can merge it all
> > through the soc tree?
> 
> Yes, I could take it via samsung-soc. I assume I have your acks for
> unput parts.

Yes, of course.

Regarding Sashiko review:

- IRQ concerns are pre-existing and will be addressed in a separate
  series

- TOCTOU with device tree overlay changing DT properties in the middle
  of the probe I will not attempt to address. If this is a real concern
  it should be addressed globally 

- Introduction of 5ms default debounce on proximity and suspend seem
  harmless

- Copying of MFD cells is necessary because we need to "mix in" software
  nodes from platform data. I originally tried to handle this is the
  regulator, but the result was worse as it needed to add software node
  to the device after it was created. Doing it in the core is much
  cleaner overall.

Thanks.

-- 
Dmitry
