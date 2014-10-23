From: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Subject: RE: [PATCH v2 04/10] usb: dwc2/gadget: disable phy before turning
 off power regulators
Date: Thu, 23 Oct 2014 18:15:57 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E0304844E546E@US01WEMBX2.internal.synopsys.com>
References: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
 <1413801940-31086-5-git-send-email-m.szyprowski@samsung.com>
 <20141023150116.GH13573@saruman>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from us01smtprelay-2.synopsys.com ([198.182.44.111]:34937 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932143AbaJWSQC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Oct 2014 14:16:02 -0400
In-Reply-To: <20141023150116.GH13573@saruman>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "balbi@ti.com" <balbi@ti.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

> From: Felipe Balbi [mailto:balbi@ti.com]
> Sent: Thursday, October 23, 2014 8:01 AM
> 
> On Mon, Oct 20, 2014 at 12:45:34PM +0200, Marek Szyprowski wrote:
> > This patch fixes probe function to match the pattern used elsewhere in
> > the driver, where power regulators are turned off as the last element in
> > the device shutdown procedure.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Paul, can I have your Acked-by here so I can send this to v3.18-rc1 ?

Sorry, I've been working on a really hot issue at $work and didn't have
time yet to review this series.

Acked-by: Paul Zimmerman <paulz@synopsys.com>
