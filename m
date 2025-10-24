Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A3D21ABC9
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 15:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761321281; cv=none; b=GeYXP1J5pHtQn/LM2Am1qEFGIk+sQxAyqSeHUiUFaYVQSzaTYsMQspgurNSg4EOqfkvAwlKFGXLaYGqjsOuIrP2ZGFI+17/NczAGyVIL3cyCJNsjmF7IGV4SuLaWRZv7bHv955e8XC6pPHFIWvA5qc9A5NilKOSy5vgw5r6j5II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761321281; c=relaxed/simple;
	bh=9W0jOqh0WFB83c/hgolD1lDfJvFPAIhOpkeDEgaA6gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WP2se9+BRI3QducbaHFi2o8DVx0paOZPMW3/KsXOQQpEndi+cYwKuHLWJZ84oBTzMcqYdoNhmrRFJFwUtDQuWrOMxzf/7hpxdVYsncp01M57JPyVY4I6ZctgE2Hr0mfifMztgsiujxET+38L74p9E4ZCCfLS6/zUkEPaQAtoE2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uQTRZnrQ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uQTRZnrQ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-781206cce18so2373256b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 08:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761321280; x=1761926080; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SNrPSnUwQSgek1TWOY7IJ65SZA0nkgGonkU8txu9DEo=;
        b=uQTRZnrQVi97SUFOjaA7DAbbz0wZ42XI2Vojd3qRAGTY5E9SD2f7aNFB2NuX5LFIrg
         qK+Vy4FNrn5pqfKAI1LiP5eGY80JV4n0I6gyljU+J61xhSlGcUDj3xsiIGjYn4Uy9/zJ
         9/J9fleYvSVPydHezRuCrpHJprsLG2Zq8Fx6PbFtVFUohx2wKk4vTK3NfDN9YwGcH9Jx
         zfvroltqfzMhASP0N46BS8267doMyjyPxQ09om6QGXC3mY2NmmJhTE4LPSLwp3ppzz+C
         ci9fpBRz8RC7/DNqrDjV2SBFbXhbPoqqVSM4N67cXkfKdy7rj07maamEpnnzGMtLHVcW
         /lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761321280; x=1761926080;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SNrPSnUwQSgek1TWOY7IJ65SZA0nkgGonkU8txu9DEo=;
        b=Dd+/B7QcoaooZKejK3nvAjovrk3LoA6zdShrBlCUDfugMpyLvKG5gzsmB5zZSfJ9pe
         X7sJ57zcI+2Vr2zvPZGvIDXfog4rejPdfzQk+vdDo59c5iL88G3MCm0hNa49h19wiKvK
         QSnUvVwaVljrQSu/WeR82+EgefkRQ5ATVW+QZwfmc+rXVjsC4zMbLOfp44LQJ+gfyZKr
         U55/IzdPda4/PVBafR/KG+NWoa2FH6cXQujBqgEHm1KNj99qZDY/3k3aBc8JRpbECPFn
         vABVNR8+UuT2ZvPJFj8RFHa9x1w6X7Jeu2/KTgEtYT0n48s5aJWd5gdEDFCb7FiTfUs+
         n4Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWH2n29jXuJYDm8w7DoSK84CMONoGGRECPAR/8fGWsPQtcV7TgQ4dpQTB1MrasujP8vy2w/HSYoh8Ye6cmBMBmAbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2x3BlqNgPgO6K2b9ng/ah8TMUv2qyTGJoSrigOldLhLeo4hH6
	3JLHdAilIertMY/KpOnEpIT16DCFn22yhEmiedhCkG9fYmmUNWMipk4jrIF9LBiMag==
X-Gm-Gg: ASbGncvp8kZFJjKL710Mp3ZpBEFKPZ2mDmiH4/UgffjwFsYfrosm0hJI0jSwbKANTp2
	RvXnsg5Pw+3mR05GHZmC8g7RY41bo3dqCwQ4TRJO8q+pMCigidbB/2lpHCdx54ZLONal+s/8W5i
	JMn6zO5rjvrhsTYIv/o39J3ghyaAP23N5MjBsAvK+AhpyfDemgMSn4Ga2j1WkyCghn/vJe+lCCt
	VEYV+3VhOD2S0XzQCVRbOBSU6/SJJuW+LhwhmjWTsVSP/CPOIGyd9+WxlTRQAY3LxIChf8Tc2kC
	Bi8tAt6u+sei7QakM41YxTywapx7pbUlgPujdePI4r2nMN1hxSjwhDzVhr1K2a6VHSp3BdpDsrq
	ZLOuYZbibbBFbdOSP/WiaMrxW9YyYS9U2b+5J+v7FLRtwRsbKaSr+3C0ab1frT/arwiM8gOS3bb
	vh2JI2//wA1MBIDfHaUOpC38mXX+ecatzteOi5onBqhKQA8SRu
X-Google-Smtp-Source: AGHT+IFKK/nc8huqNArnVsQcPMFPGO2/41KstRTfEUMyU+vcdTuI3QzEMa2HNBjhFdRtL+9SlQ1fRQ==
X-Received: by 2002:a05:6a00:13aa:b0:772:6856:e663 with SMTP id d2e1a72fcca58-7a284dbb2c9mr3491514b3a.8.1761321279403;
        Fri, 24 Oct 2025 08:54:39 -0700 (PDT)
Received: from google.com (80.88.82.34.bc.googleusercontent.com. [34.82.88.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274a9e8fasm6403828b3a.29.2025.10.24.08.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 08:54:39 -0700 (PDT)
Date: Fri, 24 Oct 2025 15:54:35 +0000
From: William McVicker <willmcvicker@google.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	John Stultz <jstultz@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 4/7] clocksource/drivers/exynos_mct: Use percpu
 interrupts only on ARM64
Message-ID: <aPuhO5wn8O85krV3@google.com>
References: <20251023205257.2029526-1-willmcvicker@google.com>
 <CGME20251023205313eucas1p2164ef0c1db80bccd2bbd6a79e809a1cb@eucas1p2.samsung.com>
 <20251023205257.2029526-5-willmcvicker@google.com>
 <c09387b9-3fcc-4d0e-8e29-21dee196014a@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c09387b9-3fcc-4d0e-8e29-21dee196014a@samsung.com>

On 10/24/2025, Marek Szyprowski wrote:
> On 23.10.2025 22:52, Will McVicker wrote:
> > From: Marek Szyprowski <m.szyprowski@samsung.com>
> >
> > For some unknown reasons forcing percpu interrupts for local timers
> > breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
> > machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
> > flag only when driver is compiled for newer ARM64 architecture.
> >
> > Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
> 
> This tag doesn't make sense in this patchset. Simply squash this change 
> with the previous one, adding the following tags:
> 
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Link: 
> https://lore.kernel.org/all/20250827102645.1964659-1-m.szyprowski@samsung.com/ 

Okay, no problem!

--Will
