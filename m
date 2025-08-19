Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990B61494A8;
	Tue, 19 Aug 2025 06:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755586487; cv=none; b=uGpCH1nfpgrEYtaLkExzu6ZJ9fby1ISqSoW7JaK1F5tCYTPHSvFRNXgv0du+PDlVCSre93m6CCDsXK5xEUWgXxdW0MIC2JGx/OxzcFzHe3UQKCIQOX84SPAkDf2nq54gOK7I4dIcW4QiNUeGeEy5ct70PWHBn2aiyA3Fue/PrF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755586487; c=relaxed/simple;
	bh=wUbzQ4SJ7Ro2oQeXth1wUKV8brsS8CkANEiQqLaVHGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+cUL6Lw6hNhlAObAGpSvrUzXbAl7wMUAUNuRikkbACWBMTcAIvcCU58SxQvwko6xfyVJ/rFiyvJAfysm4MweXT6YMUf3m0l8Q2SIAgqwaG6YSPT6DQZ8w8A+WjgIL+hTNEnvKr6Jc5u8Q5HpfF+jknsZ47hTu6HyJUwh8I51No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDdXXaR3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDdXXaR3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A753C4CEF4;
	Tue, 19 Aug 2025 06:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755586487;
	bh=wUbzQ4SJ7Ro2oQeXth1wUKV8brsS8CkANEiQqLaVHGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UDdXXaR3QrP+hpd7RE96ZNu1OMV8d+eV9sgHgoJkHqmZLOUgk4qMDgEYASs9z0Hcm
	 LZrn0B0gjVnWSRUR8b99N3m0DMx2wf5Vwkgi9O3pdlSrvAfhiOpQiUYQ4JP4VIYC7b
	 lqKHzcj0A+Y/WYbDJIs0aZmF+ezc6QycG71AgszoRFBYqiO+vH9BrCwBnPaitlDQqS
	 Z+IYtwtvdA4PoFTeH2VZUNlYh3CmMSysWsRKZkOczR7LFJ3b6VA7OKdEOpaNk8hwbS
	 LNxMgq0j9XVNSdrPJWvyOgD0S1avyKTPbFa97vh/sOAcQFBGYunYlp4ia4z3NQFJLm
	 aTuGGql9kJ4Ig==
Date: Tue, 19 Aug 2025 12:24:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com,
	igor.belwon@mentallysanemainliners.org, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v5 6/6] phy: exynos5-usbdrd: support SS combo phy for
 ExynosAutov920
Message-ID: <aKQfsgRXL-Nj8CkC@vaman>
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
 <CGME20250805114323epcas5p39bf73c5e0a9382ff54b1832724804cc9@epcas5p3.samsung.com>
 <20250805115216.3798121-7-pritam.sutar@samsung.com>
 <aJtN7uVUV3YhfY5-@vaman>
 <038a01dc1013$900a2800$b01e7800$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <038a01dc1013$900a2800$b01e7800$@samsung.com>

On 18-08-25, 13:11, Pritam Manohar Sutar wrote:

> > > +	/* check cr_para_ack*/
> > > +	cnt = 0;
> > > +	do {
> > > +		/*
> > > +		 * data symbols are captured by phy on rising edge of the
> > > +		 * tx_clk when tx data enabled.
> > > +		 * completion of the write cycle is acknowledged by
> assertion
> > > +		 * of the cr_para_ack.
> > > +		 */
> > > +		exynosautov920_usb31drd_cr_clk(phy_drd, true);
> > > +		reg = readl(reg_phy +
> > EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> > > +		if ((reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK))
> > > +			break;
> > > +
> > > +		exynosautov920_usb31drd_cr_clk(phy_drd, false);
> > > +
> > > +		/*
> > > +		 * wait for minimum of 10 cr_para_clk cycles after phy reset
> > > +		 * is negated, before accessing control regs to allow for
> > > +		 * internal resets.
> > > +		 */
> > > +		cnt++;
> > > +	} while (cnt < 10);
> > > +
> > > +	if (cnt == 10)
> > > +		dev_dbg(dev, "CR write failed to 0x%04x\n", addr);
> > 
> > Not error?
> 
> This is only for debugging purpose. It is not considered as error. 

Write failed is not an error? If this code is only for debug, pls drop
it. 

-- 
~Vinod
