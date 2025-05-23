Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C84F297130
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2025 17:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748020000; cv=none; b=nu54rS7G/OZmii+DyYjkm/wVmMbSOMOqRB85OmglcHEWd9qLdzFO7IOOWw6us14ES1/OFdpHOv2YNYslx5jDC+dPdIxRsyDjGMfYa56fJJ7suopExP3KuHgxCa2FRTSFIRcJF1l7xk5KlhtmfBgF1s9Mr1ZhJVfC3b9l5EgIZ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748020000; c=relaxed/simple;
	bh=U3JZBSRTDoFHSSt8crCVrx4Xd0izWnpj1PNPW8N/9vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zjw68rX3oJVogqFRzWDQbI6mh/bxdA7q58axZK+2mTh1TkCZziI/i25sGJtVQ3YsXVmhluvgK2g4pMLJBVElQPjKIHXDi61fst55IdstjAO7OeMMnPsmDpswskeATCaScgfpbxsUK/XV621tsoW3NYPkt4wnhYhmaOFrevxIbME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ccvxpeFT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ccvxpeFT"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22e09f57ed4so10555735ad.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2025 10:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748019998; x=1748624798; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J2WQ2P5qzSFyn4X0KDVk0we+dt/QLk97LlbxUNEkevY=;
        b=ccvxpeFTBW8wOpc3ExvQLS/v381IaNBU7rpwQ9SadWh76KgNHcAzuM3ULnDdOapbPv
         jBin0rE4rSTNcdUKk4PImt0x6aTpriyRUdEPkDxA2vSPEtH5Op+TA9emoZFLV4ikfjff
         zZl4QMfMn0GNatjHoxajFvZuvzF0Mw2lkx6+UL04UO66jeD6zzv8eGFN4S4vEavqdQpI
         9HPVJ+kW+1BASF2BBcUHWNVFEO5lw420CIJ+2Cyc3zTiXFeizn1ji/PRZK7XX2aNUEkE
         yw9Ov8j5zVDqRoMHhKuT6c4tnR3v1mze2N6rG+cvO/cikPum7uhHOQ3svO5baBbqX0XQ
         nGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748019998; x=1748624798;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J2WQ2P5qzSFyn4X0KDVk0we+dt/QLk97LlbxUNEkevY=;
        b=HH0UVNLhZQ8mEc9STjR8g8AYf2Y4eSK7qs2D68yxBgE+w7sJXP3c9VFYUNuVekzOMy
         r9t4PQZHI1A5ILRu86DMRQaDBae0ms75jHrH2JHPs5fHH7oV/rA1niP1KCqsSnQe/VNu
         3Oam8UrvJannP49+QV6nLwPCGv2Fqx8a51AF6k5SuzhYwFhi0rutaix2oddu8bPEtHsz
         mq0xrCFukqLVm/dJ7+hgQm3bLJYlDyOemrqGQTMqhXZPVyNgpcqe9H0fAmBbujuLYGJN
         YnOSEWyoph0LHfeAMKIHLjQ3+BsepvH++ADB5Vo2pX5esTXd2WcMOww6EYKWAGYeZct4
         0/Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXA56oZCQB25PKHfRiFG8KmnIC2B+H8XJWSgAGYfd1ebXIgTjj66wVNJJF+FFRi4cBrkv7Vf8MEJZ64UsCt990C/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZD1WNv7NwJrUUTLIoUewDvmbVOY/3AahN/xqbZZDdN2WHeZjt
	mGYM8nhcciV7OEBJeBQWB628TC1SmeW5h56E7YCuAt6jVnHxr1J7JObWMOR3/hbhww==
X-Gm-Gg: ASbGncsoTQp+m6/wRG5Ruf3rL0jNwkSgevOGT02ES3NExlJR1tqv+IvBBFV6XJhRVe+
	ICkKIxRR16K0+OfNrhs3syLL5z0FZX6rXx4ZUGU4dCPqSRQa4HJfCsD4LIWUMqFGLhGajgmh5wk
	1kH2kgunfDGilTnn1MFXO6BFWuXpIWRpcMg3e/xBvKW3SmbZV9W4s83aw8MI9N9MIhNwVo4pstT
	CKFF96aYeuM+8PiCoeA2PxfHx4UY6SRyJl6ZlooMTSnHibHKt9hPW3vNqkzCHZpT+9/BfkX+/xf
	qHyu9jwUyaQRVBRz3mBlUT21vgzX9Kajs+1WZl9A8i0jHkTfkoi0c1MNfZuA2S03hG/zlZHXtV9
	4ctxuHOXODyn8OToUcbD4TA==
X-Google-Smtp-Source: AGHT+IGVnaBi3jrRIwejKFDsONlHqePRuzoHWbgSbVetz1AYxiDu9Tm/UL+XQC5bZ+1BERzM5r1Wfw==
X-Received: by 2002:a17:903:32c8:b0:231:ad5a:fe9c with SMTP id d9443c01a7336-23414dc9914mr3358605ad.15.1748019997911;
        Fri, 23 May 2025 10:06:37 -0700 (PDT)
