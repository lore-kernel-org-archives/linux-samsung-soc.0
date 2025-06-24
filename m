Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3FF25A2AE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 23:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750808833; cv=none; b=YE/J15IC4RJe1ZF4gaye8JHlziDJnHWltpB5jVWygGStqwWlOdQERL7sBXIJuyA74w79wpFr7RhL4+TwmdLx0eQoqEOSo4qp4AWGVWVh8shiA3ZN2BcZOT5qCrhtH5unEsTwJPLjaaDGQt4rSTOfIulrsHTmP9WD1W6p9G+SOZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750808833; c=relaxed/simple;
	bh=pu5t72IDSgBJFZdw3S6LIVLqf7RGnEHGOZWLadVI4iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqDF7sSKt6e/uu70x5pe9VBUFWwyuNx4T/VQG6NnwKXOpeBUI63bLWHwF56KIdol8bqZ3iaiINDzuoZ86a/lfKfKtBKtYgbp3yP/2cxNNZf8DIDx/OAVKh5jCP72xNYIYeVY3CltWcL7syJushECHrqO/Txx1SyhoE0Ax8LaMDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h46gONhW; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h46gONhW"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-315f6b20cf9so106251a91.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 16:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750808832; x=1751413632; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J4YKMjo8OpNeO5r5Qun2FcCWMfPcqDOXTd2oX2IE1cY=;
        b=h46gONhW8/zNCwanxZSMuvNRnzqFfi9Sor97t4JJ624h701lYqUBnBlhwmWrcJxkqv
         38AGN4h95QIZRKwg29LU8cdrLlRf9XUrPAcRFpMO4AEK0mMa/KFg2MXNZtjOHnKWuTYi
         umHK+vVihqSr0gSurL3fZW0OPXN0XaXm1SLeLo55hk8HUWNmokhSuD6tITcStb0tAEsH
         6Oy6xRTr73yR2Cx6EU8Na+31NeLc9eYrCvbqNrR0qZDp3w0LlvGp+gD7leIeMU5azdfn
         cN460Y9hbE9zoZcH/oLrsO4Y0wE8t8H0MIG2nrn0EnHyYgzJrS4JJ6Dyelx2kMiS+DeW
         w5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750808832; x=1751413632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4YKMjo8OpNeO5r5Qun2FcCWMfPcqDOXTd2oX2IE1cY=;
        b=BaC6Xm4EC0t1agEqjOeqofucKeASogScgKy9CM3dQI2MuXSx8n8vbE4k8p0vxJGFzH
         ZiXPt/aaWC+BvupQN1oEyH4K4iV5T2yafYwFBcfaeIKl3hMek+GjsfAoHlQ4KaAU3KNJ
         X/tM0qRweC5ptekqiJkxKokgI9kSlAuNh7M+mnJm2ifPwCaiCCYOS0W1MO91iaUyoiYZ
         I+ihkhpTY/8eNaLk9N/j+Iv4nCuklexx6atDXt2fJ+asLIY5WJ7XrNJorsC6o5AQk0ES
         IYiKKqgc9wZ4+E7ZbRl9H9o7M/i4OG8DI7Z7lZTk5exwJkKPpAVEhJywYHNSsfPruBTa
         4Pzw==
X-Forwarded-Encrypted: i=1; AJvYcCVGJzdnfFqeBWPNNn45J5Mao7OyBUMzQgmbzm4KOxAWWI5EDHpQHsW+QfQQavgj4pQt0Irx7D+9vmfLXeqNzgQz9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0VjwVDvldXLBvRpyfwehxJ2jXEYvw8YARwGO1n1lmsV3avyHD
	DO+IChJ+S+kiDJinDHjKUrB5Q2hrMy/PLu5S/gnJquLzwbI7a0JnMDGIhXRaSKHBmw==
