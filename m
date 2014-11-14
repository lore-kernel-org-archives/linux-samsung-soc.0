From: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Subject: RE: [PATCH v4] usb: dwc2/gadget: rework disconnect event handling
Date: Fri, 14 Nov 2014 22:09:27 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E0304844EBDAB@US01WEMBX2.internal.synopsys.com>
References: <5465EEF3.7060902@samsung.com>
 <1415967607-6174-1-git-send-email-m.szyprowski@samsung.com>
 <A2CA0424C0A6F04399FB9E1CD98E0304844EBBFF@US01WEMBX2.internal.synopsys.com>
 <20141114190457.GA16388@saruman>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay4.synopsys.com ([198.182.44.111]:51643 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754335AbaKNWJ3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Nov 2014 17:09:29 -0500
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "balbi@ti.com" <balbi@ti.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

> From: Paul Zimmerman
> Sent: Friday, November 14, 2014 1:21 PM
> 
> > From: linux-usb-owner@vger.kernel.org [mailto:linux-usb-owner@vger.kernel.org] On Behalf Of Felipe Balbi
> > Sent: Friday, November 14, 2014 11:05 AM
> >
> > On Fri, Nov 14, 2014 at 07:01:37PM +0000, Paul Zimmerman wrote:
> > > > -----Original Message-----
> > > > From: Marek Szyprowski [mailto:m.szyprowski@samsung.com]
> > > > Sent: Friday, November 14, 2014 4:20 AM
> > > >
> > > > This patch adds a call to s3c_hsotg_disconnect() from 'end session'
> > > > interrupt (GOTGINT_SES_END_DET) to correctly notify gadget subsystem
> > > > about unplugged usb cable. DISCONNINT interrupt cannot be used for this
> > > > purpose, because it is asserted only in host mode.
> > > >
> > > > To avoid reporting disconnect event more than once, a disconnect call has
> > > > been moved from USB_REQ_SET_ADDRESS handling function to SESSREQINT
> > > > interrupt. This way driver ensures that disconnect event is reported
> > > > either when usb cable is unplugged or every time the host starts a new
> > > > session.
> > > >
> > > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > ---
> > > >  drivers/usb/dwc2/core.h   |  1 +
> > > >  drivers/usb/dwc2/gadget.c | 13 +++++++++++--
> > > >  2 files changed, 12 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> > > > index 55c90c53f2d6..78b9090ebf71 100644
> > > > --- a/drivers/usb/dwc2/core.h
> > > > +++ b/drivers/usb/dwc2/core.h
> > > > @@ -210,6 +210,7 @@ struct s3c_hsotg {
> > > >  	u8                      ctrl_buff[8];
> > > >
> > > >  	struct usb_gadget       gadget;
> > > > +	unsigned int		session:1;
> > > >  	unsigned int            setup;
> > > >  	unsigned long           last_rst;
> > > >  	struct s3c_hsotg_ep     *eps;
> > > > diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> > > > index fcd2bb55ccca..c7f68dc1cf6b 100644
> > > > --- a/drivers/usb/dwc2/gadget.c
> > > > +++ b/drivers/usb/dwc2/gadget.c
> > > > @@ -1029,7 +1029,6 @@ static int s3c_hsotg_process_req_feature(struct s3c_hsotg *hsotg,
> > > >  }
> > > >
> > > >  static void s3c_hsotg_enqueue_setup(struct s3c_hsotg *hsotg);
> > > > -static void s3c_hsotg_disconnect(struct s3c_hsotg *hsotg);
> > > >
> > > >  /**
> > > >   * s3c_hsotg_stall_ep0 - stall ep0
> > > > @@ -1107,7 +1106,6 @@ static void s3c_hsotg_process_control(struct s3c_hsotg *hsotg,
> > > >  	if ((ctrl->bRequestType & USB_TYPE_MASK) == USB_TYPE_STANDARD) {
> > > >  		switch (ctrl->bRequest) {
> > > >  		case USB_REQ_SET_ADDRESS:
> > > > -			s3c_hsotg_disconnect(hsotg);
> > > >  			dcfg = readl(hsotg->regs + DCFG);
> > > >  			dcfg &= ~DCFG_DEVADDR_MASK;
> > > >  			dcfg |= (le16_to_cpu(ctrl->wValue) <<
> > > > @@ -2031,6 +2029,10 @@ static void s3c_hsotg_disconnect(struct s3c_hsotg *hsotg)
> > > >  {
> > > >  	unsigned ep;
> > > >
> > > > +	if (!hsotg->session)
> > > > +		return;
> > > > +
> > > > +	hsotg->session = 0;
> > > >  	for (ep = 0; ep < hsotg->num_of_eps; ep++)
> > > >  		kill_all_requests(hsotg, &hsotg->eps[ep], -ESHUTDOWN, true);
> > > >
> > > > @@ -2290,11 +2292,18 @@ irq_retry:
> > > >  		dev_info(hsotg->dev, "OTGInt: %08x\n", otgint);
> > > >
> > > >  		writel(otgint, hsotg->regs + GOTGINT);
> > > > +
> > > > +		if (otgint & GOTGINT_SES_END_DET) {
> > > > +			s3c_hsotg_disconnect(hsotg);
> > >
> > > I think you should clear hsotg->session here, shouldn't you?
> > > Otherwise I think s3c_hsotg_disconnect() will be called twice, once
> > > here and once when the next GINTSTS_SESSREQINT comes.
> >
> > the best way to avoid that would be fiddle with hsotg->session inside
> > s3c_hsotg_disconnect() only.
> 
> Whoops, I just noticed that hsotg->session *is* cleared inside of
> s3c_hsotg_disconnect(). So I think the patch is good as-is.
> 
> Acked-by: Paul Zimmerman <paulz@synopsys.com>

I'm having second thoughts about this. Currently, the
GINTSTS_SESSREQINT interrupt in the gadget does nothing except print
a debug message. So I'm not sure that all versions of the controller
actually assert this interrupt when a connection is made. If they
don't, then this patch would break the disconnect handling, since
hsotg->session would never get set.

In particular, I'm thinking that a core which is synthesized without
SRP support may not implement the GINTSTS_SESSREQINT interrupt. The
databook seems to imply that:

"SessReqInt: In Device mode, this interrupt is asserted when the
utmisrp_bvalid signal goes high."

And in the section which describes the utmisrp_bvalid signal, there is
a note that says:

"This interface is present only when parameter OTG_MODE specifies an
SRP-capable configuration."

So Marek, can you try moving the line which sets hsotg->session = 1
into s3c_hsotg_irq_enumdone() instead? Then we will be sure it gets set
to one after a connect. Probably it should be renamed from 'session'
to 'connect' in that case.

-- 
Paul
