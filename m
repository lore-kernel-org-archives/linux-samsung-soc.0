Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F94231F9AD;
	Wed,  6 May 2026 06:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050275; cv=none; b=cFaHZdoU50oGX7OgR/JWFeay6W2ksD9uTuXgIMKS4T8XsTaXBMTFjhLKzIZGJ9phn36/mNU3WkxBEPzHhVybz9yxUdYphkihVgh8FRXtTWxSfuAdLJfEHxRzDMvAGace5/c/zieJOos0Kh3iOMPaTmvShxe9C6VCptuhH/CJ5bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050275; c=relaxed/simple;
	bh=AQlqR4NGzxgyH9+x3roKMGWGdoqh6SNIVHh2RKzbW+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bmW+CIx8GvgrqAgxzwyH1BfFohg6erqTVvX6KnU3xNFBIsg8qFr2IdxlXi2W2lXHqaMsH5qpaouFWbY9Nal44UUq07DO1l5q9Tn9l4F2WQxhUDOt2XkIWgciIkHm3mRjk5WoUdbR2CoKeELKPd50pEAkxAdOm+R46MDB1gZ7Hk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iY1833PD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/0ELYQ1J; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iY1833PD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/0ELYQ1J"
Date: Wed, 6 May 2026 08:51:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778050271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=AQlqR4NGzxgyH9+x3roKMGWGdoqh6SNIVHh2RKzbW+4=;
	b=iY1833PDouvlDtJkZe28DSYYJ/vj0x64Mw9k4deX6IR3RNJThcHFIUcIuhABUwHnWQC4Bw
	fBKVLnD5ICP38aEDsumzyTxyXEjqj9LLP/339+ZBGKwy2KbNoLCWfMdDKQOVm47QvKR0JQ
	SVxPOa/4XG4yewy5Qj+hrSlUetpLcuUcT8truTq1qiPAP1hcX/tHcALvEwKsmDU3+l4cRr
	s2Y6/Z2QLyxDV9ENOpq0Rivk2Omqwcf5gxWdUNhlnBxOI5CUDEH1VXXO5d1PTI31CDYZJM
	R7OgiNf5oEGdXHkYsikkbI9/8BvbiHliDecwhSinqEcP1YJyszghhiLpMdOu5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778050271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=AQlqR4NGzxgyH9+x3roKMGWGdoqh6SNIVHh2RKzbW+4=;
	b=/0ELYQ1J7+gUYvxixyFwaqNyUpvNcvi7hgVAQtRfx5G7BOEgnIYTzBCHAEXNODDATKpqb5
	bLBmX9jFAoYrX7AQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Waiman Long <longman@redhat.com>, linux-rt-devel@lists.linux.dev,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: [BUG] exynos5_i2c_xfer_atomic() can sleep.
Message-ID: <20260506065110.sY3jKS7G@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

While looking into the xfer_atomic i2c thingy, I've been looking at the
exynos5_i2c_xfer_atomic() function and noticed that it has a
disable_irq() invocation. Given that i2c_algorithm::xfer_atomic is
called from atomic context (with either preemption or interrupts
disabled) the might_sleep() in disable_irq() must lead to splat here.

This looks very light tested because exynos5_i2c_poll_irqs_timeout()
which should be invoked from atomic context has usleep_range(). This
will schedule from atomic context is not good. I *think* this gets back
with enabled interrupts.

Sebastian
