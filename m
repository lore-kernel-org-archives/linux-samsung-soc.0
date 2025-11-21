Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09061F09AD
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 17:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763747525; cv=none; b=LFY0k9HvSIvrSOIt9wWFQa1sdlfZxp+/+3gLeDV/SzsrlTsUi5jA3wK5A6i9gE0USpC5J05wXr+jU3axzhd8JYz2WtafiGuJyMGmsFM1x9hHwHAZ/MJeN+UidI8SSKMmRyaL+/tU1h0urDo9AseQooKnnJHRekAVo+maGIy7oc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763747525; c=relaxed/simple;
	bh=H6Nmw2cOUCXV1RMAwGf1wSN9k4qMYCw+aluImtFnens=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=klwz7743Dvv8TE4s1P4qRWKc8pdmGSC+LZoIoVTDea6nXJIev4ka4s/D36bj0B+3jQAM5hlfAwwJD2IXRsjM+G6IGjamcEqDCNdSUZFGBDIqRGs1iXykiYwjRe4UPaA5hjGrQQY0Rx7xTC91KusUnS+sYgeZRRWuiD+uRupjeI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pyOwuSxW; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pyOwuSxW"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so2822105b3a.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 09:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763747523; x=1764352323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZYN6CUWohQloljnDLqdKdUMC90qRAZ5XfNki7IHyQA=;
        b=pyOwuSxWfMObuvFKz9K5jHMEl70J5FmSrsCekpxvMyct1hPQjkcHo9kIHJLBnE8Kqv
         XhbM63q6FrutqEomifISBHFQAjG4Qw2g5MmLs2n3qZ7A8DYfzAV5u97DXpDfaX6kYuUH
         B7eUOE/o4gj21yx4j4v1DC+JtHLwRQGXlCgsOcc56mDZPUeQP0XUIRTy+DOqh7w64+A+
         Hm1Cq1Nts2q7b+zjBE8Xcs93AxXwtoiTxoJyaQJyEHqyCeAcnhy6HVoGcSPpd/dOfHPe
         E3sIKCHT1kAFKxKYn8TGUorh0UM5E43lWXLH2A2dluRSCtOsmog+6q2MtV20L9Puxcvj
         Gt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763747523; x=1764352323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZYN6CUWohQloljnDLqdKdUMC90qRAZ5XfNki7IHyQA=;
        b=pd8UGV327rHFOyrpDXEFvXdq8IE+lVdZurUnindym4RS9cDV+gbYnrQJxGhicVsNlq
         JISu9ickHvk5mvGDJPKC5/LqLeVXXDBOxzOj8IJYg4uganRaQKU9M4obCA1UfFWLS1N/
         W9NPR1FwpbbliD7698dk18Bom1A77TvCieXkKEgm/am32E7d6xLSHkjVBohe5hIc18q9
         dqzUpsyuOi9/NR37UsMZdasNhRzQIXYf3hdFkkJqdeRex+5TngRseaglWLnowoM5ttjB
         TvbkpyNvKlF5paepKUT1UL4/md1ukE2x2hAEGTh4ItQYVIWSl5MWQ/si6x9z0NnRmLcj
         jlpg==
X-Forwarded-Encrypted: i=1; AJvYcCUfbntKGcMxe7k2fG34gATTXRfP0QEL+RFqE3DwAmlI9q9ne3q5AT++/rMLquRooGz/0SPeuVBv7GqKpvLcObq0+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYosiPwOkqNOLAMcg4icXCwOleEBz2nwuxJ/Wnw/N41tsK4snI
	DxyrITqsd6HYghKdzNWvD8d5rV1tUqEzVtgvpF4UfYDaA9bWKv1szhWhykVXSOOb+w==
X-Gm-Gg: ASbGnctAfthSbCJNwmVjUXv7Dt3HCwViQq/3H4h1zQL/waViULJnrbPulXWwna0ZvjL
	xGBYRQLHAnf7+UCQ6E5nJVqzNeXgCUnWVTU9n6gsY+DBEfUqGZFYgBvaymBtkQu3Lg0VBr3fYni
	+fvKtBMnB7UkY+MJfDpgSmiJXatrnPku2TS515lpw5YvO1kL4aBiRpoQmXz6etGQ7Tl+isE+cIa
	SSlPCVVl9RamU+8PC7t1MbRuqDiUA723X/hMdaV78LwN731a0gAzJ7wHeFTGQdvO1noLJktIsUI
	juoDr/IjB64zTzrSR6ctU6gPY0E+nHHlN47PiXlxvKikxHOs7WDEkM4ltP516FgKZ2nNvhii1Us
	QSBtYthlFVST+dg9on6d4cUdxqG0wTDks0s3Yd4r3w5i+3GspjjPmvcxK9J6iAM23pSq35oNGy8
	qb1i4uNi/O2Zk+4ixLJmCy47N2tUvJYli7uyfn3qeDeKOZytkJ/3b5vCk=
