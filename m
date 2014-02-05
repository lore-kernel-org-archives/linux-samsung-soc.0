From: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: RE: [RFC PATCHv1] usb: dwc2: Combine the dwc2 and s3c_hsotg into a
 single USB DRD driver.
Date: Wed, 5 Feb 2014 00:42:19 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E03046D149949@US01WEMBX2.internal.synopsys.com>
References: <1391550341-32509-1-git-send-email-dinguyen@altera.com>
 <1391550341-32509-2-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391550341-32509-2-git-send-email-dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

> From: dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org [mailto:dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org]
> Sent: Tuesday, February 04, 2014 1:46 PM
> 
> From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> 
> This means that the driver can be in host or peripheral mode when the appropriate
> connector is used. When an A-cable is plugged in, the driver behaves in host
> mode, and when a B-cable is used, the driver will be in peripheral mode.
> 
> This commit:
> - Replaces in the defines used in s3c_hsotg.h with the defines used in the dwc2
>   hw.h defines.
> - Use the dw2_hsotg as the unified data structure for the host/gadget.
> - Uses the dwc2 IRQ handler for host/gadget.
> - A single spinlock.

Hi Dinh,

Putting all of these changes into a single patch makes them unreviewable
as far I am concerned. You need to break this into a series of smaller
patches. I would suggest something like this:

1 of n:  Make the minimum changes to the dwc2 header files needed to
         support s3c-hsotg as a standalone driver.
2 of n:  Make the spelling changes to s3c-hsotg.c needed to use the dwc2
         headers, and move it to the dwc2/ directory. Make the Kconfig
         and Makefile changes needed for the move. Delete s3c-hsotg.h.
3 of n:  Move the struct defines etc. from s3c-hsotg.c to the dwc2
         header files.
.. of n: Make the changes required to combine the functionality of
         both drivers into one. Preferably this would also be a series
         of patches instead of one big one.

At each step of the series, both drivers should still compile and work.

Also, please follow the patch style used on the linux lists. 
'git format-patch --cover-letter' should do most of this for you
automatically.

And you should probably trim the Cc list to something more reasonable.

-- 
Paul

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
