From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: Please remind 'WARNING: about Samsung merge window over'
Date: Tue, 3 Aug 2010 09:56:11 +0900
Message-ID: <AANLkTinQgWfZsC0Qy_OOEcJTPrm1aHWuKODJhzUXbtjq@mail.gmail.com>
References: <003401cb3206$d68a1fc0$839e5f40$%kim@samsung.com>
	<AANLkTimJvS0djVprEgCJ8k3_SYeaKc72NMNZNrRpqXHi@mail.gmail.com>
	<20100802073138.GB10608@n2100.arm.linux.org.uk>
	<AANLkTim1qtiYzvGKKRDcgt-Wds30qVX27GDMcnquOvBP@mail.gmail.com>
	<20100802092233.GB30670@n2100.arm.linux.org.uk>
	<00e701cb32a6$4282cf20$c7886d60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:52937 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752930Ab0HCA4N convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Aug 2010 20:56:13 -0400
Received: by wyb39 with SMTP id 39so3869820wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Aug 2010 17:56:11 -0700 (PDT)
In-Reply-To: <00e701cb32a6$4282cf20$c7886d60$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, kimty@samsung.com, ben-linux@fluff.org, nala.la@samsung.com, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

On Tue, Aug 3, 2010 at 9:53 AM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> Russell King wrote:
>>
>> On Mon, Aug 02, 2010 at 05:35:37PM +0900, Kyungmin Park wrote:
>> > As the maintainer, he merged his features freely but others can't =
get
>> > the chance if the implementation is not fit his taste or company
>> > policy.
>> >
>> > Look at the example.
>> > [PATCH v2 0/4] ARM: S5P: Support gpio interrupts
>> > http://marc.info/?l=3Dlinux-arm-kernel&m=3D127840208508625&w=3D2
>> >
>> > We need the gpio interrupt support but he refused it since it used=
 too
>> > many irq. Actually his board don't use this features.
>> > "It is because there are too many gpio interrupts and having suppo=
rt
>> > of all of them is unnecessary as realistically only few of them ma=
ybe
>> > used."
>>
>> From my count, there's already 144 IRQs, and you'll be adding 27*8 =3D=
 216
>> additional IRQs to that. =A0That's quite small compared to some plat=
forms
>> which have in the order of 512 or even 1024 IRQs.

Can you comment this one?
and previous s5pc110 cpufreq also?

>>
>> > And current kernel don't support the sparse irq feature. then it's
>> > reasonable to merge it first and revise it later.
>>
>> sparse irq support has been queued for almost a month for the merge
>> window which has just this morning opened. =A0This doesn't help you =
if
>> you instantiate all your 360 interrupts though - just because you
>> don't _use_ an interrupt which has been declared as existing doesn't
>> reduce the size of the arrays.
>>
>> > Another why FIMC support is missing? we modified it as his request=
ed
>> > and send it properly.
>> > [PATCH v3 3/8] ARM: Samsung: Add platform definitions and helpers =
for
>> > http://marc.info/?l=3Dlinux-arm-kernel&m=3D127990218813931&w=3D2
>>
>> This looks like it's been missed. =A0People get busy and miss things=
 on
>> the mailing list, there's nothing special about that.
>>
> Yeah...actually I missed reply for it...so I requested re-submit v4 p=
atch to
> Marek with some modifying and finished review it just now.
>
>> > [PATCH v3 1/8] ARM: Samsung: Add register definitions for Samsung =
S5P
>> > http://marc.info/?l=3Dlinux-arm-kernel&m=3D127990218613922&w=3D2
>>
>> Kukjin Kim replied to this one with a point requiring an answer, but
>> nothing came back.
>>
>> =A0 =A0"Looks ok...however, I'm still thinking whether really need a=
ll these
>> =A0 =A0 definitions."
>>
>> Seems to be a perfectly reasonable point to raise, and if there's no
>> reply to justify them...
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
