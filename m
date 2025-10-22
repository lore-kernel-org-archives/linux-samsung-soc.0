Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDECC33F3;
	Wed, 22 Oct 2025 06:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761114652; cv=none; b=NB6OhOcH/hg1rCB0NjfmlN/EQ/DvCVJCbr7sG7c+pwkxjI6PHrG0D/VhSto12J73q+RMVb5PZry16RvEVE/uPidcT92ZPtEbK6IENxxSv0xR/ybGTDiHJ/V5vJGf72DXfXlId2oh/6QnLrFlkU9Uf+n0Cghnd5Db+FYwaLKDOUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761114652; c=relaxed/simple;
	bh=KEgp4fU5XhMtbOPuc2WyIySNoZ5jLcw+J/DU2i8WbJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfRoP0Tmc5JoKvNpipUWuRxxV9dm7tOVQgwYyiX9aYtqbE8FDNufunbdgHutbzRk1706qjeb5q9NWINTgir+zpwIafqy8zffVO1CHBp9BvHjMOhCYRGtq0jhj/+wSkncEE3+jEjWaJDiiOlnI3DciUEpS+Nb60CBboOpUTBW9+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMAHiKg7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMAHiKg7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC2DC4CEE7;
	Wed, 22 Oct 2025 06:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761114650;
	bh=KEgp4fU5XhMtbOPuc2WyIySNoZ5jLcw+J/DU2i8WbJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMAHiKg78Y1C7Fkm7JWfmXWxkP7AX1nnigwoF0sQjnZWuHnFs853YwIBqLKNCAtbM
	 RbHksicBdoVVUgkjng/Nti9dFYEvhuvCVtRXpff61yi92WWQJc11wNflrRLhvuJ7Lx
	 5CsAcsW9Bi0E+2UvfmJoXo+gKmZKRY13+YZTS6Seacn0kSb+XcGKEusPdg0SmSvXWN
	 v9HSP52xcR8KN00zUaxAm6rNNYmvrSISAY+Fcxd+7CS0UuNAoPv4jWoxV6f6lvfJsS
	 189C79XSH6oHA8Tv7Hc+BaBObhNbMtm11VkmCVsQP3Q0zhU59WDmohC3mnUogthTO9
	 GnZSDbJA9Sv2g==
Date: Wed, 22 Oct 2025 08:30:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
Message-ID: <20251022-delectable-gabby-hedgehog-35f7d6@kuoka>
References: <20251017233459.2409975-1-royluo@google.com>
 <20251017233459.2409975-2-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251017233459.2409975-2-royluo@google.com>

On Fri, Oct 17, 2025 at 11:34:58PM +0000, Roy Luo wrote:
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
>  .../bindings/usb/google,gs5-dwc3.yaml         | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

