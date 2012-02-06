From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] USB: SET SEL request definition
Date: Mon, 6 Feb 2012 06:53:37 -0800
Message-ID: <20120206145337.GB26982@kroah.com>
References: <001001cce4a7$143300e0$3c9902a0$%tikhomirov@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <001001cce4a7$143300e0$3c9902a0$%tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anton Tikhomirov <av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Kukjin Kim' <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Greg Kroah-Hartman' <gregkh-l3A5Bk7waGM@public.gmane.org>, 'Felipe Balbi' <balbi-l0cyMroinI0@public.gmane.org>, 'Yulgon Kim' <yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 06, 2012 at 05:12:33PM +0900, Anton Tikhomirov wrote:
> Cc: Kukjin Kim <kgene.kim <at> samsung.com>
> Cc: Greg Kroah-Hartman <gregkh <at> suse.de>
> Cc: Felipe Balbi <balbi <at> ti.com>

What is that mess?  It belongs, with real email addresses, below your
signed-off-by line, if at all.

> Adds SET SEL standard request definition as defined by ch9
> of the USB3.0 specification.
> 
> Signed-off-by: Anton Tikhomirov <av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  include/linux/usb/ch9.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
> index 61b2905..76ff771 100644
> --- a/include/linux/usb/ch9.h
> +++ b/include/linux/usb/ch9.h
> @@ -88,6 +88,7 @@
>  #define USB_REQ_GET_INTERFACE		0x0A
>  #define USB_REQ_SET_INTERFACE		0x0B
>  #define USB_REQ_SYNCH_FRAME		0x0C
> +#define USB_REQ_SET_SEL			0x30
>  
>  #define USB_REQ_SET_ENCRYPTION		0x0D	/* Wireless USB */
>  #define USB_REQ_GET_ENCRYPTION		0x0E

Why did you insert this out of order?

greg "please note my email address change as well" k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
