Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC211F4CB2
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Jul 2025 07:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874182; cv=none; b=Qo1SmaywXVxiPM4krTR2gv/8fmSX2IOipWadVMKObjDaDl+rO0ToDtzDjlX8+t9gbpQnv0hsptIf67aSCRdubEuC3Ilg3wz7zk5zJrcgT8E8JV3YktzALZUxEqnE00Qp1+PkR6Z/qX8uBuh1c87+q+Jk+OrzDI3OUXrVNcPnios=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874182; c=relaxed/simple;
	bh=Eh5nVob8XqBT5H4toPBO7Udtl43mgczbn+4VPn8DZoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HxvxvvJZZMWerLOHAqGbpnSJPKKH+JXk/D9EHjvYRZ6xdoH1rxxENmk7YGDI/2n9vx4rbwkr2aocsxORgPeX5kjeFV2VmXjW+Fzsxprae5jTFI4ETXLgxD2zOcTvFotrZVruPtP2DefZUJ6NuWaAxA0TqyVbuzuTT26WCEoKu2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ChHYPX1n; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ChHYPX1n"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so2372238f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Jul 2025 00:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874179; x=1752478979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKu+RkS0Zdmhr2twn3T0q2HDKxEwF3RB9jkgTUfP94w=;
        b=ChHYPX1nmz0n+W8CMnMDT7zZPn16w0D3pSWC/02A1q8MtyIHzkeqBgPtGe1ZTKA0jj
         gGzwOFiiHv3N/t7ebj1FmgFVWONCdV1M+svymtUoPcYyhks/KCBExK7AwPt3v0QyK6nd
         Mpv5rT6D7+F1Iw+4asZfTaO6GeFumO5uVwOSTdIYm0MvB+tzUcBjTOppISc7kpZVM5eO
         LvwiAozcanHKw5xXpQ0Xx3+n9DDztZvYQuAtOSG3V5bWBZB9jxbAv3fyYPpsBIaEbI14
         4PcJqTsYB/+OFbS5XfM9EXz2uocu+z/qEolNC90DxxQDQr/tju5QBwOWPlu70UaOjXSL
         RR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874179; x=1752478979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKu+RkS0Zdmhr2twn3T0q2HDKxEwF3RB9jkgTUfP94w=;
        b=EJBNw+RQt0McnRxburLZKOZvpvBc5EiPr2Q/5pdujWDjAUeGogYNtVxBNcOzTpTDpS
         BSVOfCF2PG64RzgewnXFPjd9kadT55Eno3W9ZCtB3FsaRudXrZnrt4MVSSvc3xnWOFav
         adHf+Mwsv5ymv2FDREPu2zszdbNFt7+zsXQKwHKtbBfyCmOkP/UC2jqyIdtFGM0ITYEZ
         +cj8R7b0IT7z7hsDXgJQg64l0E9GtyxNLD4IS4QhaWpYAdRo/dRlBHnCDlX7a3OVbvOl
         iamJx9X+UflRKcseA+KP2omIDZLBgBmzNjE/C/x09P9xHm4z0+oFv0aWQQ/kpcbSHBu8
         UNDw==
X-Forwarded-Encrypted: i=1; AJvYcCU5BjTIFDgUip7zFrAdhj4iWY4x4paGxsKnFCwrVJKCA6yxg9MXWB9X5o7FOTCSY27BaJALPrHhDOb5YpM5pXiqiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2BrOyWu3nRqW3yCKJiE2p3lGwkfC06sKrDkyZPHc780hJcmgR
	k5O0eYoD3cjZD5ZN2/R2Nq+ifoDKukdi3awvqvN5XMdmFxrwvSvKj1EpgO50TyrzqGo=
X-Gm-Gg: ASbGncsFEO5A2PeaRqBi+xiCL1HXrmBHJavuRGIx9qgN7STV/4humkD0JVfeekF+fIN
	hLVoiFdG3mnhdeiRPMXGAiu+oTglbWhQvMLRDYKmjK4TSgT8skMscBWwXfM5EJ/kgBAlVuPspAj
	MpUBgJfpkVU4iy7LJ6U26rmwROKjnqeDzzPRiZIt6YU/DqoBGC+XFPSd+yuq6WN5HpcGEiq5xdZ
	+mIYq2yoEEuaAIn4b9OTyLefiGJGiYSNAGDuVuT9KleXcxMwp5XLa76w8pp3MGvOuG4rfS+X7Fw
	ItLTxAKVorl6ioRlvaBTcjhGx+U7MUeDAzci4P+Iua+XrU/0GepfsjAGarfAm8g=
X-Google-Smtp-Source: AGHT+IHNExQVGguYaXAKB1aXj/Vuf2MjgUwaU88wZ/Fr9+ouWScx/ZAWPfXjtQAAvi/SLz+JJ7WmDg==
X-Received: by 2002:a5d:5846:0:b0:3a5:7991:fd3 with SMTP id ffacd0b85a97d-3b495b94916mr10412880f8f.11.1751874178826;
        Mon, 07 Jul 2025 00:42:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0941sm9259629f8f.26.2025.07.07.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:42:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH RFT v2 0/6] gpio: mmio: remove struct bgpio_pdata
Date: Mon,  7 Jul 2025 09:42:56 +0200
Message-ID: <175187417000.11224.18185920121696300938.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
References: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 01 Jul 2025 13:49:34 +0200, Bartosz Golaszewski wrote:
> I'm working on removing the fields relevant only to gpio-mmio from
> struct gpio_chip. One of the bits that need addressing before we can do
> this is the removal of struct bgpio_pdata from the kernel. Fortunately
> there are only 3 users left treewide.
> 
> This series adds support for parsing of generic device properties to
> gpio-mmio, converts all users to setting up software nodes containing
> relevant values in their property sets and removes struct bgpio_pdata.
> 
> [...]

Applied, thanks!

[1/6] gpio: mmio: drop the big-endian platform device variant
      https://git.kernel.org/brgl/linux/c/e567269e246809223fafaee7d421ae17a832fae5
[2/6] gpio: mmio: get chip label and GPIO base from device properties
      https://git.kernel.org/brgl/linux/c/c4a834840596c8b9e388d430154959390f9f96e4
[3/6] mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
      https://git.kernel.org/brgl/linux/c/11cd2e582bf4da87b5fc0f9b07e194daaf212651
[4/6] ARM: omap1: ams-delta: use generic device properties for gpio-mmio
      https://git.kernel.org/brgl/linux/c/094017efe332d411a8d6ac41fd8d0a4f81f72a99
[5/6] ARM: s3c: crag6410: use generic device properties for gpio-mmio
      https://git.kernel.org/brgl/linux/c/bb9c88d5b0fabe05b0ed4b843efe78ac1c4712f0
[6/6] gpio: mmio: remove struct bgpio_pdata
      https://git.kernel.org/brgl/linux/c/9bad4bec5daddbb296481af759f9d56c849ba96f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
