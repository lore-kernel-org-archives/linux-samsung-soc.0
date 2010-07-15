From: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: Re: s3c-hsotg patches
Date: Thu, 15 Jul 2010 10:02:22 +0100
Message-ID: <20100715090222.GD16584@trinity.fluff.org>
References: <1278460943-16224-1-git-send-email-ben-linux@fluff.org> <20100707151246.GA2121@kroah.com> <00c401cb2338$84a3f730$8debe590$%szyprowski@samsung.com> <20100714151026.GD24104@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100714151026.GD24104-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Ben Dooks' <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jul 14, 2010 at 08:10:26AM -0700, Greg KH wrote:
> On Wed, Jul 14, 2010 at 11:39:50AM +0200, Marek Szyprowski wrote:
> > Hello,
> > 
> > On Wednesday, July 07, 2010 5:13 PM Greg KH wrote:
> > 
> > > On Wed, Jul 07, 2010 at 01:02:12AM +0100, Ben Dooks wrote:
> > > > Re-send of previous set, with corrected patches.
> > > 
> > > Hm, what tree are these going through?  Do you need me to take them
> > > through the linux-usb tree?  Or are they going through a
> > > platform-specific one somewhere?
> > > 
> > > confused,
> > 
> > Looks that Ben is busy and has no time to answer...
> 
> Then we all should be too busy to apply them :)

I've been really ill for the last couple of weeks, so still sifting
through a pile of stuff that needs to be sorted.

They where sent to you as I much prefer the driver specific stuff to go
to the relevant maintainer and if possible have them merged via the
maintainer tree.
 
> Seriously, if a simple question like this is ignored, what happens if a
> real problem is reported?
> 
> > I'm interested in merging these patches too. These patches were
> > intended to be merged to 2.6.35-rc5. They are available on 
> > git://git.fluff.org/bjdooks/linux for-2635-rc5/hsotg branch.
> > 
> > IMHO these patches should go though the linux-usb tree - they
> > don't touch any platform specific code, and register definitions 
> > (arch/arm/plat-samsung/include/plat/regs-usb-hsotg.h) in fact belongs
> > to the driver rather than the platform. s3c-hsotg driver belongs to
> > the linux-usb tree.
> 
> Ok, I can take them all, care to resend them through email?

Do you still want them re-sending. I'd have to check that the branch
on git://git.fluff.org/bjdooks/linux for-2635-rc5/hsotg is up to date
before having it pulled.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
