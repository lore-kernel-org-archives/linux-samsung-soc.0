Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A66277CAF;
	Sat,  6 Dec 2025 10:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765018106; cv=none; b=cOlX2ENWeMBsqpcUcHeMU4TyZd+tEcrOJ/kYd7pwzFP4d7sTk41kycVuGnYvm0wDZbH0m0V3YcKIPGRwVAKF30rouFk8JLxwdeTuB3uYErWvPqx4mw3aJ+xBfRBzC1YIIqjFmQ461YHR/R4ADextucmv6Pa0mKpPsGxyxUUFGsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765018106; c=relaxed/simple;
	bh=STlMorUBBdfacWXUVY0MYVqsAE1P74sX888Amhh4DqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=semnDl2meXuyf8eyahrfzGztIjNROVDY0KgLOEhmJbA2YrqB2rDvsoFlBe9HiC/EnW5UJVHRVQYO9ny0KQVz/oCLXoVEfqj4IgHeSxkdnfo7ogprTqQUK1PLat1HXkBKRA8WA4DaFGiIsOCVbs6wa43cswIq0SrB85CaaPn2MBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTd5Bxaw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTd5Bxaw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD59C4CEF5;
	Sat,  6 Dec 2025 10:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765018106;
	bh=STlMorUBBdfacWXUVY0MYVqsAE1P74sX888Amhh4DqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kTd5BxawgkEYe4L+iumdhan+lE8CnBtT01ThDZa7b0F0Ip81sUSc/9625ECYF/iQz
	 442XYwhRYNxCZpEKsyRaQ0IvCTXIC1u4EDRv/yI1Jlu7ceV3rzD7xWhvi0n+LTKnLD
	 7j75ukNgYNpUFa711h2OulwuVfSZ1cDd3DQVi38KrkdC7ISqgZWWf2iZc+ojRCUrQb
	 ZXwxdU3v1HIuhyyT4OQfj97wb+k4KcrYZubuowSFWdT74jPAn3ybeDBgIIr7HJpTDQ
	 IVXGf6v0cfspFMY3lizzo70QHNC0h4qndXeslofw7YcjSInbOiwjYK3BYnV9Dlxh5R
	 Z2vsYF4DFlnlg==
Date: Sat, 6 Dec 2025 11:48:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: google: Add Google Tensor G5
 USB PHY
Message-ID: <20251206-viridian-shrimp-of-growth-43ddd0@quoll>
References: <20251205-phyb4-v8-0-c59ea80a4458@google.com>
 <20251205-phyb4-v8-1-c59ea80a4458@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251205-phyb4-v8-1-c59ea80a4458@google.com>

On Fri, Dec 05, 2025 at 03:54:11AM +0000, Roy Luo wrote:
> Document the device tree bindings for the USB PHY interfaces integrated
> with the DWC3 controller on Google Tensor SoCs, starting with G5
> generation (Laguna). The USB PHY on Tensor G5 includes two integrated
> Synopsys PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo
> PHY IP.
> 
> Due to a complete architectural overhaul in the Google Tensor G5, the
> existing Samsung/Exynos USB PHY binding for older generations of Google
> silicons such as gs101 are no longer compatible, necessitating this new
> device tree binding.
> 
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  .../bindings/phy/google,lga-usb-phy.yaml           | 133 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 134 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

