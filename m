From: Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: Enable audio support for Peach-pi board
Date: Fri, 13 Jun 2014 14:58:26 -0700
Message-ID: <CAD=FV=XCk9E-7VPV=LQrdLU5fKsFHviQf79MBmC8va3gsg=Ydw@mail.gmail.com>
References: <1402464739-19044-1-git-send-email-tushar.b@samsung.com>
	<1402464739-19044-4-git-send-email-tushar.b@samsung.com>
	<CAD=FV=XqqP7+xDOAKCixivzgaO0xvJX7L+CCN+unAEuf-6aUbQ@mail.gmail.com>
	<20140613170511.GA20112@sirena.org.uk>
	<CAD=FV=VvkvH1TPiKttm9VXbBRnBo7kmTVK8bZZvexK=bAvaO4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=VvkvH1TPiKttm9VXbBRnBo7kmTVK8bZZvexK=bAvaO4Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Tushar Behera <tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tushar Behera <trblinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Mark,

On Fri, Jun 13, 2014 at 10:13 AM, Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> Mark,
>
> On Fri, Jun 13, 2014 at 10:05 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Fri, Jun 13, 2014 at 10:03:50AM -0700, Doug Anderson wrote:
>>> On Tue, Jun 10, 2014 at 10:32 PM, Tushar Behera <tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>
>>> > Peach-pi board has MAX98090 audio codec connected on HSI2C-7 bus.
>>
>>> If you want to be a stickler about it, peach-pi actually has a
>>> max98091.  That requires code changes to the i2c driver, though.
>>> ...and unfortunately listing two compatible strings for i2c devices is
>>> broken.  :(
>>
>> It is?  We should fix that if it's the case...
>
> Yah, I mentioned it to Mark Rutland at the last ELC and he said he
> might take a look at it, but I probably should have posted something
> up to the i2c list.
>
> I made a half-assed attempt to fix it locally in the ChromeOS but
> quickly found that it was going to be a much bigger job than I had
> time for...
>
> https://chromium-review.googlesource.com/#/c/184406/
>
> IIRC i2c_new_device didn't return an error like I thought it would,
> probably trying to deal with the fact that devices might show up at a
> later point in time.
>
>
> Hrm, now that I think about it I wonder if the right answer is just to
> call i2c_new_device for all the compatible strings even if it doesn't
> return an error.  I'd have to go back and try that and re-explore this
> code...

Nope, that didn't work either.  Now I remember trying that before,
too.  It doesn't like you registering two different devices with the
same address:

[    2.582539] DOUG: /i2c@12CD0000/codec@10 (0) max98091
[    2.587360] DOUG: /i2c@12CD0000/codec@10 (0) max98091
[    2.591160] DOUG: /i2c@12CD0000/codec@10 (1) max98090
[    2.596686] i2c i2c-7: Failed to register i2c client max98090 at 0x10 (-16)

If you hack out the check for address business:

sysfs: cannot create duplicate filename '/devices/12cd0000.i2c/i2c-7/7-0010'

Anyway, suffice to say that the i2c core needs to be extended to
handle the idea that a single device has more than one "compatible"
string.  I'll leave it to an eager reader of this thread to implement
this since we can also fix our own problem by just listing "max98091"
in "sound/soc/codecs/max98090.c" like has always been done in the
past.


-Doug
