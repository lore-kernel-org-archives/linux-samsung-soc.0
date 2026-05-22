Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2E333F58E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 May 2026 06:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779431265; cv=none; b=mdXSp+gSTVBUFldhBzHQsqUr8hNRxFNWc/s5G5CGI6XliZR0Wcwa/axO58gM7KCegmMy2omqkcOpcb3vrP6ZS27QA98PRvDzcc9FKXXxfWkpOV6cO4Or3qBk6KU/xTfakcVKsVsWt3x7TRii7KJnsElPFop2p2T3WEtkudGLY6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779431265; c=relaxed/simple;
	bh=giHjcohEligmB9k/qEKSB5JOwouvT5DMRXBspPhDIRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJL0Xeq9QfeOnwUr9mVRVO49iWbCGTXklYDXapZngJ7+sTYiInUX78csw4na8QMbYZD/CMRlrJVD+b4rFRYpCec8j9BDspGpURssUUo3UUghRW65/LYs1YKbiHcC+myPqKhOfbf3BLD4E7obPYvOzcnSbHUTqdWjkyHq8vGP7gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jKoK0RYz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5KRNGD8e; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jKoK0RYz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5KRNGD8e"
Date: Fri, 22 May 2026 08:27:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779431260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qYjGb1GFi1JFw4GuG/m60phb4+uBryv0UJN+GFgd2FE=;
	b=jKoK0RYzZjyEUQj6U1jE9jhVA6FPU1ARQ5sSDuyg9lcZ+SySV/5BQ/+lmT+6GqV4c5FEHd
	BbnMPiWfytacAEoIqu9GkCfz0JolyW9Nh4f1SMjS51EZrOr5KoxAjPo9OCzThL/MTjkoQ3
	R8tnAXApd4EH5ZyHvCHR8/tT03angWS/IehQkTVrUX+8bmlqupgvUavO0qf7aRHCOWUVfq
	YgfZea9ZHQMBiLGEoU0biV2ch+Iex8e77LOn6CXcIAn8kf7zW6ngdgxfxPtDU1Fuw9IJ3P
	132joHsqf0oHvEHvcx2Jh70A5x5JiwB2M2z4xCNrIDTugRMSGu7WltwDkhKN+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779431260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qYjGb1GFi1JFw4GuG/m60phb4+uBryv0UJN+GFgd2FE=;
	b=5KRNGD8eTk/9zrBFONVNp3MRxC9xKrjsLwwgbQnzFv3ngkzD+L3lu1Yic95qvelzHmtYES
	bixGFkKnprZxN/CQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] irqchip/exynos-combiner: remove useless spinlock
Message-ID: <20260522062739.5-YngA7K@linutronix.de>
References: <CGME20260522061030eucas1p15f61b7bc01f77a3d34d41472210ea662@eucas1p1.samsung.com>
 <20260522061012.2687122-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522061012.2687122-1-m.szyprowski@samsung.com>

On 2026-05-22 08:10:12 [+0200], Marek Szyprowski wrote:
> irq_controller_lock doesn't protect anything, it must be some leftover
> from early development or copy/paste. Remove it completely.
> 
> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Link: https://lore.kernel.org/all/20260520220422.3522908-1-m.szyprowski@samsung.com/
> Fixes: 96031b31a4b3 ("irqchip/exynos-combiner: Switch to raw_spinlock")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

There is a bit of reserch in 20260521090453.bbUZ00tS@linutronix.de why
it is a leftover.

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
