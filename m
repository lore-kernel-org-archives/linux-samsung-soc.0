From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: Add peach-pi board support
Date: Mon, 5 May 2014 08:17:05 -0700
Message-ID: <CAD=FV=U_b_n=V_mEFYNPFZ1wyrgjjr5jEGrVb5TviP0Z33popg@mail.gmail.com>
References: <1399035821-25096-1-git-send-email-arun.kk@samsung.com>
	<1399035821-25096-4-git-send-email-arun.kk@samsung.com>
	<5363D176.80601@gmail.com>
	<CAD=FV=XYjMg7V9=OzAy_ifwaM83QS0tiTrp5+nxvG236kkSjRQ@mail.gmail.com>
	<53644DDB.7050503@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53644DDB.7050503-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arun Kumar K <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arun Kumar <arunkk.samsung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, May 2, 2014 at 7:00 PM, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Well, if you can use the device tree of peach-pit board and boot peach-pi
> and vice-versa and it won't cause any hardware failures then I guess it's
> fine to keep this string.

I believe you can actually make it a good portion of the way through
boot, though a bunch of things (including graphics) won't work.  I
general I don't think it's all that different from "exynos5".


>>> I don't think this is a good idea, because this is basically rendering
>>> this
>>> dts file useless, unless used with a bootloader that can actually inject
>>> correct values. I believe that some generic setup could be provided in
>>> the
>>> dts, so you could at least get the board running.
>>
>>
>> I won't say that I care a whole lot, but I think that was what was
>> agreed upon the other day.  Specifically Tom Rini of U-Boot was
>> worried about the fact that U-Boot will read the memory node and
>> totally clobber it.  He thought there might be cases where someone
>> might _purposely_ not want U-Boot to do that.
>>
>> ...I would wonder what alternate bootloader you're imagining will
>> actually run on this board and not do this?
>
>
> People should have the freedom to choose anything they want. We have also
> barebox and coreboot with ARM and even Exynos5 support (in coreboot), but
> people might want to use something completely exotic as well and the device
> tree should let them do so.

Fair enough.  Unless Tom cares about this enough to throw his opinion
in here, I guess our answer is that the memory node should have a sane
default and we'll expect the bootloader to put something better in if
it can properly probe memory.

In this case I guess it would be 2GB.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