Received: from google.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233f9e17e3csm10816895ad.177.2025.05.23.10.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:06:37 -0700 (PDT)
Date: Fri, 23 May 2025 10:06:33 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: John Stultz <jstultz@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Youngmin Nam <youngmin.nam@samsung.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
Message-ID: <aDCrGT67ubNNUoUz@google.com>
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
 <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
 <aCNctHq6K7uqFF05@mai.linaro.org>
 <aCUkN301jWUkXJ3_@google.com>
 <6e6b0f5f-ac60-48bb-af6c-fa58658d2639@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e6b0f5f-ac60-48bb-af6c-fa58658d2639@linaro.org>

On 05/23/2025, Daniel Lezcano wrote:
> 
> Hi William,
> 
> On 15/05/2025 01:16, William McVicker wrote:
> > On 05/13/2025, Daniel Lezcano wrote:
> > > On Tue, Apr 15, 2025 at 05:48:41PM -0700, John Stultz wrote:
> > > > On Tue, Apr 15, 2025 at 9:50 AM Daniel Lezcano
> > > > <daniel.lezcano@linaro.org> wrote:
> > > > > On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > > > > > From: Donghoon Yu <hoony.yu@samsung.com>
> > > > > > 
> > > > > > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > > > > > boot (and even after boot) the arch_timer is used as the clocksource and
> > > > > > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > > > > > source for the arch_timer.
> > > > > 
> > > > >  From a previous thread where there is no answer:
> > > > > 
> > > > > https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
> > > > > 
> > > > > I don't feel comfortable with changing the clocksource / clockevent drivers to
> > > > > a module for the reasons explained in the aforementionned thread.
> > > > 
> > > > I wasn't CC'ed on that, but to address a few of your points:
> > > > 
> > > > > I have some concerns about this kind of changes:
> > > > > 
> > > > >    * the core code may not be prepared for that, so loading / unloading
> > > > > the modules with active timers may result into some issues
> > > > 
> > > > That's a fair concern, but permanent modules (which are loaded but not
> > > > unloaded) shouldn't suffer this issue. I recognize having modules be
> > > > fully unloadable is generally cleaner and preferred, but I also see
> > > > the benefit of allowing permanent modules to be one-way loaded so a
> > > > generic/distro kernel shared between lots of different platforms
> > > > doesn't need to be bloated with drivers that aren't used everywhere.
> > > > Obviously any single driver doesn't make a huge difference, but all
> > > > the small drivers together does add up.
> > > 
> > > Perhaps using module_platform_driver_probe() should do the trick with
> > > some scripts updated for my git hooks to check
> > > module_platform_driver() is not used.
> > 
> > Using `module_platform_driver_probe()` won't work as that still defines
> > a `module_exit()` hook. If you want to automatically handle this in code, then
> > the best approach is to follow what Saravana did in [1] for irqchip drivers.
> > Basically by using `builtin_platform_driver(drv_name##_driver)`, you will only
> > define the `module_init()` hook when the driver is compiled as a module which
> > ensures you always get a permanent module.
> > 
> > [1] https://lore.kernel.org/linux-arm-kernel/20200718000637.3632841-1-saravanak@google.com/
> 
> Thanks for the pointer and the heads up regarding the module_exit() problem
> with module_platform_driver_probe().
> 
> After digging into the timekeeping framework it appears if the owner of the
> clockevent device is set to THIS_MODULE, then the framework automatically
> grabs a reference preventing unloading the module when this one is
> registered.
> 
> IMO it was not heavily tested but for me it is enough to go forward with the
> module direction regarding the drivers.

Great! Thanks for looking into that. I'll add that in the next revision and
verify we can't unload the module.

> 
> One point though, the condition:
> 
> +#ifdef MODULE
> [ ... ]
> +static const struct of_device_id exynos4_mct_match_table[] = {
> +	{ .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
> +	{ .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
> +
> +static struct platform_driver exynos4_mct_driver = {
> +	.probe		= exynos4_mct_probe,
> +	.driver		= {
> +		.name	= "exynos-mct",
> +		.of_match_table = exynos4_mct_match_table,
> +	},
> +module_platform_driver(exynos4_mct_driver);
> +#else
>  TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
>  TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
> +#endif
> 
>  is not acceptable as is. We don't want to do the same in all the drivers.

Are you suggesting we create a new timer macro to handle if we want to use
TIMER_OF_DECLARE() or builtin_platform_driver()?

> Furthermore, we should not assume if the modules are enabled in the kernel
> that implies the driver is compiled as a module.

Ah yes, that's right. The ifdef should be checking
CONFIG_CLKSRC_EXYNOS_MCT_MODULE.

Thanks,
Will
