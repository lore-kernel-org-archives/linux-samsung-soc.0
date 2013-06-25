From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/4] usb: gadget: s3c-hsotg: Allow driver instantiation using device tree
Date: Tue, 25 Jun 2013 23:05:06 +0200
Message-ID: <1543279.BFn8pxUra6@flatron>
References: <1372174706-5459-1-git-send-email-t.figa@samsung.com> <5782443.xpFZv1Saq0@flatron> <20130625210044.GD9748@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f48.google.com ([209.85.214.48]:54798 "EHLO
	mail-bk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752453Ab3FYVFH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Jun 2013 17:05:07 -0400
In-Reply-To: <20130625210044.GD9748@arwen.pp.htv.fi>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, m.szyprowski@samsung.com, l.majewski@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, Paul Zimmerman <paul.zimmerman@synopsys.com>

On Wednesday 26 of June 2013 00:00:44 Felipe Balbi wrote:
> On Tue, Jun 25, 2013 at 10:57:06PM +0200, Tomasz Figa wrote:
> > On Tuesday 25 of June 2013 23:46:32 Felipe Balbi wrote:
> > > On Tue, Jun 25, 2013 at 05:38:23PM +0200, Tomasz Figa wrote:
> > > > This patch adds OF match table to the driver to allow
> > > > instantiating it
> > > > using device tree.
> > > > 
> > > > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > > > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > > 
> > > when will this driver get merged into dwc2 ?
> > 
> > What's dwc2? I can only see dwc3 in mainline kernel tree and it
> > doesn't
> > seem to be compatible with s3c-hsotg.
> 
> drivers/staging/dwc2/

Oh right, staging, I forgot to check there.

> That's the same IP you're using Paul Zimmerman (now in Cc) is working
> towards getting that out of staging. It currently has only host mode, so
> plugging your code in there shouldn't be too difficult.
> 
> OTOH, it might be better to make your code a device-only version of dwc2
> (drivers/usb/dwc2) and have Paul move his host side to that instead.

Hmm, I believe Lukasz Majewski and Marek Szyprowski (both on CC) should be 
able to say something more on this topic as I'm not really into USB 
drivers and just doing Device Tree enablement here.

Best regards,
Tomasz
