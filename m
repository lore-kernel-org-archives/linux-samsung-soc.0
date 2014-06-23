From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] i2c: exynos5: Properly use the "noirq" variants of suspend/resume
Date: Mon, 23 Jun 2014 15:42:01 -0700
Message-ID: <CAD=FV=VBcWC2Z2WCmsiZUPCrakqrdd9Cd6QL9TLYS4c23+sMkA@mail.gmail.com>
References: <1403155273-1057-1-git-send-email-dianders@chromium.org>
	<7h8uosyc3k.fsf@paris.lan>
	<CAD=FV=XxNVmF+N5HF4SnZoJRJvkSUkpEx6ct4v2gtmAQ9n28-Q@mail.gmail.com>
	<7hwqcbs166.fsf@paris.lan>
	<CAD=FV=Uz9O0i2gmuk2+BHa-Tksvyxv0+MTi2UEjVREAMNCK7Ug@mail.gmail.com>
	<7h7g4brx6w.fsf@paris.lan>
	<CAD=FV=VmPMf6tCNmKJ1o5J7PyAXoU8fb6+s+Fkv18FH2WaQp7A@mail.gmail.com>
	<7h38evp8ng.fsf@paris.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7h38evp8ng.fsf-4poPxKt068f/PtFMR13I2A@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, naveen krishna <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Masanari Iida <standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Kevin,

On Mon, Jun 23, 2014 at 3:23 PM, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> So I guess in this case the truly correct way to handle it is:
>>
>> 1. i2c controller should have Runtime PM even though (as per the code
>> now) there's nothing you can do to it to save power under normal
>> circumstances.  So the runtime "suspend" code would be a no-op.
>>
>> 2. When the i2c controller is told to runtime resume, it should
>> double-check if a full SoC poweroff has happened since the last time
>> it checked.  In this case it should reinit its hardware.
>>
>> 3. If the i2c controller gets a full "resume" callback then it should
>> also reinit the hardware just so it's not sitting in a half-configured
>> state until the first peripheral uses it.
>>
>> If later someone finds a way to power gate the i2c controller when no
>> active transfers are going (and we actually save non-trivial power
>> doing this) then we've got a nice place to put that code.
>>
>> NOTE: Unless we can actually save power by power gating the i2c
>> peripheral when there are no active transfers, we would also just have
>> the i2c_xfer() init the hardware if needed.  Maybe that's kinda gross,
>> though.
>
> Yes, this is how we manage the i2c controller on OMAP.
>
> Essentially, between every xfer, the hw is disabled and can potentially
> lose context, so eveery xfer requires a hw init.  We use the runtime PM
> "autosuspend" feature so that it stays alive for X milliseconds so
> bursty i2c xfers are not punished.
>
> Have a look at drivers/i2c/busses/i2c-omap.c.
>
> You'll notice there are not callbacks for system suspend/resume, it's
> only doing runtime PM.

OK, cool!  That might be a bit too aggressive of a change for what I
can take on right now.  I've filed http://crbug.com/388007 to see if
Samsung can take a look at this.

-Doug
