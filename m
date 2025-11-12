Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFDA2C08C2;
	Wed, 12 Nov 2025 08:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762935258; cv=none; b=WW2naF+CbJcbjk6xGTPOYGZsTyatlFdscV5YbULZ7LNi1vI3OTXqAp0qUddBTT/brlBlJoYDgG89Gw0TJKO0SPJEI2JQIroAMjOYD+0GWRp4Y+EagvRpV/kYchSW/7SicmTfEecM5Mx/tRkRUrAO0OgOmKnxuFkbQcjgh9PKZEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762935258; c=relaxed/simple;
	bh=ZLUHJ3nXQoAGNsQe7fgeAz8Dvgy6taFR/cCsG/Xfe5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0LnO2nM5Hfnjy8vykEuFu3LY8oVr9260BqkGzSo2GPVQEjKB1EqpKcg0xg4xAWZgLqQ0DaoGxFPGZTx3eC2imAyr1eysfSs6FrIbnr267fH2p4yk9jG7xXCESskmF3Oi7WL3QMe7cQcH13+DwN9SODt/lqXSIRDQti/364OK+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXI4NbVg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXI4NbVg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755F4C4CEF5;
	Wed, 12 Nov 2025 08:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762935257;
	bh=ZLUHJ3nXQoAGNsQe7fgeAz8Dvgy6taFR/cCsG/Xfe5U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JXI4NbVgLixO0GOgeRVClcNs8W1nh0RJcDMkuYRSiUwgx2FPy4L/BjH5k/OqHZjA/
	 67PrSg2ug51TbcbbTfzas5QPw9Vda1B6HPhOvxOP47+aG6NozWJs4J2t3+LXBulvC5
	 nLrKB11ju8V1BDMNgNzSMUXmtAKKIZTs/k2/dwVTJN8Fqyxr/4VyerE8ng5Kf1HU2P
	 5wc5e7OMsjPxtrwayEG2x1oYIV/rZaVJjoD/za30PYZMaS2FegvPT7qUY2cZ52ZObP
	 wSsnUn2gU4BPEIYsaK/G+jx/tN/4u6EXxfGOL9ePJY9gcgk5LTB+khqmqXoIjbR3uK
	 ptKL5XRz7zbAA==
Message-ID: <40e67c6d-2430-483b-b4b1-0220ffbd6418@kernel.org>
Date: Wed, 12 Nov 2025 09:14:12 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: google: Add initial dts for frankel,
 blazer, and mustang
