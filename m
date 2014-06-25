From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 02/14] mfd: max77686: Allow the max77686 rtc to wakeup
 the system
Date: Wed, 25 Jun 2014 10:24:05 -0700
Message-ID: <CAD=FV=UQfJfUUN4rnnCw2Pah-5BukL2SzhTskRVcvvzp8f+isA@mail.gmail.com>
References: <1403202040-12641-1-git-send-email-javier.martinez@collabora.co.uk>
	<1403202040-12641-3-git-send-email-javier.martinez@collabora.co.uk>
	<1403690742.22107.7.camel@AMDC1943>
	<53AAA4A3.50400@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53AAA4A3.50400-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Daniel Stone <daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Wed, Jun 25, 2014 at 3:29 AM, Javier Martinez Canillas
<javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
> Yes, the original Chrome OS 3.8 max77xxx also called the irq worker thread to
> ack the interrupt.
>
> So the real problem is that an interrupt occurs before the I2C bus controller is
> resumed and so the interrupt handler is not able to access the registers over I2C.
>
> Doug posted the following patches [0,1] that AFAIU solves the issue by making
> I2C controllers to be resumed in the noirq time to ensure that drivers will be
> able to use the I2C bus to handler their wakeup.

Yup, that's the solution as far as I know.  I know that in ChromeOS we
still have the extra call to the worker thread (despite the controller
waking up early), but that might be related to some other problem?

I was able to successfully suspend/resume multiple times once I woke
the i2c controller up earlier.

If you feel like adding Reviewed-by / Tested-by to my i2c patch then
feel free!  ;)


> In fact, Doug's original patch had this as a part of the commit message:
>
> NOTE: due to wakeup ordering problems this patch alone doesn't work so
> well on exynos5250-snow.  You also need something that brings the i2c
> bus up before the max77686 wakeup runs.
>
> I removed that note since I (probably wrong) thought that he didn't mean it to
> be part of the commit message but just was side information.

I probably would have left that in the patch, but I'm not objecting to
you taking it out.  :)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
