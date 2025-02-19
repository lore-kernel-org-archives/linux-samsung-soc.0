Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF22F1C54B3;
	Wed, 19 Feb 2025 08:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739952627; cv=none; b=mljwB0n6MddHzsAqK8TY3DjKwBd8SOhozpbi7AffnrS66gXY0qlGvZXmN8fnoVa5cNLux8s32EiviR1HpeRPrgu0S1uK5A3Z3pfR3ZEkWsJKZHa4Izh2Fa1xYGJhlZKVKlKk187JNMHlCKbNCSlpHlLzyrTyYjUtVfYolmJSynw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739952627; c=relaxed/simple;
	bh=6daNzU34b0ai1+kOC+LbIJcJDSwe4SEgiE/l3fIVfMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgsnS1WTNsJrgVgJ01FdMcBRLgCbEARWtB6Lv01KWo5P0YsZr2LqjTVwHcesaTRfRWXG52clgS97oAw3bNlg+s35cNver6o6WyiUhtFF5HvSXfvCbEc4kXy52icYAaQl2O2r1JYkc3RDcrAIzk+76u9A+M23U+xDnO87fXeDXWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNzeSBLU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNzeSBLU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FFD6C4CED1;
	Wed, 19 Feb 2025 08:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739952627;
	bh=6daNzU34b0ai1+kOC+LbIJcJDSwe4SEgiE/l3fIVfMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QNzeSBLUOT97nZH9tDnbnfc6gmflk304SFgxL1unwfFOCyhooaU8RzZqp+WXq8U0k
	 U6uEsCzPA2VBbZdp/WZoFESjQuI+vC/4h++NjJZ+Xxud10KCyX6kVhWDD+VfNHC02R
	 aIbSK5QTmM6A91l7hsya6sWdfD9wrtb81eoRfFYcgt/EhQ0ZVhE9otfgn36YqRA1P9
	 MSTxdZ6MQZRG/H+QWQrwyRz/9J30E011Ws5dUkkKLzZCm8dny/nXrJMEjlfXBWUxh1
	 3jvnMD9ghZcEmywbwx3vIRm/UaRFbD9DIp2iK2+WGdZAmNHdlFAwYnXsI2MALTJOGP
	 HcYPpc+DKBtSA==
Date: Wed, 19 Feb 2025 09:10:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: document exynos7870 clock
 driver CMU bindings
Message-ID: <20250219-discerning-convivial-flamingo-6d9eb5@krzk-bin>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
 <20250219-exynos7870-pmu-clocks-v3-2-0d1e415e9e3a@disroot.org>
 <20250219-competent-bullfinch-of-justice-09cbfb@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-competent-bullfinch-of-justice-09cbfb@krzk-bin>

On Wed, Feb 19, 2025 at 09:05:55AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Feb 19, 2025 at 12:20:29AM +0530, Kaustabh Chakraborty wrote:
> > +  Exynos7870 clock controller is comprised of several CMU units, generating
> > +  clocks for different domains. Those CMU units are modeled as separate device
> > +  tree nodes, and might depend on each other. The root clock in that root tree
> > +  is an external clock: OSCCLK (26 MHz). This external clock must be defined
> > +  as a fixed-rate clock in dts.
> > +
> > +  Each clock is assigned an identifier and client nodes can use this identifier
> > +  to specify the clock which they consume. All clocks available for usage
> > +  in clock consumer nodes are defined as preprocessor macros in
> > +  'dt-bindings/clock/exynos7870.h' header.
> 
> Full path and drop quotes

And this filename becames:
samsung,exynos7870-cmu.yaml

Best regards,
Krzysztof

