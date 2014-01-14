From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 0/2] dwc2/s3c-hsotg: Initial steps to combine the 2
 driver
Date: Tue, 14 Jan 2014 15:30:29 -0600
Message-ID: <1389735029.26963.8.camel@linux-builds1>
References: <1389697262-29065-1-git-send-email-dinguyen@altera.com>
	 <20140114142138.GB19492@kroah.com> <1389732378.26963.7.camel@linux-builds1>
	 <A2CA0424C0A6F04399FB9E1CD98E03046D140082@US01WEMBX2.internal.synopsys.com>
	 <20140114211422.GC28453@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140114211422.GC28453-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rashika Kheria <rashika.kheria-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthijs Kooijman <matthijs-gZv8Wpyq0Kk@public.gmane.org>, Luis Ortega Perez de Villar <luiorpe1-qHq8kIZmbuA@public.gmane.org>, Dom Cobley <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 2014-01-14 at 13:14 -0800, Greg KH wrote:
> On Tue, Jan 14, 2014 at 08:57:12PM +0000, Paul Zimmerman wrote:
> > > From: Dinh Nguyen [mailto:dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org]
> > > Sent: Tuesday, January 14, 2014 12:46 PM
> > > 
> > > On Tue, 2014-01-14 at 06:21 -0800, Greg KH wrote:
> > > > On Tue, Jan 14, 2014 at 05:01:00AM -0600, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
> > > > > From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> > > > >
> > > > > Hi,
> > > > >
> > > > > I'm starting work downstream on combining the DWC2 host driver and the s3c-hsotg
> > > > > gadget driver into a dual-role OTG driver. Before I go further, I was hoping to
> > > > > solicit comments on whether or not my initial approach is correct? I know there
> > > > > are plans to combine the 2, so would like to solicit comments/suggestions so
> > > > > that I can also upstream it as well.
> > > > >
> > > > > These 2 patches:
> > > > >
> > > > > * Moves the DWC2 driver out of drivers/staging into drivers/usb/dwc2/
> > > >
> > > > This already happened yesterday in my tree, so you should see this in
> > > > linux-next by now, no need to do it again :)
> > > >
> > > 
> > > I see it now. Thanks for the pointer.
> > > 
> > > > > * Moves the s3c-hsotg driver into drivers/usb/dwc2/
> > > > > * Delete s3c-hsotg.h
> > > > > * Make the s3c-hsotg.c file use the defines in hw.h from the DWC2 driver.
> > > > >
> > > > > This initial patch has been tested on the SOCFPGA platform only in Host-only
> > > > > and Gadget-only mode.
> > > > >
> > > > > The next step would be to do the combining of the driver into a dual-role OTG
> > > > > driver.
> > > >
> > > > I was told that merging the two of these isn't going to work as the
> > > > silicon is just too different, which is why I allowed the code to move
> > > > out of staging.  If you feel differently, and think you can combine the
> > > > two drivers, that's wonderful, I'll gladly take patches to do so, but be
> > > > sure to test on the proper platforms to make sure nothing breaks.
> > > >
> > > 
> > > I wasn't aware of the silicon differences. I just took the s3c-hsotg
> > > driver as is and it worked fine on my version 2.93a of the USB IP. I'll
> > > search the ML for information, or perhaps Paul can comment?
> > 
> > I think Greg is thinking of the octeon-usb driver in staging [1], not
> > the s3c-hsotg driver. The plan was always to eventually merge dwc2 with
> > s3c-hsotg.
> 
> Yes, I'm totally confused, you are right.
> 
> Nevermind then, Dinh, if you want to redo your patch after 3.14-rc1 is
> out, that would be great as merging the drivers together can be done
> easier after that development point.
> 
Unless, Paul has already started the work, I can take a crack at it.

Dinh
> thanks,
> 
> greg k-h
> 



--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
