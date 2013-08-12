From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V4 1/4] ARM: dts: exynos5420: add i2s controllers
Date: Mon, 12 Aug 2013 13:41:23 +0200
Message-ID: <3916118.YsNJ4NTaJS@amdc1227>
References: <1376302070-1877-1-git-send-email-padma.v@samsung.com>
 <21180092.af8YMiXtjc@amdc1227> <20130812113447.GW6427@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:52926 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756191Ab3HLLla (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 07:41:30 -0400
In-reply-to: <20130812113447.GW6427@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org

On Monday 12 of August 2013 12:34:48 Mark Brown wrote:
> On Mon, Aug 12, 2013 at 01:14:20PM +0200, Tomasz Figa wrote:
> > On Monday 12 of August 2013 15:37:47 Padmavathi Venna wrote:
> > > +	i2s_0: i2s@03830000 {
> > > +		status = "disabled";
> > 
> > If a node does not require any board-specific properties for the device
> > to operate properly, there is no point in disabling it, just to add a
> > single status property at board level.
> 
> I'd expect that to interact badly with the pinmuxing - unless the device
> is disabled it'll try to grab its pins on probe which is not going to be
> a good idea unless it is actually wired up for use in the system.  Or is
> there some other mechanism for handling that?

Ah, good point. Now I wonder whether pinctrl nodes shouldn't be considered 
board-specific and specified in board-level dts instead?

Best regards,
Tomasz
