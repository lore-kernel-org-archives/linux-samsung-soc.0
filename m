From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH V4 0/2] Add DT support for i2s
Date: Fri, 07 Dec 2012 13:51:31 +0000
Message-ID: <20121207135131.A53643E0B87@localhost>
References: <1354099669-1735-1-git-send-email-padma.v@samsung.com> <CAAgF-Bc4t6WL4vswP6CFeSQrPZBmOuYfVt6_JoB1Za9TBX7mvA@mail.gmail.com> <20121206041141.GA10867@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:61842 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030505Ab2LGNwH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Dec 2012 08:52:07 -0500
Received: by mail-wg0-f42.google.com with SMTP id dr1so846561wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Dec 2012 05:52:05 -0800 (PST)
In-Reply-To: <20121206041141.GA10867@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Padma Venkat <padma.kvr@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Padmavathi Venna <padma.v@samsung.com>, sbkim73@samsung.com, devicetree-discuss@lists.ozlabs.org, jassisinghbrar@gmail.com, kgene.kim@samsung.com, ben-linux@fluff.org, lrg@ti.com, linux-arm-kernel@lists.infradead.org

On Thu, 6 Dec 2012 13:11:42 +0900, Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:
> On Thu, Dec 06, 2012 at 09:31:40AM +0530, Padma Venkat wrote:
> > On Wed, Nov 28, 2012 at 4:17 PM, Padmavathi Venna <padma.v@samsung.com> wrote:
> 
> > > Padmavathi Venna (2):
> > >   ASoC: Samsung: Get I2S src_clk from clock alias id.
> > >   ASoC: SAMSUNG: Add DT support for i2s
> 
> > Any comments on DT support for i2s patch?  If not when this patch can be pulled?
> 
> Don't send contentless pings.
> 
> I still don't really like what's going on with aliases here, I need to
> understand why things are structured the way they are to say something
> about that.

Right. On a brief look, it appears that the binding is using aliases as
a way to encode implementation specific details of the driver.

g.
