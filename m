From: Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] i2c: samsung: resume race fix
Date: Thu, 24 Jan 2013 08:42:23 -0800
Message-ID: <CALiw-2GqdmxDAsBCvLUpwXLe9Hf-Qzv4APp86f1dh1MYBqTzdA@mail.gmail.com>
References: <1352284106-24988-1-git-send-email-ch.naveen@samsung.com>
	<20121107114437.0a563c7e@endymion.delvare>
	<20130124132759.GH12933@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130124132759.GH12933-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

[Silly gmail defaulting to html the first time around, sorry for the
re-send to those not on lists]

2013/1/24 Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>:
> On Wed, Nov 07, 2012 at 11:44:37AM +0100, Jean Delvare wrote:
>> On Wed, 07 Nov 2012 15:58:26 +0530, Naveen Krishna Chatradhi wrote:
>> > Don't unmark the device as suspended until after it's been re-setup.
>> >
>> > The main race would be w.r.t. an i2c driver that gets resumed at the same
>> > time (asyncronously), that is allowed to do a transfer since suspended
>> > is set to 0 before reinit, but really should have seen the -EIO return
>> > instead.
>>
>> I thought that the suspend order was children first and the resume
>> order was parent first?
>
> Same here, why does it not work this way?

Sorry for being quiet on this so far, I didn't notice the controversy until now.

This is actually about half of what the original fix was (which I
wrote, thus my signed-off-by). The original one was related to us
having the GPIO handshake for a shared bus (see separate discussions
on how that should be upstreamed, and the work on that). For
reference, that patch is at:
https://gerrit.chromium.org/gerrit/#/c/28126/1/drivers/i2c/busses/i2c-s3c2410.c.

So, I'm not sure that this patch is really needed. The significant
part of the original one was the move of our internal
s3c24xx_i2c_dt_gpio_free() below setting suspended = 1. Upstream
implementation of the same functionality will be implemented
differently, most likely.


-Olof
