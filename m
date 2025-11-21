Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EBF219E8C;
	Fri, 21 Nov 2025 08:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763712977; cv=none; b=N5SB9M5y4eeN2OpUEkFR6R/N3AS5fKctXFjMDIiKLv4iMwTJXnZNbqK/giupGEF+88/G0my4JhNX2VblGp3SvphNngUeGjpduePYIIVloyV22HNlBLXm1MZPyMnH8BN+cK7GNFhq9jvDKp9oHmzPhNsKGDmO5Xl+SKyzi02Mq3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763712977; c=relaxed/simple;
	bh=++S1fgLBKiTEYDVr3ZDON6U+2JRDih2JeUGeY62KsMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/r8OMLOfQXwwVnuDFa/Hd+hkK3WFyzb86xXyT45qW0tCBzeLK1x2SXkynvv5+Aey2uKHyALeSwXktBILSm2XOUKq+CEOmhmbhNAF80P2/yQAGQ5RkJcrAiya49RNaJLbjv0k2DOfgdTaDx+41CypQ7HUfIKh0QjQeuCIDUWwBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elLChGXp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elLChGXp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD03FC4CEF1;
	Fri, 21 Nov 2025 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763712976;
	bh=++S1fgLBKiTEYDVr3ZDON6U+2JRDih2JeUGeY62KsMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=elLChGXpWDVPBrFpLE1IMMMZbQmItEXg8wIZsiVNThvnVWAwhSlHRhSHwHHmvW+81
	 TEez/dFfS9abZWaMRRW6OLxo1LoAl7jqzg4nsAiyLCa5rjzSPdAFeGZoFpxrh87qdw
	 OStHA8cVb6t2+jbLYta2FFOJKA7Qo5ROABcFQgYuSgt5Tf+CixYL9UuWwbVHR6LW5e
	 UEbkzhg5lEBl7zHCe/y1ynUtIDnhdhLPhV5XSBGEYhmwM/7TvWqfUa/BWsCWWGekAC
	 Ug0KjbHZszjSI/bX5BU748T4F4rAsF759f380d2A5vRc1igU195dCW2eQEHSYEaKNk
	 MW5knPl/batYw==
Date: Fri, 21 Nov 2025 09:16:13 +0100
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
Subject: Re: [PATCH v6 1/2] dt-bindings: phy: google: Add Google Tensor G5
 USB PHY
Message-ID: <20251121-attentive-demonic-jacamar-fc4afb@kuoka>
References: <20251120-phyb4-v6-0-b6694e1f0caf@google.com>
 <20251120-phyb4-v6-1-b6694e1f0caf@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251120-phyb4-v6-1-b6694e1f0caf@google.com>

On Thu, Nov 20, 2025 at 05:36:41PM +0000, Roy Luo wrote:

I read last discussion and patch is fine, except one issue in example I
never noticed before (see at the end), which I want to fix. Apologies
for not bringing it up anytime earlier, I missed it. While at it also
one more nit.

> +description: |

nit: drop |, do not need '|' unless you need to preserve formatting.

> +  Describes the USB PHY interfaces integrated with the DWC3 USB controller on
> +  Google Tensor SoCs, starting with the G5 generation (laguna).
> +  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.0 PHY IP
> +  and USB3.2/DisplayPort combo PHY IP.

...

> > +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        usb_phy: usb_phy@c410000 {

node name: usb-phy, because there are no underscors used anywhere in
upstream. While at it, you can drop the label as well, because it is not
uised, so just usb-phy@..... {

Please send new version with these two fixed and:

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

