Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E565E325489;
	Wed, 15 Oct 2025 18:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760553151; cv=none; b=llVZ+jo1+koeG/3qUcYja1WVOFhSY7R8I9TTuxap8dsd5gTfk4C1aIo1yeojbEBcq6NMf7OKTG9sJkcqAU6Y5A7yTyuyBx8LYng9wqup4K87LoK85GIRyR519bZceL4bOLc9tuew01FWImni2zQ+L4ig2FonwT1FRbSNLAFr8fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760553151; c=relaxed/simple;
	bh=fQ6Dvs6k0CQ3t/luHMYAgBo0nY4Veo8+0mTyWsYHiwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUQxM816g8EuNUiPWFqHC2CQ6ptEMhmJV/oLKSi3SHG+u8jUTXSqJo9cKk/ZHudu5RvZhMeD7WilW4XiXUBKvyZ/vG6cp2s/Kbx9LnAuGM37UOVjS2ZJD+J8SwIWlbUyA8QU7mhY9E37T8YO5soTPF5mVHO/VeiylfXRmn/lvTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEG4U2O8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEG4U2O8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D3AC4CEF8;
	Wed, 15 Oct 2025 18:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760553150;
	bh=fQ6Dvs6k0CQ3t/luHMYAgBo0nY4Veo8+0mTyWsYHiwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VEG4U2O8yPqmF/FtLYfSbvUyTNChkJV8jzzx4HeGE1oz1q4G9b00Fh+HWj7b16kBn
	 BwJElzg5wduStaoJgTlIH0HQKMuFD4gChKoSk+EeOcN7+xkWjO+ZOJJmpjF3Y5e93X
	 Iq7ysnMH97lPOHsY8uMOKkq4oKcsjzEAqDxNFJ21JbRiaccYzeR+lOHtedTZ46Exnf
	 KWVuVoD2Woa0q1vmnP7STrKQoE1CrqibKeL4z/xHsKZ0fPuPobmnpDHoqVn6vEDVVd
	 lSMr5pDFiPEFIld19VlKmSAsyD1gIDy1mrNcHddNK4tZYjibmzAykMVROkAOFbHCHB
	 XKvXJ4OYwcCuQ==
Date: Wed, 15 Oct 2025 13:32:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org,
	Sam Protsenko <semen.protsenko@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
Message-ID: <176055314794.180061.13794322940289476072.robh@kernel.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-2-72851ee00300@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-automatic-clocks-v1-2-72851ee00300@linaro.org>


On Mon, 13 Oct 2025 21:51:31 +0100, Peter Griffin wrote:
> Update the bindings documentation so that all CMUs (with the exception of
> gs101-cmu-top) have samsung,sysreg as a required property.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../bindings/clock/google,gs101-clock.yaml         | 23 +++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

