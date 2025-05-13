Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C956D74C14
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 14:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147962; cv=none; b=mBm7vNiWJqerB7bnIa0hgmG2KcdqorAEUeVYLcN4vtrpfaNFACsyjjaxz3nQ0R468gWxNeIcXyl8aod1EgUKy0VKmedWydlklr5DmeL7+LtxKwZeGFkyyD1fH5JeDgaCQYdgM1LMBo9d1c2q8TWLnWlcvj8XHrqDZ8kveaabCz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147962; c=relaxed/simple;
	bh=7eTd/KlYKdNBE0gVtB8pRaG5SNHtwy49OeApK0fIKBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2JhWqeyORWxu3PftUvjLEXEELMndCYjanKSp3YSD0TfO48QoPKj0eh9fC8KFv4AE7uHbUNsar3Fv9cWCbNuf+s/tzApvVpXcuTeAn6pfHoKuZDXWgT3SlMQKF1bokuX1KpEHD91k3+6+PTUvY2Ynt00u10f7WR6Ba49ZtfMg1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M9/YyRDf; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M9/YyRDf"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a0ba0b6b76so4076288f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747147959; x=1747752759; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NprQZFd0msRuigKqMDzXfWDuMemIh6oSVb1Z2bS8NyY=;
        b=M9/YyRDfc3lZmZf078fLA06/K9MYKxFgXxCBxaa+mJIosp9HlH4Wy092cubEqd+qG0
         1A1TgLrCLcug1t/nt2RmCeTyNCkusflDweFdarSpZ/EqeCEq/PAUgmvd8yxHVaVkvgxa
         4oj5paQzNopFRBvLQ/R4AQl/9qGLZ07mUqtt1zFb7ROfb/i0/eHtTB2XwNy3ohYgsiVk
         /UK5pP9sh8xqGR5Yfvz17YaU+AO1AU0fj6OAioExEm2qH219EUtpbhCLppIy53KciHcd
         gM8dQJIMAs/Rs88kAxntiNvH6cnMHNx8kIFpTPKVriNIHdSxfFzcoeYgv530U+aNAdNN
         fvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747147959; x=1747752759;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NprQZFd0msRuigKqMDzXfWDuMemIh6oSVb1Z2bS8NyY=;
        b=plMqLZHe50fdD3MQppLuJiuxwSEh8yX9Gcx+OQT4UkE5vAuFKiWuiJ8Mum0mq/Hsev
         0/DDNdho7NpvJbwvEb8Pg7KG5kSOu95BT9KHu6/UIjqINSg6s27Wd643WrCYmpMEhgbe
         B25z0fSC/N5iXTAoKCJk6XsxOtabmTwzmniABmuM2YOJ/8vCdiefvxu4SKXshHbYhNz8
         h3CErqxDvZeCQJLHzklFj9cYktCmpI38049kAwvbrwvKH1FJ+C3Xvy2w8IW1XCq2kRT1
         YRZ01My/h+plbU4XPkF1fWNwCDqZoICMUiWUKX0swDf1Bewf9IxfW222o6RJSEkFH2Pz
         HrcQ==
X-Forwarded-Encrypted: i=1; AJvYcCViJdZAjnHV8P0nheMnba4BMXpPW4RuxpjXcZG6/GPel0nOyjfS2rE6bv9S6QBl0+N55GAr6PfQGswvmD25EyR5xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAqhRz1Dlvhjvi0Bjrx4PkxVQbMdA0D2piOwmQPzBjoKvYASuC
	6OaaLNu+mxpwE3rApGzds8Y6vAWcon+X+cRfjiMZxL1mPwBTaAR5WhOOVlX9hlM=
X-Gm-Gg: ASbGnct2XZ6ROcYcqGrEkeGTsrv2PE/htuaWdNEazfNgdh+6M5Y1nNUQIQXg+mjCt8m
	2PNydEDLICphbGoakuXOrXjNm3ec6teCm2pP9VbVjUK5S91iuLGWmUWGpjMjJHYeHKOggGIUcDv
	ZTxoacOslQdT7oQ8celdPrmLu1S9lEEvKoxAxuNi3AFmnLJYxy0YTap5Bpm6elbyxdQ6P9OxUFO
	qo80PMH27qyqm4N7xP2j80jb7fEf8kyEykj7povj93TF7VwVh3QG9Sq+zZX+441v/gMQX9qqEtZ
	v2eIwcZVGjPqwJas/xDcsvm0aR7qYT2LChr1E/H+GPy/2avoPiuxpSYyXZbZmqmpW6AJoLvAjfd
	51qAcO0kZnYcaLw==
X-Google-Smtp-Source: AGHT+IGYDcAG8pLfPmYFTyeqzeIaOvsHfnmcsUp0uHL3fXQ+4Wvxm5ZCV+BGXbRBT2JBatXikF9ENg==
X-Received: by 2002:a5d:6a11:0:b0:3a1:faf3:b608 with SMTP id ffacd0b85a97d-3a1faf3b6c6mr10089134f8f.56.1747147959102;
        Tue, 13 May 2025 07:52:39 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ce36sm16710394f8f.71.2025.05.13.07.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:52:38 -0700 (PDT)
Date: Tue, 13 May 2025 16:52:36 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: John Stultz <jstultz@google.com>
Cc: Will McVicker <willmcvicker@google.com>,
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
Message-ID: <aCNctHq6K7uqFF05@mai.linaro.org>
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
 <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>

On Tue, Apr 15, 2025 at 05:48:41PM -0700, John Stultz wrote:
> On Tue, Apr 15, 2025 at 9:50 AM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
> > On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > > From: Donghoon Yu <hoony.yu@samsung.com>
> > >
> > > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > > boot (and even after boot) the arch_timer is used as the clocksource and
> > > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > > source for the arch_timer.
> >
> > From a previous thread where there is no answer:
> >
> > https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
> >
> > I don't feel comfortable with changing the clocksource / clockevent drivers to
> > a module for the reasons explained in the aforementionned thread.
> 
> I wasn't CC'ed on that, but to address a few of your points:
> 
> > I have some concerns about this kind of changes:
> >
> >   * the core code may not be prepared for that, so loading / unloading
> > the modules with active timers may result into some issues
> 
> That's a fair concern, but permanent modules (which are loaded but not
> unloaded) shouldn't suffer this issue. I recognize having modules be
> fully unloadable is generally cleaner and preferred, but I also see
> the benefit of allowing permanent modules to be one-way loaded so a
> generic/distro kernel shared between lots of different platforms
> doesn't need to be bloated with drivers that aren't used everywhere.
> Obviously any single driver doesn't make a huge difference, but all
> the small drivers together does add up.

Perhaps using module_platform_driver_probe() should do the trick with
some scripts updated for my git hooks to check
module_platform_driver() is not used.

[ ... ]

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