To: Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Roy Luo <royluo@google.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>,
 William McVicker <willmcvicker@google.com>, linux-kernel@vger.kernel.org
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.4.I5032910018cdd7d6be7aea78870d04c0dc381d6e@changeid>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20251111112158.4.I5032910018cdd7d6be7aea78870d04c0dc381d6e@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2025 20:22, Douglas Anderson wrote:
> Add barebones device trees for frankel (Pixel 10), blazer (Pixel 10
> Pro), and mustang (Pixel 10 Pro XL). These device trees are enough to
> boot to a serial prompt using an initramfs.
> 
> Many things can be noted about these device trees:
> 
> 1. They are organized as "dts" files for the main SoC and "dtso"
>    overlays for the boards. There is discussion about this in the
>    bindings patch ("dt-bindings: arm: google: Add bindings for
>    frankel/blazer/mustang").
> 2. They won't boot with the currently shipping bootloader. The current
>    bootloader hardcodes several paths to nodes that it wants to update
>    and considers it a fatal error if it can't find these nodes.
>    Interested parties will need to wait for fixes to land and a new
>    bootloader to be rolled out before attempting to use these.
> 3. They only add one revision (MP1) of each of frankel, blazer, and
>    mustang. With this simple barebones device tree, there doesn't
>    appear to be any difference between the revisions. More revisions
>    will be added as needed in the future. The heuristics in the
>    bootloader will pick the MP1 device tree if there are not any
>    better matches.
> 4. They only add the dts for the B0 SoC for now. The A0 SoC support
>    can be added later if we find the need.
> 5. Even newer versions of the bootloader will still error out if they
>    don't find a UFS node to add calibration data to. Until UFS is
>    supported, we provide a bogus UFS node for the bootloader. While
>    the bootloader could be changed, there is no long-term benefit
>    since eventually the device tree will have a UFS node.
> 6. They purposely choose to use the full 64-bit address and size cells
>    for the root node and the `soc@0` node. Although I haven't tested
>    the need for this, I presume the arguments made in commit
>    bede7d2dc8f3 ("arm64: dts: qcom: sdm845: Increase address and size
>    cells for soc") would apply here.
> 7. Though it looks as if the UART is never enabled, the bootloader
>    knows to enable the UART when the console is turned on. Baud rate
>    is configurable in the bootloader so is never hardcoded in the
>    device tree.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> To avoid fragmenting the discussion, IMO:
> * Let's have the discussion about using the "dts" for SoC and the
>   "dtso" for the boards in response to the bindings (patch #1).

That's discussion here, bindings are irrelevant to this.

> * If we want to have a discussion about putting "board-id" and
>   "model-id" at the root of the board overlays, we can have it
>   here. I'll preemptively note that the "board-id" and "model-id"
>   won't show up in the final combined device tree and they are just
>   used by the tool (mkdtimg). We could change mkdtimg to parse the
>   "compatible" strings of the overlays files (since I've put the IDs
>   there too), but official the docs [1] seem to indicate that
>   top-level properties like this are OK.
> 
> In order for these device trees to pass validation without warnings,
> it's assumed you have my dtc patches:
> * https://lore.kernel.org/r/20251110204529.2838248-1-dianders@chromium.org
> * https://lore.kernel.org/r/20251110204529.2838248-2-dianders@chromium.org
> 
> [1] https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/Documentation/dt-object-internal.txt?h=main
> 
>  arch/arm64/boot/dts/google/Makefile           |   9 +
>  arch/arm64/boot/dts/google/lga-b0.dts         | 391 ++++++++++++++++++
>  .../arm64/boot/dts/google/lga-blazer-mp1.dtso |  22 +
>  .../boot/dts/google/lga-frankel-mp1.dtso      |  22 +
>  .../boot/dts/google/lga-mustang-mp1.dtso      |  22 +
>  .../boot/dts/google/lga-muzel-common.dtsi     |  17 +
>  6 files changed, 483 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/google/lga-b0.dts
>  create mode 100644 arch/arm64/boot/dts/google/lga-blazer-mp1.dtso
>  create mode 100644 arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
>  create mode 100644 arch/arm64/boot/dts/google/lga-mustang-mp1.dtso
>  create mode 100644 arch/arm64/boot/dts/google/lga-muzel-common.dtsi
> 
> diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
> index a6b187e2d631..276001e91632 100644
> --- a/arch/arm64/boot/dts/google/Makefile
> +++ b/arch/arm64/boot/dts/google/Makefile
> @@ -1 +1,10 @@
>  # SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +
> +dtb-$(CONFIG_ARCH_GOOGLE) += \
> +	lga-blazer-mp1.dtb \
> +	lga-frankel-mp1.dtb \
> +	lga-mustang-mp1.dtb
> +
> +lga-blazer-mp1-dtbs		:= lga-b0.dtb lga-blazer-mp1.dtbo
> +lga-frankel-mp1-dtbs		:= lga-b0.dtb lga-frankel-mp1.dtbo
> +lga-mustang-mp1-dtbs		:= lga-b0.dtb lga-mustang-mp1.dtbo
> diff --git a/arch/arm64/boot/dts/google/lga-b0.dts b/arch/arm64/boot/dts/google/lga-b0.dts
> new file mode 100644
> index 000000000000..83c2db4f20ef
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/lga-b0.dts
> @@ -0,0 +1,391 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Google Tensor G5 (laguna) SoC rev B0
> + *
> + * Copyright 2024-2025 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model = "Google Tensor G5 rev B0";
> +	compatible = "google,soc-id-0005-rev-10", "google,lga";

So that's SoC, thus must not be a DTS file, but DTSI.

...


...


> diff --git a/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso b/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
> new file mode 100644
> index 000000000000..133494de7a9b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso

And that's a board, so DTS.

> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Google Pixel 10 (frankel) MP 1
> + *
> + * Copyright 2024-2025 Google LLC.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include "lga-muzel-common.dtsi"
> +
> +/ {
> +	board-id = <0x070306>;
> +	board-rev = <0x010000>;

Undocumented ABI, which you cannot document because these properties are
not allowed. You cannot have them.

Best regards,
Krzysztof
