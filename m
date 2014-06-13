From: Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: Enable audio support for Peach-pi board
Date: Fri, 13 Jun 2014 15:50:07 -0700
Message-ID: <CAD=FV=U06JioDvvSqHyC5BZp_sKppk4i=s7DERCXG7rGHBe=xQ@mail.gmail.com>
References: <1402464739-19044-1-git-send-email-tushar.b@samsung.com>
	<1402464739-19044-4-git-send-email-tushar.b@samsung.com>
	<CAD=FV=XqqP7+xDOAKCixivzgaO0xvJX7L+CCN+unAEuf-6aUbQ@mail.gmail.com>
	<20140613170511.GA20112@sirena.org.uk>
	<CAD=FV=VvkvH1TPiKttm9VXbBRnBo7kmTVK8bZZvexK=bAvaO4Q@mail.gmail.com>
	<CAD=FV=XCk9E-7VPV=LQrdLU5fKsFHviQf79MBmC8va3gsg=Ydw@mail.gmail.com>
	<20140613220421.GD5099@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140613220421.GD5099-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Tushar Behera <tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tushar Behera <trblinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Mark,

On Fri, Jun 13, 2014 at 3:04 PM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Jun 13, 2014 at 02:58:26PM -0700, Doug Anderson wrote:
>
>> Anyway, suffice to say that the i2c core needs to be extended to
>> handle the idea that a single device has more than one "compatible"
>> string.  I'll leave it to an eager reader of this thread to implement
>> this since we can also fix our own problem by just listing "max98091"
>> in "sound/soc/codecs/max98090.c" like has always been done in the
>> past.
>
> Why do you need to register multiple compatible strings (I guess for
> fallback purposes?).

I'm no expert, but I think that's part of device tree isn't it?

In the case of max98090 and max98091, they are incredibly similar
pieces of hardware (I think the max98091 simply has more microphones).
If you've got a driver for a max98090 it will work just fine for a
max98091 but you just won't get the extra microphones.

In cases like this then device tree theory says that you should list
both compatible strings: max98091 and max98090, right?  If your OS has
a driver for max98091 it will use it.  ...if it doesn't but it has a
max98090 driver it will try that one.

As far as I understand we _shouldn't_ lie and just say that we have a
max98090 when we really have a max98091.  The device tree is supposed
to describe the hardware and isn't support to care that the OS has a
driver for max98090 but not max98091.

Ironically in our case we have a driver that supports both the 98090
and the 98091 via autodetect.  However, it doesn't know about the
98091 compatible string so if you list yourself as compatible with
98091 then it won't find the driver.

> A quick fix that is about as good is to take the
> first compatible only.

That's how the code works today, actually.  ...but as per above the
current 98090 driver doesn't know about the 98091 compatible string,
so:

compatible = "maxim,max98091", "maxim,max98090";

...won't find the right driver.

--

The quick fix is to add max98091 to the max98090 driver and is what
I'd suggest in this case.  ...but I still think that the above logic
is valid and eventually the i2c core should be fixed.  Please correct
me if I'm wrong.

-Doug
