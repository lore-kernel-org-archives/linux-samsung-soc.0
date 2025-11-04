Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B81130506E;
	Tue,  4 Nov 2025 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762243892; cv=none; b=RxLokX0G6fSraOTi/VE1xgP3yaOhkUENTG84AMy/m1gky8EiFP0RDitxY4eQx/GOti054/eiSZ8V2B5EzTGpQs/qzHXu3bwLFobkSvwTe0izIy2CwFkWV9nzl12/k8ysMQDR/pfZu/FvPDxRv5JzbZB+66H/jB0N7IySKOv9ZoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762243892; c=relaxed/simple;
	bh=7RaiFs9v/UL4cLzP1EGbRyUA5ARrzGlW5oFQNrU+8sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOp8oju9UzE8TkozbXyhuRrzZjT8eBd8V9T+hZEJvD7WvelT0nJj3F7lTE5ymlH9iGQzXi3jisuPDE4BxqhQa2n+flt1uVKwlHWy+nWNISfTgYcXNHDKBuzuWTk0IRic8waUooOK7klaZNfrem6zRjqCpgOGzxB4H+7SL0HRWLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkUR6Kzh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkUR6Kzh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533A9C4CEF8;
	Tue,  4 Nov 2025 08:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762243891;
	bh=7RaiFs9v/UL4cLzP1EGbRyUA5ARrzGlW5oFQNrU+8sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SkUR6Kzh0jg86uh6A+ix+nKwo2M1QuE0rK1jCJe8c791dEjYlYv3u15FTVPMp+KyA
	 HbKc2L6m2Gv5eZBNnw610BhHBWelvWdB3GDuqYAvkHIuiPg00y8p86TLNDn0VtCiOO
	 JUYzuwdWdV57XtU9PVrDaREvtJkYdJkNijX/u55jU2A+8+QI98uVKMV7NaLC8h5EZ8
	 U8SzKHBLfXwaBpjm2DKwQL9RyWC/eEhmuPBixz+36rqb3kJJy4/CSIl4MS3LlvMURk
	 OQASdotusXDlYR4MiIOV6TlQhU3gIAlbeuGdhblUrvrmuu6+ePCJxoz3emrjycgSrW
	 2M+Er/tzmDWxg==
Date: Tue, 4 Nov 2025 09:11:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
Message-ID: <20251104-enthusiastic-cream-gibbon-0e7b88@kuoka>
References: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
 <20251102-automatic-clocks-v3-1-ff10eafe61c8@linaro.org>
 <20251103-smoky-rustling-bloodhound-7590ce@kuoka>
 <CADrjBPpjX_qSehbNkaAG03f=whs09qFzzgNiY3sztk7v0QeCFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADrjBPpjX_qSehbNkaAG03f=whs09qFzzgNiY3sztk7v0QeCFw@mail.gmail.com>

On Mon, Nov 03, 2025 at 01:49:53PM +0000, Peter Griffin wrote:
> Hi Krzysztof,
> 
> Thanks for the review feedback!
> 
> On Mon, 3 Nov 2025 at 09:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Sun, Nov 02, 2025 at 08:27:14PM +0000, Peter Griffin wrote:
> > > Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> > > that contains the BUSCOMPONENT_DRCG_EN and MEMCLK registers.
> > >
> > > If present these registers need to be initialised
> >
> >
> > ... for what exactly? What would happen if this was not initialized?
> 
> The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
> bus components. So it is related to the automatic clock gating feature
> that is being enabled in this series. Things still work without
> initializing this register, but the bus components won't be
> automatically clock gated leading to increased dynamic power
> consumption. Similarly the memclk register enables/disables sram clock
> gate. Up until now we've not been initializing the registers as
> everything from Linux PoV has been in manual clock gating mode and
> until starting to implement this I wasn't aware there were some clock
> related registers in the corresponding sysreg. Additionally with
> Andre's work enabling power domains it has become clear we should be
> saving/restoring these two sysreg clock registers when the power
> domain is turned off and on.
> 
> > What is the exact justification for ABI break - wasn't this working
> > before? Or new feature will not work (thus no ABI break allowed)?
> 
> No, automatic clocks and dynamic root clock gating were not working
> prior to this series. Currently power domains and system wide
> suspend/resume aren't enabled upstream either. As we work on enabling
> these features we are finding some things that in an ideal world we
> would have known about earlier. Unfortunately it's not so obvious just
> from studying the downstream code either as they rely heavily on
> CAL-IF layer that has peeks/pokes all over the memory map especially
> for power/clock related functionality.
> 
> Whilst it is technically an ABI break, I've tried to implement it in a
> backwards compatible way (i.e. an old DT without the samsung,sysreg
> phandle specified) will just fallback to the current behavior of not
> initializing these registers. Things will still work to the extent
> they did prior to this series. With a new DT the registers will be
> initialized, and dynamic power consumption will be better.

So explain that this is needed for proper and complete power management
solution on this SoC, however that is not an ABI break because Linux
driver will be stil backwards compatible.


Best regards,
Krzysztof

