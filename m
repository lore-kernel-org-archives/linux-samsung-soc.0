Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1F72E6CC6
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 17:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763747755; cv=none; b=GEHk+A8lQejcVbmND4Lkzm+aq6QgW3LqgGa74HYoNUYzN0zszxGVY0ndLAafx3peuHtzzE2hdWffC52F0KuRAmUjAUJRmdyxnBuzGcQmAS/jjVdw+467CRkJnwQZ5cvo76pxAER8JzneXQe9ST6G8dLu761s1QDa/kgASAjQKzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763747755; c=relaxed/simple;
	bh=tEJqq7Rfs/EaLLTLsK4fB83SVwyDPP1g2+eZC5Cw+Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/ydWU3nIVlTf4KQ6vpFy5cdWmI3YIemFh29rsSgDYN8WmOY/5WTQpXmNdKmUQr6oFavXuskLd+m+WnpMyvvUoga57cTII2Wri0dhP+6bkbixv1XjFPF4HuSbymHsRDUnog7N90icU/QyfwU7JUqqtCVWhKdfYp3NLcb9TglbUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xrZc9o9u; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xrZc9o9u"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2984dfae0acso35197905ad.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 09:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763747753; x=1764352553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NOczehve2+cnsMUNrag+s9SdOyzwCWr1O+HoNDArIDs=;
        b=xrZc9o9uZ73ur5+Jz10sQx2w5OtWeLFN2CheHzkAaBMA2XCJP3BMPAmW9JY7+WZXwA
         2nJqTB/JlpXob/eryJ2Izv4wdZ2sJhaYLYfFsFpxRS8ZEK5d1DIQrpJXhdATr+Ax9wxC
         bsH0V9lbVUXvq8xr3Xt5Rs5Trnv9igjudux5yd85lEnZ37S/Sssdgxa411iT29uZNg1M
         WSfrp/eyRV4dox+AZsYbaZxnSKG9sFgpHlgnDWE5+qHtnu5p+PdXuMIEk3P7TiuJV+1f
         T44nKBPckO5R9/5ZbM6p0bEANCkL1qjC1e0Fa/Bo/3Ya1UMskzakvVmCIecXbaAzVEne
         vrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763747753; x=1764352553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOczehve2+cnsMUNrag+s9SdOyzwCWr1O+HoNDArIDs=;
        b=UrjFMtYvcYLi9dRbbtuD7HcnMSlq0nepOXMzb/kB7CDgxRHuzmZRZ0z8/i02hI/pVr
         8zS56yVOlW3+wz0w4Yvg/aeCjQzbc+LoaIQQ3FFetH+0axx/jnj/Z5ddsHZNnOH6uYWf
         M1retjyMzEPtTFjGjIH+2qkfAU1o07EFNlOhcVYzmm67Wnnpmf354/Bo/aDtefg8MFDl
         LEKgmDNlMIT7I44BDAL3VRshfAEAc6pCNnRnVBo3142n6/HQEnfykgeEFpv2o3NVSjPX
         2eaOoOHzxsY9FsoPx5FU46kDluH6vPSNz1mDFkkqfxWv0vtyfLmLWlVIRzmNtrNQVwZs
         4MOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGIOKCG8nwdnwQRSAjyFbf9956OF4U1OfyIrKYjdiQce2V73jDJkP7Ui1PLXPJtqzZSsZF6h2EuFbcvLa7iZSTXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNUO/RrqrTFz4+spDTy33a9UgoHZaeucArvpo07bnTRkf/fyuv
	DQbRNKF54ijLt/+mfuzdvXI2Fl3SspPGoxzJ5gXj6kF3mKE/VxEb58g+uJMDgwsX2g==
X-Gm-Gg: ASbGncut3rDUAyEr/PUNzO8FvtSHrVVWwEPRDjrUsw10DMDV1T+HYOUXQRPInJNIK39
	6s/Rl2fuEU8a47OF+AurWyGTVANi5biAsBh/xUFncntq6oz8MV19om+hg7eBFrGQyV25URzAkAk
	FBtiSU32sK5r0EK2N82tRkOt0DQ/PYkIHxqYWSjmgLF0ZtGuQBoIAVIESX2MNl3jpmqcmpBKcfD
	D8xxM3UQgpQBQkyiaj9krVhN6q0LDPoGA5tnHdDxtq2W/iTMJaTcQ2gQPMN5GbNLTJZiCwvNOiY
	HUJV5CnaZtIAmcer2IKVGtDPhnXQmoW3PNSD3BFBk7QU0m+EPnAnfrPOz1FXZQVEdtJ4EPGFPqf
	ImVJ6a4hvPK8eaKAoGKs8es69XLLyCPwVXt7/7F/6t274A0ZkqWYevwPrVag94EOUoth9B7OSR0
	IVNAlICvFi1VDPG2gc0wva7M/uz+b4rOPA4HdQw0famn8ZPFhUIollcIw=
X-Google-Smtp-Source: AGHT+IE2W4u9IOFJelWNiCRMfwPVNTwdUvO0tURMAaL/pRmfzeXyfqcqSuXHOyjy9NczAMIsi751Tw==
X-Received: by 2002:a17:903:3c43:b0:298:1156:acd5 with SMTP id d9443c01a7336-29b6bf1a67fmr42515655ad.39.1763747752665;
        Fri, 21 Nov 2025 09:55:52 -0800 (PST)
Received: from google.com (226.174.82.34.bc.googleusercontent.com. [34.82.174.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75e6c6ad3sm6145258a12.13.2025.11.21.09.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 09:55:52 -0800 (PST)
Date: Fri, 21 Nov 2025 17:55:48 +0000
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
Subject: Re: [PATCH v6 0/6] Add module support for Arm64 Exynos MCT driver
Message-ID: <aSCnpO72osBqfmTj@google.com>
References: <20251120184242.1625820-1-willmcvicker@google.com>
 <aSCBKRpA4jSw1iuF@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSCBKRpA4jSw1iuF@shell.armlinux.org.uk>

Hi Russell,

On 11/21/2025, Russell King (Oracle) wrote:
> On Thu, Nov 20, 2025 at 06:42:28PM +0000, Will McVicker wrote:
> > This series adds support to build the Arm64 Exynos MCT driver as a module.
> 
> There are parts of this that are just totally incompatible with it
> being a module. For example, you can't register a replacement udelay
> loop after the system has booted.
> 
> This is the second time I've faced a patch series wanting to remove
> __init anntations to call it from a module, where the author has
> clearly not analysed the code to see whether that is a valid thing
> to do. This is unfair on reviewers - it is the submitters
> responsibility to check that what they are doing is valid.
> 
> Moreover, in _this_ case, you will have received a kernel diagnostic
> message stating that the call to register_current_timer_delay()
> was ignored, so I also question whether you bothered to run-time
> test this change.

Sorry for wasting your time on this due to my lack of explanation. PTAL at my
response in the other patch set.

To address your testing concerns, this series has been thoroughly tested on
Pixel 6 (ARM64) since 2021 starting with the 5.10 kernel version and is
continually being tested on the latest kernel version today.

Thanks,
Will
