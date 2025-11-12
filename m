Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C292D1F4E;
	Wed, 12 Nov 2025 08:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762936356; cv=none; b=N2sDXgiY1e0k4a/FNFjHwLQsxJ+J4AxHFJXU/uHg0Sln1e20O3D6qfXQu/mlMXMUgvgYzawGIxONT+iWNXSLIxMJW2rNTghfbPCUKNJnWScFWIMLQFq08ZmcGmX4O45WSmjdTkNqZDPdI9xUEC7A2520DPj3nO9DbkmT5GRw0OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762936356; c=relaxed/simple;
	bh=HLgjcXexC7pF9CiIspXb6LGzy7iOI12i9DXTENjQK1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=add50/d6d3Sc3V5+xj0s6pW+uPxY+6lY/uSdQXeht5mlsgHFKyAOYTgcPgFzkoaRnCD8HXjmgWVopPv/RU5QsnlDJMn5+NDt67NUvpNbjEo+dhh2h4gEeICmd9tF7lK2ezSTbi5JTOCXmyFw1zngZ4AtuuJ95GazXCA7pMVQEVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0FshDGY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0FshDGY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99523C4CEF8;
	Wed, 12 Nov 2025 08:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762936356;
	bh=HLgjcXexC7pF9CiIspXb6LGzy7iOI12i9DXTENjQK1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q0FshDGYRzjn07iHUHbVMBW8fPmDhBKmWCPzT00v75yPduJYGW2UmC2/VKp9vxj+7
	 MnCplljpJw87Koy57fVoNRxcUGDoxMdUrXq2eIPT3n3Xqf/R9PBn5JQ0OM85yZBo8i
	 9/EXi274/+HFzeskwFpZGIsDTbCg0iZWrNb+Gzzo8rTeuBMI/PGPn0+7QDMolXxGiy
	 5dq0Mg/RA9jpB+No8NXN3jgCRg44e8sS/qBeu6E/+NjYI5QD+8DaI4gbLYCsXpl56z
	 cHRpZRRNhIIIMv7kebKpg6Z6IxLEm7HJu2hy3xXrhThe6GwyTK2uAMh/+m1Q004QjA
	 1g58dONx5oGKg==
Date: Wed, 12 Nov 2025 09:32:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
Message-ID: <20251112-logical-grebe-of-modernism-dcf83b@kuoka>
References: <20251111130624.3069704-1-royluo@google.com>
 <20251111130624.3069704-2-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251111130624.3069704-2-royluo@google.com>

On Tue, Nov 11, 2025 at 01:06:23PM +0000, Roy Luo wrote:
> Document the device tree bindings for the DWC3 USB controller found in
> Google Tensor SoCs, starting with the G5 generation.
> 
> The Tensor G5 silicon represents a complete architectural departure from
> previous generations (like gs101), including entirely new clock/reset
> schemes, top-level wrapper and register interface. Consequently,
> existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitating
> this new device tree binding.
> 
> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
> Dual-Role Device single port with hibernation support.
> 
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  .../bindings/usb/google,gs5-dwc3.yaml         | 140 ++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> new file mode 100644
> index 000000000000..bfaf6cbdfec3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2025, Google LLC
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/google,gs5-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> +
> +maintainers:
> +  - Roy Luo <royluo@google.com>
> +
> +description:
> +  Describes the DWC3 USB controller block implemented on Google Tensor SoCs,
> +  starting with the G5 generation. Based on Synopsys DWC3 IP, the controller
> +  features Dual-Role Device single port with hibernation add-on.
> +
> +properties:
> +  compatible:
> +    const: google,gs5-dwc3

Doug just said SoC is lga, not gs5, so you need both to align on that.
Actually not only you both, but whoever else is upstreaming from Google.

It is not the community who should synchronize and organize way how
Google works on their own stuff. Google should organize how Google works
on your Google's stuff.

Best regards,
Krzysztof

