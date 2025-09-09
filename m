Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE971316911;
	Tue,  9 Sep 2025 17:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437429; cv=none; b=gvbNre2Buj8GFAU5xvlQ1hwc2eg2t3V62J1X+Qj8PnuToOHK1VJOUNBc/9CxOVektRZRWHFgp82vuG/5Ih5H3iDu1tfbE4RU/XdTyqMIkX/xFM74e0LlWImYAZtjX4vStiORVFzZYgbbXHrJ9XiFg/s4dfd4O2Qx/SBuLLjDUog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437429; c=relaxed/simple;
	bh=0ePioIJRedWiKF0fn+IJE4meuWisJGQBNojm9/VTE8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQ3/88L6byKP57dVRunNIZYOdq3jv2bb1JmuiG30iunxDIQC0v0tyEgC0Y02dZzJalipu+3dZz79D63T3Htc5+ucgoeZ2jVh4hrwl/tZWVG8Wk0YkKbDPz2r/YPcrrV86uj+Rro5ywLtlV24Hj+1ICYeUcdpCKiaSiR9UI+xYVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3+ngas/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3+ngas/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D7AC4CEF4;
	Tue,  9 Sep 2025 17:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757437429;
	bh=0ePioIJRedWiKF0fn+IJE4meuWisJGQBNojm9/VTE8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3+ngas/LmfCKgPZgS169nXNhfUMi1tMAVKGAMExa9X/38EsL7MfulBUMkwfZZoTe
	 EF6V/mhI34Ox2QTO9s9jc+vlIXF1iuc7UwoqLnxIiQguFuweWprRw9rDy817jTfk4M
	 +22dYEsWWFJ4SmAw6+NxxjrOaTJgppaHnzoQ6sq0bZ0+t4O/hmpBdDCb7sk0blDggh
	 GMPw7BByEmf61rxXpP8B25vPJW51PtIaDk4RgueiveFEskvx7pnKkwrWw3TkkflV8B
	 JJxHYM0pcgdmUCgJCUMDnq5/i3ijSytnVEEweecUgcNsdSmlPYQcO2xSxFkJcaRF+c
	 0HJX8bWWEnw5w==
Date: Tue, 9 Sep 2025 18:03:44 +0100
From: Will Deacon <will@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com, Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: Fix for CONFIG_DEBUG_PREEMPT
Message-ID: <aMBd8NT78_Svcy71@willie-the-truck>
References: <20250905162446.88987-1-smostafa@google.com>
 <19a6f296-eb40-49cf-9571-2d7964cd3313@kernel.org>
 <aLshJ11k3c2T-MRs@google.com>
 <84332e77-cfd2-4090-a3c0-114a9eb5422a@kernel.org>
 <aL_-N43BTtQynMS_@willie-the-truck>
 <52222467-4fc0-4a53-9682-a935ec8f1a44@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52222467-4fc0-4a53-9682-a935ec8f1a44@kernel.org>

On Tue, Sep 09, 2025 at 05:43:16PM +0200, Krzysztof Kozlowski wrote:
> On 09/09/2025 12:15, Will Deacon wrote:
> > Krzysztof,
> > 
> > On Sat, Sep 06, 2025 at 09:07:02AM +0200, Krzysztof Kozlowski wrote:
> >> On 05/09/2025 19:43, Mostafa Saleh wrote:
> >>>>>
> >>>>> As this value is only read once, it doesn't require to be stable, so
> >>>>
> >>>> Why it does not need to be stable? Onlining wrong CPU number is not
> >>>> desired...
> >>>>
> >>>>> just use "raw_smp_processor_id" instead.
> >>>>
> >>>> You might be just hiding some other real issue, because above stacktrace
> >>>> is from gs101_cpuhp_pmu_online() which IRQs disabled and preemption
> >>>> disabled. Provide analysis of the warning, instead of just making it
> >>>> disappear.
> >>>
> >>> Not sure I understand, how is preemption disabled? that wouldn't fire
> >>> in that case.
> >>
> >> Because there is explicit preempt_disable().
> > 
> > Where do you see that?
> 
> I did look at the code.
> 
> All the calls I saw (including calltrace from commit msg) were under raw
> spinlock and raw spinlock does:
> 
> preempt_disable();

The backtrace doesn't contain a raw spinlock. As Peter subsequently
pointed out, the reported issue has been fixed in linux-next and there's
a raw spinlock there but since the report is from vanilla -rc4, it
doesn't have that fix.

Will
