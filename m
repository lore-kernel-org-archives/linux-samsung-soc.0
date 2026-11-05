Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902032;
	b=UUbJV+8kHZ5VmueOefkNBDAGP4jCT6JqGGh1qIKmVzp7wHtLOgMbdQIbaEXpR8qw+zwV
	 kQNMex6WYIffK93/m9NkLlKLVs+Q5mSnYh8uURviFimUJR9THWAB6B08KxGCdxgtZvjMP
	 x7CO2w6b7VpuyNf3pIxUhJkmANcGYscVCsCGGD53SBD7TvtCN6VjxQveHlqxp7OXXpJIR
	 5ZcTz5ha8KEYhJ54aoAapg1DmcNUub0im3EymEv1UnYhRxL7I7FLa24DC1UOyYGY2J/7G
	 TUm6y7/5VIfqSPa9dZEbvZKSiYmxQtzxu1/KA//C3HjMjVlYh8alzkWC2OHv94YJT+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WNyoqfFkSiqIaDnNr0KZB++i/w4miVNCO0u6spo9AfQ=;
	b=fbTXSwwKdk/JmcFfBAUxcHsbnA/QOK6A0nuamk12owoHENRA9tehm5RyV1ci+K205Crb
	 J/xPRU+AVbuOcQqcdZUFMuEnSSq3uYFTi79foWbb39ZKO9UL+yuVNF+u2tJYAgJRYjbay
	 H2ValDT3gTSaJnatYP5b96i/G3OLqkORmZAvMj6NUNfxypZX0UeoDCBGL0Ff5nSR2+Vcs
	 AbAC1n6GNThsvir+loXPbkToo1zYWFPhalFKTm1dWMDOZ69qCl83JOY43t67F+0FH8xhc
	 KYh+5jQUGRXXnqJOx+Iiwh2a4QbaCqB1Eqh91T0mfiWBhfU78EAn1JdfhBo4XLFVFrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5UCTITv;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B19606A328
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 18:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20B19606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5UCTITv
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36dbde64409so2031641eec.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2026 10:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793902031; x=1794506831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WNyoqfFkSiqIaDnNr0KZB++i/w4miVNCO0u6spo9AfQ=;
        b=U5UCTITvXWwFAMjd4xA/eex0qYwQOmYLDActLa+N1l7D8a8wyRtF7hpXuTcLzb83hW
         OpYR7T0gTEzY/xFfgSBaFHKkGyyWC19rgNGY4YnMVY963R5LNu+6Ysa7GJfhgKd9tbCH
         k2D+OaUerwk0ehLHWWQRQj8ebKEn5Gi2t1LkLfuNudcN4yyXYz/ohhmBjXYDxz40o0o4
         aHJArNw3iM08FnigMyp7t/hUxZcRNzPtUNGBrlsNk8ZcgOl8VwvTzt+rei5o9QCXTpk7
         GqWvwKJajtiw/IPmJnF5PnREMj0Tuw55QuXIan9StpKXScRuqpDfmBl+orpP5KizUVP2
         ABNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902031; x=1794506831;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNyoqfFkSiqIaDnNr0KZB++i/w4miVNCO0u6spo9AfQ=;
        b=1Rkn5PU41Z1STb+9VkipAciSba8ds5PVDEcPBH+RjEjNksEZixO0NWDbCYGm14T/Nx
         QxsX8OxbsLDXRNaSt78pfjXH5REwAv7uI6e1z5Q04d6XBL7eHd79OoNwZvDV//C8xD7H
         i0e69cIm+u1BhjttzMG933FkE3kp1driM3zgKGl6ZcSHSyJWWvVpt2pTF1lcpOHjpcVD
         kh6SbUv7F5XPcj3dFE543q7gkS5m/tbq3mOyOqTrhYg2P0uuB/004hykAWUHa7BdEVvr
         YduSaQQvPK47imyUaeCpNCzT380tBUp4DE/EykRErODhZQowtosa7bv+D/JC1I3FfMZz
         dv7w==
