Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628602512D0
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 18:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743705571; cv=none; b=XJNO+oiLAsudeIEcq794mc3h15r+0YMRFAg2p9LqqUOiCpVmocmCQyznvcb3TimnjaPGNH6LXnbntq3ve43BcHTblpRVkv2GQqHZHqGmJnChM+y0h3yYNsj5c2LmWLrQrGHzTbe1D/lTMEKF35Hs+mQbM2fzCg8kZvsWWQlVQhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743705571; c=relaxed/simple;
	bh=MI0PfKYpQBkW3noUT5Lwg4IeL13JXEDg3xWq9pSaoG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMzB68L0REg7BWyHdrxTIxQ00WN1PH80rdld3z+JwDOY27PmLqjs/IxsMiOw1UaUuduyCBt0+uewhUqwU4V9qPS3hScWN1H3/9j5SMZJaeeo5jPGYCQ2kkghj6oxIYg1wlDd3x1hL0T9Amn3R+n5yhp0YzvTEGo3tOT+0lUlW4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iGS4weRP; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iGS4weRP"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736b98acaadso1305093b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Apr 2025 11:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743705569; x=1744310369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=09ptcXZfcBhfJGnGO0uRHBsRknDiljVX3LNPLnOx7vU=;
        b=iGS4weRPMLJMa+0G6Dxucj5p7Lsbodmkubc42VKmuFXeIHazvq8M2WGTxtaFG4ABWk
         NvqQgzzlrTr1E0ORUJ1wqM6HuWAXD4AjE8gCv76WmCMqvXK5OYuRjC61gtzrEyjZAQIb
         7CY9/znW0h1ovE+WQCGolm79IyE83XD44spvEm4lLkpiRosLE2heuIqsJlrygOCnKsUY
         96OCQva14LJBh/nS3ecRi5SFZ7mbKpHWum6A0tRuCwprKMBNQ6j3re7s8TRxMZzJSKbl
         qGWeppvyiMoHITiHKu/fsPOYrECAeLNXVS9rOPRpwtl2y1+nVfJV2ois76dM6wNE89Ir
         PINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743705569; x=1744310369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09ptcXZfcBhfJGnGO0uRHBsRknDiljVX3LNPLnOx7vU=;
        b=dVPreWodTTkJ4hWt1jLxTjCPx024qg4QoLKnOPHDCDaMZgM8p+B3FT1m+8ckZ7uxec
         1F/m30y984rHSIqt0L9/ML5JsWrQD6+47EkS38HjaVVHXN5enJg2uZd1h9N+2B3IZJzQ
         kNQxM4y6rRPX55dxwRiGBL6GYDXLqHv0keRkdyGSFcLE0JjG0PUNjCa9wDE56gHn79FS
         5motFii4965wZ7gjU4V54PGvkS/EYwlSdBjasdaTnBEY/bdgCFc1/pVBeOceY0q2Ry4J
         Medxyfjpftk2x2QXXbA1CXk215896nSvZc4rOXppa7chgvdHz1pc0Q6aJkR80bqHbA0H
         sw3A==
X-Forwarded-Encrypted: i=1; AJvYcCXITy2OJNir1QOEeWI96jyRSP4Rh+n/i0KTh2+C1xLBbBvZa6YyFvj3XMdEq5Q3lXpA0EkDPl1/P+TlxXc3dX/i1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6UBQBAjENwiPLs/MPqAOmp7ogvgNkKr+tEcbDPsou79G0HBKe
	dfVudPGPRxN3nPQEgGq/iLaHLWvmD1tLKETmSqAPlBlcVAS7FbBktfzYtnJKgA==
X-Gm-Gg: ASbGnct/YGTXOV/xSL5+7bAc30GvBlsLyNGi9ujr0nJ2NL8eic5VZwHDTSiBoSnLtOP
	gkznowDVSTxk+tEiogLDDeYrYckJwmL0w1FiriDpD2dW2SYZ/Fo4jq69aAf8xoFJWZSaCf2IF23
	PECn6Nudnv1zbrkN0dHsw1pPf6O2z/oiBLwFwIXvRdlHU5tyFIMzpvh7XEQZsK4vqQj82UKLD85
	ryG/Sr5QXInBzW0KgxDDLv14OwDC/cHW1hjt7cdDvAKdDR7lcqTo2XQv/FN5bk8Z4fduPV5onBH
	4yvPSbE5BkXpPNC13lwmnLiCGT0ZlVIIlhlnoqeOscW8JIOk3kJeMn+pZd2hxkTXWD1FEYJYTU2
	mKXvQpAtnVjBD3QHTHbPUd4q2Cg==