X-Google-Smtp-Source: AGHT+IFPL3FivnOWfid8exhOdWBbh9Ql9Sf8cs9AXnf97m9xxC/jy3I6lLegY3I666JwhN5KsK/Tfw==
X-Received: by 2002:a05:6a00:9286:b0:782:5ca1:e1c with SMTP id d2e1a72fcca58-7c58e112b18mr3708723b3a.21.1763747522951;
        Fri, 21 Nov 2025 09:52:02 -0800 (PST)
Received: from google.com (226.174.82.34.bc.googleusercontent.com. [34.82.174.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f174ba7dsm6627878b3a.64.2025.11.21.09.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 09:52:02 -0800 (PST)
Date: Fri, 21 Nov 2025 17:51:58 +0000
From: William McVicker <willmcvicker@google.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, Rob Herring <robh@kernel.org>,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/6] ARM: make register_current_timer_delay()
 accessible after init
Message-ID: <aSCmvsOc13Z1TS6y@google.com>
References: <20251120184242.1625820-1-willmcvicker@google.com>
 <20251120184242.1625820-2-willmcvicker@google.com>
 <aSB_bUbfjenD1fjZ@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSB_bUbfjenD1fjZ@shell.armlinux.org.uk>

Hi Daniel and Russell,

On 11/21/2025, Russell King (Oracle) wrote:
> On Thu, Nov 20, 2025 at 06:42:29PM +0000, Will McVicker wrote:
> > The function register_current_timer_delay() is called from the
> > exynos_mct clocksource driver at probe time. In the event that the
> > exynos_mct driver is probed deferred or the platform manually unbinds
> > and rebinds the driver we need this function available. So drop the
> > __init tag.
> 
> First question. Why.

Sorry for not explaining this very well. Let me fill in the gaps.

> 
> Second, have you analysed the code to check that you _can_ call this
> after init time?
> 
> Let's look at the code:
> 
>         if (!delay_calibrated && (!delay_res || (res < delay_res))) {
>         } else {
>                 pr_info("Ignoring duplicate/late registration of read_current_ti
> mer delay\n");
>         }
> 
> So, if delay_calibrated is set, then this will fail. When is that set?
> It's set by calibrate_delay_is_known() and calibration_delay_done().
> When are these called? Basically after calibrate_delay() has finished.
> When is calibrate_delay() called? It's called by start_kernel(), while
> the init sections are still present.
> 
> So, calling this _after_ the init sections has been freed will result
> in the above pr_info() printed and this function doing *nothing*.
> So it's utterly pointless to call if the init sections have been freed.
> 
> Please find a different solution.

Sorry for wasting your time digging into this! You're right we shouldn't (and
don't) call register_current_timer_delay() after the init sections are freed.
This change was made purely to address the section mismatch compile-time
errors. The Exynos MCT driver cannot be compiled as a module for ARM 32-bit
devices; however, since ARM64 and ARM devices both call the function
exynos4_clocksource_init() and ARM64 configurations can set the MCT driver as
a module, we hit a section mismatch error due to calling an __init tagged
function -- register_current_timer_delay() -- from a non-init tagged function
-- exynos4_clocksource_init(). If you inspect the code, you will see that
register_current_timer_delay() is compiled out of the driver for ARM64. To
avoid hacking up the MCT driver with more `#if defined(CONFIG_ARM)` to handle
this section mismatch, I decided it was cleaner to drop the __init tag.

I'd be happy to re-factor the MCT driver to split up the ARM and ARM64 parts of
exynos4_clocksource_init() to avoid the section mismatch altogher in order to
keep the __init tag for register_current_timer_delay(). Given the comments
here, I think that makes sense.

I hope that explains it. Let me know if I overlooked anything.

Thanks,
Will
