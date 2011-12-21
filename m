From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Re: [PATCH 0/3] Support Samsung S5P OHCI device and driver
Date: Wed, 21 Dec 2011 13:38:24 +0900
Message-ID: <062501ccbf9a$601f3af0$205db0d0$%kim@samsung.com>
References: <33510089.42761321876635907.JavaMail.weblogic@epv6ml08>
 <20111121172344.GA4483@kroah.com>
 <046f01ccb011$6d111370$47333a50$%kim@samsung.com>
 <20111209235807.GC6680@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37300 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751730Ab1LUEi2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Dec 2011 23:38:28 -0500
In-reply-to: <20111209235807.GC6680@kroah.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Greg KH' <greg@kroah.com>
Cc: 'Jingoo Han' <jg1.han@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@suse.de, stern@rowland.harvard.edu, 'Yulgon Kim' <yulgon.kim@samsung.com>, 'Shim Joonyoung' <jy0922.shim@samsung.com>



> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Saturday, December 10, 2011 8:58 AM
> To: Kukjin Kim
> Cc: 'Jingoo Han'; linux-arm-kernel@lists.infradead.org; linux-
> usb@vger.kernel.org; linux-samsung-soc@vger.kernel.org; gregkh@suse.de;
> stern@rowland.harvard.edu; 'Yulgon Kim'; 'Shim Joonyoung'
> Subject: Re: Re: [PATCH 0/3] Support Samsung S5P OHCI device and driver
> 
> On Thu, Dec 01, 2011 at 07:10:17PM +0900, Kukjin Kim wrote:
> > Greg KH wrote:
> > >
> > > On Mon, Nov 21, 2011 at 11:57:16AM +0000, Jingoo Han wrote:
> > > > > -----Original Message-----
> > > > > From: Greg KH [mailto:greg@kroah.com]
> > > > > Sent: Friday, November 18, 2011 4:12 AM
> > > > > To: Jingoo Han
> > > > > Cc: linux-arm-kernel@lists.infradead.org; linux-
> usb@vger.kernel.org;
> > > > > linux-samsung-soc@vger.kernel.org; gregkh@suse.de;
> > > > > stern@rowland.harvard.edu; kgene.kim@samsung.com;
> > > yulgon.kim@samsung.com;
> > > > > jy0922.shim@samsung.com
> > > > > Subject: Re: [PATCH 0/3] Support Samsung S5P OHCI device and
> driver
> > > > >
> > > > > On Tue, Nov 15, 2011 at 06:49:58AM +0000, Jingoo Han wrote:
> > > > > > Hello.
> > > > > >
> > > > > > This patch series adds USB OHCI device and initial driver for
> > > Samsung
> > > > > > S5P SoCs and is based from Linux 3.2-rc1. I have tested on
> SMDKV310
> > > > > board
> > > > > > using EXYNOS4.
> > > > >
> > > > > This is to be sent through some arm tree, not the usb tree, right?
> > > > Right, 1st and 2nd patch are sent throught arm tree.
> > > > However, 3rd patch is sent through the usb tree.
> > > > Thanks.
> > > > [PATCH 1/3] ARM: SAMSUNG: Add USB OHCI device
> > > > [PATCH 2/3]  ARM: EXYNOS: Add USB OHCI support to SMDKV310 board
> > > > [PATCH 3/3] USB: Add S5P OHCI diver
> > >
> > Hi Greg,
> >
> > Sorry for late response. I came back today from family vacation...
> >
> > Anyway,
> >
> > > So the third patch does not depend on the first two?  If it does, that
> > > means I will get build errors in the USB tree when I apply that patch,
> > > right?
> > >
> > > If so, then all three should go through a single tree.
> > >
> > Yes, right. This series would be handled in same tree so that we can
> avoid
> > useless conflicts.
> >
> > I commented small thing on 3rd patch. So I think, if you're ok on his
> > updated patch, it can be sent to upstream via Samsung tree. Or your tree
> > with my ack?
> 
> The samsung tree is fine to take these, thanks.
> 
Hi Greg,

OK, let me pick this up in my tree...so, when I apply, may I can have a ack
from you on 3rd patch?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
