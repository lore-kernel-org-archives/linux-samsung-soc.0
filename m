Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720649461
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Apr 2025 16:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525386; cv=none; b=oT4AIyGr5hjt0SQQcBpZvg7kImmY8iHyhNdHhidfpgXzCNJ9T4BmZl7n745pH9OiAkMfJDVAXQUNJSltNYzF5Lpo2ETkjjmaVwh+DWN99CCWOiH53nGfkDkDnCV6exM6Wvojk7DEqxXv6+N7DApsKrAKZf6vWvzR9MTSD2zEQyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525386; c=relaxed/simple;
	bh=D6sNF7Z1CFTYLjjafoK97rcaY9AK8pnnYevtkw0IPVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L18Dm9dT9wTx6zV27YsCiJdLF+A+FALGjF8FxencLpAQqu7/AKt08VD9iCrAAYbqisI9U/gQbkS/pWN/fISe/S2W+GGgrX1IrGUO82suithQZB8uxM26JbSVCZQv1+8yvNynDJ4nkXL/PRqIxZrslVCFIwnSVttGH+3kXtOYcDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BvLPH6V8; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BvLPH6V8"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff64550991so7423299a91.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Apr 2025 09:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743525385; x=1744130185; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6PD/PgO3ncsJ3cZCJrRv/Qt4Ciw0gv+K6O/dnt5CkV8=;
        b=BvLPH6V86TRAMmx8/X/G25/jz4pMqw1fGvkQcaeY7gsZDgtDLF44TKYtvUX8v6igYA
         ZqoqC5BQ6MWXOa4CbPhve4oNARQKSxnEkiUGJd4USt3BSvwLyW/mUdUa01ol4QPqIV6Z
         1Anq5s5CDB0RkQlTY04D2nUFQftuaE/dxBK3tyzqvliWB1fvgPKbV9Tc4mLN4o0VoOtb
         OB4EIJt4Yn5J+rnVD0wyAqXbhS08esJRX5gXKJBvZ5+vxLC7+SlFRsDoz9LlQpTuvTYY
         3K2k7eRb0RbXGKKXjfekUT4qzerZ+i3NzgWScvsOhcSdcS/hbJiPF3Ua6hrGGsqpo1Mj
         pcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525385; x=1744130185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6PD/PgO3ncsJ3cZCJrRv/Qt4Ciw0gv+K6O/dnt5CkV8=;
        b=OEWeq3+I8wO5eORkGSTUN/50z7GpG1Blf+sctFe2U1KVNmTAdUDKx05gsuFwdGCrLo
         vbflWMtyQTN9DwbDQGXnkayFyyB3EyNsKZEUZfvfCj0QONUbWPDHdFxzNYecF/Dh7Pbm
         9NcvQXNsOmpoCSqVhtKPPbmUtPJw9rENqENffFEabBIxa0Mhb5RVd2oYupti4Dyi9H+k
         qepNHjhX/XFYdEvLxHAqrQU2M7fWgTr10vB4jEfqWFYcL+9txTH9BWf7WMQg2p5jjIZ/
         jVHS4pcym72kwEHx/VN38gfG7HzbyRPdeXC8P378O3J2jRV38uMfW1gKgvlRhQ7+//Rb
         aLlw==
X-Forwarded-Encrypted: i=1; AJvYcCXCH6X/yguHnhFuw95XsbRHfBF0cxpj5JVWvW5rCBSqMujtmZeCUHipmzJa7wDq5l8rA+4C/K9dWDOnsX3KXQn8Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWMPUgRW6/r7ASwqOLHE7qt6ZzI7dZhBfZf7eC/8r+v2ZuLxOw
	PsQxZW/zY3cRA96h8l8M/IJPU8eIZ1pbBVpnFh+QpT0hQFTq6rRzk2P53EF9jQ==
X-Gm-Gg: ASbGncstsIR9ZS83qqQmhZbL4/D1LnSLeuuILKcEhZQ/ELiDuE6oHGuj51nBRjBCw4W
	LW+jc+rjILSt8DqD0LNu55/GCFPnNNTLRHLRBVMHr4ieLJlHhBTzgkOnpfn4Gae8TywyfzpGYFS
	yZcRx0QLyy2L/i/jIN6zYY8JqMoc1QvxURrIX09GB/WHZlT6vAK3zetxj1C4/KPEWiWO1B3FnE3
	TdzRJE6lPGxoGzwuC/vSyW0JewvmQvffLag+pNbzvcuLKd3ij6liRNLcjg6kp2MCvmn8siEnFY6
	lQQ6Kfxq2al4tvRx/NUOYXSM5XwtQthEbveu7pBA/Fm9uHkaxFpyhgaOfPl4HvRsdYu6/MxiB6N
	h+PliyOsxhMQyZj0=
X-Google-Smtp-Source: AGHT+IEzU+hLZLEqxJTjXsu2ERUIGdFfgSk9TWMvKqglUiejKKsOC4BUUb3g94o4jueNGuOJWVn+bg==
X-Received: by 2002:a17:90a:f950:b0:2fe:b8ba:62e1 with SMTP id 98e67ed59e1d1-30532147209mr20787773a91.28.1743525384529;
        Tue, 01 Apr 2025 09:36:24 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516fed6f4sm9502139a91.32.2025.04.01.09.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:36:23 -0700 (PDT)
Date: Tue, 1 Apr 2025 09:36:19 -0700
From: William McVicker <willmcvicker@google.com>
To: John Stultz <jstultz@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Hosung Kim <hosung0.kim@samsung.com>
Subject: Re: [PATCH v1 3/6] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
Message-ID: <Z-wWA-46L08V89qK@google.com>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <20250331230034.806124-4-willmcvicker@google.com>
 <CANDhNCqNqXfGgvo8vNof1qi3E3jejk5KBD=oedZp2_p8RKZdjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCqNqXfGgvo8vNof1qi3E3jejk5KBD=oedZp2_p8RKZdjw@mail.gmail.com>

On 03/31/2025, John Stultz wrote:
> On Mon, Mar 31, 2025 at 4:00 PM 'Will McVicker' via kernel-team
> <kernel-team@android.com> wrote:
> >
> > From: Hosung Kim <hosung0.kim@samsung.com>
> >
> > The MCT local timers can be used as a per-cpu event timer. To prevent
> 
> Can be used, or are used?  If it's an option, is this change important
> in both cases?
> 
> > the timer interrupts from migrating to other CPUs, set the flag
> > IRQF_PERCPU.
> 
> Might be work expanding this a bit to clarify why the interrupts
> migrating to other cpus is undesired.

Let me dig into this further to figure out if the IP has a limitation where the
interrupts need to be handled by the CPU the timer was triggered on or if this
is just an optimization.

Any chance you know this @Youngmin?

Thanks,
Will

> 
> > Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
> > [Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> 
> thanks!
> -john
