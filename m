From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V4 0/2] Add DT support for i2s
Date: Thu, 6 Dec 2012 13:11:42 +0900
Message-ID: <20121206041141.GA10867@opensource.wolfsonmicro.com>
References: <1354099669-1735-1-git-send-email-padma.v@samsung.com>
 <CAAgF-Bc4t6WL4vswP6CFeSQrPZBmOuYfVt6_JoB1Za9TBX7mvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:41648 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751909Ab2LFELv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Dec 2012 23:11:51 -0500
Content-Disposition: inline
In-Reply-To: <CAAgF-Bc4t6WL4vswP6CFeSQrPZBmOuYfVt6_JoB1Za9TBX7mvA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, lrg@ti.com, jassisinghbrar@gmail.com

On Thu, Dec 06, 2012 at 09:31:40AM +0530, Padma Venkat wrote:
> On Wed, Nov 28, 2012 at 4:17 PM, Padmavathi Venna <padma.v@samsung.com> wrote:

> > Padmavathi Venna (2):
> >   ASoC: Samsung: Get I2S src_clk from clock alias id.
> >   ASoC: SAMSUNG: Add DT support for i2s

> Any comments on DT support for i2s patch?  If not when this patch can be pulled?

Don't send contentless pings.

I still don't really like what's going on with aliases here, I need to
understand why things are structured the way they are to say something
about that.