X-Gm-Gg: ASbGncsmQdF9B69Xp64rEx6YNxSHDfYL4JooLzG4o9byIjBF1WT4TFp7/pgZH1Q/8gC
	45OtDEqsADYFZedhrOx6aQsfqwFMFng+PHgi+3codvSt6BIgYNUOuSQSKiLJT4GQKAolG51DddA
	bpw7B6oQT6zxxv6IEhezApfXsruuKnBDFos/fpkbWMzvvN2JZ7lvo5zTvECVRRmkmqh37pXpG38
	gjnlcYzQ7o0pA+eoviXMUL+vjN0k3JiWIZxYprM2wNRF7xmnfNWIXVuzf6M9f1iwa9lcGLfdFte
	+JrqdPMNW9ZnIdy3I7fwklXDp48o0wmI2EjGhrei+dbH3p3SOpYGsDCxaym397TgKaS4Yt4XaO3
	X2sjN0uYUKyFt1ja3BauLTJimPEE=
X-Google-Smtp-Source: AGHT+IG/sOl/kqpMXtibwdZ96A5j8WE1NPsYc5QH8w6AlxiSCpqY0NhSwOKYQiXX05vdAY6hDJ1wIw==
X-Received: by 2002:a17:90b:3a05:b0:311:f684:d3cd with SMTP id 98e67ed59e1d1-315f2623c5amr1363566a91.12.1750808831471;
        Tue, 24 Jun 2025 16:47:11 -0700 (PDT)
Received: from google.com (96.41.145.34.bc.googleusercontent.com. [34.145.41.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53a1bcbsm221025a91.19.2025.06.24.16.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 16:47:11 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:47:07 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/6] clocksource/drivers/exynos_mct: Add module support
Message-ID: <aFs4--JdpE1W3Lh8@google.com>
References: <20250620181719.1399856-1-willmcvicker@google.com>
 <20250620181719.1399856-6-willmcvicker@google.com>
 <aFqsqr7i7cdR5-I0@mai.linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFqsqr7i7cdR5-I0@mai.linaro.org>

On 06/24/2025, Daniel Lezcano wrote:
> On Fri, Jun 20, 2025 at 11:17:08AM -0700, Will McVicker wrote:
> > From: Donghoon Yu <hoony.yu@samsung.com>
> > 
> > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > boot (and even after boot) the arch_timer is used as the clocksource and
> > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > source for the arch_timer.
> > 
> > Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > [original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
> > Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
> > Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > ---
> 
> ...
> 
> > -static int __init mct_init_spi(struct device_node *np)
> 
> __init_or_module

Thanks, I'll update in v5.

> 
> > +static int mct_init_spi(struct device_node *np)
> >  {
> >  	return mct_init_dt(np, MCT_INT_SPI);
> >  }
> >  
> > -static int __init mct_init_ppi(struct device_node *np)
> > +static int mct_init_ppi(struct device_node *np)
> >  {
> >  	return mct_init_dt(np, MCT_INT_PPI);
> >  }
> > -TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
> > -TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
> 
> Are you sure this is not going to hurt the ARM platforms ? Here the
> timer is enabled very early in the boot process while with this change
> the timer will be available later.

I took a second look at the TIMER_OF_DECLARE() macro and FWICT the timer will
only be enabled "very early" via timer_probe() if "MODULE" is not defined which
is only defined when this specific driver is compiled as a module. Note, this
"MODULE" define is not the same as the Kconfig option "CONFIG_MODULES".
That is why in my v1 and v2 patch [1] I had:

 #ifdef MODULE
   ...
   module_platform_driver(exynos4_mct_driver);
 #else
   TIMER_OF_DECLARE(...)
   TIMER_OF_DECLARE(...)
 #endif

However, I dropped that since Saravana mentioned that we should not be using
TIMER_OF_DECLARE() for drivers that can be modules. I don't have an ARM Exynos
device to verify dropping TIMER_OF_DECLARE() is safe. So if you and Saravana
agree, I can work on creating a patch to define TIMER_OF_DECLARE_MODULE() like
you proposed in [2] to handle this for all the drivers that are used for both ARM and
ARM64 SoCs.

Thanks,
Will

[1] https://lore.kernel.org/all/6e6b0f5f-ac60-48bb-af6c-fa58658d2639@linaro.org/
[2] https://lore.kernel.org/all/f2f914aa-c554-4135-afaa-f075537ed929@linaro.org/

<snip>
