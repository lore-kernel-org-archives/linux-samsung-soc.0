Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0BE21CA02;
	Fri,  8 May 2026 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778255555; cv=none; b=RWh8ad9ovN9Dkj4tGMdr6DpIlZPEWaOufhtN/2pMIOeCx+0nvdB2YM/R8HJ4prET4opXo1zD6czoBozBQMc36spbh/4bSfxrIySZ5i3X4oAn8yAYyza+mgoYSKgpiUXR1g8JPSolzE2qVi5j25Cufqkbmg2IYtaca/eUSv08SK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778255555; c=relaxed/simple;
	bh=Vr95CnXKFUe/NTkF4R5ow1e0xGtyYDUjkrZIWOEB9mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGx76ANcZtKPJmtQcT7wDeh4r9G7ZeW8GkTh/CKfMjhShsc+QIlKj2TcOHVUiB56WbDW5a5JBrxPkQCXlp7VuA/TYBE1b/uoKxMi1GwBIrwAidirx3BzQMywszl5yFXhHTsqupQ7YRZiReGsCGr1GjMoAWy6pqKghIeT0zIvUkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bpixmYP9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=w6yq+fhb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bpixmYP9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w6yq+fhb"
Date: Fri, 8 May 2026 17:52:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778255552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9MsXVjxOigHjBAuUsOzDFWCRCoyrnggupnw1Ge9VUIo=;
	b=bpixmYP96/36Obnt0mMQAN3I7Wfm/hVIT4KeZCUImzc27MOeyXWhHKayXq83RE8lA3urvV
	FpxrXZMWMqHapkjYrpScOfT/2MWdiCwebibBQ8TYd4Uhj8GScT6Fj18/u5kixjPRzn+mAS
	1div9n7U1Yfev2r0gPg3Zxd4EhWvIiBheJjKnm/pF0qNxY9I97IBpaJnBn3AL4OYLZY40D
	QeuyiSigByXAB1lkF20ykQdGGMg9IFyKf+TV5SRrCmvgS1NHdnK2+sAd1tTl3ODrt9o2PB
	JQzdJSJfJE+OjtWe0nWcKwUYVrzkWvCj8T63wxYdwnBu/8spIrRWa/hM+d/9CA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778255552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9MsXVjxOigHjBAuUsOzDFWCRCoyrnggupnw1Ge9VUIo=;
	b=w6yq+fhbysTwPEyl/Ng9CnfPJAMcGa8IRlXbu++FgzMOQ4m8hlG2EBjbZmKhR1MMiDmBUX
	miwLWL9G9izFvYAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Waiman Long <longman@redhat.com>, linux-rt-devel@lists.linux.dev,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [BUG] exynos5_i2c_xfer_atomic() can sleep.
Message-ID: <20260508155231.fe3abjlF@linutronix.de>
References: <CGME20260506065541eucas1p2f986355d0a06ac1f72aa00e8d3148ad0@eucas1p2.samsung.com>
 <20260506065110.sY3jKS7G@linutronix.de>
 <03c06142-12eb-45b7-8d22-ce12fab6e132@samsung.com>
 <20260508100910.nxRkt3mA@linutronix.de>
 <dbacd56b-2914-40ce-9139-78b819a81c13@samsung.com>
 <20260508104235.n9gGOYqU@linutronix.de>
 <55bdf688-85f5-4b2b-9e90-b4a2c671250f@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <55bdf688-85f5-4b2b-9e90-b4a2c671250f@samsung.com>

On 2026-05-08 17:28:10 [+0200], Marek Szyprowski wrote:
> On 08.05.2026 12:42, Sebastian Andrzej Siewior wrote:
> > On 2026-05-08 12:35:51 [+0200], Marek Szyprowski wrote:
> >> Ah, it looks that I've checked irq_disable() code, so that's why I
> >> didn't find might_sleep() call. In the case of exynos5_i2c driver,
> >> probably switching to disable_irq_nosync() will be enough. I assume
> >> that all previous transfers have to be finished to start this atomic
> >> one, so waiting for interrupts to finish is not needed.
> > This looks kind of odd. Are the "other" transfers really done at this
> > point? Do you have a backtrace for me from the atomic path?
> 
> I thought that i2c core somehow serializes the transfers for the given master.
> 
> > Is this needed because you need to send the "power off" command via i2c?
> 
> Yes, most embedded boards do power off by sending i2c command to PMIC chip.

I'm wondering if you could "avoid" the interrupts-off part since
kernel_power_off() is called from preemtible context.

> 
> > Could you try to test with PREEMPT_RT? I'm sure how this works there.
> 
> I will check this, but so far I run all my tests without PREEMPT_RT

Right. I am curious if interrupts are really disabled on PREEMPT_RT or
if this happens as a side-effect of something that does not happen with
PREEMPT_RT enabled.

> Best regards

Sebastian
