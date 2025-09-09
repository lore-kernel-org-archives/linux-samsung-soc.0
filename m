Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C495D2E975A;
	Tue,  9 Sep 2025 10:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757412924; cv=none; b=udpcE3lO9ShH0RD6FQdQhMZW0uez4qNi52VPLL0pJMGLGuG3953wa73SrYzGwmhsaczCBrBZSY/c1KyQamBNz1bslf5iAjjn3k2zjt+/YNssCR9nVtR2iXAy/zlmDrI6hvYuXFh/h0OZdJjfPvXRHfCsZ1JLubu2mtx+ZkgkfAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757412924; c=relaxed/simple;
	bh=W4ZNNxvoHzwG3XR6SRFoMRWquFrLJc9azWmuVkfqFbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/WBcor0S/Emj9aqd8IjqQklVll/Yn09e320/XH7ADLBXEoGH9zs7tRLGdsEDbIVYhjfPnqvQUGzCqd8Z1eI/gdeAu/TE1XbGF+LK3m2eKmuEJ9NxD1R2KcqCXowYp0URoTuu4YZ++OI0NLkvyjr0LIT5VDbWZRVFbl1AqxydoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/BUqdfD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/BUqdfD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1ACBC4CEF4;
	Tue,  9 Sep 2025 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757412924;
	bh=W4ZNNxvoHzwG3XR6SRFoMRWquFrLJc9azWmuVkfqFbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/BUqdfDHVAiCMuZDphbqs1NG9VJi7db+t8nkDQz3QVKv0Dfm/UmlSNu8SkGceqrL
	 4DNtHy3sIm01JuUR6VxzRG14wg36xFHUCeYafD/CVf1PLWLLMlZF6cucspP9kpZu2i
	 JnXwA5Nz4XHdp7BrcMhA3wBX3wD7Whna8PQb6OX66SgkhomCdMHQWULD6elxq6q8mU
	 SXRBYjMqw9PuBx3Y5TaGqDoUHCODQJFFvHvhw4NAoP6YhGpoVe9DFT4cUTwoAGp/3Q
	 bP7SNzyUVyQBg/AK5BlzTodr/etp4Q6Du6UgzhFQt67cSknW9nVs7dtBksmjAOdKO+
	 RR5JoZ8/i8pjA==
Date: Tue, 9 Sep 2025 11:15:19 +0100
From: Will Deacon <will@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com, Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: Fix for CONFIG_DEBUG_PREEMPT
Message-ID: <aL_-N43BTtQynMS_@willie-the-truck>
References: <20250905162446.88987-1-smostafa@google.com>
 <19a6f296-eb40-49cf-9571-2d7964cd3313@kernel.org>
 <aLshJ11k3c2T-MRs@google.com>
 <84332e77-cfd2-4090-a3c0-114a9eb5422a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84332e77-cfd2-4090-a3c0-114a9eb5422a@kernel.org>

Krzysztof,

On Sat, Sep 06, 2025 at 09:07:02AM +0200, Krzysztof Kozlowski wrote:
> On 05/09/2025 19:43, Mostafa Saleh wrote:
> >>>
> >>> As this value is only read once, it doesn't require to be stable, so
> >>
> >> Why it does not need to be stable? Onlining wrong CPU number is not
> >> desired...
> >>
> >>> just use "raw_smp_processor_id" instead.
> >>
> >> You might be just hiding some other real issue, because above stacktrace
> >> is from gs101_cpuhp_pmu_online() which IRQs disabled and preemption
> >> disabled. Provide analysis of the warning, instead of just making it
> >> disappear.
> > 
> > Not sure I understand, how is preemption disabled? that wouldn't fire
> > in that case.
> 
> Because there is explicit preempt_disable().

Where do you see that?

From what I can tell, the driver (somewhat bizarrely) registers its
online callback much earlier (at CPUHP_BP_PREPARE_DYN) than the offline
callback so that gs101_cpuhp_pmu_online() will be run in the context of
the caller/onliner rather than the actual CPU coming up. I don't see
anything which disables preemption on that path.

> So far you did not present any code analysis, any actual arguments, so
> deflecting reviewer's comment like above will get you nowhere. Instead
> of replying with a question, bring arguments that the code path does not
> disable the preemption.

Mostafa's reported a bug and had a go at fixing it, for goodness sake.
Would you rather not hear about bugs in the code you maintain?

As somebody who should understand this code better than most, perhaps
you could try a bit harder to fill in the blanks on the technical side
rather than pointing out extraneous blank lines and making questionable
judgements about CC lines.

> My call is that you run all this on some other kernel, just like usually
> happens in Google.

Whilst that inevitably happens with some of the more product-facing
teams, I think it's foolish to assume that nobody works directly with
upstream at Google. We're also not going to waste time fabricating bug
reports which is why we bother to reproduce issues on Pixel 6, as that
can boot upstream without any additional patches.

Will
