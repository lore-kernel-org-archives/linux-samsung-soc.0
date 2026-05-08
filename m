Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59BB333730;
	Fri,  8 May 2026 10:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236959; cv=none; b=eKZjGytK2eQd8FgbB5XoTi/XJHGt0yhXl4P+G/EvZ+HRYIPcHg3qtlWDDMGWUsTG8cRT2nWessg/NHtB6gna0sTmrpLO0N5RYipnW5jmEbC2jvLICw7sL2ps12c23554RSWWcz0uAdqEforkoIZGfP+1YCSmd0aDgIywA+ISks0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236959; c=relaxed/simple;
	bh=95n1WgHj8rNW6Tm63CNf5gUqAJPcMZkKY5Po3vFMy6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMeu8sRx0OMJfpEU2P4PWAy1DV/SWz1ioSkANcPxMGJv1MtJ1/OT8ghaQySK2TQcdqqEbW1MAX1olszM7FtfqOyfsoEa36H4YHK+ck84lavRJgAWpgG5QWPHjXaaszOguMTmFiWLFIbCphPF5FF1E+xfMxmD6YOEDnUDaIsTbgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vafjCaTx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7sNYr8Dr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vafjCaTx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7sNYr8Dr"
Date: Fri, 8 May 2026 12:42:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778236956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=95n1WgHj8rNW6Tm63CNf5gUqAJPcMZkKY5Po3vFMy6A=;
	b=vafjCaTxkuB75cXZya7Xlk2T2NRuWc0htlt4Cfoey+jUXDuOioSF20Cc3EJTk4C3dvTHic
	3cA/EO4mMUDr1f9WlpteT1k3oprDwdXVMTKe6/LQS3p2OaR9NsJUSzm9DMdBpYaUkFYDa2
	QHcsI8KNVJckfHYI8zo2WFc2dGUgRzrY3Fm6VKKFgBqq497E3z/gzmLDhqYpD6bpfRd1Aj
	cFR+/48g5b4XkTOVmgjZftX6+6V4JH5fGrTni951XBaMZ2/0uFbMCKDQsZVKpYvE04GTVr
	1l+USjZOUm7ZINq8Svw1bK33VHUN2o16osph0d7xnVMQHwG4W199iDB9T7AbDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778236956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=95n1WgHj8rNW6Tm63CNf5gUqAJPcMZkKY5Po3vFMy6A=;
	b=7sNYr8Dr72RFPaPOWEgDxumiEA5BWIIzHfs59Xi6qa5W/zPiso8+iAYNL3aw82wsAWMDHU
	u7vkv2i4xAvYY1BA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Waiman Long <longman@redhat.com>, linux-rt-devel@lists.linux.dev,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [BUG] exynos5_i2c_xfer_atomic() can sleep.
Message-ID: <20260508104235.n9gGOYqU@linutronix.de>
References: <CGME20260506065541eucas1p2f986355d0a06ac1f72aa00e8d3148ad0@eucas1p2.samsung.com>
 <20260506065110.sY3jKS7G@linutronix.de>
 <03c06142-12eb-45b7-8d22-ce12fab6e132@samsung.com>
 <20260508100910.nxRkt3mA@linutronix.de>
 <dbacd56b-2914-40ce-9139-78b819a81c13@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dbacd56b-2914-40ce-9139-78b819a81c13@samsung.com>

On 2026-05-08 12:35:51 [+0200], Marek Szyprowski wrote:
> Ah, it looks that I've checked irq_disable() code, so that's why I
> didn't find might_sleep() call. In the case of exynos5_i2c driver,
> probably switching to disable_irq_nosync() will be enough. I assume
> that all previous transfers have to be finished to start this atomic
> one, so waiting for interrupts to finish is not needed.

This looks kind of odd. Are the "other" transfers really done at this
point? Do you have a backtrace for me from the atomic path?
Is this needed because you need to send the "power off" command via i2c?

Could you try to test with PREEMPT_RT? I'm sure how this works there.

> Best regards

Sebastian
