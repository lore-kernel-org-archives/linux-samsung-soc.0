Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC090A92E;
	Thu, 20 Nov 2025 00:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763597348; cv=none; b=B+l6pJefwOeJnPZ7bVGKjDV/nkhyPwleUTnDvFwJ9Wj5boNy38ldVRjllwV904ncX3oi5DR/J1RgfjqV4/yTLpnEGdMLffWh4g/g1TcKuUaR3QR86/PYKeqU9ONztLueO4XjtSuYqx+fikjWwRFtDw6z63VHMMtVWYguvRN2hGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763597348; c=relaxed/simple;
	bh=bI1hJPeepEDCllDijUB6qbqgSNpihc1cIDuIMmez/q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+Hc6h3lM6OlEJA32i3d3cGpjfhHaUMw0MWJWEYmta5mvs/SMc+7S3/dmMEvLK9QmgmBWEyJhh4/j7TfRzh+bwLAyslR6huK71VHfLURtkJWA4lqYpmaDNyLOADkPvwQO5skZS7NMnjcLKKHkymM7qyVgAmRjcVKSKYclwNWf/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oimvl6kV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oimvl6kV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA58C4CEF5;
	Thu, 20 Nov 2025 00:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763597348;
	bh=bI1hJPeepEDCllDijUB6qbqgSNpihc1cIDuIMmez/q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oimvl6kVMjefJr0p46lkwTVZpA1S/VXpJrh6kB2QI8hrej31IgA76bY8dvOECDUHE
	 Z31pJgXwNwlq8lTDNg9kX+TBDofM6AC9WjYDiN7MIDbHD4BCzRmz17CVTlXOu0sruV
	 WOz2R+DI2cUSEsOj+f5wk3Z7Oc/9QEz9ga2gkjCeniXrL6fxyQoaiYGtpkSQ01M7pC
	 ElbSmiID/k9kMu4MtulpkGRJ1Yh5m943XuQw8gb5OAgMJksp9uEz4s9uv2md7w9wc3
	 YMQ/LhEIMA7TE212GbIwR/WLwcVoK/bOvR9efJGdsEPNnW+pRivvcg8XKr5Se356Br
	 ming3fpVmNuVg==
Date: Wed, 19 Nov 2025 18:09:06 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, dan.carpenter@linaro.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, willmcvicker@google.com,
	devicetree@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
	kernel-team@android.com, arnd@arndb.de,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: samsung: exynos-pmu: remove
 syscon for google,gs101-pmu
Message-ID: <176359734563.3602720.3498297116767646950.robh@kernel.org>
References: <20251114-remove-pmu-syscon-compat-v2-0-9496e8c496c7@linaro.org>
 <20251114-remove-pmu-syscon-compat-v2-1-9496e8c496c7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-remove-pmu-syscon-compat-v2-1-9496e8c496c7@linaro.org>


On Fri, 14 Nov 2025 12:00:16 +0000, Peter Griffin wrote:
> Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> "syscon" compatible") it is possible to register a regmap without the
> syscon compatible in the node.
> 
> Update the bindings for google,gs101-pmu so that the syscon compatible is
> no longer required. As it isn't really correct to claim we are compatible
> with syscon (as a mmio regmap created by syscon will not work on gs101).
> 
> Additionally (with the benefit of hindsight) PMU register writes were never
> working with a MMIO syscon on gs101, so the ABI break is justified.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v2:
>  - Update commit description (Krzysztof)
>  - Change Items to enum, remove const (Krzysztof)
>  - Checkpatch warning commit msg length (Krzysztof)
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

