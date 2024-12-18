Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312369461;
	Wed, 18 Dec 2024 19:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734549394; cv=none; b=V+AcFwYcr2EjIlPG6HSsanUtah7pzMR6mLSucZKGWFkYn1AXenB6NxCpV0MzTErbzFM90lj2VW+0uh+ato4IQtPTSsAE/o8lPZhWakET2jdbSiqtrFlFOvBwog0GwkEoYAtiyfMImy9oqEGp1X2nOc48Mqj7ZvH/SskHbzTrCfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734549394; c=relaxed/simple;
	bh=hMHHPgD+Q5TTWWhgNt+yZVrZ1As+Nx1lYcDU7z4dqus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4A1BQfM5ENM8Cl5OBgCi50rwDIzAmNoAjM+o+H8+Zsek+kHWQuPwCSroRSiRSnCYPGMIKYqldyDucV2XQ5qXeUtCGIbsmFHl0lLLgI8gXLnvm3m17T15/rrO5PklBv8rJ70eXGBwbr6Al1GwOMEUzOu6o7QZqLl9p+ioPP8+OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKkS0CwM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKkS0CwM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1DFC4CECD;
	Wed, 18 Dec 2024 19:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734549393;
	bh=hMHHPgD+Q5TTWWhgNt+yZVrZ1As+Nx1lYcDU7z4dqus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EKkS0CwMwa3KIYYecmq4E5W+qExO80uJ+SLr0SM103IkZ4HXSz37aKmGlkigkv/nW
	 Azr8Y9JxygnbptIt/gbrDY2MEJZFo4e9T7e2eQwHol2kYf1xq8OcI0Rs3SN2FXYFDE
	 7Oy2oXLEbd0l7F1vDgmYHGNF5/FFBfG+r0fo9mCTHw2ZWHNbc8ekj2/US+qktTTpJD
	 E7LsLZSvga7RS8wc0Ykdl2cLc1ri9O0mIPI0fAOFzUJBy6ZVGltJRuWNqHnm2ISBcV
	 XcZKtgKCt5hoOg6mfTjtPeSnaRvY78hfYe1O/m5Bk/Nh30rD/DOKz9l/YGEA+1WLaB
	 UR0vvKQ+hKusQ==
Date: Wed, 18 Dec 2024 13:16:31 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: exynos: gs101-oriole: move common Pixel6
 & 6Pro parts into a .dtsi
Message-ID: <20241218191631.GA1837559-robh@kernel.org>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
 <20241216-gs101-simplefb-v1-3-8ccad1830281@linaro.org>
 <fw2a6taf4kd3sggmyppeym2uxkuyotxy7ugj3bh73vetnra4m6@jllekadordju>
 <6e22585f8d374f8e26a2a51153680041ad8b1bea.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e22585f8d374f8e26a2a51153680041ad8b1bea.camel@linaro.org>

On Tue, Dec 17, 2024 at 08:34:50AM +0000, André Draszik wrote:
> On Tue, 2024-12-17 at 08:38 +0100, Krzysztof Kozlowski wrote:
> > On Mon, Dec 16, 2024 at 01:06:28PM +0000, André Draszik wrote:
> > > In order to support Pixel 6 (Oriole) and Pixel 6 Pro (Raven) properly,
> > > we have to be able to distinguish them properly as we add support for
> > > more features.
> > > 
> > > For example, Raven has a larger display. There are other differences,
> > > like battery design capacity, etc.
> > > 
> > > Move all the parts that are common for now into a gs101-raviole.dtsi,
> > > and just leave the display related things in gs101-oriole.dts.
> > > 
> > > Raviole was chosen as the name because Google uses that when referring
> > > to the combination of Oriole & Raven, keeping the familiar terminology.
> > > 
> > > Signed-off-by: André Draszik <andre.draszik@linaro.org>
> > > 
> > > ---
> > > Note: MAINTAINERS doesn't need updating, it covers this whole directory
> > > ---
> > >  arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 290 +-------------------
> > >  .../boot/dts/exynos/google/gs101-raviole.dtsi      | 297 +++++++++++++++++++++
> > >  2 files changed, 305 insertions(+), 282 deletions(-)
> > > 
> > 
> > This looks like move of the code, so -M/-B/-C format patch arguments
> > would create better diff.
> 
> Ah, yes, forgot about those when I switched to using b4 instead of
> custom scripts...

If b4 does not do that by default, then it should set the option. One 
less thing to get right for users. I sent a patch for that.

Rob
