Received: from wfout3-smtp.messagingengine.com (wfout3-smtp.messagingengine.com [64.147.123.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DF3EBE;
	Thu, 20 Jun 2024 11:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883648; cv=none; b=b/OEbrd9U5knb+kqhwmnt18aSPbhTBMILXanRPJ/Uqy9oOcVneauW2CYfaixMct3lXnYIHo5XFfOXjdKyNSD8qsXg1ViXVzM2ipkmqiZDAugqAta7vWcDnF4pH/Ohow5w1JyB/yKb+tDsf53YxRd1qUwtBKQ6ikxItOMAIdWe28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883648; c=relaxed/simple;
	bh=FYQA09eJnQbBscXTK3MzsRbkjN4tAg+3ilMpf/N2kn4=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=ZcIM71GqUHqmpp03K/nju/su3vASXd9+e2SuO2C9nIL6ZhgUdTsadSrC+6/klmrEFizHt3PopbcXVruJKbvKLqFhY1DR7eVB32/Cn8ujPkobheKqs+w76h2BA4yeQoe9sDVtCY0V8XSbYbx/ASPAksbwWEBIkEOwp324uoiRaog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=JK9Jer9d; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ifvy0gtK; arc=none smtp.client-ip=64.147.123.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="JK9Jer9d";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ifvy0gtK"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id EC8641C001CF;
	Thu, 20 Jun 2024 07:40:44 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 20 Jun 2024 07:40:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1718883644; x=1718970044; bh=Kyi6DOxRGm
	mf09/1dL9TG4SUHEYH9mmOWhybLNfnbjM=; b=JK9Jer9dTt0YjzBCTg1GfIEtHe
	FRH5WdSbTjvMurVAZGwHvDVahjkDPlsoGeCeJ9/uK78nXL+IZ4T2GmkSyOOXO00c
	JnNSYykFnitvKbOnw9xQMGBeMUjQPBXqItBzpsLZHYxVC0nPJA6YZMR6UwHyEcDA
	bgrrtUm/rPzeuQcQxirVqAiIVjhheuIaNMAGQE082i3VxmcKITBR8hd/LOeMK5py
	AyXH4KdrEUl1OV2LbGNWSodv5yxrO8g0kT0FvV/clgN8FwyO83jtvGyUBqSWdcvH
	butQxfttYKsG+ucoRUM/TcHjQwp8KgWw8Sy3ucA/hw0ohL6s1/3EV1ScoajA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1718883644; x=1718970044; bh=Kyi6DOxRGmmf09/1dL9TG4SUHEYH
	9mmOWhybLNfnbjM=; b=ifvy0gtKenpo+a7GkQIgD5glYthYdrnu9qj+tL1mXdpt
	i41BOXARRT3xlIpPDBgJaWRQwicXHnSEkfPpqDOoF0BVOA2Sm0L8EX++zBjmE912
	CYlxsWBrlUsyPQ4WMoSm2BPJdW8zCmxTSYLwMTb17ML7ZkVzNXAxEOldr2N7EXSO
	ZvNou+vQxnSKRgadf6nMaF/M1zUJ6s//fBNWawDis3zdw9rwsqboiXLrRqqH5f3Q
	7NgWQsnUAmokRZxX7VH8xKxrMscs1mgd1IbpId7nbZWOgmyJGzefVZIqtXlGQq76
	LiEJFEpX+vhfjK5ku7lXAG8VxfAA2f+UdY/J8vBYsg==
X-ME-Sender: <xms:OxV0Zp0QUxYYh1JD7Vi5S1-pCbvczEhdRhHz37eqKxsuEfN_zwcZNA>
    <xme:OxV0ZgE9_eBIWV6hHs46VlWYJb2oqJealXm7tQ2ZKetWAmMw7v9_o8PT_GxIGmjJA
    lWjBJFq4sq0FV5C-2Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:OxV0Zp437mKwByYjdmJmcQh5-TPfC6gVQDfYMriZnC0D7Ch1QEjbgg>
    <xmx:OxV0Zm0O8bMUtW4t7Djbu2ba0mKmJUqk1NHVDqrSkiLA65C5aWL_2g>
    <xmx:OxV0ZsHWWD-bI-u-YBSTrzMTK5hOohGbAGrZ1wITyJZWDKJVUoDB_g>
    <xmx:OxV0Zn9yl6LTiR8rpLyIcsQpEQyX8HDbrZjHC2IR6cMyy9pi_eSIeg>
    <xmx:PBV0ZjeEvY64vDWkPr-1epllCd82VMIP2XLoV-kHt1Cc6yk5B2XPt8QG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BD415B6008D; Thu, 20 Jun 2024 07:40:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <73d2002a-9afa-4cfd-b835-6908d64586d6@app.fastmail.com>
In-Reply-To: <20240620112446.1286223-2-peter.griffin@linaro.org>
References: <20240620112446.1286223-1-peter.griffin@linaro.org>
 <20240620112446.1286223-2-peter.griffin@linaro.org>
Date: Thu, 20 Jun 2024 13:40:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Griffin" <peter.griffin@linaro.org>, "Lee Jones" <lee@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 "Saravana Kannan" <saravanak@google.com>,
 "William McVicker" <willmcvicker@google.com>,
 "Sam Protsenko" <semen.protsenko@linaro.org>, kernel-team@android.com
Subject: Re: [PATCH v2 1/2] mfd: syscon: add of_syscon_register_regmap() API
Content-Type: text/plain


On Thu, Jun 20, 2024, at 13:24, Peter Griffin wrote:
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
> - Keep syscon lock held between checking and adding entry (Krzysztof)

Unfortunately you now have a different bug:

> +	/* check if syscon entry already exists */
> +	spin_lock(&syscon_list_slock);
> +
> +	list_for_each_entry(entry, &syscon_list, list)
> +		if (entry->np == np) {
> +			syscon = entry;
> +			break;
> +		}
> +
> +	if (syscon) {
> +		ret = -EEXIST;
> +		goto err_unlock;
> +	}
> +
> +	syscon = kzalloc(sizeof(*syscon), GFP_KERNEL);
> +	if (!syscon) {
> +		ret = -ENOMEM;
> +		goto err_unlock;
> +	}

You can't use GFP_KERNEL while holding a spinlock.

I think the correct way to do this is to move the allocation
before the locked section, and then free it in the failure case.

     Arnd
