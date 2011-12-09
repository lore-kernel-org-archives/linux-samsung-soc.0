From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH 0/3] Support Samsung S5P OHCI device and driver
Date: Fri, 9 Dec 2011 15:58:07 -0800
Message-ID: <20111209235807.GC6680@kroah.com>
References: <33510089.42761321876635907.JavaMail.weblogic@epv6ml08>
 <20111121172344.GA4483@kroah.com>
 <046f01ccb011$6d111370$47333a50$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <046f01ccb011$6d111370$47333a50$%kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-l3A5Bk7waGM@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, 'Yulgon Kim' <yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Shim Joonyoung' <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Dec 01, 2011 at 07:10:17PM +0900, Kukjin Kim wrote:
> Greg KH wrote:
> > 
> > On Mon, Nov 21, 2011 at 11:57:16AM +0000, Jingoo Han wrote:
> > > > -----Original Message-----
> > > > From: Greg KH [mailto:greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org]
> > > > Sent: Friday, November 18, 2011 4:12 AM
> > > > To: Jingoo Han
> > > > Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > > > linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; gregkh-l3A5Bk7waGM@public.gmane.org;
> > > > stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org; kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org;
> > yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org;
> > > > jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
> > > > Subject: Re: [PATCH 0/3] Support Samsung S5P OHCI device and driver
> > > >
> > > > On Tue, Nov 15, 2011 at 06:49:58AM +0000, Jingoo Han wrote:
> > > > > Hello.
> > > > >
> > > > > This patch series adds USB OHCI device and initial driver for
> > Samsung
> > > > > S5P SoCs and is based from Linux 3.2-rc1. I have tested on SMDKV310
> > > > board
> > > > > using EXYNOS4.
> > > >
> > > > This is to be sent through some arm tree, not the usb tree, right?
> > > Right, 1st and 2nd patch are sent throught arm tree.
> > > However, 3rd patch is sent through the usb tree.
> > > Thanks.
> > > [PATCH 1/3] ARM: SAMSUNG: Add USB OHCI device
> > > [PATCH 2/3]  ARM: EXYNOS: Add USB OHCI support to SMDKV310 board
> > > [PATCH 3/3] USB: Add S5P OHCI diver
> > 
> Hi Greg,
> 
> Sorry for late response. I came back today from family vacation...
> 
> Anyway,
> 
> > So the third patch does not depend on the first two?  If it does, that
> > means I will get build errors in the USB tree when I apply that patch,
> > right?
> > 
> > If so, then all three should go through a single tree.
> > 
> Yes, right. This series would be handled in same tree so that we can avoid
> useless conflicts.
> 
> I commented small thing on 3rd patch. So I think, if you're ok on his
> updated patch, it can be sent to upstream via Samsung tree. Or your tree
> with my ack?

The samsung tree is fine to take these, thanks.

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
