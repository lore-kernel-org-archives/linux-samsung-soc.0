From: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Subject: RE: [PATCH v2 03/10] usb: dwc2/gadget: fix gadget unregistration in
 udc_stop() function
Date: Thu, 23 Oct 2014 18:18:51 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E0304844E5483@US01WEMBX2.internal.synopsys.com>
References: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
 <1413801940-31086-4-git-send-email-m.szyprowski@samsung.com>
 <20141023150132.GI13573@saruman>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay2.synopsys.com ([198.182.60.111]:56047 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753761AbaJWSTV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Oct 2014 14:19:21 -0400
In-Reply-To: <20141023150132.GI13573@saruman>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "balbi@ti.com" <balbi@ti.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

> From: Felipe Balbi [mailto:balbi@ti.com]
> Sent: Thursday, October 23, 2014 8:02 AM
> 
> On Mon, Oct 20, 2014 at 12:45:33PM +0200, Marek Szyprowski wrote:
> > udc_stop() should clear ->driver pointer unconditionally to let the UDC
> > framework to work correctly with both registering/unregistering gadgets
> > and enabling/disabling gadgets by writing to
> > /sys/class/udc/*hsotg/soft_connect interface.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Also here. In fact, this is much more important :-)

Acked-by: Paul Zimmerman <paulz@synopsys.com>

Are there any more patches in this series that need immediate attention?
Otherwise I plan to finish reviewing the series on Friday or so.

-- 
Paul