X-Forwarded-Encrypted: i=1; AKwUvBzcI2yohvp8WNHhORNQ4MxejXOwtiCMlNERybybFzwFsNKQX0dKyOLnqE9m3h4lU5+PaNevjslbOx85QJSXO7LqRg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8h6a4ZRy1TaLRVNAxY1EGvE+FlMykFNpKpxd2TLu+fsOuk3cu1
	fEtCUF5WAekur5zXumAZvAdahtxkBVV8NyjA2UpsS6+ogMJveWYuKqwH
X-Gm-Gg: AYBFou11sUFYa7ZWg2UJQZS2qLdU5yysuPVnS31z1j1TGtfiOSJhzh1GmKlAVEckyPl
	pvYyk3sw3lVuioJgrGhCR00diPD7dOQL7fYfaBDdBH0ldx8FSRj7zlrGkqY5WrymAwblQgXN3XL
	BtAhikeRKHKi1Z9qSXms2Tn8OwGYR6CpUZOpsbFXFr40DT4kXWjQJj4GJMYL41SINHkTuriamjQ
	Dkh8WwNjOsqm/dRacBWHSu255OUXv8j24gaYJOwZiGCcz7sCru1xsGNpRWFBDABX5WqLzQ+gq0k
	OEVE8fG5I0YBff1toh6J32LJe0kw4L2k+YdriCa6Pn+t47FCc+1iZ49Pw+XIQp66AZGaU4y6ZO9
	SFhjuJoTvIEMBGEXIpkgqomtjCzabKV1mI9cDdzeE4vZ4saH3x/QQ1N7MpjTyTQ2FyChwhTDqdO
	eD+KNzpRK5Gspt5mziFfZFY4g7VWQl2ZIN9KXQbiidinFbh2UnouUqBWioKG2K1OgYQcGAzz5F5
	l6s9MqlqZUc0yOJjl9HPEnzb8M7QwxkutsePFj2olFbk4a+Cvn04Radn3glZGD2jhPs1SIW4Mdn
	eLjNu5l74O1iBqwfm3bz3kcXCAMA082czMZT++TiKZONQngjHiURUm6uFR5gc0bXCTrhLA==
X-Received: by 2002:a05:7300:e9cd:10b0:36a:ac68:c745 with SMTP id 5a478bee46e88-36aac68c84amr14869976eec.25.1793902030913;
        Thu, 05 Nov 2026 10:07:10 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36db94376b1sm12512067eec.10.2026.11.05.10.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:07:09 -0800 (PST)
Date: Thu, 5 Nov 2026 10:07:06 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <auzFQkIPZScADEeb@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
 <auy4Qbxg-pW_X37E@google.com>
 <ad9ec396-aab1-4950-8ea6-dd72d8938464@sirena.org.uk>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad9ec396-aab1-4950-8ea6-dd72d8938464@sirena.org.uk>

On Thu, Nov 05, 2026 at 05:19:30PM +0000, Mark Brown wrote:
> On Thu, Nov 05, 2026 at 09:12:38AM -0800, Dmitry Torokhov wrote:
> > On Thu, Nov 05, 2026 at 02:43:17PM +0100, Arnd Bergmann wrote:
> 
> > > As far as I understand the situation, wm831x was used on the
> > > reference board (Samsung smdk6410, removed in 2019) in addition
> > > to crag6410 but never anywhere else upstream. The question
> > > then is whether we'll ever see a DT conversion of crag6410.
> > > This would require finding someone willing to actually do
> > > the work, and coming up with a way to handle the autodetection
> > > in mach-crag6410-module.c so the correct spi/i2c codec
> > > child devices are probed.
> 
> > So I guess the question then: do we need to keep this board at all? Or
> > it is time for it to go the way of the dodo? And then we could drop some
> > more drivers as well.
> 
> I don't really have a great replacement for it.
> 
> > My goal for the series was to move along legacy gpio API conversions, as
> > well as move away from the GPIO lookup tables (ideally I want them gone
> > now that we have software nodes supporting describing GPIOs).
> 
> It is a bit hard to get enthused about software nodes :/

Hopefully you do not need to pay too much attention to them as they are
hidden in the legacy board code.

The benefit is that using them makes the driver exercise the same code
paths as it would on DT system (unless you insist that the driver is
very special and should only use of_* API) and allows dropping support
for bespoke platform data (in most cases).

Thanks.

-- 
Dmitry
