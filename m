Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B86192B66;
	Wed, 19 Feb 2025 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739952609; cv=none; b=CM+Y3TGEU3rgR6MDfi4Cc2I2Pd3+vdh3U+ss16Jl6qLOP8s7awFFdHAB+oRRPPGN3aAGlgHFImOH0OhjGfdRLRLzEfrgzb42JfexA7TvC/hD9+IUPf8bPEaKoR3gOZ0C2v+kCXtMoL5qAIqht9HsgdZhCn9IbOgi5cMqOeL4Rfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739952609; c=relaxed/simple;
	bh=toKhTzJHk0yZd6I+pNwZHNw66R0PvxmZq/5VoXfHFKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgoOvsqea5qcNwLMx3rZH5MldWSDxyupXr7ltGP1imYZuGGbuuNjeYowAKNJ0vUmTxkH51CFu4bzxcIebJs8riBWVK6hv4XgyVyFpE0rVVck3XEHYcIqC5eHYraDzltln57YpuZTDWKKmdWx4TC6WzqGxFQ9077sroU7aYVQdx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wzq8gltg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wzq8gltg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D32C4CED1;
	Wed, 19 Feb 2025 08:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739952608;
	bh=toKhTzJHk0yZd6I+pNwZHNw66R0PvxmZq/5VoXfHFKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wzq8gltgUcfJkGOZsx9ZxxcsxiQIfUb3Pi56Nqb2TKzzbUokHYAWNkXkb8iORu0cy
	 QMHnaTcKzNxMy9OjQJOHnjwK8MVKGk75fag479zNQSzFb6p/5mO8jO4WH2XRqO+tYS
	 g8TVWHZCdrtOfaHvqOjLMWKBryhSKfHiASOJmox46aoOQy7JbrUK7Pyc0/d/rFF4dA
	 GB8AtkmTe+yEy0Ump6xlWG2etlUxl8j7Qy3oDXH1U6AlBHafjofLPDsuACofwZY+mj
	 /rciYb9bP8L4qhje96aI1R07sHcm5WdVMUyay/je+sfhkjC+006PFO3acPs8yCSG+8
	 2M8p9VTcoGAaw==
Date: Wed, 19 Feb 2025 09:10:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: add clock definitions for
 exynos7870 CMU
Message-ID: <20250219-frigatebird-of-premium-philosophy-de6dab@krzk-bin>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
 <20250219-exynos7870-pmu-clocks-v3-1-0d1e415e9e3a@disroot.org>
 <20250219-naughty-spaniel-of-refinement-ab6fac@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-naughty-spaniel-of-refinement-ab6fac@krzk-bin>

On Wed, Feb 19, 2025 at 09:07:17AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Feb 19, 2025 at 12:20:28AM +0530, Kaustabh Chakraborty wrote:
> > Add unique identifiers for exynos7870 clocks for every bank. It adds all
> > clocks of CMU_MIF, CMU_DISPAUD, CMU_G3D, CMU_ISP, CMU_MFCMSCL, and
> > CMU_PERI.
> > 
> > Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> > ---
> >  include/dt-bindings/clock/exynos7870.h | 324 +++++++++++++++++++++++++++++++++
> >  1 file changed, 324 insertions(+)
> 
> Again, you keep repeating some old patterns ignoring what was added
> recently. This must match compatible, so missing vendor prefix.
> 
> Also squash the patch with the binding itself so you will see the
> difference in names.

Let's unify everything to:

samsung,exynos7870-cmu.h
