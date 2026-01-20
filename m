Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF25843E4AF;
	Tue, 20 Jan 2026 14:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920471; cv=none; b=WTV12ZnEirH6NpXVrjU7VUHqCOnD9v6b+gkel1Rd2fwnjxsGF2gl8cpPF2C5cxZ3bFuFjvOoUbVUjlOXLL+rvhN6gxchbwnMl4F4hlasQYFbHILZ0VimcsW81dhkv+rfiYN7vdJImQu7wRblcp7s7s5lNa5sBZib/4uzlK4i93k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920471; c=relaxed/simple;
	bh=CTbz2aRX7VUqXhjb6SHfBzbNu0hxAJadTL4MO29FhEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhWAyYGOwHSp4UeGwz5bEPE7BBiYfFgqQ12QvMeI4/bSnlAmFqVDbdIhMRqLeyDimsORnUAUF1GUu2hxSlUqhuxMDKq4mXMEOzdjoJVZApV0tRzQnSL+PljuXgzezjK2v/OaKTWyvGynzguXwTqFhff000dOR++bxHiTwWOpSNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kpjPSnj1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kpjPSnj1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C974C16AAE;
	Tue, 20 Jan 2026 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768920471;
	bh=CTbz2aRX7VUqXhjb6SHfBzbNu0hxAJadTL4MO29FhEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpjPSnj1ja3WWqodg90cTOJ2VXmUkYX9wML3cHth2j67+pj6gAyaTs4zz3cNKHmLf
	 BvrAFwnqL3xersAGl8r9cBx7iq3qQMzaOuyE72HXQE7overU0EIiVl5Bde/vYkOMwM
	 kT6bVjWcEpJ6WG6fdxT2m43j1uXHDvjnHLtra6HWpls9JuEkUYwBmR1ZwCQvUmRtWl
	 TcjIsdheZ63tww9L55jjcTNGXPDCZZLeLbQeExox1qE6V3Vya2ulsWxC6tgDThURjQ
	 zJKNmDWtgDdensfjzKdrswQihT5kzrYWVyeFQGs0HohOPJWvqHogylFBfH8z9czF3E
	 S0wodIJq9fENA==
Date: Tue, 20 Jan 2026 14:47:44 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
Message-ID: <20260120144744.GC1354723@google.com>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
 <20260113112244.GE1902656@google.com>
 <6ace23c4-d858-4bdf-9987-104e706190cd@sirena.org.uk>
 <20260114155011.GC2842980@google.com>
 <b9df01e9-c4ba-4e2c-b458-bc93663ab78e@sirena.org.uk>
 <17cb0fffa7531e75b8cbe11252deaca1bf377a39.camel@linaro.org>
 <20260120144440.GB1354723@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120144440.GB1354723@google.com>

On Tue, 20 Jan 2026, Lee Jones wrote:

> On Tue, 20 Jan 2026, André Draszik wrote:
> 
> > Hi Lee,
> > 
> > On Wed, 2026-01-14 at 16:02 +0000, Mark Brown wrote:
> > > On Wed, Jan 14, 2026 at 03:50:11PM +0000, Lee Jones wrote:
> > > > On Tue, 13 Jan 2026, Mark Brown wrote:
> > > 
> > > > > Given that the bulk of the series is regulator changes I'd been
> > > > > expecting to take it?
> > > 
> > > > I have no issues with that, providing you offer a succinct immutable
> > > > branch containing just this set for me to pull from.
> > > 
> > > > Failing that, I have the machinery in place to offer you the same.
> > > 
> > > Yeah, given what André said about dependencies if you could apply the
> > > MFD commits and send a PR that'd be great.
> > 
> > Friendly ping. Is there anything else required to get this going please?
> 
> Don't do that!
> 
> If you think the patch/set has been dropped (it hasn't) then please send
> a [RESEND].  I'll get around to it when I do my next round of reviews.

And since I traverse my todo list in reverse chronological order, all
you've achieved here is putting yourself at the bottom of the pile.  =:|

-- 
Lee Jones [李琼斯]
