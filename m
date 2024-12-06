Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52C62066EF;
	Fri,  6 Dec 2024 13:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733490196; cv=none; b=Gg8FEHrdwXrFmtaIAXVwo9rs8h9PvdgZOOeC/ZDrggDwgOUZbNpeRkFpXObwTH3Mv11Cv4kZDNl2Abml/O5pxNbnlLNGcj3PTyEN5yINItaCWTx5/W0kJXriE59bVAeeHNbIUUZU6U60tSBP/IJ/F4w4oZyrmcxlJrMyg8OGcr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733490196; c=relaxed/simple;
	bh=0Cq9X0ogqv0BAjVe9dzu6yM3Iqzt1IeZLgK7mmksykY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pdfnAGM7OIKD0szj6urtL9eyRVNCNwFG6MNjW9ufkAa7tyxXcfFopszS2PyYpNyKVDsgROhVhfL/KfpwmE2OZXvOngYtIMjzCkjirYu7sGx9CzLB70m/M/TGo3tlGL0MKvaXI2GPf57KLfV5MlFY1V8fn6HZImcU1G/K9B/vneQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=dKnybjiv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aukdyfWQ; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="dKnybjiv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aukdyfWQ"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C36521140157;
	Fri,  6 Dec 2024 08:03:12 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 06 Dec 2024 08:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733490192;
	 x=1733576592; bh=Q2mGikl9wgoPB6QGMDFbsKjPfadQvu6/96OReyITeFk=; b=
	dKnybjivCTbw/XFCh9sS01mLXRPJ4gwaN2B6x9pux0KTSppt8W9rOgJX4AmvR9Lp
	IwLOlu4qsLFaGzoGDtFxu9qxgkXJUiFK399tI8ECd81gVKM7k2tJfvZxHyKDRrcX
	Jkb1Ya6HHWEVwvOL22MZada6TLBuNrXAutaEUhcGDq9yh6QjOp1On7+2vg8sQgYB
	CJ7vMfRMpw6B1BL7x6LIUYfS6dwXyNlwixukEh8G59uRcmrmJwDi82EGB7osbaMz
	NzmXnSIuWiOo1H3pZPPVWVygfcbOrHJ7CWzjUNCz2sD7cMpUeHcSOa3vNgHnR/Y3
	/O5wNAyb2VoJmrSY0/SGNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733490192; x=
	1733576592; bh=Q2mGikl9wgoPB6QGMDFbsKjPfadQvu6/96OReyITeFk=; b=a
	ukdyfWQXN4yJCCSfeKTI2psfUC7pJP06lSaPlUVM5pqyloYDHiMRkHf3QHkac7Cg
	EXWqnXd+yJW2SKEHDyGwpUgesUa0v+By+UdUBKscL/6rUI2uQ1Yp7VLjVzzZDvMZ
	sK7AHLVV+21c1Ev/3KUTvLC7sZaOj8B3osOx6p56907Xi5mkyEIcZBwy7RZkES8Y
	JHh0LH229zLZ464HoprENmxjLtgTHPtVP/LhfmOQhdyU/R8dmKRKfHuEyYHUUpiC
	HXBlxEiDRq2iwhNM763m/GqiYCCzs6xcXD0jR4QJSyomNneKWiJagBUc15qqpCFi
	01qjtCSsGVg0bRkoIKP6w==
X-ME-Sender: <xms:D_ZSZ5GVoHzOXX2xDMFZXz3W-TGG3KlEkI33eTN5eKgDxZeVwu9_9Q>
    <xme:D_ZSZ-UQYj6xy_pn8EIHY3ZEntYgebtspmL2Y6fqkOJv2zaXbilJVJAfsJXLqEmPO
    Aauf6LcAt__DVbp8Z0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrieelgdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedukedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhgvrhhnvghlqdhtvggrmhesrghnug
    hrohhiugdrtghomhdprhgtphhtthhopeifihhllhhmtghvihgtkhgvrhesghhoohhglhgv
    rdgtohhmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgdrughrrghsiihikheslhhinh
    grrhhordhorhhgpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghr
    ohdrohhrghdprhgtphhtthhopehpvghtvghrrdhgrhhifhhfihhnsehlihhnrghrohdroh
    hrghdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:EPZSZ7JHa8snLcz6I0aQ9FOzxkZv3FgUF_ANvcqXDMOSLCkbqMS1-g>
    <xmx:EPZSZ_HeErg6meZEepvltZtpdaRChcfLqyEFsSsSeC9ImXYwIBSTgw>
    <xmx:EPZSZ_U2xRQyP_fjmoONHc8EgZ47WLi1kj4cBrGOxQaDnfRKkVT1jw>
    <xmx:EPZSZ6MgG6jRXgrtkUsCvffzr2Mtu9lnxM-xlFob4emZkImbFLANKQ>
    <xmx:EPZSZxZEdqwV8nMEK3L96QZODrP-dJjTa4fIY8QQbLQth3tuImQurn7a>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E4C762220074; Fri,  6 Dec 2024 08:03:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Dec 2024 14:02:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 kernel-team@android.com, "William McVicker" <willmcvicker@google.com>,
 "Peter Griffin" <peter.griffin@linaro.org>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Vincent Guittot" <vincent.guittot@linaro.org>,
 "Ulf Hansson" <ulf.hansson@linaro.org>
