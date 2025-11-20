Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CE33C2F;
	Thu, 20 Nov 2025 00:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763597416; cv=none; b=hihagBzc/y9M0+hfEOQjnOylUWxQiwki4fWuXRgTimr0VPKq3UStWuPfsF1FwRocf7AaEEuiu5FyqFayUqNbcNtcGYhctxSRFWSofvtUPvZcFcz+NklN7MThvYa150lcUHDg198cCBmmB07aoE8cA1eggW51zNyGgEQ3khiUaCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763597416; c=relaxed/simple;
	bh=ea5U/JJufh5pYNga2ZzeflJrlaYuHhKo5b+7WwgCRf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJhh1dRnj3lSp+AEL3tfud0xFK53LVo5AnJndn1UYwB/Wd4vFc7uhPmn8Ny5MwVmc3ln4pGr8GW79GzlbosCMNWGNwjBC+Jef4F7zQLhb5P1xel9Sm7DO+TgZusPUZLpd1wLk+FO0ieGE0TzD0oSuZzdqxDzQ+RHL2pxNRBRmuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KiZU5Flv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KiZU5Flv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12B7C4CEF5;
	Thu, 20 Nov 2025 00:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763597416;
	bh=ea5U/JJufh5pYNga2ZzeflJrlaYuHhKo5b+7WwgCRf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KiZU5FlvGhByHmnQ2qXdxblVfg4iblqeL0BCCeWosof+z30V8kacoOcobZ722KyC5
	 kkJ5dYhBO96hdyYeG/zuT4izsyzFiA21hIwV1E33n4hLQlcLJGWQ/wWrvvA9Jzk5dX
	 zv2BGtnNKlUMaSVyOgbM4heQD3oGPMEQY1Pac6mJYBjlg+itLiMmJJxwvZeI920TWW
	 UG67mS9CDdV5UkEu1oCJaoycfUouWocn7lEYWHsT+b4QcjFDRuAwfRM749k+v9ibA4
	 FcAl6+ML8krCT7ORBKK6Kg8Y9dJNhX0lcOkFgzT/6RcwME43ooa3I5QIMaBPCla1mE
	 JH22UPQhGpH6A==
Date: Wed, 19 Nov 2025 18:10:14 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
	Will McVicker <willmcvicker@google.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>, kernel-team@android.com,
	Sam Protsenko <semen.protsenko@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
Message-ID: <176359741364.3604013.10884169748220916434.robh@kernel.org>
References: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
 <20251114-automatic-clocks-v5-1-efb9202ffcd7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-automatic-clocks-v5-1-efb9202ffcd7@linaro.org>


On Fri, 14 Nov 2025 14:16:48 +0000, Peter Griffin wrote:
> Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
> The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
> bus components and MEMCLK gates the sram clock.
> 
> Now the clock driver supports automatic clock mode, to fully enable dynamic
> root clock gating it is required to configure these registers. Update the
> bindings documentation so that all CMUs (with the exception of
> gs101-cmu-top) have samsung,sysreg as a required property.
> 
> Note this is NOT an ABI break, as if the property isn't specified the
> clock driver will fallback to the current behaviour of not initializing
> the registers. The system still boots, but bus components won't benefit
> from dynamic root clock gating and dynamic power will be higher (which has
> been the case until now anyway).
> 
> Additionally update the DT example to included the correct CMU size as
> registers in that region are used for automatic clock mode.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v5:
> - Invert the test for google,gs101-cmu-top (Andre)
> 
> Changes in v4
> - Update commit description with additional requested details (Krzysztof)
> 
> Changes in v3:
> - Update commit description as to why the sysreg is required (Krzysztof)
> 
> Changes in v2:
> - Update commit description regarding updated example (Andre)
> ---
>  .../devicetree/bindings/clock/google,gs101-clock.yaml | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

