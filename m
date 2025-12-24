Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA08F10785;
	Wed, 24 Dec 2025 05:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766554250; cv=none; b=Te0VYBnSmwHltiASytz33DIk3It8qAqr3VRJ7EUx7oOGtxPaMXV1dVervS8eCK5Ny1mi7f4Q6mG3AjypbSa7M1WU5cneueGirj34Rvd6BUpmzBNKdaW4qm9qVHaslSfgajF/MYE3taa62Rf2ac5uP4UdgGrEqH9dTnwuJgF+k/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766554250; c=relaxed/simple;
	bh=1X9APecdnLI/dPB5jwwC+T1kxLB0WLC073vyb8hkJgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bueiHLJgHXlXonBuF2r31ogPHm2+bETQvCbwGFcCDSyp9bD7H0p4L537RACAKL8dV8DFoBVNapkZDmV3PcJbT0tMtZfFxgHKaq2OGgIS28w84z0fYerhgKAcAFuk/okvbj5hev1VNfi5bGLpbT4UG+PHvMAz/nj9zXK/DCn+TpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SISDydji; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SISDydji"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1F1C4CEFB;
	Wed, 24 Dec 2025 05:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766554250;
	bh=1X9APecdnLI/dPB5jwwC+T1kxLB0WLC073vyb8hkJgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SISDydjirDPYMUr4FcfxX40KBetH36Bjt+7pfTrpYmEmu1dd3hfUs3tTGX/NJ9qQF
	 X9Fm57cx+ptcwhFuNNkN5uGbHO5TM696KG63jvQbPbeLXIMWoSRPgCpeNPlB7uNiNl
	 RVsK/7XARw8cBznR0jdphIRjJBW9PrBsb5hKiBLaoONmjOQ76AUknCN3p2Gcp6OXPA
	 uBm0TPM9fBzuM+86esajXU34fbEWeVAd2/uXW+oOWiv5GQ7n5T+CC+/5F+CyCQ9p7O
	 x0kP0727nRjzkrInVLGaSyPnJR/4lVYXQdVCWjot+cn8BAk/DvXPZM2vtGmk89FaB8
	 pSw44WM1/otYg==
Date: Wed, 24 Dec 2025 11:00:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>
Subject: Re: [PATCH v9 2/2] phy: Add Google Tensor SoC USB PHY driver
Message-ID: <aUt6hobN9DPUGbpz@vaman>
References: <20251222-phyb4-v9-0-82c0b671b070@google.com>
 <20251222-phyb4-v9-2-82c0b671b070@google.com>
 <aUqhbVFHczpL9qnL@vaman>
 <CA+zupgxP+_2iRYABhPM1OOJtRdkrcOvrsKH=Sxk45XwsiamzTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+zupgxP+_2iRYABhPM1OOJtRdkrcOvrsKH=Sxk45XwsiamzTw@mail.gmail.com>

On 23-12-25, 09:53, Roy Luo wrote:
> On Tue, Dec 23, 2025 at 6:04 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 22-12-25, 21:31, Roy Luo wrote:

> > > +struct google_usb_phy {
> > > +     struct device *dev;
> > > +     struct regmap *usb_cfg_regmap;
> > > +     unsigned int usb2_cfg_offset;
> > > +     void __iomem *usbdp_top_base;
> > > +     struct google_usb_phy_instance insts[GOOGLE_USB_PHY_NUM];
> >
> > so you have an array for one phy?
> 
> While the current patch only supports usb2, I used an array
> to simplify future support for usb3 and DP. I understand this
> might seem like over-engineering for now, and we could
> certainly wait to implement the array until the second phy
> support is added. I’m happy to move away from array if
> you’d prefer a simpler approach for this iteration.

Rather than do array, allocate mem as probe based on how many phys will
be there and use that. That would be a better approach than static
allocation here

> > > +static int google_usb2_phy_exit(struct phy *_phy)
> > > +{
> > > +     struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
> > > +     struct google_usb_phy *gphy = to_google_usb_phy(inst);
> > > +     u32 reg;
> > > +
> > > +     dev_dbg(gphy->dev, "exiting usb2 phy\n");
> > > +
> > > +     guard(mutex)(&gphy->phy_mutex);
> > > +
> > > +     regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
> > > +     reg &= ~USBCS_USB2PHY_CFG21_PHY_ENABLE;
> > > +     regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
> > > +
> > > +     reset_control_bulk_assert(inst->num_rsts, inst->rsts);
> > > +     clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static const struct phy_ops google_usb2_phy_ops = {
> > > +     .init           = google_usb2_phy_init,
> > > +     .exit           = google_usb2_phy_exit,
> > > +};
> >
> > Only two ops? I would expect more... No power_on/off or set_mode?
> >
> > --
> > ~Vinod
> 
> No, configuring usb2 phy is pretty straightforward. The hardware
> does not distinguish between "initialized" and "powered on" states,
> it also does not distinguish phy mode.

ok

-- 
~Vinod
