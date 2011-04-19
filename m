From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: Cleanup Samsung stuff
Date: Tue, 19 Apr 2011 11:52:21 +0900
Message-ID: <BANLkTi=3JOn4sc0_tXM1mROdTU0-Uwq_-A@mail.gmail.com>
References: <012801cbfe33$a76fa490$f64eedb0$%kim@samsung.com>
	<BANLkTimTuQ1YE8Xu04NyMZxF42KGDr_XBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:51643 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754078Ab1DSCw0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Apr 2011 22:52:26 -0400
Received: by fxm17 with SMTP id 17so3085198fxm.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Apr 2011 19:52:25 -0700 (PDT)
In-Reply-To: <BANLkTimTuQ1YE8Xu04NyMZxF42KGDr_XBQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, =?UTF-8?B?64yA7J246riw?= <inki.dae@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Russell King <rmk+kernel@arm.linux.org.uk>, LAK <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, MyungJoo Ham <myungjoo.ham@gmail.com>

Hello everyone,

Anyway, I've got a quick question about the directory structure in arch=
/arm/*

Is there any reason not to keep mach-* in plat-* directories while
mach-* appears to be a "sub-categories" of plat-*?

=46or example, rather than the current structure:
arch/arm/plat-samsung/
arch/arm/mach-s5pv210/
arch/arm/mach-s5p****/
, why don't we structure them like:
arch/arm/plat-samsung/mach-s5pv210/
arch/arm/plat-samsung/mach-s5p****/

=46or mach-* that is not included in and does not use any plat-*, we ma=
y
make "arch/arm/plat-common" or just put them at arch/arm/.

Probably there could be discussions like this (likely), but I just
don't know why we are not structured like that. If it is because we
have some mach-* that use multiple plat-*, (multiple inheritance?) we
may be able to move on with this consolidation.



Cheers!

- MyungJoo

2011/4/19 Kyungmin Park <kmpark@infradead.org>:
> On Tue, Apr 19, 2011 at 10:46 AM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
>> Hi all,
>>
>> I think, you know about current situation of Linux ARM world.
>>
>> So...
>>
>> As Russell suggested, I also will focus on consolidations and bug fi=
xes for
>> Samsung stuff for a while so don't complain about missing new stuff.=
 In my
>> opinion, we can keep going it later...
>>
>> As a note, I'm doing(or preparing) following at the moment.
>>
>> - Removing some "mach-s5pxxxx"s
> Why not mach-s3c series? don't you think too much plat-{s3c, s5p,
> samsung}? how about to use the plat-samsung only?
>> - Removing useless header files in include/{mach,plat} of Samsung
>> - Samsung GPIO stuff cleanup/consolidation
>> - Samsung DMA stuff consolidation?
> =C2=A0 -> Move to dmaengine and use it.
>> - Device tree (with Linaro)
>> - and so on...
>
> =C2=A0 - Strange Samsung Clock and names consolidation.
> =C2=A0 - IRQ stuff (some parts are done by tglx but need to use the
> generic IRQ base instead of odd +32 magic)
> =C2=A0 - generic IOMMU consolidation.
>
> BTW, who works on this at LSI?
>
> Thank you,
> Kyungmin Park
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>



--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
