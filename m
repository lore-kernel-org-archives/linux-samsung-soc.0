Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07FA189F3B;
	Thu, 30 Oct 2025 07:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761809871; cv=none; b=X/V8BuAWTiNaoFiZt4Eq2dsMgzMngw4H6UOuQKQJ1x2DiQCge5zyIclD/PTvaSPnIZTwSV7sqr/9OfXLTzal5J0oVAvpIP2ksUre2bHcEaPk/t34+YklFelQBvu+mvg6B3e6ncU4m/cmibQZyfjBtxEt29ZKHNQPWDC4qt2Oe6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761809871; c=relaxed/simple;
	bh=p5DHJywARmB6vgwsW87ali+itZaEbJODsI/RAOXtFCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9VkA5TztRz/wslyuaNsnaE/p1ng9HB23uofqVx8R0PELYOuBqLtcpuNMxs4VXkUs7oxc0lEP2bYjMI4xgGW0c0pTS81l6lakVyzpuEoatmScV6u5/tKi26I3fDaoypAPpWS7sgZwdQBhXy6RGTrm/5gYDoMFRrvFEgCFd51JxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTu0b8qN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTu0b8qN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2C8C4CEF1;
	Thu, 30 Oct 2025 07:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761809871;
	bh=p5DHJywARmB6vgwsW87ali+itZaEbJODsI/RAOXtFCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTu0b8qNGle6R+nWGmP4sNLndzagsCvdS/cbADesFxlULifaO76DGm7ScTcoqCjfZ
	 fP5A7qc+k+GR7FJ13+GWv4Rw59IycUpgKVZ6ZJiGv3Plx/qxok01KYRsRvBcKe9+G1
	 Dv9ssTxAPwWBqV6erVoEaiFEvLsGTUDvIT1icXMUvwlJRE8dHDlaHEnUWomt04+sOz
	 yRTLDWvk0P2VxTjrQpx02G5OaH0kGK3OMmpm3i7lekjMcE1Df15k5rOgRrgWje0dln
	 yGJDcg4EEc5LXOxsc3ty2JeUUHgFecigDQ0w58W0Y0Q30kw1Lh9pkcdXgj3Z2P/PD6
	 iLjEuL9hL0tNg==
Date: Thu, 30 Oct 2025 08:37:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Doug Anderson <dianders@google.com>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: google: Add Google Tensor G5
 USB PHY
Message-ID: <20251030-cunning-copper-jellyfish-1b5f3b@kuoka>
References: <20251029214032.3175261-1-royluo@google.com>
 <20251029214032.3175261-2-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251029214032.3175261-2-royluo@google.com>

On Wed, Oct 29, 2025 at 09:40:31PM +0000, Roy Luo wrote:
> Document the device tree bindings for the USB PHY interfaces integrated
> with the DWC3 controller on Google Tensor SoCs, starting with G5
> generation. The USB PHY on Tensor G5 includes two integrated Synopsys
> PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo PHY IP.
> 
> Due to a complete architectural overhaul in the Google Tensor G5, the
> existing Samsung/Exynos USB PHY binding for older generations of Google
> silicons such as gs101 are no longer compatible, necessitating this new
> device tree binding.
> 
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  .../bindings/phy/google,gs5-usb-phy.yaml      | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> new file mode 100644
> index 000000000000..8a590036fbac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025, Google LLC
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/google,gs5-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Tensor Series (G5+) USB PHY
> +
> +maintainers:
> +  - Roy Luo <royluo@google.com>
> +
> +description: |
> +  Describes the USB PHY interfaces integrated with the DWC3 USB controller on
> +  Google Tensor SoCs, starting with the G5 generation.
> +  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.0 PHY IP
> +  and USB 3.2/DisplayPort combo PHY IP.
> +
> +properties:
> +  compatible:
> +    const: google,gs5-usb-phy
> +
> +  reg:
> +    items:
> +      - description: USB3.2/DisplayPort combo PHY core registers.
> +      - description: USB3.2/DisplayPort combo PHY Type-C Assist registers.
> +      - description: USB2 PHY configuration registers.
> +      - description: USB3.2/DisplayPort combo PHY top-level registers.
> +
> +  reg-names:
> +    items:
> +      - const: usb3_core
> +      - const: usb3_tca
> +      - const: usb2_cfg
> +      - const: usb3_top

These prefixes are redundant. Also, you are still referencing here
completely different devices. MMIO of IP blocks do not have size of 0xc
and they do not span over other blocks (0x0c410000 and then next one is
0x0c637000).


> +            reg = <0 0x0c410000 0 0x20000>,
> +                  <0 0x0c430000 0 0x1000>,
> +                  <0 0x0c450014 0 0xc>,
> +                  <0 0x0c637000 0 0xa0>;
> +
> +  "#phy-cells":
> +    description: |
> +      The phandle's argument in the PHY specifier selects one of the three
> +      following PHY interfaces.
> +      - 0 for USB high-speed.
> +      - 1 for USB super-speed.
> +      - 2 for DisplayPort.
> +    const: 1
> +
> +  clocks:
> +    minItems: 2
> +    items:
> +      - description: USB2 PHY clock.
> +      - description: USB2 PHY APB clock.
> +      - description: USB3.2/DisplayPort combo PHY clock.
> +      - description: USB3.2/DisplayPort combo PHY firmware clock.
> +    description:
> +      USB3 clocks are optional if the device is intended for USB2-only
> +      operation.

No, they are not. SoCs are not made that internal wires are being
disconnected when you solder it to a different board.

I stopped reviewing here.

You are making unusual, unexpected big changes after v4. At v4 you
received only few nits because the review process was about to finish.

Now you rewrite everything so you ask me to re-review from scratch.

> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      - const: usb2
> +      - const: usb2_apb
> +      - const: usb3
> +      - const: usb3_fw

Again, what's with the prefixes? apb is bus clock, so how you could have
bus clock for usb2 and usb3? This means you have two busses, so two
devices.

> +
> +  resets:
> +    minItems: 2
> +    items:
> +      - description: USB2 PHY reset.
> +      - description: USB2 PHY APB reset.
> +      - description: USB3.2/DisplayPort combo PHY reset.
> +    description:
> +      USB3 clocks are optional if the device is intended for USB2-only
> +      operation.
> +
> +  reset-names:
> +    minItems: 2
> +    items:
> +      - const: usb2
> +      - const: usb2_apb
> +      - const: usb3

And here?

This all looks like downstream code.

Best regards,
Krzysztof

