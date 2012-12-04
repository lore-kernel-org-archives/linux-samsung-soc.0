From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Add bus arbitration implementation
Date: Mon, 3 Dec 2012 16:11:36 -0800
Message-ID: <CAOesGMgzBGieYJ131sUX7u8EWPEusxareFzC0XPt48+oNuh-xA@mail.gmail.com>
References: <1354165536-18529-1-git-send-email-ch.naveen@samsung.com>
	<1354165536-18529-3-git-send-email-ch.naveen@samsung.com>
	<20121129163448.GA3761@sirena.org.uk>
	<CAPnjgZ0atD3k=gT0vjgkLO_SA8DMak6SiT6nZ_2T6WFqtK0szQ@mail.gmail.com>
	<CAOesGMgE0JEHsdySpua34_kbWi1+z4n4UdW0kumiJEROi7O2pQ@mail.gmail.com>
	<20121201132632.GA17981@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121201132632.GA17981-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, naveen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Dec 1, 2012 at 5:26 AM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Thu, Nov 29, 2012 at 10:14:58PM -0800, Olof Johansson wrote:
>> On Thu, Nov 29, 2012 at 6:13 PM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
>> > It was originally done separately but I think it was felt that this
>> > was overly complex. Olof can you please comment on this?
>
>> it is indeed not controller specific per se, but we are unaware of any
>> other platform/driver using it. So, it seemed reasonable to implement
>> it in the driver as long as we have only one user; if another one
>> comes along it's of course better to move it to the common i2c code.
>
>> At least that was my opinion at the time. I could be convinced
>> otherwise if someone else has strong opinions on the matter.
>
> This sort of approach is half the reason SPI ended up being so fun...  I
> suspect if you look hard enough you'll find that this is just the first
> time someone tried to upstream such a scheme.  This is all especially
> true for the DT bindings, even if the implementation is driver local for
> now it'd be better to define generic bindings.

Ok, sounds like we might as well make it generic then. Naveen?


-Olof
