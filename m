From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/4] sysfs: Support is_visible() on binary attributes
Date: Wed, 7 Oct 2015 15:08:07 -0700
Message-ID: <20151007220807.GA3375@localhost>
References: <1442842703-5309-1-git-send-email-emilio.lopez@collabora.co.uk>
 <1442842703-5309-2-git-send-email-emilio.lopez@collabora.co.uk>
 <20151004183334.GA23538@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151004183334.GA23538-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Emilio L?pez <emilio.lopez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Oct 04, 2015 at 07:33:34PM +0100, Greg KH wrote:
> On Mon, Sep 21, 2015 at 10:38:20AM -0300, Emilio L?pez wrote:
> > According to the sysfs header file:
> > 
> >     "The returned value will replace static permissions defined in
> >      struct attribute or struct bin_attribute."
> > 
> > but this isn't the case, as is_visible is only called on struct attribute
> > only. This patch introduces a new is_bin_visible() function to implement
> > the same functionality for binary attributes, and updates documentation
> > accordingly.
> > 
> > Note that to keep functionality and code similar to that of normal
> > attributes, the mode is now checked as well to ensure it contains only
> > read/write permissions or SYSFS_PREALLOC.
> > 
> > Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> > Signed-off-by: Emilio L?pez <emilio.lopez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> 
> As this should probably go through the "platform drivers" maintainer,
> I'll just give you this:
> 
> Acked-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> 
> So it can go through their tree and not require me to just take this
> one.

Thanks, applied to the chrome-platform tree now.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
