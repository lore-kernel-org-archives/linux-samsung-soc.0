Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353041F4C90
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 21:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743631178; cv=none; b=LUQALqSoHfWAPcsTvtR3w6Hm8ddhFfQY1LIB0rtzRH5lyr+KIEntFOxL3wU1g4KzcdnYBh/klhh+gRoRkVy3WWQvszPiNXqUPUPiR13aPE32gEXOZmOvRZPUkE6WgURz9kIrMWC1UYzBngGSqjstuBnWyCQsfP5cJCewuRZYqv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743631178; c=relaxed/simple;
	bh=Z/xOV2Rb8NgoEvjLqYQw+xu9IJFae4Mb5dAPjpppXrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHdhWz3vwjJ7joRyxdrsbpjhnGuuDoPuH14T7H+v6p9kS7wuInz/FqB7glnJXzhUJTXIYPkO3SFOMDs4Mwv4MGWRphaMjBHLQM/wvYMu6WBbzGjpfawId2Aec0mEy5uS+eOL0uGeVwl/tYZ080jzORGjK7ggYRTX2aqBbKokxP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xZq14Bl/; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xZq14Bl/"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22548a28d0cso3488585ad.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Apr 2025 14:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743631176; x=1744235976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WqllMbVSzlYmSg4e9MsN3Hg5U+KXq66OHOKXxPOPhW8=;
        b=xZq14Bl/GyyNlhPUpwTuaLjWoGIgqv8F1cDdpDwbEEPnjy94s6VIJDUB7F3K0h7fAD
         5jDL17EWS1I8eaxbcoII1dKiCgWRqojvygllrZXFwBs2FXIZQI6L/+DW9j0w3vl3nf7/
         ZQfWi1jQfSv+DnahlIPTKf04gFEIIvU0YdH7y8dYh9oRMOz6AbJvbRlt02LTWSt0MMlb
         QWszKp4Qiz7zh1mhYqXSinmUx925sejMoBPCQ0clziuF+bwmkyQrmxz36O3BExFwWg+c
         jRM0cp7PZwkPPzBWMFjO8a7YLfEd8Wnatl2/Tsp2fSi8uJZMEkJHBoDIzQN4gLcpoxMG
         znEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743631176; x=1744235976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqllMbVSzlYmSg4e9MsN3Hg5U+KXq66OHOKXxPOPhW8=;
        b=N3MoFoC4UkLPKudt6opF38lgfoeMKK+DTOay1JoBC6aiCKUj/mxbXQWbA2nkxfxd0J
         O9KwHGnQG0kVbbEK+zkSoKRlVASZH/xzXoZBzSUVNW73jLb/+MB94EjddOEoF3X/4KmD
         +40wq7HdgEVQ7pndeN2J6BcpOrTRammXLstwQbphnR3CVh+/RfvY7MYy//DlP6NYvZ9Z
         mRv/VV49HgoOakE9lLAPS5nFvoXEJq7KRHoZCbpoC+pYAXC2/Qr0x8tl46at5Sqv1FIn
         gfOehp3D6sl/OVaJCMTRefjQncGOrMleqODviHZozaQ2gsGOHnO/ouAWs/SgFd+kNUZB
         iEYg==
X-Forwarded-Encrypted: i=1; AJvYcCVV5dfQv4fVm13Xn58dMoIK8oKmxJYXAO8Tl2B/LCtPAqo7DLKY/9098dNbOuerXszpcd1MyEgiSaQnT8Swyw83Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqy7dqabVsat9OKJzOIvGbETrd9SiRgxyOewoGgQls4/O2OCFU
	5DxKBb7MvimJgtCOxy2AAJg1ZcL2KjCV243fQer6Qja8apAwJfSpFu0EJipP1A==
X-Gm-Gg: ASbGncuCu6Co3YLa2BT6BGfOaKyKEXuM2kACAc0i9MldFLpKiT1zEKOEVZtu7mo/TSX
	lxjL22DS6vifFSyHXcWK4fNewVrUfRQvxRzunFCVKZh2AYZpyg5ucXJY9T6PQREIKx4uiE1kIcJ
	pgQ48bAHqkcXrZWpZBMf2JO7AVJyVw80uxuaRpGpNW8gWPtaZ6tf58FSuRbudbTPVyuVonCLswa
	wWvZg7HzWM/53eZobMobtlY5x3asGdpPQnpFfh1MYm6m7e0La7siIAkwtF6NdgBUPTfavPoQnTl
	IxNDN+9BhMKdLJkIn7LBcrPiZGsUAtbjd/xFvJRBctRnCKwWCOu5bRBpx7AZLgfFEXVZkcZvf7P
	RLGYfijNyAXfftw4=
