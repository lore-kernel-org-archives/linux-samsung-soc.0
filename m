Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE11325785E;
	Sat, 22 Nov 2025 11:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763811319; cv=none; b=b7YzXjs4K8pbwjlgwbD9U+/2sA3br5ggcVU8rBPf6SB+9i3B+yDOwYbo3zo/sfouUNT9Ml8JUyVKhFfBiDB9oZxvstjhQ5G9tXhN2LvezrjlnF85VP5q94Szizmr17D2gAyGsIufNFJVW4PHpAeFp+H+7Wa4Dzx/XVL55JjY8uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763811319; c=relaxed/simple;
	bh=IxDDJj+ygRvaEnL6Mv9NBj7KbnZR8hk1nQd27frJE4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=klCc86Swbd7toQdUYD4MuM7pC4PSqN8HSsp1lxPZc9I7XvTb8VZkz9N1jUqzmH/Pu0Sc+CICA3NmFYAHxsskx53jltzVXklII+4O1STTnuKNlDFNEUsfpQWjvKHVwvCptY7IxMDUdBuLKWDewK3xaDDScs+XlmsNk3GH2iIrYKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVWk8ULv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVWk8ULv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD82FC4CEF5;
	Sat, 22 Nov 2025 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763811319;
	bh=IxDDJj+ygRvaEnL6Mv9NBj7KbnZR8hk1nQd27frJE4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LVWk8ULvqh2xe440+nRdtGXjxKjU3mwEtE8JpOGjuvw9xErXSWy6vhAc+JoKF19Lu
	 K9sOBsXMExNo4MNoVOlbYm3cjE530lDTTw+1ePxmwKS5b7AMm8vt4a2jC5FeoZeQ10
	 Wn+2fpjpzbOKWhpOA5cVrbvgWIwrgCty25xWdmSDH4hniMXOIER0Z2u8lqntilAuBJ
	 UA+9V19LjRhwX2GbkQAssqQCM87gLF8q01hTuqIw+Py3Z+J3IYzM6qb0oiZFet5fev
	 rWia9kvLG3i+KW2pca2px+ssMax4/5XvPLL1stNrZwglf/XRrG+WcEHIe5ocgYoAIf
	 eXC792xrgoSqg==
Date: Sat, 22 Nov 2025 12:35:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
	Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: google,gs101-clock: Add DPU
 clock management unit
Message-ID: <20251122-silent-fluffy-agama-9a9ad1@kuoka>
References: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
 <20251120-dpu-clocks-v1-1-11508054eab8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251120-dpu-clocks-v1-1-11508054eab8@linaro.org>

On Thu, Nov 20, 2025 at 09:06:11PM +0000, Peter Griffin wrote:
> Add dt schema documentation and clock IDs for the Display Process Unit
> (DPU) clock management unit (CMU). This CMU feeds IPs such as image scaler,
> enhancer and compressor.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../bindings/clock/google,gs101-clock.yaml         | 19 ++++++++++++
>  include/dt-bindings/clock/google,gs101.h           | 36 ++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> index 09e679c1a9def03d53b8b493929911ea902a1763..1257be9c54a42ea2387e1112e53b5ee1f03e09f5 100644
> --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> @@ -34,6 +34,7 @@ properties:
>        - google,gs101-cmu-hsi2
>        - google,gs101-cmu-peric0
>        - google,gs101-cmu-peric1
> +      - google,gs101-cmu-dpu

Standard comment - oddly placed. d < p. Or you just always keep adding
at the end?

>  
>    clocks:
>      minItems: 1
> @@ -171,6 +172,24 @@ allOf:
>              - const: bus
>              - const: ip
>  
> +  - if:

This as well follows alphanumeric placement.

Best regards,
Krzysztof

