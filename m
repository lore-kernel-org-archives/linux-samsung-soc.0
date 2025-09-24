Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE67280339
	for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Sep 2025 17:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758734266; cv=none; b=TjgBFBuaHFns8+oyVQYeSfCyI948JktrYsyF3jGlP8jUw5HfLebf7XOJl139hD29awd7jir7fM/YPFMtL2vhmVr98Dpc71E/DKOc5lHh4H4NuVey4SmKzg2bijjQfytuhksd4FEZbyMh/JfkqVkY2Ffo91N7j2s9IW26I1/lc2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758734266; c=relaxed/simple;
	bh=rx88R2iKA6Ro6LIxDiM7N+vRM/mt4U60a2VsMTl5+yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alitijMhmQOKdRAgTcoXPj6kuyrFzKosG6n2Q5+uPVqCKHdmWNsyQyWihoexaFeZnwnzdjerXKFrHGsjfAlHjylcT+CahGLQOmd4NXmmGWOhVvRj7L82XPkEO97bNRSZ3muZWOyox2aUpxuy6K9rvuZSU3zoQzxmZKG60wWhMwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jcRwSBKW; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jcRwSBKW"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77f22902b46so86829b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Sep 2025 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758734264; x=1759339064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra9h0pKy9hrfzn/xULq5J28p+78Z8nIxSntYx3sf93M=;
        b=jcRwSBKWrYeopMGn6p2dXkSWdE4RKcgDlG1nqCq1MmQYb70FQgPeY0CUM26sHILHQ1
         sVXky37EXYYreaR0WN2lz+HLPSXo1XoouJuzEY343JOXVCDd72gjg6+4A0MAeBea2T3K
         tIIPGEihpa79xeL9WyntOpIGZepKErel0Qh+zye1SQQUYmdpIQjtnX2r0/yOkNlNvoa1
         z8DIwJpnfteCiOWn/Msa3nCbHClCTJ0R5zZ2xBcWFZ4pjYvk+9gvcjjgD2Z3DvA5yfBl
         nvEeSHj+xx31vzLOZdd9O1Xel2A3j0Dwp0MP4t44NxFkb2fdJlcBWM4fYo1KGjJXJY+M
         I27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758734264; x=1759339064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra9h0pKy9hrfzn/xULq5J28p+78Z8nIxSntYx3sf93M=;
        b=wS/rboj9DXGYq2rN14zaHeI5jsg11AhjKnRTMfjfo+JQWNzBDQMBwZUlEuW0+Ng7V/
         xH5xhAJOTLi8tnLYmx0eq29qbujDyddTERLyIqKoHEwdLXn82MhtJCSm7ElBPvrE58cv
         nYuO5wVL/LwacIRnN+4sxUxDAuOrTGPOu8U/8We/h8QtGx6cYbkHio8Zcki7K9gmusJY
         nAiRzJsrBZJXTKbO2AGXaeX1UVHfJN9kL49ff8rAmDmxBMlHq3o2hD9tLL9HvC3MhCpp
         Ib5JG684cnCvq2xIl+aPx2Wjd6nPxBYcYONYRNp5roERJyVfUOjlehdX7CtUexcNLQr+
         AwSw==
X-Forwarded-Encrypted: i=1; AJvYcCXXE9JvrTuSnr79/+H5msXAacdMxvPl7hZIcapvhXntAt8NJZfgFT8kOFZugcJMn3hTObmLEYeZrNw6LU0O2ZRL3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAniGd662dB0c3o/91oelmerTGdVQTaut0mMuApFbzmuIAnK58
	pYa+5dVEwTFAE0te+khVbBdspejj5cViqLqtE+VrM/d89ycBB2NO7dL8tWVPRH1xRQ==
X-Gm-Gg: ASbGncsSatqaNBzkWk0sgHFD8PsqAKFMUpdB/2j8QUP/Rkj5CAoXOmVuJrLosiTrR64
	tGj7dIahzNClxE1ru+BYOza9YtodT8u4etulDOFuKgb8oSsM//bQBmckhSSGS5XPZkrJy1I/4sd
	955wevQf1V3TVhcvtiCNmlrqZ2+HrcI2+onu6JhHniRfi0ON7hgq2o8vVtwFr7LjkCXSzoHTW7W
	dFB2V9UpHWqLvWxQFqLUdYqg5HB+RY1R1YfL0Mve8BFAA3M/5sUK4r2DkWamnwWCU3RASc2Eez0
	HSpVA+alT3YzxRrK1RmtHE96R959lA4uCRpDCCbeFyA3aFb3STQWN3CztKr4hJ/4n/ah8oYCePT
	MZVIyITdZ6/I7HMczzdyP47vWVCfLo8XfcRwG6TzBgu7wej80iwZ63uPAkPauiTP3Cl9PZg==
X-Google-Smtp-Source: AGHT+IECcRUUOXZw8N72wAdSdn4wRjBNkobfFLE0UHBTkp1YQV+wUXCx2YiosQc5CaxumRtZ4E56yA==
X-Received: by 2002:a05:6a20:258f:b0:2d3:f411:a970 with SMTP id adf61e73a8af0-2e7d3eaa484mr412304637.41.1758734264070;
        Wed, 24 Sep 2025 10:17:44 -0700 (PDT)
Received: from google.com (83.117.83.34.bc.googleusercontent.com. [34.83.117.83])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77dbc8e7cc4sm17407079b3a.29.2025.09.24.10.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 10:17:43 -0700 (PDT)
Date: Wed, 24 Sep 2025 17:17:39 +0000
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Use percpu interrupts
 only on ARM64
Message-ID: <aNQnszeIfeHjx3GS@google.com>
References: <CGME20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3@eucas1p1.samsung.com>
 <20250827102645.1964659-1-m.szyprowski@samsung.com>
 <8fb4534e-ffb0-40ad-8256-b0fa040a1b97@kernel.org>
 <d27df41d-58ba-41e8-9275-2e9991f574a0@samsung.com>
 <6a89a8bf-022d-4c31-b6db-95763142e603@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a89a8bf-022d-4c31-b6db-95763142e603@linaro.org>

Hi Daniel,

On 09/24/2025, Daniel Lezcano wrote:
> 
> Hi Marek,
> 
> On 19/09/2025 23:31, Marek Szyprowski wrote:
> > On 27.08.2025 13:58, Krzysztof Kozlowski wrote:
> > > On 27/08/2025 12:26, Marek Szyprowski wrote:
> > > > For some unknown reasons forcing percpu interrupts for local timers
> > > > breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
> > > > machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
> > > > flag only when driver is compiled for newer ARM64 architecture.
> > > > 
> > > > Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
> > > 
> > > I am pretty sure the patch above was not tested on arm32, thus this
> > > workaround seems reasonable.
> > > 
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > Daniel, any chance to get this merged?
> 
> The patch does not apply. However it is not your fault but a glitch in the
> previous pull request and the regression found in the Exynos MCT.
> 
> Apparently, Thomas had to drop the entire pull request while I thought he
> dropped only Will's changes.
> 
> A pull request with the previous changes for v6.17-rc1 and with the new
> changes for v6.18-rc1 is about to be emitted but without the Exynos MCT
> changes for the modularization. That means your change does not apply
> correctly anymore on the current changes.

Is there somewhere I can check to see which changes will be re-sent? I don't
see them in the timers/drivers/next branch. Will it be patches 2-4 plus the
fixes for the section mismatch and this new IRQ fix? Once that's all sorted
out, I'll base the new modularization patches on top of that.

Thanks,
Will
