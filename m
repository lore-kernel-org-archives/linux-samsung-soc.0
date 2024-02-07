Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A30C83A16
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 18:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707329068; cv=none; b=RcqpFqWzr599Ln6gnorfX1RtPncVzf7jtwXbI60S0GeL304nRWNOMS7KspV24rvQWyjphGzUDvAERgA4a3U44sWYhmZ0+4k936nGUcRvj6W5Ckf1p/FTtPTTtZrctZaWuSvuaMDSNoSAW1fUSFuWo6R+YApfErMeYZGTX/T9s84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707329068; c=relaxed/simple;
	bh=YPMOvZH55fB37dDiim6APGore/9mGwNNUnY4uRV464E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPML96V6DmSLKqqWGDJNffSnIaEO0fWHBETT6Kc61D3jGYWrgYKiD1/MgGhgcJVKWxvzZxJ0QLiy7cXvkS79zTfwTLCYIgSS2811JYWYX8qcSjyyex0Mx42Aa345fAD6S7YXlufcOxXnQCexfQdYFhQ+fKy5oJ89B5UOga36WC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zs0BNLh6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zs0BNLh6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d5ce88b51cso11645ad.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 10:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707329067; x=1707933867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hwVhLzZGxow3qxlf4scZQzQkeVQyNuXvArPW2Vnm55I=;
        b=zs0BNLh6ZAdZcUyMLhAeYIYcWNSWLjEODSghKq5dr26AeVdSfWuCBhvb9qSUcwzEW0
         fu0gDQWAJCf8SfRj1oqCHyVnWEKKIfPasamVqFLEQ7/AQqfaNp612VsUFV5hhXl81/Bw
         bf0rmABjg+ro8MYyEE2ZohD5rtupr97gKV5TNyZgPgX63t0+8vt/VSsHdFIj4dSKdcsW
         avetJzblyP31Z3InluFlY31/ej+3iM3FX1VdWXIrBiYUwYMtO9+rtk2dTb1nmp0A+PdP
         xSJRksztGf4OqHgWR3ngB4cJx9cM7PuVnwlqEb18Wkz4gKrZ6Ebh/S1KFXQd+Oh2Pf9L
         gLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707329067; x=1707933867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwVhLzZGxow3qxlf4scZQzQkeVQyNuXvArPW2Vnm55I=;
        b=dYcVJOXCMOoCmhO7oxc4xQKbAv71cw1S10cWDB0zeb5nmrAYgdfzFYIZb4cSStgWXH
         sFnyXfwPpDFjD9jhLyTzxVjQ+O1ObMy6vLXVpxtNUq/zFqru+6VK1nN4Ed9O/krlIRzr
         eYAACC2/3fRsN/Z3fByT3CigutMI/4wP/OJn5yQ9gD9+yGS3uukeHyYwBeh3r0FL7rkO
         E1bFoNFD7L8T/IYzV9E2GtKwLjJnisWodShuL4diLY1AbBvPJoqODL3Oh+pxvLXLIlhC
         c/vosbSWCx3VS/yiShTmxxS3qjL+GZ+rYc5g8l24o3du6IVL6Xk81/qaYa2DPU4eejOm
         5h5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaNf9oIrByQw22PXqVRVrg4nJJZLiCAt0D8glgckkv7EQaBtqWCRBMxC0VvDjOgwjymssc64dA+CvjXw4azMMQjAmRTSEqe8cJaRGOO5V4en8=
X-Gm-Message-State: AOJu0YwsnEvqqBM+9huKKtKZa1it1XI6i0pkPF3TS6Dc/KPqA6KCdoiX
	lpi71uI4yhRXMKzyR1XCYWUCydR3lbSlGV8/EldmEe+eyqDv9lE02Opia1+e6vrsx0vb0OB6lYp
	J6w==
