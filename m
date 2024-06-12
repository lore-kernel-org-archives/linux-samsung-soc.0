Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA7416DEA3
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2024 09:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718184999; cv=none; b=qUTmjf9QEkXXYOse1tOr84MQuHMx/+fkGGCEXMLs+tq4aqi2nxalITaN+ldUL6BgHzlec+s4JGB56+YahNG5xfL9KDHE2uptPrrrlPvnlSaaKEA+YF4k53rbazfEOHikLmd8+rsPfHuyE+oXPchcqUzqg74u7A8pSjFCMU5DvMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718184999; c=relaxed/simple;
	bh=1DBKN6+Dh1Qa+D6idOan20UzNrMjKS7NMiz55q78mDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olV4laoghnZGCIXe/8JXt9h/a4e+UihgAkybd0eXbWq6HWfD/oSFt7UK0qWgCgw6oOsh8jcNPt75/8NOa+v9qJF4YckXkUah6J/RotUgKgZkDfHdMaaOk28MQNspUBTZlBNKZ6R9XKKig6RGC9ZPzUCSHZIj3SuI0mV43tskN+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFirGuZb; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFirGuZb"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5bafcb42d28so1089625eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2024 02:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718184997; x=1718789797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zls2PjeN96MBj/tRd+drvu+9AaG+9o/48mGsjcvAGWw=;
        b=kFirGuZbjujrg7Fksp0/wPZcE/6pjfgfw62j/0dE4c9rS2xG50O7L6e2UQHTL7SBNL
         Qu/FXbO3KtnpltMSnY4d/77N8zMZi9E2aRPsgONZ03X9jLh748eet/r9F4x7WJdUkvyY
         Wuem/N1aWtmI1HdOBFJdd31xA27NIAqvpBUoA/hrhMpy4EWyMrk47WOTP3CmtFpgrS40
         qhTgnHLbXbLPyWfSUBSbhBD/8A4AH4hIo4qf/6+7A+9FAPE0gtPEad94yHwIOwsw1Yv+
         wyyMIZ4bEJhmJhw8paR2LL+T/qYVx+VIxTIU6hoEJYVRuX8WQ5SmjaSX0XfUhzYWD/Uj
         kg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718184997; x=1718789797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zls2PjeN96MBj/tRd+drvu+9AaG+9o/48mGsjcvAGWw=;
        b=B12v7o3hilhu2mOqEmLHWPXTrpY7XC7b5xGwFBft7FEz1T+OFteasmiBV5Ei4goofo
         y2qm7b46zoyZigTwD8g/zQGJy8tFLzWi41KrGDUgiBxi35O4MVHiEGkJiRZ5o3cWsAa0
         76OL/GwTzPXdqFy+rczZTzPrqI7eJozNEXY9WV2pRsgFvLiB5T1piQ7Wt4yqmi3eGtis
         EQPg31yV3evGhaahYbbieGUjvCHVZDz1koiaiFgv3drZ52jhJKuvOV3fB1BkdnfaYoWh
         EHBuaBoZuk2HNtX2ggL1RRgOO962Wvm4sk9iWoSZgzpru6P87QmG5unPLVjTvyy4Qa/L
         OKQg==
X-Forwarded-Encrypted: i=1; AJvYcCUFBhvNqdnF+M5ut5UmNEJUXywr6n5lMAZox6jaFKbX1/g0RAQDbx49L9etBSzRuCfciD+90agc/aN9rqwB2sP5Qm1ze9qC8QxfBu1X3lNPMS0=
X-Gm-Message-State: AOJu0YweYS8cyQF2jqVwrd1cyo3ut0O7+stFJourVegzoDWXYUOrAQem
	Pk8qM7jXGDnRFeB7h/EZZTVMz55IioKC6WosQdoYhGk5zqCE8n2l4pbJhbduHTtednWeESq1kN2
	skhm55drBKgVcqmby3ickDOm8ZU8+CDofBh1dBw==
X-Google-Smtp-Source: AGHT+IE41xMremI9KFQUhCySgvLj9p73+kYjRPEZjElNgdLOUBTOPohyPwVNwxRkyxdmcQDgsd5j+uZYm1dpTqpuuoA=
X-Received: by 2002:a05:6820:612:b0:5ba:bb77:bf51 with SMTP id
 006d021491bc7-5bb3b9410a1mr1738733eaf.2.1718184996962; Wed, 12 Jun 2024
 02:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507-samsung-usb-phy-fixes-v1-0-4ccba5afa7cc@linaro.org> <20240507-samsung-usb-phy-fixes-v1-4-4ccba5afa7cc@linaro.org>
In-Reply-To: <20240507-samsung-usb-phy-fixes-v1-4-4ccba5afa7cc@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Jun 2024 10:36:25 +0100
Message-ID: <CADrjBPqM-6vu-9+ZZ-=BKqnAn+vngELBgrLtU1ua_DMrDaWjXQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] phy: exynos5-usbdrd: fix definition of EXYNOS5_FSEL_26MHZ
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Tue, 7 May 2024 at 15:14, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Using 0x82 seems odd, where everything else is just a sequence.
>
> On E850, this macro isn't used (as a register value), only to assign
> its value to the 'extrefclk' variable, which is otherwise unused on
> that platform. Older platforms don't appear to support 26MHz in the
> first place (since this macro was added for E850).
>
> Furthermore, the downstream driver uses 0x82 to denote
> USBPHY_REFCLK_DIFF_26MHZ (whatever that means exactly), but for all the
> other values we match downstream's non-DIFF macros.
>
> Update to avoid confusion. No functional change intended.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

[..]
