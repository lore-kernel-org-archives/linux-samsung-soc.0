From: "Steinar H. Gunderson" <sgunderson-jG/AHqQBv7lBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] dwc3-exynos: Fix deferred probing storm.
Date: Fri, 27 May 2016 15:25:19 +0200
Message-ID: <20160527132519.GA5268@sesse.net>
References: <20160524192424.GA11690@sesse.net>
 <E1b5Hwn-0005Be-UA@pannekake.samfundet.no>
 <CAFp+6iGFkquYkHCCJRkQALRZ2g-htiKbrJZbJwMoAMR=+A5u_Q@mail.gmail.com>
 <20160527114641.GA39472@sesse.net>
 <5748480D.8000501@samsung.com>
 <87bn3rprtw.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87bn3rprtw.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Steinar H. Gunderson" <sesse-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 823552-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, May 27, 2016 at 04:12:59PM +0300, Felipe Balbi wrote:
> yes, please do that. Keep in mind, also, that we're still in the middle
> of the merge window and nothing will really happen until v4.7-rc1 is
> tagged.

Sent. As a fix, there's a chance it could go into 4.7, right?

/* Steinar */
-- 
Homepage: https://www.sesse.net/
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
