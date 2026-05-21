Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DE935B137
	for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2026 09:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354297; cv=none; b=qr94BN97Y2kcbBZ19NM6e69naAe8STje2MwAb3OFNIBZDoXgGMa55FEitZ+z1fAmr7jT1jsPz1o6CgcR2I+DHbMN1F0+LPSdqdLcSDsrGGjPvqxD2IKxeqazPwJFqDeH4lim2aadYOOOVHZKxs9mjS/pp4z8KlpuPVmVnd0iGWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354297; c=relaxed/simple;
	bh=51jdkliopHm/gTkNpfyqZJdBe6+HfqqyblMbDA73iTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8rImMzawrl7SC51MmAIxLNucXV5LaMQRuvOfGF45fGq0Fe5L4Tbne1UhVpxOlWlHZZV3B46wQNR0aMedcpgYJDat8m6eSBdmAPuDVcdR8jk08DkLKMoeUU8iwWo0td3lpm5pPD0MEDMn/+KjZZuPUmhXl+oXgT64bFcPwWTzio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fd6DhrsO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=w6ZCIvIL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fd6DhrsO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w6ZCIvIL"
Date: Thu, 21 May 2026 11:04:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779354295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fSDPkRUUJC/bV8tedmxXW4GHFzaVR3KOKuUCBGSDWus=;
	b=fd6DhrsOkDkVlvJmnojDSYTfvxgdDuEFW0nykKnpcXFVv6JGL2tKkOziAGd1u0pcwu5pD/
	+67Hv5MavnqkZ1tfiFmGjH4Qv52WmwyI6Znj/nYQyvZA174tY3OlZM1t8YGDGOjzJay9Ka
	ZuVkn9Nko7R5zjLG988KjO/f4b83dl06WsZYmxYPtQPZ8u+YlkI5jEQr1/Iw5zR0AcJteN
	ou6yERi6jYswvjfI11ETBPPuU9pXGNyyynpGxzZkfwFkEQ41dPNGBEBQVijDOCApUfXW67
	qloChEmysIhRZmVP5gKSJ2UDKTTgFERnTb67OL+LqgNsNKAV0WodHinquaHxkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779354295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fSDPkRUUJC/bV8tedmxXW4GHFzaVR3KOKuUCBGSDWus=;
	b=w6ZCIvILEIf2lo04wU/0+32CTneX/5/eJI+XnLzI/3gDgC538g4FbafFduGE4apaApx0lv
	TTY1RPCizLMCfcCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] irqchip/exynos-combiner: switch to raw_spinlock
Message-ID: <20260521090453.bbUZ00tS@linutronix.de>
References: <CGME20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109@eucas1p1.samsung.com>
 <20260520220422.3522908-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520220422.3522908-1-m.szyprowski@samsung.com>

On 2026-05-21 00:04:22 [+0200], Marek Szyprowski wrote:
> The exynos-combiner driver uses a regular spinlock to protect access to
> the combiner interrupt status register in combiner_handle_cascade_irq(),
> which is invoked in hard IRQ context as a chained interrupt handler.
> 
> When PREEMPT_RT is enabled on ARM, regular spinlock is converted to a
> sleeping lock (mutex-based), which must not be used in atomic context
> such as hard interrupt handlers. Switch the irq_controller_lock to
> raw_spinlock, which remains a true non-sleeping spinlock even under
> PREEMPT_RT.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Fixes: a900e5d99718 ("ARM: exynos: move exynos4210-combiner to drivers/irqchip")

For the change based on the reasoning
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

but why do you need a lock around a single read of a register? 
As far as I can tell, it was introduced in commit
   84bbc16c1f621 ("ARM: S5PV310: Add IRQ support")

and then dragged through the kernel, merged, renamed, unmerged until it
got where it is today.

This
	https://lore.kernel.org/all/1277476037-8806-5-git-send-email-kgene.kim@samsung.com/

is v1, as you see the lock is used in multiple places. Then someone
asked "why locking"
	https://lore.kernel.org/all/20100628144743.GB3287@debian/

and in v2
	https://lore.kernel.org/all/1279270714-15146-5-git-send-email-kgene.kim@samsung.com/

it went down to a single user. 

It looks like a leftover from initial development. So it would make
sense to einer remove it or add a comment why it is still there after
all these years since it is not obvious.

Sebastian
