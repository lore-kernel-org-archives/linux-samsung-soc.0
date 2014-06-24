From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/4] devicetree: bindings: Document murata vendor prefix
Date: Tue, 24 Jun 2014 14:30:30 +0100
Message-ID: <20140624133030.GH5856@leverpostej>
References: <1403612356-23685-1-git-send-email-ch.naveen@samsung.com>
 <1403612356-23685-2-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403612356-23685-2-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jun 24, 2014 at 01:19:13PM +0100, Naveen Krishna Chatradhi wrote:
> Add Murata Manufacturing Co., Ltd. to the list of device tree
> vendor prefixes.
> 
> Murata manufactures NTC (Negative Temperature Coefficient) based
> Thermistors for small scale applications like Mobiles and PDAs.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> ---
> This changes is needed for the following reasons
> 
> 1. The vendor prefix "ntc" is not defined in vendor-prefixes.txt
>    Thus, giving an error when checked with scripts/checkpatch.pl
> 2. Murata Manufacturing Co., Ltd. Is the vendor for the
>    NTC (Negative Temperature Coefficient) based thermistors.
>    Hence, "murata" is the right vendor-prefix, Not "ntc".
> 3. NTC is a technology used, But the prefix "ntc" is wrongly
>    and heavily used in the driver and the documentation.
> 
>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 4d7f375..a39b7d7 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -84,6 +84,7 @@ moxa	Moxa
>  mpl	MPL AG
>  mundoreader	Mundo Reader S.L.
>  mxicy	Macronix International Co., Ltd.
> +murata	Murata Manufacturing Co., Ltd.

Nit: please keep this list in alphabetical order.

Otherwise, this looks fine to me. With the order fixed:

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Mark.

>  national	National Semiconductor
>  neonode		Neonode Inc.
>  netgear	NETGEAR
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