X-Google-Smtp-Source: AGHT+IHteXxFO7jbKx3k3Jy9PnUQzjVaQtKgEm+NOfEcxdPjDfCVTFwPG/5wPWOnq7Eh2M3nBNvUdw==
X-Received: by 2002:a17:902:ea03:b0:223:536d:f67b with SMTP id d9443c01a7336-2292f9f607fmr329229995ad.38.1743631176289;
        Wed, 02 Apr 2025 14:59:36 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c2791sm636175ad.80.2025.04.02.14.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 14:59:35 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:59:31 -0700
From: William McVicker <willmcvicker@google.com>
To: Youngmin Nam <youngmin.nam@samsung.com>
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
	Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Will Deacon <willdeacon@google.com>
Subject: Re: [PATCH v1 4/6] arm64: dts: exynos: gs101: Add 'local-timer-stop'
 to cpuidle nodes
Message-ID: <Z-2zQ-PcvxFTBc6M@google.com>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <CGME20250331230151epcas2p486a7c6d7153737f4168cfef74249742f@epcas2p4.samsung.com>
 <20250331230034.806124-5-willmcvicker@google.com>
 <Z+y4zxfifkQqLxKF@perf>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+y4zxfifkQqLxKF@perf>

Hi Youngmin,

On 04/02/2025, Youngmin Nam wrote:
> On Mon, Mar 31, 2025 at 04:00:26PM -0700, Will McVicker wrote:
> > From: Will Deacon <willdeacon@google.com>
> > 
> > In preparation for switching to the architected timer as the primary
> > clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
> > property to indicate that an alternative clockevents device must be
> > used for waking up from the "c2" idle state.
> > 
> > Signed-off-by: Will Deacon <willdeacon@google.com>
> > [Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > ---
> >  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > index 3de3a758f113..fd0badf24e6f 100644
> > --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > @@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
> >  				idle-state-name = "c2";
> >  				compatible = "arm,idle-state";
> >  				arm,psci-suspend-param = <0x0010000>;
> > +				local-timer-stop;
> >  				entry-latency-us = <70>;
> >  				exit-latency-us = <160>;
> >  				min-residency-us = <2000>;
> > @@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
> >  				idle-state-name = "c2";
> >  				compatible = "arm,idle-state";
> >  				arm,psci-suspend-param = <0x0010000>;
> > +				local-timer-stop;
> >  				entry-latency-us = <150>;
> >  				exit-latency-us = <190>;
> >  				min-residency-us = <2500>;
> > @@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
> >  				idle-state-name = "c2";
> >  				compatible = "arm,idle-state";
> >  				arm,psci-suspend-param = <0x0010000>;
> > +				local-timer-stop;
> >  				entry-latency-us = <235>;
> >  				exit-latency-us = <220>;
> >  				min-residency-us = <3500>;
> > -- 
> > 2.49.0.472.ge94155a9ec-goog
> > 
> Hi Will.
> 
> Are you using this property in production?
> If so, have you noticed any performance improvements?

On Pixel 6, I have only recently switched to using the arch_timer as the
default clocksource. I haven't noticed any major perf improvements to the main
benchmarks, but also haven't seen any regressions. Based on the ChromeOS perf
analysis in [1,2], there was a significant perf difference found.

[1] https://lore.kernel.org/linux-samsung-soc/CAJFHJrrgWGc4XGQB0ysLufAg3Wouz-aYXu97Sy2Kp=HzK+akVQ@mail.gmail.com/
[2] https://lore.kernel.org/linux-samsung-soc/CAASgrz2Nr69tpfC8ka9gbs2OvjLEGsvgAj4vBCFxhsamuFum7w@mail.gmail.com/

If it helps, I found that Pixel 8 and 9 devices (didn't check Pixel 7)
are already using the arch_timer with this 'local-timer-stop' as the default
clocksource in the production kernel.

Thanks,
Will

[...]
