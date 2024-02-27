Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CD713666C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Feb 2024 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709026267; cv=none; b=BUIqfGnvufswMkcVOZ/VJoeeg5uWKA13+w6cY/xc5MTD1i4G2LzdLRuZ7G7wMdsr2Kvz9YJ7hOm+iaNL5Xchf/W3THZePZV8Y2mA304IaLNt3ZujqIlgDU8ug0my8LzKo1hcsxmR68mnVPbVg8amARHOpNE53QYwjgs0ikE4X14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709026267; c=relaxed/simple;
	bh=hwzqvwZnxyGpUvZNOaZcQ1ABFA77XSmZnu1lmoUdPUo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ZSN3VezCVd4J+DaW7ogvegCxMbEk1lh26mfQNMNaC7l5q676EAedMCveLavJeFb8ZxjRStYu82w7OM8D3nF4bOtqUuk1t9GZJ3kwwwDDFzn7uYrpuHuaKsNGlJ9Lm1j8X7OrA1tIf372qj77YnHPpzwmh+FG60Ama7KmBqTtERQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3shxXBn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3shxXBn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0629C433F1;
	Tue, 27 Feb 2024 09:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709026266;
	bh=hwzqvwZnxyGpUvZNOaZcQ1ABFA77XSmZnu1lmoUdPUo=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=c3shxXBnSTM5jp4KHo98AZTj3/gWNubZZQAnMvt9nkc9Hn40ptIdV3C7rMw0gEPpK
	 e92+J2A7/iSLydIe1LlwtkGQqiWHcjGmy1DHktOfPTo4vOjnF8RMA6ymHXxSSAJVph
	 E6ZPVeRd+lw2S+NoZq1mNex6l5Q2dp8b5zkSFQ84VWEm3IJpRNFehcL0/uaQx4/Q0f
	 5AbIs+KjSDjYHYGIWecGK+NHbEq0L0TjBLt4r2xCelnxabuPqTlyF8OBZjoUZ1xH1L
	 BSr8Bi3mNAG5sx3aWqNcmXH3F+c1TNK+iyTYE8hJCrGad5OPNrm25WR8nqpj879ITq
	 ZSkIfUluloEXg==
Message-ID: <0938fd7d-8e1d-4db6-a6aa-c3258846afd6@kernel.org>
Date: Tue, 27 Feb 2024 10:31:01 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Users of exynos drm driver
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Seth Jenkins <sethjenkins@google.com>, inki.dae@samsung.com,
 sw0312.kim@samsung.com, airlied@gmail.com, kyungmin.park@samsung.com,
 linux-samsung-soc@vger.kernel.org
References: <CALxfFW7nSev3UmgdOpc_Sai52yGo3NSO2iNQ=p5Xi4O=cPRAQg@mail.gmail.com>
 <6337a46a-b8dc-4d0f-9e59-d88d7aa53176@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <6337a46a-b8dc-4d0f-9e59-d88d7aa53176@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/02/2024 10:26, Krzysztof Kozlowski wrote:
> On 08/02/2024 19:42, Seth Jenkins wrote:
>> Hi, my name is Seth and I'm a member of the Google Project Zero
>> security research team,
>>
>> I'm presently looking at the upstream code present in
>> drivers/gpu/drm/exynos, enabled by kernel config CONFIG_DRM_EXYNOS. It
>> appears to be well-maintained and regularly patched, but despite my
>> best efforts I have had difficulty tracking down the end-users of this
>> driver. I have not been able to find any recent examples of this
>> driver being compiled into kernels Android devices or Samsung Smart
> 
> Vendor Android? They do not use mainline kernels but some old stuff.
> Android devices are well known of not using mainline kernels, but vendor
> old, custom and poor stuff. I thought that's kind of obvious. :)
> 
>> TV's (based on Samsung's open source repositories). I've also not been
> 
> TVs not sure, but most likely even worse than above - even older, less
> "mainline" kernels, because no one pushes them to do something like GKI
> where at least you have to package vendor crap into module.
> 
>> able to find any modern open-source codebases that utilize the ioctls
>> exposed by this driver.
> 
> Hm, that one should be. We have working display since years (10? 12? 15?).
> 
>>
>> I was hoping you may be able to point me towards modern usage of this
>> driver - I assume it's present in kernels compiled for some subset of
>> Exynos socs and in lieu of  the CONFIG_DRM_SAMSUNG_DPU code? What
>> kernels/end-devices would that be?
> 
> All mainline supported devices. Open mainline kernel, go to DTS and
> look. Now, if the question is how to get one, it's a different story.
> Currently known widely-available devboards are Hardkernel and e850-96.
> 
> For community, users and all list of devices see: exynos kernel wiki and
> postmarketOS pages on mainlining (that's probably the most comprehensive
> list). elinux page also might have something.

One more thought, because you entirely skipped me in the CC list. Please
use scripts/get_maintatainers, to obtain the list of maintainers. In
that case you could get some sort of answer from me 20 days earlier,
because I scroll through samsung-soc occasionally. get_maintainers.pl
prints my name, so I just don't need to look at mailing list.

Best regards,
Krzysztof

