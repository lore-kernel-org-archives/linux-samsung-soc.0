Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2383928D82F;
	Thu, 23 Oct 2025 06:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761201836; cv=none; b=uqYUXk+PqUPq758w7Yi7aOJf3xN/UnmlwtpRfjTqkdFBuFGV4zNmODsqD6VuN7ktfbE07RwQDFKHYPBdctfv+7ub/wfJTowsopJvmNnDSgLXBRQM9bDUbG2rLx0u/e0nnVOfhvtLd7dJtqLlfIonLR+2P3UroAn+94tz8jMysFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761201836; c=relaxed/simple;
	bh=wq+PR3JQ5rz4ZSLM4QLGVeX/gN+W7vLpvlbttzeFtxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eks64kmAWtB0xMYCLjYB/0PDzqQq7LrS38UV6RroipodxeeMjk3aispgWBb6iDdw3RAF9PMAd7gXhFBbA2DnF2Yy8rYDGnxXmpV+znTxGNTtOwvtOTZpmiVoEMrWr98KS5TyRYhl3qmzkpqO5Ze/FfNnZ1oGUvShgscvusDo3Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOGZ6THX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOGZ6THX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC70C4CEE7;
	Thu, 23 Oct 2025 06:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761201835;
	bh=wq+PR3JQ5rz4ZSLM4QLGVeX/gN+W7vLpvlbttzeFtxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UOGZ6THX+KPz+fnPS5IScnjRV0adu4aQoy6YNzJ+hZrkQ7aeE9Ms19UvzFAVImC1E
	 6QlKvIyK47+4zHYNw+rZnANKkid7mEn6aX/h9hIf3MrFgTLAk/MIcfagQD5MyuFijV
	 vSlQyyDsYGYBK0zsR6y4yjEcbe7gpgbWSd2benJxLYFlPAx19knlG7j1f3PXB5oAeu
	 oYKjMgn018VPkjFeAV3D5wAf2RW+LQFZF1dBZ1HMR3KVANuH6n/2BE5B3zFYBilpNq
	 wGlsZXsShmlWcPwcWUF5QHN6WgdJSwBxGCo45QA1rBJtO8h6sqdCvM7lFtzSW8hj5m
	 R+ZAR0vgmbEjA==
Date: Thu, 23 Oct 2025 08:43:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: google: Add Google Tensor G5
 USB PHY
Message-ID: <20251023-collie-of-impossible-plenty-fc9382@kuoka>
References: <20251017235159.2417576-1-royluo@google.com>
 <20251017235159.2417576-2-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251017235159.2417576-2-royluo@google.com>

On Fri, Oct 17, 2025 at 11:51:58PM +0000, Roy Luo wrote:
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
>  .../bindings/phy/google,gs5-usb-phy.yaml      | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> new file mode 100644
> index 000000000000..c92c20eba1ea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> @@ -0,0 +1,104 @@
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
> +  The hardware can support three PHY interfaces, which are selected using the
> +  first phandle argument in the PHY specifier::

Just one ':', anyway this sentence and below does not belong to
description but to phy-cells. You describe the cells.

Or just mention the header with IDs - here or in phy-cells.

> +    0 - USB high-speed.
> +    1 - USB super-speed.
> +    2 - DisplayPort
> +
> +properties:
> +  compatible:
> +    const: google,gs5-usb-phy
> +
> +  reg:
> +    items:
> +      - description: USB2 PHY configuration registers.
> +      - description: USB 3.2/DisplayPort combo PHY top-level registers.
> +
> +  reg-names:
> +    items:
> +      - const: u2phy_cfg
> +      - const: dp_top
> +
> +  "#phy-cells":
> +    const: 1
> +
> +  clocks:
> +    items:
> +      - description: USB2 PHY clock.
> +      - description: USB2 PHY APB clock.
> +
> +  clock-names:
> +    items:
> +      - const: usb2_phy

core

> +      - const: u2phy_apb

apb

> +
> +  resets:
> +    items:
> +      - description: USB2 PHY reset.
> +      - description: USB2 PHY APB reset.
> +
> +  reset-names:
> +    items:
> +      - const: usb2_phy
> +      - const: u2phy_apb

Same here

> +
> +  power-domains:
> +    maxItems: 1

Best regards,
Krzysztof

