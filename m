Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B411CDDAD
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 01:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707270756; cv=none; b=m6EbeT81mc0Qw4N6s+RRQOLFx8tYlAhlGU6PF1NAWmNfSDEhxEK1NSNbaowPflkS6Xo+NamaKiIqfoQxHkCx14u9tUcIbEO3YR3x9LVPTRoevOiRDFh3BSAt9iTrs8VKuivJEZ1mU7PdsuNuXavU3pZA69AJBwclc8Lh1zkf9Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707270756; c=relaxed/simple;
	bh=fPAGMfSyuD+8TdF5uQU0QjwDMC6vux/Tb4WUPf7a+Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTEOS+vJU16KYTODPkXlI81wKdPiyXhu+8J/YoNanfKyQfxTt8HzF0LLrDCM6fUoxsCEqyEv2jTCiiT3xwZzNc94MWZ2MwIHmIlsgS/OkRS7Fg1WBjgZqUDu/tlb7x0XKUBjWDG0yugSq+SVACpO7kZeqjs4mARt/F1iCuyqjIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRz4yamq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRz4yamq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A61C433C7;
	Wed,  7 Feb 2024 01:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707270756;
	bh=fPAGMfSyuD+8TdF5uQU0QjwDMC6vux/Tb4WUPf7a+Oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mRz4yamqq2Wft9jp9DMFqJohZfZ434abPReGluQyVUMHPtzJA0S0JnjJrUA2dJMC/
	 xkaJe4yMHlb3ch6ZsPBhJfwWclAGJvyVb6D08STqnKYYFN709wyZsjm2in4ctbeDkm
	 0K0HXOBxGKcEWGJsMEGHsWzf0YyzUO+/HVSvcoZlbstvnEWiJMq5L4n5v5TMvQsrR7
	 E1X+ogfGez3Xefy1GaWAsEYvy3yG1sXcFjgjfHPRUHLLWMKEPhZXFdcl+R24vIA1dG
	 iTKXrv36fBDIuUYfS77vjkdkbUjRgfX5PXlB+gPEEyYT04hdllaUPXjTMAHeom3GhD
	 19aU3IAbTb1Zg==
Date: Tue, 6 Feb 2024 17:52:34 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org,
	Will McVicker <willmcvicker@google.com>
Subject: Re: UFS storage support for Tensor/GS101?
Message-ID: <20240207015234.GD35324@sol.localdomain>
References: <20240206034502.GA175333@sol.localdomain>
 <CADrjBPpw4f-GW+dxQMTP4HEhVjEJ19g=eAsYLdzXzzFkTmcVbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPpw4f-GW+dxQMTP4HEhVjEJ19g=eAsYLdzXzzFkTmcVbA@mail.gmail.com>

Hi Peter,

On Tue, Feb 06, 2024 at 05:09:13PM +0000, Peter Griffin wrote:
> Hi Eric,
> 
> + Will
> 
> On Tue, 6 Feb 2024 at 03:45, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > Hi Peter!  Thanks for all the hard work you've been doing on upstreaming support
> > for Tensor/GS101.  I've tested that the latest upstream kernel is now able to
> > boot to a serial console on Pixel 6.
> 
> Thanks for testing :)
> >
> > I'm wondering if you have any plans to upstream support for the UFS storage on
> > that platform?  It should be able to use the already-upstream
> > drivers/ufs/host/ufs-exynos.c driver, but changes may be required; I'm not sure
> > how many.  I'm interested in this mainly because I'd like to upstream some
> > patches related to inline encryption, and that depends on UFS storage working.
> >
> > I'm interested in helping with this, but I wanted to check to see if you know
> > about any existing plans first.
> 
> We certainly want to add support for UFS upstream, and if you can help
> out with enabling it that would be great! It would free us up to work
> on enabling something else in parallel. From a first pass analysis of
> the downstream UFS code it looks like ufs phy driver likely needs the
> most attention.
> 
> The last UFS dependency (that I'm aware of) that is missing currently
> is clock support for cmu_hsi2 (which I was planning on working on as
> my next task). Also the UFS phy accesses PMU registers so that will
> require my exynos-pmu [1] series but that is hopefully close to being
> merged.
> 
> So I think we are quite close to having all the UFS dependencies in
> place. Shall I ping you once I have some code for cmu_hsi2, and
> hopefully that should be enough for you to start working on the UFS
> driver and phy?
> 
> Thanks,
> 
> Peter

Yes, let me know as soon as you have some code for cmu_hsi2, and I'll try to get
UFS working.  I don't know how hard it will be, though, so it's possible I'll
need help from others.

Thanks,

- Eric