Message-Id: <f6a04a2f-aed6-436d-aef1-4974a6fe35d2@app.fastmail.com>
In-Reply-To: <aa09bbe3-8f5f-42cb-a7a9-deaaef77affb@linaro.org>
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-3-tudor.ambarus@linaro.org>
 <427caa87-b9ba-4797-88bd-a18a96eefdcf@app.fastmail.com>
 <aa09bbe3-8f5f-42cb-a7a9-deaaef77affb@linaro.org>
Subject: Re: [PATCH v3 2/3] firmware: add exynos ACPM protocol driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Dec 6, 2024, at 12:59, Tudor Ambarus wrote:
>>> +/**
>>> + * acpm_get_rx() - get response from RX queue.
>>> + * @achan:	ACPM channel info.
>>> + * @xfer:	reference to the transfer to get response for.
>>> + *
>>> + * Return: 0 on success, -errno otherwise.
>>> + */
>>> +static int acpm_get_rx(struct acpm_chan *achan, struct acpm_xfer *xfer)
>>> +{
>>> +	struct acpm_msg *tx = &xfer->tx;
>>> +	struct acpm_msg *rx = &xfer->rx;
>>> +	struct acpm_rx_data *rx_data;
>>> +	const void __iomem *base, *addr;
>>> +	u32 rx_front, rx_seqnum, tx_seqnum, seqnum;
>>> +	u32 i, val, mlen;
>>> +	bool rx_set = false;
>>> +
>>> +	rx_front = readl_relaxed(achan->rx.front);
>>> +	i = readl_relaxed(achan->rx.rear);
>> 
>> If you have to use readl_relaxed(), please annotate why,
>> otherwise just use the normal readl().  Is this access to
>> the SRAM?
>
> all IO accesses in this driver are to SRAM, yes.
>
> There are no DMA accesses involved in the driver and the _relaxed()
> accessors are fully ordered for accesses to the same endpoint, so I
> thought _relaxed are fine.

My normal rule is to only use _relaxed() if it makes any
intended difference in performance or behavior, otherwise
every reader of the code has to understand why exactly this
was done. More generally speaking, use the function with the
shortest name to do what you want, since the longer functions
are usually special cases that are not the default ;-)

SRAM is a bit special, as you don't have to deal with
side-effects the same way that an MMIO register would,
though there is still a question of serializing against
concurrent accesses from another processor.

It's possible that readl_relaxed()/writel_relaxed() end
up being exactly what you wand for this driver, but I would
probably encapsulate them in a local sram_readl()/sram_writel()
wrapper along with some documentation.

You should also have a look at which ioremap() version
you actually want. The default ioremap() uses
PROT_DEVICE_nGnRE and has strong ordering but not the
"non-posted" guarantee like ioremap_np() that would
let you skip the read-after-write for serialization.

If you care a lot about performance on the SRAM access,
you can go the other way with a more relaxed ioremap_wc()
and explicit barriers where needed, or even better
see what the remote side uses and use the same mapping
flags and serialization here.

>>> +	spin_lock_irqsave(&achan->tx_lock, flags);
>>> +
>>> +	tx_front = readl_relaxed(achan->tx.front);
>>> +	idx = (tx_front + 1) % achan->qlen;
>>> +
>>> +	ret = acpm_wait_for_queue_slots(achan, idx);
>>> +	if (ret) {
>>> +		spin_unlock_irqrestore(&achan->tx_lock, flags);
>>> +		return ret;
>>> +	}
>> 
>> It looks like you are calling a busy loop function inside
>> of a hardirq handler here, with a 500ms timeout. This is
>> not ok.
>
> That's true, the code assumes that the method can be called from hard
> irq context.
>
> Can't tell whether that timeout is accurate, it comes from downstream
> and the resources that I have do not specify anything about what would
> be an acceptable timeout.
>
> I see arm_scmi typically uses 30 ms for transport layers.

I think 30ms is still too much for a busy loop. I see that in
the SCMI driver it implements both a sleeping and a spinning
loop, but I have not found exactly which callers use the
spinning version, and what timeouts those have.

>> If you may need to wait for a long timeout, I would suggest
>> changing the interface so that this function is not allowed
>> to be called from irq-disabled context, change the spinlock
>> to a mutex and polling read to a sleeping version.
>
> I think the question I need to answer here is whether the acpm interface
> can be called from atomic context or not. On a first look, all
> downstream drivers call it from process context. Curios there's no clock
> enable though in downstream, which would require atomic context. I'll
> get back to you on this.
>
> If there's at least a client that calls the interface in hard/soft irq
> context (clocks?) then I don't think I'll be able to implement your
> suggestion. Each channel has its own TX/RX rings in SRAM. If there are
> requests from both hard irq and process context for the same channel,
> then I need to protect the accesses to the rings via spin_lock_irqsave.
> This is what the code assumes, because downstream allows calls from
> atomic context even if I can't pinpoint one right now.
>
> I guess I can switch everything to sleeping version, and worry about
> atomic context when such a client gets proposed?

Yes, usually at that point the caller can be changed to use
a threaded IRQ or similar.

      Arnd
