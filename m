Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0672EACF2
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 19:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794352; cv=none; b=dOZaKVVmSYp0vINWzQomVuT5oVKK4TvXOVs87vrRdIMuJ4+SzpK8ThQ6xruRpxAi9M9ksHVmvQI1OeihsRp7CtVFStJF/94DYt7Q9X2aluXuhaVDHTf8VgwLIgdNfNII2KvcQ+UgmDNc0rLMiHqrEmbKcI3MiLcr7T+3lkgmXAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794352; c=relaxed/simple;
	bh=kGEnlzNr9Zb878AZa1b7vvDvLKPv+xFVLBc4sy4VEnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4qB/fc5/x9neq0yg6TX4p2gZiwBKlLxEg6MRs9DCqcE+H3E50o63+7cUFtCg2r40O60BYj4gzo5E0wcENFCxKrpR3hGWtzVAxKzOQIHlzYAGkZclXJKLL9oUcCDFhwDxtdP61dYlQsOD/FnGOXuPhVKMH1ugbFBFyrvcwXb6z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uvz+GWRp; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uvz+GWRp"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b5931037eso6916821fa.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 12:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794348; x=1751399148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGEnlzNr9Zb878AZa1b7vvDvLKPv+xFVLBc4sy4VEnE=;
        b=Uvz+GWRpTRnT8nKtxhEc/eCo7ZG5NAvzQCPFuUyl+e7x4xx34/OQVluMhmvu2AMSX1
         afYwoBsuAd1iyqI8sJGGp0VLXRYjybuRn1C+Z3FdRI0+PJyfx05xsjhGZnr1alWI7taj
         9UY3ldcznOUMO77Dtryz/RDlY5G35wQt1xyq17iL8qSzfDXktUtM97Xk3G7zr0fdxHIa
         bn03ruHMVzVdAlW8z6EPnIPdDwDbbZ8qHsV9N6XoyxjgUuffNOQeWAr/3W3rlhK3bHyb
         ui9ne4B1nQQWlcZ7zsAUHBPwBycSu9tDthaM8YesgizqXmRdQFI8fO7AVAkzKn3sQu7S
         oBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794348; x=1751399148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGEnlzNr9Zb878AZa1b7vvDvLKPv+xFVLBc4sy4VEnE=;
        b=K7ELWzDcAP9sNz+P8OOxIXuOZ/K1A6LzhfIMrBupG6L3FBwPvR0CXZzjkkxPdDLasV
         ZzU75J1X3FmBnvzdvBYTB8ZR72pHwoN4PcbrDPcHfCfbDj/aAgl3YiXVF3d5BR0YDsm5
         d/zt77N27nyrLR0G2b7DIibRpk19uFbY+iRhqvtJtuBtOOqFnyc/tBGl3AZe623J8Hg6
         LL0Z9yXX/3VVQ9Y1oBh/T+imDMjW+ZIs1IEkSi0iD7sSYNEyUdS8hslxFPRsuFY1af69
         yTetxn0cGq0TFoZ5PiimssRS1sjq7+xOJ6gGt8r/3Ho5b0lWxAKDevWswLUHhEU11lcq
         W3Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWM92WIE/VUqXHpd95TENZyiacfZJHRr/T7lLy87cS+pvHwiSvCWK14UwQx+fak/5KD6Og+XtXSmMp0oGyX1Bl/zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwRof76DdmlE06lPDVDcD5BEf1mW2cRWiuv+8+7Zr82vWl9G8t
	wm0oXIemaRjXp3QxDOt0rqbS94CSnteVHpfQW8lK4kqfI99UxtOFNO/9V75eo/BPaJLVgKYKPDf
	IXjX10Zgw7S9SOo3g8b7ZAcASYIFYIrHhmlR4gtqq0Kf9roBp4LEwsjB7iA==
X-Gm-Gg: ASbGncvnpaJF6Sz3wb0XfF3ZNTFeO9E64Y0z9OqHBt1lrK4LBn89EjjIJmGM68WIE7N
	BX7mRLJ4KeS0lSd7aOWAurmR5NFaheLqEzRjsbYOMSfP52VIbJgyimNvzxJiGC6jzNdP11B6xPn
	YiscikpQmwV1SI0XC+381mL5Yu1srQPnVlXfsrgeoILfFwQ26c6jviWQ==
X-Google-Smtp-Source: AGHT+IFmqiLtBv2UOTh1D8iZHZIySmZyFDbcKWQIsCqDE3SSo4mBAPZZgwKH6/ZLVohgVWg9CA+g75neATAOTu7gWuo=
X-Received: by 2002:a2e:a7c1:0:b0:32c:a006:29d5 with SMTP id
 38308e7fff4ca-32cc6432fc5mr199911fa.9.1750794347783; Tue, 24 Jun 2025
 12:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-4-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-4-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:45:36 +0200
X-Gm-Features: AX0GCFuxMgt5rF_SL0XMbgco8X42yBA-5q-4FLSXTx6fBKQwC2WxaI2emdRh8Cc
Message-ID: <CACRpkdYTQywBeO_NSdjHZFAc3GizCpM9bSU2W+o59vtkp=Cf8g@mail.gmail.com>
Subject: Re: [PATCH RFT 4/6] ARM: omap1: ams-delta: use generic device
 properties for gpio-mmio
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
> The two latch GPIO devices in ams-delta are registered with struct
> bgpio_pdata passed as platform_data to the gpio-mmio driver. We want to
> remove the bgpio_pdata from the kernel and the gpio-mmio driver is now
> also able to get the relevant values from the software node. Set up
> device properties and switch to using platform_device_info to register
> the devices as platform_add_devices() doesn't allow us to pass device
> properties to the driver model.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