X-Google-Smtp-Source: AGHT+IHKo1uB12F2qz0Bx8hQv5MdUl4S9SkNNYXXluY/VdcwwTA2jfjTiNcrEuMi7fkWuEP6PC+AGA==
X-Received: by 2002:a05:6a21:338e:b0:1ee:e655:97ea with SMTP id adf61e73a8af0-2010474336emr652313637.41.1743705568300;
        Thu, 03 Apr 2025 11:39:28 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc3fd70csm1548787a12.56.2025.04.03.11.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 11:39:27 -0700 (PDT)
Date: Thu, 3 Apr 2025 11:39:23 -0700
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
Message-ID: <Z-7V27GKU85vba0B@google.com>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <CGME20250331230151epcas2p486a7c6d7153737f4168cfef74249742f@epcas2p4.samsung.com>
 <20250331230034.806124-5-willmcvicker@google.com>
 <Z+y4zxfifkQqLxKF@perf>
 <Z-2zQ-PcvxFTBc6M@google.com>
 <Z+4Hve9pQoLeh9sZ@perf>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+4Hve9pQoLeh9sZ@perf>

On 04/03/2025, Youngmin Nam wrote:
> On Wed, Apr 02, 2025 at 02:59:31PM -0700, William McVicker wrote:
> > Hi Youngmin,
> > 
> > On 04/02/2025, Youngmin Nam wrote:
> > > On Mon, Mar 31, 2025 at 04:00:26PM -0700, Will McVicker wrote:
> > > > From: Will Deacon <willdeacon@google.com>
> > > > 
> > > > In preparation for switching to the architected timer as the primary
> > > > clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
> > > > property to indicate that an alternative clockevents device must be
> > > > used for waking up from the "c2" idle state.
> > > > 
> > > > Signed-off-by: Will Deacon <willdeacon@google.com>
> > > > [Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
> > > > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > > > ---
> > > >  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > > > index 3de3a758f113..fd0badf24e6f 100644
> > > > --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > > > +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > > > @@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
> > > >  				idle-state-name = "c2";
> > > >  				compatible = "arm,idle-state";
> > > >  				arm,psci-suspend-param = <0x0010000>;
> > > > +				local-timer-stop;
> > > >  				entry-latency-us = <70>;
> > > >  				exit-latency-us = <160>;
> > > >  				min-residency-us = <2000>;
> > > > @@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
> > > >  				idle-state-name = "c2";
> > > >  				compatible = "arm,idle-state";
> > > >  				arm,psci-suspend-param = <0x0010000>;
> > > > +				local-timer-stop;
> > > >  				entry-latency-us = <150>;
> > > >  				exit-latency-us = <190>;
> > > >  				min-residency-us = <2500>;
> > > > @@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
> > > >  				idle-state-name = "c2";
> > > >  				compatible = "arm,idle-state";
> > > >  				arm,psci-suspend-param = <0x0010000>;
> > > > +				local-timer-stop;
> > > >  				entry-latency-us = <235>;
> > > >  				exit-latency-us = <220>;
> > > >  				min-residency-us = <3500>;
> > > > -- 
> > > > 2.49.0.472.ge94155a9ec-goog
> > > > 
> > > Hi Will.
> > > 
> > > Are you using this property in production?
> > > If so, have you noticed any performance improvements?
> > 
> > On Pixel 6, I have only recently switched to using the arch_timer as the
> > default clocksource. I haven't noticed any major perf improvements to the main
> > benchmarks, but also haven't seen any regressions. Based on the ChromeOS perf
> > analysis in [1,2], there was a significant perf difference found.
> > 
> > [1] https://lore.kernel.org/linux-samsung-soc/CAJFHJrrgWGc4XGQB0ysLufAg3Wouz-aYXu97Sy2Kp=HzK+akVQ@mail.gmail.com/
> > [2] https://lore.kernel.org/linux-samsung-soc/CAASgrz2Nr69tpfC8ka9gbs2OvjLEGsvgAj4vBCFxhsamuFum7w@mail.gmail.com/
> > 
> > If it helps, I found that Pixel 8 and 9 devices (didn't check Pixel 7)
> > are already using the arch_timer with this 'local-timer-stop' as the default
> > clocksource in the production kernel.
> > 
> > Thanks,
> > Will
> > 
> > [...]
> > 
> 
> Hi Will,
> 
> Thanks for sharing the status of Pixel devices.
> 
> I agree that using the arch_timer as a clock source device brings significant benefits.
> The links you shared are definitely related to that.
> 
> However, I would also like to know whether arch_timer is used as a clock event device in Pixel production.

For Pixel 8 and 9, the arch_timer is used as both the clocksource and
clockevent device which is what my series is proposing for Pixel 6 upstream.
The MCT device is solely being used as the alternative clockevents device for
waking up from the "c2" state. The reason for using the arch_timer as the
clockevents device is because we were seeing hrtimer stability issues where
a 10ms interval timer would delay about 300ms-1s before starting the callback.
This resulted in several media-related latency issues.

Thanks,
Will

[...]
