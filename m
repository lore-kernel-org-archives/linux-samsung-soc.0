Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61D21DD873
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 23:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747264575; cv=none; b=QIzFlAA/v9ylpTNuAoAJNT49lwNLGyvtaDO6TarxIi2S4ICuMwFhmYW4xkEekN41BfvKOaN0tmdSoE6mJpGurMSU5IiBqcBuYyBRVtGKIM4be3+8zRTEpY2Qu05ZqRiFQU+zQx6lWSHdhwHdXcrdOmbtYzktXyV3cw4iq5DCJM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747264575; c=relaxed/simple;
	bh=hGjmz+ytr/ERYvZjZjC0xo/IsJHm8WfohuB4torFsQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnFlLKDLP81vKajCtxkU3T3ZfmlWY9xYOZxfY+khRyjUUCqR9diJftwcq64jVu6Dlxc4WRvUhjtY4Xjbp5pR5Xr30QeahgKzSTyeYAtnfaF5kVizzE4q3NXz6JZ5T5J8Yie4ODAR/aHQY16iJVbaHN/uH7FJT4az+NX+pyCkUF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lg2A8T0o; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lg2A8T0o"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22e661313a3so3646505ad.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 16:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747264573; x=1747869373; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tK7PATuM2XObswlBZPi3Fy1sqLR6TUymd28Xe7Esnew=;
        b=Lg2A8T0o8bzWpDN8ErKYMbssWda/KfoeeeLrF1cf2PYrdvjbwyarbpJtaevAQ6xwJC
         63wbismnblBfWVZNEt/IrDBe8C5wDdeLuVV8a1zbuLQJkWwoz4Ta0Fm8nx05DYlgJd5O
         bLmKXVb02tEQ2e5FX1wqAmTs1BrpZYpXsBCk/KOgoxZGbnzMI2gp3eVySWeirRNwQYX4
         mWnHGF9Rol8az2bKMTHzVJWLdQsPQBxbuhK9MsjIs+x1GYlmyLq5+l16mYXIeVVKrLFa
         YUZVjP3v4BO0UGiBclCuHn+ICVX+frmlLeJ1bsJKDPFpz5EgG95qxjVVCu5K3fdTLI2A
         uwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747264573; x=1747869373;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tK7PATuM2XObswlBZPi3Fy1sqLR6TUymd28Xe7Esnew=;
        b=lK3NOOhIqJ3swdgrid4fCMvTwLO/HAjuumVX9o8273SyjPbunc7DXdHF5ljWsGxc2C
         +G5z/uJpDcSimjTB62pnrIKj2oNl/erxAZen/74UUoim8UbT/CW0ufEgX552Fp9JHcTx
         XJgScUgj0nem8tX38tNqOzl18SWUrF99cvrkhR5spr+x/DdKFp1UieyMsRhPmeV7BOTk
         Gn3poR/Og1j3sLIIgtYnS60ziJZzA8NnrrUFCFYiBducgV5TZSVsxTqw1TW0aCDjfoJs
         y1PUNjeJ5APcT0cEADMwK+QCfroNxbIwiV11gMhoXCV2+OkFSRjyaENBTYJooPNmt2/K
         FEUA==
X-Forwarded-Encrypted: i=1; AJvYcCXTQYFhYZyTUr+j/lm5YMYLnKb02PVSDWjiU6ZgZ3irqJM8jW8/2H0sJ5Hk7SusYJhxkefcExLIT6yymbRfxEYGzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyts0I3ty6ctzao0GdnTIwaym/9NbA7aMdTP+FYYH1iEqZDmJXs
	VZtycFx83kMv5lXRz4ITMFwU1uiHgNraqqqqm9ztDbQJQ/RyIKfW//RIF/Rp7Q==
X-Gm-Gg: ASbGncsuKgR/dNpOeGSWXqUCot1XUC9ihIPwig+mKJEGpws/0nJ0KsYC9N8g0GRqHeC
	u2fMTht+xoZhC5jVhMVyTWMvdWU9hLla8DAlBOlfPib7v0QqbJ41Fk17+0BG6hKLTTrDZFn4uP9
	mq6v3/n9u4MHUuhUjzME3dTIRsQ7R3oHfZUGv2Ts0wDlnTT9Gb0y3fnhZnlRcc+dRoJSOpkvCrs
	P0/Nx2/JE228fhEf2EvdJuPaqOMvI+BSIzhYPpX4uAnyPblPY+bjW4qbNbxOSgYVJuQCchdwq5F
	oBtwArwfjV3SIrBoEwFUD3NYZBW97ueEjEoIp+cv/6cY9b8Q32vcbf2MCaKRsN1l5ECC2TdbzPU
	KHP4aLhaAvBA=
X-Google-Smtp-Source: AGHT+IEsrSGIrRf/QU64B6v5yFPwGzw3MqjHwN5SfWQd/PEk8gnJbbur5kF7m6fDr23b53A05xfT6w==
X-Received: by 2002:a17:903:228a:b0:223:60ce:2451 with SMTP id d9443c01a7336-231b5e26004mr5188935ad.15.1747264572659;
        Wed, 14 May 2025 16:16:12 -0700 (PDT)
Received: from google.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271a67sm104886415ad.114.2025.05.14.16.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 16:16:12 -0700 (PDT)
Date: Wed, 14 May 2025 16:16:07 -0700
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
Message-ID: <aCUkN301jWUkXJ3_@google.com>
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
 <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
 <aCNctHq6K7uqFF05@mai.linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCNctHq6K7uqFF05@mai.linaro.org>

On 05/13/2025, Daniel Lezcano wrote:
> On Tue, Apr 15, 2025 at 05:48:41PM -0700, John Stultz wrote:
> > On Tue, Apr 15, 2025 at 9:50 AM Daniel Lezcano
> > <daniel.lezcano@linaro.org> wrote:
> > > On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > > > From: Donghoon Yu <hoony.yu@samsung.com>
> > > >
> > > > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > > > boot (and even after boot) the arch_timer is used as the clocksource and
> > > > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > > > source for the arch_timer.
> > >
> > > From a previous thread where there is no answer:
> > >
> > > https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
> > >
> > > I don't feel comfortable with changing the clocksource / clockevent drivers to
> > > a module for the reasons explained in the aforementionned thread.
> > 
> > I wasn't CC'ed on that, but to address a few of your points:
> > 
> > > I have some concerns about this kind of changes:
> > >
> > >   * the core code may not be prepared for that, so loading / unloading
> > > the modules with active timers may result into some issues
> > 
> > That's a fair concern, but permanent modules (which are loaded but not
> > unloaded) shouldn't suffer this issue. I recognize having modules be
> > fully unloadable is generally cleaner and preferred, but I also see
> > the benefit of allowing permanent modules to be one-way loaded so a
> > generic/distro kernel shared between lots of different platforms
> > doesn't need to be bloated with drivers that aren't used everywhere.
> > Obviously any single driver doesn't make a huge difference, but all
> > the small drivers together does add up.
> 
> Perhaps using module_platform_driver_probe() should do the trick with
> some scripts updated for my git hooks to check
> module_platform_driver() is not used.

Using `module_platform_driver_probe()` won't work as that still defines
a `module_exit()` hook. If you want to automatically handle this in code, then
the best approach is to follow what Saravana did in [1] for irqchip drivers.
Basically by using `builtin_platform_driver(drv_name##_driver)`, you will only
define the `module_init()` hook when the driver is compiled as a module which
ensures you always get a permanent module.

[1] https://lore.kernel.org/linux-arm-kernel/20200718000637.3632841-1-saravanak@google.com/

Regards,
Will

[...]
