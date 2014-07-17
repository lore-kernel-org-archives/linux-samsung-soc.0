From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/4 v2] hwmon: ntc_thermistor: prepose vendor prefix change
Date: Thu, 17 Jul 2014 16:05:30 +0200
Message-ID: <CABxcv=mko=1bQ+VnKhPtRbx6Leop+gRNNkiSO-CbvN=JiyWh2A@mail.gmail.com>
References: <1403677773-21141-1-git-send-email-ch.naveen@samsung.com>
	<02b501cf9064$34f16b80$9ed44280$@samsung.com>
	<53AAD8C8.3080506@roeck-us.net>
	<CAHfPSqCGf2d6xXDGr974+4ipNsYx3-fOLT+u2OGN=c9FVPEkZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHfPSqCGf2d6xXDGr974+4ipNsYx3-fOLT+u2OGN=c9FVPEkZg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jdelvare-l3A5Bk7waGM@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Naveen,

On Thu, Jul 17, 2014 at 6:21 AM, Naveen Krishna Ch
<naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Can you pull the 3/4 and 4/4 patches.
>

Patch 4/4 depends on the max77802 support series [0] since the ADC
uses the max77802 ldo9 regulator as its voltage supply. So that patch
can't be merged before the series land in mainline.

Best regards,
Javier

[0]: https://lkml.org/lkml/2014/7/14/273
