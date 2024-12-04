Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D70A199B8;
	Wed,  4 Dec 2024 15:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324881; cv=none; b=AANl3gvE9BExveGjar/A/h658Bifz1VCY7qhnRTQEv/jKNUL50uMP19DvBM8stXHPGOsIYyke7N65fJdB9eLWAQQQskghyujYzwPiNffGTywiKm7BUq0E1bTzWXhHCml5EzFykEjXIxBQsbeQgXtoye3G9m67UDTEx4xYfTvvtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324881; c=relaxed/simple;
	bh=0kt2C/BPb11YSq+EhEeua8KQDxctV1/JE1X1KHLEYDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IM5oMxd6uHJfW36iBARwenwd9wFT9IzaisZ1FwbG3TThztDF7yY+fW19ZeVw18qIj5BDWNipWmqYo5H1yFuWToKGM748yl5cGuiDEmZAV4pdJQCYE82ufuRTpO10xr/ZG7WbvKn07tTDy61+ZrUFy9URdocSbXXd4zsGwmrMhiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkEu+Xic; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkEu+Xic"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68516C4CECD;
	Wed,  4 Dec 2024 15:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733324880;
	bh=0kt2C/BPb11YSq+EhEeua8KQDxctV1/JE1X1KHLEYDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkEu+XicCILr1p4dve1n8IUDmckfslbj50hNbRBSVCy1ZeA+s2/RPB++Pt0GQpSkd
	 5Im3F4iNCvBlJTLMierdCw9aFJmC+ArBXI8mNoxMSu5Iggv3PdgcRQYBWnCD9QZaHn
	 OmAWy0UwfWDeQCu0BvNrKZVMeb5E/wAdLEozIavQJlCifk/Q3V0MptnU9vaQncyFP8
	 yRfPfvVuCCoDBhJ2y8fxCarXhjTwjqeOT/69+2F23AnSg3wI17wmuIGWWRThSnFe5b
	 WeBMmSu7pIT+3CH23D5hSayds/q3SWmzX5C5efGPt9saYir1pe6I9e1fh6rvXNsaCu
	 cNFUFCO8ZW0rw==
Date: Wed, 4 Dec 2024 09:07:58 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: samsung,usb3-drd-phy: gs101:
 require Type-C properties
Message-ID: <20241204150758.GA220712-robh@kernel.org>
References: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
 <20241203-gs101-phy-lanes-orientation-phy-v2-2-40dcf1b7670d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203-gs101-phy-lanes-orientation-phy-v2-2-40dcf1b7670d@linaro.org>

On Tue, Dec 03, 2024 at 12:13:50PM +0000, André Draszik wrote:
> orientation-switch is the standard declaration to inform the Type-C mux
> layer that a remote-endpoint is capable of processing orientation
> change messages.
> 
> The USB PHY on gs101 needs to be configured based on the orientation of
> the connector. For that the DTS needs a link between the phy's port and
> a TCPCi, and we'll need to inform the phy driver that it should handle
> the orientation (register a handler).
> 
> Update the schema to enforce that by requiring the orientation-switch
> and port properties on gs101 (only). We disallow orientation-switch on
> all other supported platforms, since other versions of this phy (or its
> system integration) don't currently support or even need it.
> 
> Even though this new required gs101 property is an ABI break, the
> intention for the driver is to behave as before if it's missing
> (meaning for gs101 it will work in SS mode in one orientation only).
> Other platforms are not affected.
> 
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> ---
> v2:
> * squash original patches #2 and #3
> * actually disallow orientation-switch on !gs101 (not just optional) (Conor)
> * update commit message to clarify that the intention for the driver is
>   to work with old and new DTS (Conor)
> * collect tags
> ---
>  Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> index 1f8b35917b11..c1d16254aeec 100644
> --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> @@ -51,6 +51,9 @@ properties:
>    "#phy-cells":
>      const: 1
>  
> +  orientation-switch:
> +    $ref: /schemas/usb/usb-switch.yaml#/properties/orientation-switch

Generally, we don't reference things at a property level, but node 
level. You can just do:

  - if:
      properties:
        compatible:
          contains:
            const: google,gs101-usb31drd-phy
    then:
      $ref: /schemas/usb/usb-switch.yaml#


And switch additionalProperties with unevaluatedProperties.

Rob
