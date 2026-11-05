Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887997;
	b=SxUMDWa2kOJdTwtRaRbksF7uCdsWqxiIfUdxHDVWOlrc84wSmNXsl41N0MbiYQhBccp9
	 2fm6AZrbUMZ5fHkA2/H2kDu5cDERaX64RwXdjvbYMH2x2xjvzmEEOIi565YbBWW6bCYx5
	 4ucvaXtvTzlfkh3F8Vyb8Xx6IdfI8zMfnAs7rAGEeJMJV+Cbk8hfcBDVHcI9aOQ417DIN
	 FmCt96qiJVvzK3dklPr5qADAM1Ns4Kt4vKj+TcZbuMP+G7NEx1cDxu/c5nyzKkvZ6HJ9O
	 AzhTbe7e5uQMg200TCjS/Qf0vw7e9CbxmXl82uTLLAmR6/Y5N4McbfJo4jwy9PZKwdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887997;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vhaMFCmITRvdlEmOVhab1Mlft/tMQfl2s1RAannTexY=;
	b=eaTQI6C0BZqllgxWM/oco9K0YaKqtQMapgw4K8TBxBQBhpuIW0PMXVKeJjuxNqrvzOsy
	 iTrGKaRI46Hd5FMJ2ar33VzRc+UIdpYzaxz618EJvewS2cauLe1covxWG9rtwnrONoUxf
	 VOSzE9MqsfAcPu4odB/0vGsU+YtZR76NdV3hmIZVQDFYf5K1nLqN7CxSm+yjfd+JQxFjS
	 m4843pY2TOSe1kezuaKrktC9E32NG5fPuR+VUW4RuhuybexS+idxklie9cnbPp5/EowFZ
	 OhPRTy6bTuyvta8vFdFDv9ExgthB2J9F9QEiuqP79ojKD/9m0FCxERNS90dMsMyWhJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AV5U+7nJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F338606D805;
	Thu,  5 Nov 2026 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AV5U+7nJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9051D1F00919;
	Thu,  5 Nov 2026 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887997;
	bh=vhaMFCmITRvdlEmOVhab1Mlft/tMQfl2s1RAannTexY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AV5U+7nJyY2hDS2LZLnNqkvzwtaZN9HFjMh+dqmA2Mn+hXgWQ5u7YfNttOsb+ku8F
	 yJe6d7FRUgxuwXotQ32bNxyonWdscEaZnLyWpTAgqdFxt+ZWsV/3QX2oJe9Jt8IxoX
	 PW0e0ndTIhwh5xG/SIdJmfKj4ioos6ViPcc+MAy4wHQunAWaghYQE9aolrOKEJl2GA
	 wArS2mKgHYmxczgrSDCLEdOHWr8E6f2CK/RfSPQxHchVWtpIUkeLGTJ7DGYGGWSae3
	 I1nu9+qeijUjVhvxpSWQ8aIJbzjfeKklb1wamfJiBVqySUQqkhu/izowr5cGY1CpqQ
	 mhelaRKYT4eGg==
Date: Thu, 5 Nov 2026 14:13:12 +0000
From: Lee Jones <lee@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <20261105141312.GL1650678@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
 <auyK50dqvwxIGIar@opensource.cirrus.com>
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
In-Reply-To: <auyK50dqvwxIGIar@opensource.cirrus.com>

On Thu, 05 Nov 2026, Charles Keepax wrote:

> On Thu, Nov 05, 2026 at 02:43:17PM +0100, Arnd Bergmann wrote:
> > On Thu, Nov 5, 2026, at 09:53, Lee Jones wrote:
> > > On Wed, 04 Nov 2026, Dmitry Torokhov wrote:
> > >> On Wed, Nov 04, 2026 at 06:14:29PM +0000, Lee Jones wrote:
> > >> > On Sat, 24 Oct 2026, Dmitry Torokhov wrote:
> > - if there is a reason to expect any future user of the driver,
> >   extend the wlf,arizona.yaml binding to cover wm831x as well,
> >   replace all the platform data with swnode properties according
> >   to that binding and have the drivers use those.
> 
> I really don't like adding wm831x to the Arizona binding. Fine if
> we want to create a new binding in a similar style but Arizona is
> a binding for a specific series of audio parts, wm831x predates
> those and is a pmic. Trying to combine them feels likely to cause
> problems.

I don't personally mind how this gets resolved, as long as we avoid the
monstrosity suggested in the original submission.  =:-]

-- 
Lee Jones
