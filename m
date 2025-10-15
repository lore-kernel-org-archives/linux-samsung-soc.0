Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB7B2B9A4;
	Wed, 15 Oct 2025 13:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760533541; cv=none; b=plR76vzwCXh1DuDLK070Z0ztLR5cbAo3l/4xxX/rhzI2dpQHQSeJ0QyyTrPfPcuMpAtadBRMbtA4w/TOtiia8Hm9w3xoNqzWkn/4uKalBZx4WIASfXuSMU2KizOB4L5ErB4GzJB08VEr0drBF4zqQy0kfP1CfF4cWKRrTvAQFSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760533541; c=relaxed/simple;
	bh=2r5714A42xcyIZFh8H5uVbCGHRJdXN2qlO5VN/2T0Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ua2LyN+4Qo30vtOWe1Re0SMI6al299cblna5TGumV5eCajLX9cCX6H5mlZz6xlfb/LN/xByuJlU39cyUCb30dyFm9CBR4sOughmT0eN2gAHv4+Y+irRSIlLKbTqMvH0ETDTK5CH1INeX16Me2cE3c9z3dVLSqoET5fiMgz8zeKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVh+57mK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVh+57mK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A275C4CEF8;
	Wed, 15 Oct 2025 13:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760533540;
	bh=2r5714A42xcyIZFh8H5uVbCGHRJdXN2qlO5VN/2T0Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bVh+57mKWZVZm31clx69McTVpcKPtVKXMVsVHMnFx1t54sVuWgpEGP38jnNDor41z
	 SQjR5suW6Rady1D6k/JVqoY2mYJR5TKba++BzWoKWtgms8nEKR9/Uso/JybM5VM+wY
	 P+yBwwelUiv7OBSqvJ3czmFScuZTt+s7TlVywdM2OHz5kZl2NyRhgJmIs3oL5scNRE
	 QQYTD2wgDx26wtabWpXNT6Gu9IBvwR2NB9X7D7XQ1B8FWNGnrQ81P0Hy0CaowrEKl6
	 6vngZORTXSdIEAvD3bi4EV3iZfCDqRRDBGzbTABJ3fmahCFbrBcCzjOK4KjjrzFiEb
	 lICeM2lYuHQvg==
Date: Wed, 15 Oct 2025 08:05:38 -0500
From: Rob Herring <robh@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: phy: google: Add Google Tensor G5
 USB PHY
Message-ID: <20251015130538.GA3214399-robh@kernel.org>
References: <20251010201607.1190967-1-royluo@google.com>
 <20251010201607.1190967-4-royluo@google.com>
 <75756635-b374-4441-8526-175210e01163@kernel.org>
 <CA+zupgwHFpP5GEwGxOksmLJBU7+Kr_o0p50Pad1NmwNB0AxcGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+zupgwHFpP5GEwGxOksmLJBU7+Kr_o0p50Pad1NmwNB0AxcGA@mail.gmail.com>

On Mon, Oct 13, 2025 at 06:46:39PM -0700, Roy Luo wrote:
> On Fri, Oct 10, 2025 at 5:11 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 10/10/2025 22:16, Roy Luo wrote:
> > > +  reg:
> > > +    items:
> > > +      - description: USB2 PHY configuration registers.
> > > +      - description: DisplayPort top-level registers.
> > > +      - description: USB top-level configuration registers.
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: u2phy_cfg
> > > +      - const: dp_top
> > > +      - const: usb_top_cfg
> > > +
> > > +  "#phy-cells":
> > > +    const: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  orientation-switch:
> > > +    type: boolean
> > > +    description:
> > > +      Indicates the PHY as a handler of USB Type-C orientation changes
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - reg-names
> > > +  - "#phy-cells"
> > > +  - clocks
> > > +  - resets
> > > +  - power-domains
> > > +  - orientation-switch
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    soc {
> > > +        #address-cells = <2>;
> > > +        #size-cells = <2>;
> > > +
> > > +        usb_phy: usb_phy@c410000 {
> > > +            compatible = "google,gs5-usb-phy";
> > > +            reg = <0 0x0c450014 0 0xc>,
> > > +                  <0 0x0c637000 0 0xa0>,
> >
> > You probably miss DP support and this does not belong here.
> 
> This register space isn't solely for DP operation, a significant portion
> manages the custom combo PHY. Consequently, this space is essential
> even for USB-only operation. We can expect more registers in the space
> to be utilized when DP support is added.
> 
> While I acknowledge the current name is confusing, it directly reflects
> the hardware documentation. We can either adhere to the hardware
> documentation's naming or propose a more descriptive alternative.
> What's your preference?
> 
> >
> > > +                  <0 0x0c45002c 0 0x4>;
> >
> > That's not a separate address space. I really, really doubt that
> > hardware engineers came with address spaces of one word long.
> 
> I initially created this space to access the usb2only mode register,
> which must be programmed when the controller operates in high-speed
> only mode without the USB3 PHY initialized. Upon review, I now
> believe the controller driver is the better location for this configuration,
> as the register logically belongs there and the controller can tell
> whether usb3 phy is going to be initialized.
> 
> That is, I'm removing this register space in the next patch.

You are missing the point. What exists from 0x0c450020-2c and 
0x0c450000-0x14 for that matter? Hardware blocks don't just start on 
unaligned boundaries like 0x14 or 0x2c. DT describes the h/w blocks, not 
just nodes of what a driver needs. So if the 0x2c register needs to be 
accessed by the USB driver, that's fine, but the register doesn't go in 
the USB controller node 'reg'. A property with a phandle to the node 
defining all the 0x0c450000 registers and an offset (if needed) is 
typically what we do there. Or you can just find that node by 
compatible.

Rob
