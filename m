Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C361136651
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Feb 2024 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709026005; cv=none; b=HhLoTJzPOPygOr75ENnaeh9QlnQ+Qwp+UB8f8h8RJKecN/F0oe6SWI+rBHNJfs48cUzIrzbcvlnbzHZYjDF1B7xGoXGMxS9nkDG6RcisKg22QDLBiNlk2RKxxstLlyI5F663tWVxdHebzNEWcTpu3v2qLsEbHngMtBuiFSq+oBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709026005; c=relaxed/simple;
	bh=gSbUQsirrWFrImZesOfAPQMNkjUonfMjw6UlzzNR/IU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZfbGrbVtNjyAwWyRQxnsh4pBBD4ZU6sNCgeb7ou4PN6Cj8Yp8ix5TuyXSu/HF/Ty7mU/uQhYLUfK2ZMAWuxQdlThq4xxiL/v74Wt5OrlbTMrTC/utY26CVWJNozMvCNDlKNXBCiA/AY14MIShf5ypln4bbRboslQfjnq1KkMX9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwtEoTQm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwtEoTQm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E901EC433F1;
	Tue, 27 Feb 2024 09:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709026005;
	bh=gSbUQsirrWFrImZesOfAPQMNkjUonfMjw6UlzzNR/IU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=TwtEoTQmvaegR4xgPtwfsRUyel4qJB6fY7FHfYlZoChZcbIZ9wLddTMZRoHzrtTFO
	 pdmCDcMOCtQaGcEgvnlzwARxMNLmSd8p+k3NU3NrXeGjd0HGYpQydNVOlyNpAxfEXM
	 aywR1nGRYmnhI1zkM0Y2BslYDVjaWxxE2Ewc41/hxJSSS1cyT3wSDm7teS2BqTYRB+
	 Ek35EJXIUj2wRVwUzIdXmXAdwECV6bORUBvFDacs4U9IWhhVwNOP7vZ/ih/P0TUuaA
	 JMOu+L4uVm+eBjIJaoKsP2ZuT0Pqolr7tARd8iCRCelGC6DscKsXlZOn+9Ev/6qT+D
	 xl1DrMlv3grXQ==
Message-ID: <6337a46a-b8dc-4d0f-9e59-d88d7aa53176@kernel.org>
Date: Tue, 27 Feb 2024 10:26:39 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Users of exynos drm driver
Content-Language: en-US
To: Seth Jenkins <sethjenkins@google.com>, inki.dae@samsung.com,
 sw0312.kim@samsung.com, airlied@gmail.com, kyungmin.park@samsung.com,
 linux-samsung-soc@vger.kernel.org
References: <CALxfFW7nSev3UmgdOpc_Sai52yGo3NSO2iNQ=p5Xi4O=cPRAQg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CALxfFW7nSev3UmgdOpc_Sai52yGo3NSO2iNQ=p5Xi4O=cPRAQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/02/2024 19:42, Seth Jenkins wrote:
> Hi, my name is Seth and I'm a member of the Google Project Zero
> security research team,
> 
> I'm presently looking at the upstream code present in
> drivers/gpu/drm/exynos, enabled by kernel config CONFIG_DRM_EXYNOS. It
> appears to be well-maintained and regularly patched, but despite my
> best efforts I have had difficulty tracking down the end-users of this
> driver. I have not been able to find any recent examples of this
> driver being compiled into kernels Android devices or Samsung Smart

Vendor Android? They do not use mainline kernels but some old stuff.
Android devices are well known of not using mainline kernels, but vendor
old, custom and poor stuff. I thought that's kind of obvious. :)

> TV's (based on Samsung's open source repositories). I've also not been

TVs not sure, but most likely even worse than above - even older, less
"mainline" kernels, because no one pushes them to do something like GKI
where at least you have to package vendor crap into module.

> able to find any modern open-source codebases that utilize the ioctls
> exposed by this driver.

Hm, that one should be. We have working display since years (10? 12? 15?).

> 
> I was hoping you may be able to point me towards modern usage of this
> driver - I assume it's present in kernels compiled for some subset of
> Exynos socs and in lieu of  the CONFIG_DRM_SAMSUNG_DPU code? What
> kernels/end-devices would that be?

All mainline supported devices. Open mainline kernel, go to DTS and
look. Now, if the question is how to get one, it's a different story.
Currently known widely-available devboards are Hardkernel and e850-96.

For community, users and all list of devices see: exynos kernel wiki and
postmarketOS pages on mainlining (that's probably the most comprehensive
list). elinux page also might have something.

Best regards,
Krzysztof

