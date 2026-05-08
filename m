Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BEA329C6B;
	Fri,  8 May 2026 10:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234954; cv=none; b=jHseH1eQPGJyb0dH62KR7sIHgPvQApBv8S6/i+xTy3uo9IqJ5y+xYN/lDsZOF8qaCG19XgP5hab/OczlcJfLFpBHl9T1z804riDbNWWT7rHmnTzWRdPKKF036HVuXy0DXbah5sbextOgVx2H8Vf4E5+qWk1gNKXyMbMzwaBu7j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234954; c=relaxed/simple;
	bh=XCjkE1y+US15KfhfQsz7XJ+1Xj4xdLeW3Etb7sYijZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsbyR2tA5fUStzV1RoJM4+q+T+yKXcPMICpOgJ4EdvIj59NpuntKk1bg9JFM+bQq1YIqf5Q9jPJ5j73FV0vE6KzdbOCWZMRCKWMbrsLIi4o5RXWZ0PRlnq3iwtK+zfXZpnONQrE0hW67UeOy1Mq8OC4w7nnLjJ7f61dPhC0mB8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ypRqE5l2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=haDwM19z; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ypRqE5l2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="haDwM19z"
Date: Fri, 8 May 2026 12:09:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778234951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jXOyYk0EhGWEVa4ZiWZamHRmF6e96QOpZ/Edj4JqaA0=;
	b=ypRqE5l2Yt+sUHfyuDwOhmIqYE8P6J9fbLhBA38GBopAMiV3a9FlGSwIQXkL1IsdT84VKW
	S/429/T7GPUm4bsVAraRxqS+QzC1btH6aiY1EUdZwC/LR/5Ixxtpsx/DKEU6jv4MIOMlZc
	lmlTcqUCPwX+zpLG/zoON4xK0IXXW+YfXqgdhqkPYTP6gzwKtXfRFnekkUcHtpcPngq3Un
	TdH+5lpjyaTqdJCU96l+ClZlRVKp7/7x7hSDFxyXJd6p4SUEyEvjf8LYbrD/KVrBqClr76
	AZc7d3p/b42wPEj52ghB1/MpXqDxQkoQ7KsH2CjOWbh9Wnn1Eov7PZL5C8rvJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778234951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jXOyYk0EhGWEVa4ZiWZamHRmF6e96QOpZ/Edj4JqaA0=;
	b=haDwM19zhsfgCtmbP7c2Gl6dh3i8h0amWCn7fV8DCeeE3yhYw58r/5Zcxwe7i8mfxjwtSA
	yK4K22A0bZlYjnBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Waiman Long <longman@redhat.com>, linux-rt-devel@lists.linux.dev,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [BUG] exynos5_i2c_xfer_atomic() can sleep.
Message-ID: <20260508100910.nxRkt3mA@linutronix.de>
References: <CGME20260506065541eucas1p2f986355d0a06ac1f72aa00e8d3148ad0@eucas1p2.samsung.com>
 <20260506065110.sY3jKS7G@linutronix.de>
 <03c06142-12eb-45b7-8d22-ce12fab6e132@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <03c06142-12eb-45b7-8d22-ce12fab6e132@samsung.com>

On 2026-05-08 11:45:15 [+0200], Marek Szyprowski wrote:
> On 06.05.2026 08:51, Sebastian Andrzej Siewior wrote:
> > While looking into the xfer_atomic i2c thingy, I've been looking at the
> > exynos5_i2c_xfer_atomic() function and noticed that it has a
> > disable_irq() invocation. Given that i2c_algorithm::xfer_atomic is
> > called from atomic context (with either preemption or interrupts
> > disabled) the might_sleep() in disable_irq() must lead to splat here.
>=20
> Its me, who added that code, commit 445094c8a9fb1. I've tested that=C2=A0=
in
> the reboot/shutdown path and I'm quite sure that I've copied that
> irq_disable/enable from some other driver. I also cannot locate that
> might_sleep() in disable_irq(), where exactly it is?

kernel/irq/manage.c:
| void disable_irq(unsigned int irq)
| {
|         might_sleep();
|         if (!__disable_irq_nosync(irq))
^^
|                 synchronize_irq(irq);
| }
| EXPORT_SYMBOL(disable_irq);

Sebastian
