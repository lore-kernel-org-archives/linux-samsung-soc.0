From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: Please remind 'WARNING: about Samsung merge window over'
Date: Mon, 2 Aug 2010 15:24:13 +0900
Message-ID: <AANLkTimJvS0djVprEgCJ8k3_SYeaKc72NMNZNrRpqXHi@mail.gmail.com>
References: <003401cb3206$d68a1fc0$839e5f40$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:35976 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752493Ab0HBGYP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Aug 2010 02:24:15 -0400
Received: by qyk7 with SMTP id 7so5179309qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Aug 2010 23:24:15 -0700 (PDT)
In-Reply-To: <003401cb3206$d68a1fc0$839e5f40$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, ben-linux@fluff.org, nala.la@samsung.com, kimty@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>

Absurd !!!

Did you mentioned that samsung merge window over before?
why it's reminder mail? it's unilateral notification at this time.

In my feelings. only include the your side (LSI) patches and don't
include others (mobile). since it's not fit your taste.
Can you explain the difference between "S5PV310 CPU support" and
"S5PV210 cpufreq support"?
Did you get any ACKs for V310 support? Why do you exclude the v210
cpufreq support even though it's acked from others?

On Mon, Aug 2, 2010 at 2:52 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> Please remind following which is from discussion about Samsung merge =
stuff
> with Russell.
>
> ---
>
>> > So, please send the majority of patches *before* the merge window =
and
>> > try to avoid sending anything but fixes during the merge window it=
self.
>> > The merge window is for code which has _already_ been merged and h=
as
>> > been in linux-next to be merged into Linus' tree. =A0It's not for =
new
>> > code to be reviewed.
>>
>> Next merge window, which will probably be the last I will handle for=
 the
>> S5P range, will have an earlier cut-off point. It was a big rush to =
get
>> this lot reviewed and merged.
>
> It also means that *NONE* of the stuff in your second pull request wa=
s
> in linux-next for *any* time. =A0It also conflicted with my tree. =A0=
The
> result of that is I'm expecting mainline to be dead for all ARM with:
>
> arch/arm/Kconfig:883: can't open file "arch/arm/plat-s5pc1xx/Kconfig"
>
> because of a mis-merge - and since that conflict was not picked up by
> linux-next, it could not have been previously published.
>
> For the next merge window, I will avoid reading email for the duratio=
n
> of the window - which means those who are late for the merge window w=
ill
> simply not have their patches and trees pulled. =A0This means we _wil=
l_
> have time to resolve conflicts and find problems _before_ the merge
> window
>
> ---
>
> I have no more plan to merge s5p stuff for this merge window, but rev=
iewed
> here until now.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