X-Google-Smtp-Source: AGHT+IElGE49IyyE5HMUb70U4NBFH9z5Thr9D2OHUdaBGGuMDRpYd0PG8AHfES1Gt/LVsGvQpFaPRg==
X-Received: by 2002:a17:902:db08:b0:1d9:795a:6495 with SMTP id m8-20020a170902db0800b001d9795a6495mr200060plx.8.1707329066465;
        Wed, 07 Feb 2024 10:04:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRqFZCI5QVt1iMW5cB+eU6N9p6niKleuQLjUZSG2COtjHmnZzCCjG6GYci3e3T+qbBfHUEk8aBVcj6NulrECZ1lCpfYvomgyfpL+vA0nx4WZjb80R1r0dy2ZLi0sAkZA6JqUnZGtO+S6Drcqp5nNKWL0sCrw2/BLJd0Cm2+5U=
Received: from google.com (69.8.247.35.bc.googleusercontent.com. [35.247.8.69])
        by smtp.gmail.com with ESMTPSA id nh12-20020a17090b364c00b002969d5db646sm4370835pjb.9.2024.02.07.10.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 10:04:25 -0800 (PST)
Date: Wed, 7 Feb 2024 10:04:22 -0800
From: William McVicker <willmcvicker@google.com>
To: Eric Biggers <ebiggers@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com
Subject: Re: UFS storage support for Tensor/GS101?
Message-ID: <ZcPGJo-NsOgZAQI5@google.com>
References: <20240206034502.GA175333@sol.localdomain>
 <CADrjBPpw4f-GW+dxQMTP4HEhVjEJ19g=eAsYLdzXzzFkTmcVbA@mail.gmail.com>
 <20240207015234.GD35324@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207015234.GD35324@sol.localdomain>

On 02/06/2024, Eric Biggers wrote:
> Hi Peter,
> 
> On Tue, Feb 06, 2024 at 05:09:13PM +0000, Peter Griffin wrote:
> > Hi Eric,
> > 
> > + Will
> > 
> > On Tue, 6 Feb 2024 at 03:45, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > Hi Peter!  Thanks for all the hard work you've been doing on upstreaming support
> > > for Tensor/GS101.  I've tested that the latest upstream kernel is now able to
> > > boot to a serial console on Pixel 6.
> > 
> > Thanks for testing :)
> > >
> > > I'm wondering if you have any plans to upstream support for the UFS storage on
> > > that platform?  It should be able to use the already-upstream
> > > drivers/ufs/host/ufs-exynos.c driver, but changes may be required; I'm not sure
> > > how many.  I'm interested in this mainly because I'd like to upstream some
> > > patches related to inline encryption, and that depends on UFS storage working.
> > >
> > > I'm interested in helping with this, but I wanted to check to see if you know
> > > about any existing plans first.
> > 
> > We certainly want to add support for UFS upstream, and if you can help
> > out with enabling it that would be great! It would free us up to work
> > on enabling something else in parallel. From a first pass analysis of
> > the downstream UFS code it looks like ufs phy driver likely needs the
> > most attention.
> > 
> > The last UFS dependency (that I'm aware of) that is missing currently
> > is clock support for cmu_hsi2 (which I was planning on working on as
> > my next task). Also the UFS phy accesses PMU registers so that will
> > require my exynos-pmu [1] series but that is hopefully close to being
> > merged.
> > 
> > So I think we are quite close to having all the UFS dependencies in
> > place. Shall I ping you once I have some code for cmu_hsi2, and
> > hopefully that should be enough for you to start working on the UFS
> > driver and phy?
> > 
> > Thanks,
> > 
> > Peter
> 
> Yes, let me know as soon as you have some code for cmu_hsi2, and I'll try to get
> UFS working.  I don't know how hard it will be, though, so it's possible I'll
> need help from others.
> 
> Thanks,
> 
> - Eric

+Bart

Hi Eric,

Thanks for reaching out! I was planning on sending a message to you and Bart
once the UFS dependencies that Peter mentioned were close to landing. We would
love to have your help!

Bart,
I know you mentiond in the past that you looked into upstreaming the Pixel UFS
driver but were blocked on it's dependencies. Have you had a chance to see what
has landed for gs101 upstream thus far? It would be great if you could provide
feedback on your findings! And please let us know if you're interested in
collaborating with us on upstreaming the gs101 UFS bits.

Thanks,
Will
