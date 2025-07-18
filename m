Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C26A1EEA55;
	Fri, 18 Jul 2025 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752832410; cv=none; b=Iej38mKUAF0hXJU2hnYZ/2de9eBaiodNLcLxtK0DCl/D0BAVtzIa0CmOqgTWMfOJBftjAte9BmHIcPuuj4lCgvihzwMDEp002B8r3o23SyU6rIGJVp5KGLc3mBBFnOjZFYtRKWtVM9wh6bNS5t+LbFLtT085CQjJ3NCSan1mPXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752832410; c=relaxed/simple;
	bh=OElGBMman8+XYMXxS0JFIroRtpLqq3hAImUD3ByBIwE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DSKMjADpWaYAqIPcboYdQJWkS9LIq01HDlE3rWZ4pabde+0biZ/66v2cRqJIYUWUW8GFshU+QttsAHvrHTzjPDwoEiCla3zY2WxzfB+z+OMsBKaTcav/81A+2Rz8JnQpjO35DWtp5eDkOIUYPHnqlMQyTXx+/SwhHLzUIAwiTX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=dVXHm5Tj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iKBnNfo5; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="dVXHm5Tj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iKBnNfo5"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id ABC661D000D0;
	Fri, 18 Jul 2025 05:53:26 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 18 Jul 2025 05:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1752832406;
	 x=1752918806; bh=7SqGMxq5975lMlqnb4GEZWltCuOrS0Th0H4icarU5s4=; b=
	dVXHm5TjJar97qRy8v6ZCOwnAuvNDngTi4sGnLFPkjG6mYVFn5MhK+v8a9I49w6R
	wtyvTO5NP5azbnIsEWQF74D9MTgl8Y0g8my82rIAm9rnh++oZhyJJyq2JLXQz8zO
	wgSe37FEIHZ5bfMEWY0rKVb5BC2sTgz5AxgTU/JSOXM40IBwgc9sddSMgqivDlnO
	ve9VrKz/QMD9Vg48TVVu7drVZ9/C34j9JdbNk3auRqPj3i420x1VJ3Psl1KiJWOW
	9Z1wpjhwoaJFyeyjifUhgBeMGCF5s7IVVFncOx2zpDTlQQL7DBQtUHGQ96zsiyfz
	I2W8EWWnUi6k+LKI3GtiXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752832406; x=
	1752918806; bh=7SqGMxq5975lMlqnb4GEZWltCuOrS0Th0H4icarU5s4=; b=i
	KBnNfo5B50V4tFBq1iHFaS7ctPsvIjDd8KyXxoUsxlp4DXbTe/kvIL4/MhAkgbnj
	4HvMz/UxeAbpCu3sqgKLJ4CqMQFj0htJlN5cY338mhbbGFv3EwEW3XN6kn2EIuRv
	PxXc/EDlaL3OXhbria9D3x23B+YSbSfuJjepqhtxqgP0eObMsr4AbFIak/45FbO6
	WpzjKmIo7F/SUWRlXXNwc7J9+mKgQSeXxfFo+NQUxyUd7huQB/qqt4BjdwHMfnPQ
	J9v6EYDZsNHncIKn0FoDa3N3d0icOFn4Z5JIhYO7f0n1onD30NOFlgRhxJpqrITx
	9Q7hZagbXJT2Kal/rXmBA==
X-ME-Sender: <xms:lRl6aJeq5ifbMwZYChxtcOPGhbeO50cuUb4I3ANKXlaMncCoi-1Q4w>
    <xme:lRl6aHNopLerASkXHQwJVTlDcdrPR_8UIXCLxLIU0Umv7K3S_5LqP9UcDsYVHXBK2
    07UPPvVw6MgyUf9peg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeifeduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopeifihhllhhmtghvihgtkhgvrhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhdrlhgv
    iigtrghnoheslhhinhgrrhhordhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrh
    honhhigidruggvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhs
    thhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghlihhmrdgrkhhhthgrrh
    esshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsrghmshhunhhgqd
    hsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:lRl6aA9E4sK1Y7VjUXEWlhwEnBUhYr74uBhnAPp3NmZS2eSYv6bQVw>
    <xmx:lRl6aFlJboraXgsMTeEhqNKKajYjQOvsb3zF7YmQ8qCCDhqc6PXUpQ>
    <xmx:lRl6aFzmc-DgjivPAa94gze3gLvg04Ab478YLBXvMQZJU0yVVswB5g>
    <xmx:lRl6aP7sn1iGg1-hPPo_TMyRNpzTNG1s-eJib_bIxP4cKe6pgN6LIg>
    <xmx:lhl6aGqJbSaRAF5pOKm8zGXOo0thPUdyQD_jHy4z6PnNBRFDLw7cfcaG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9445E700065; Fri, 18 Jul 2025 05:53:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T5ec6489364d9ab60
Date: Fri, 18 Jul 2025 11:53:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "William McVicker" <willmcvicker@google.com>
Cc: linux-kernel@vger.kernel.org, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
Message-Id: <bccb77b9-7cdc-4965-aa05-05836466f81f@app.fastmail.com>
In-Reply-To: <20250715121834.2059191-1-daniel.lezcano@linaro.org>
References: <20250620181719.1399856-6-willmcvicker@google.com>
 <20250715121834.2059191-1-daniel.lezcano@linaro.org>
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Fix section mismatch from the
 module conversion
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jul 15, 2025, at 14:18, Daniel Lezcano wrote:
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 5075ebe052a7..80d263ee046d 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -657,7 +657,7 @@ static int exynos4_timer_interrupts(struct device_node *np,
>  	return err;
>  }
> 
> -static int mct_init_dt(struct device_node *np, unsigned int int_type)
> +static __init_or_module int mct_init_dt(struct device_node *np, 
> unsigned int int_type)
>  {
>  	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
>  	u32 local_idx[MCT_NR_LOCAL] = {0};

Something still feels off here, though I'm not sure what the best
solution would be. Some observations:

 - The exynos4_mct_probe() function is listed as permanent, but
   it indirectly calls an __init_or_module function, which is not
   technically allowed but does not produce a warning here
   because of the indirection.

 - if the driver is built-in and the platform_driver picks
   up the device, it can be manually unbound and rebound, but the
   mct_init_dt() will be discarded at this point.

 - In a loadable module, you cannot call register_current_timer_delay(),
   since this causes a link failure.

 - unloading the module fails to undo the registration, so the
   next call to delay(), sched_clock(), ktime_get() or an interrupt
   ends up in invalid memory.

I think the driver should use an explicit init function calling
platform_driver_probe(), so the probe is only done at initcall
time and both unbinding and unloading are prevented.

       Arnd
