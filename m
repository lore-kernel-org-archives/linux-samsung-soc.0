Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57BD201278;
	Mon, 16 Jun 2025 08:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061353; cv=none; b=Xh1BySY4G7hZ6Uu7nzGguTpQO0qRsAohFY0JLDwhxIRnq+zjA7kSaBa4Ig18+B/ts8cdPbK13t0HYBoACf/kJ2BQdOP7i9IAy3jZmbSPp5VgY7XEjp0Ajm5rf+rc/hYS/vqqFSpfJZfQ2sPtNO61xA0HE9bw8CpwlbInrIdN8GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061353; c=relaxed/simple;
	bh=ZCTP2/KUxDBBTDWSD2jPN9l79DgfK77S6TqfxgzSUaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhlZXtlsB6WWBKjKfvjWoBZPYDqs1H4d7hl0wsFbWlsobh+Ie+l6caIJICLYe1RRh0rZ3+C6jGWB6wh+yDLuTmHk8HGrRkohPxK4ItdEIs40uch3br41Y2LysvJDEb/KPTsvJWPJeAfG9cYllE7L8u2MO4NNnUXQko9aZg6fc6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BI4kWD82; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BI4kWD82"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7441C4CEF4;
	Mon, 16 Jun 2025 08:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750061353;
	bh=ZCTP2/KUxDBBTDWSD2jPN9l79DgfK77S6TqfxgzSUaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BI4kWD82040tlVQMNLetNaZSuG6+NbqVcIJZURB4XdOSPd4/idPYxU/bPnI5lDnad
	 wWFmyksnH4CZqJ6jCMtiTKq2ZmgYcIRR2HqwyaaV9Nzpt5asFh2SjF6X1r8QE+23E4
	 g5mcChEHbxO8fWlM/wFhXZ5ZhpW/6l7HmFYW0gHni2DUEz1a69Fdx2JnTGHIPBAEXR
	 EDQlNoR0InTOOywUfwHPXM2gx25GZQeMiuIgLBiyZ/Hy2CnHlifaAQewrg8ndVipC6
	 QwRNY8KWIiSXSHOO83ui12Ym99+A9cBCPnquNUcNRZci3yAsYGWwFii8akvIDMGgco
	 L3GaMAQP/1kwQ==
Date: Mon, 16 Jun 2025 10:09:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pritam Manohar Sutar <pritam.sutar@samsung.com>, vkoul@kernel.org, 
	kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, andre.draszik@linaro.org, peter.griffin@linaro.org, 
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com, 
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com, 
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v3 9/9] arm64: dts: exynos: ExynosAutov920: add USB and
 USB SS combo phy nodes
Message-ID: <20250616-perfect-fervent-robin-a1bc3c@kuoka>
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
 <CGME20250613055106epcas5p46a2e5e2d6f0e8811644643f6282fd9ca@epcas5p4.samsung.com>
 <20250613055613.866909-10-pritam.sutar@samsung.com>
 <9455a4e1-6352-4832-ac9f-2816f889c3a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9455a4e1-6352-4832-ac9f-2816f889c3a4@linaro.org>

On Fri, Jun 13, 2025 at 11:12:26AM GMT, neil.armstrong@linaro.org wrote:
> On 13/06/2025 07:56, Pritam Manohar Sutar wrote:
> >   		usbdrd31_hsphy: phy@16490000 {
> >   			compatible = "samsung,exynosautov920-usbdrd-hsphy";
> >   			reg = <0x16490000 0x0200>;
> > @@ -1109,8 +1120,8 @@ usbdrd31_dwc3: usb@0 {
> >   					 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
> >   				clock-names = "ref", "susp_clk";
> >   				interrupts = <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>;
> > -				phys = <&usbdrd31_hsphy 0>;
> > -				phy-names = "usb2-phy";
> > +				phys = <&usbdrd31_hsphy 0>, <&usbdrd31_ssphy 0>;
> > +				phy-names = "usb2-phy", "usb3-phy";
> >   				snps,has-lpm-erratum;
> >   				snps,dis_u2_susphy_quirk;
> >   				snps,dis_u3_susphy_quirk;
> 
> I think at least patch 6 & 9 should be squashed.

Yes. Changing lines which were just added is a strong hint, that
patchset is incorrectly organized.

> 
> Neil
