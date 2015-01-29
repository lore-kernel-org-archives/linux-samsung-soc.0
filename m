From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ASoC: Samsung: add missing I2C/SPI dependencies
Date: Thu, 29 Jan 2015 15:23:33 +0100
Message-ID: <3641576.5ROmxlmVfH@wuerfel>
References: <1815674.ObkQWLfgIW@wuerfel> <20150129114134.GC21293@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:57332 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755719AbbA2OYT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jan 2015 09:24:19 -0500
In-Reply-To: <20150129114134.GC21293@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Thursday 29 January 2015 11:41:34 Mark Brown wrote:
> On Wed, Jan 28, 2015 at 10:28:55PM +0100, Arnd Bergmann wrote:
> > The SND_SOC_ARNDALE_RT5631_ALC5631 selects the rt5631 codec
> > that requires I2C to work, so we get a build error if I2C
> > is disabled:
> 
> You rather buried the lead about there being other drivers in this
> changelog, makes the code a bit surprising when you find it.
> 
> >  config SND_SOC_SPEYSIDE
> >  	tristate "Audio support for Wolfson Speyside"
> > -	depends on SND_SOC_SAMSUNG && MACH_WLF_CRAGG_6410
> > +	depends on SND_SOC_SAMSUNG && MACH_WLF_CRAGG_6410 && SPI_MASTER
> >  	select SND_SAMSUNG_I2S
> >  	select SND_SOC_WM8996
> >  	select SND_SOC_WM9081
> 
> Why only add a dependency on SPI here?

I don't know, definitely my mistake. I had squashed three older patches
together here, which resulted in the slightly strange changelog (I
picked the one that explained it best and then tried to modify it
to cover all changes) as well as the missing I2C dependency.

I'll re-check all other drivers in this directory too and then send
a new patch.

	Arnd
