From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH 0/4] ARM: S5PV210: Clock Framework: powerdomain,
	block-gating, flags
Date: Tue, 20 Jul 2010 12:05:12 +0900
Message-ID: <AANLkTinUO548kSoDSII3ry8KZQFpUtXvgTooz40d6o7D@mail.gmail.com>
References: <1279528236-6076-1-git-send-email-myungjoo.ham@samsung.com>
	<006401cb27a7$90122100$b0366300$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:51104 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757941Ab0GTDFO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jul 2010 23:05:14 -0400
Received: by iwn7 with SMTP id 7so5300627iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jul 2010 20:05:12 -0700 (PDT)
In-Reply-To: <006401cb27a7$90122100$b0366300$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

On Tue, Jul 20, 2010 at 10:04 AM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> MyungJoo Ham wrote:
>>
>> This patches add support for powerdomain, block-gating, and flags in
> struct clk.
>>
>> Blockgating re-uses powerdomain support scheme and depends on powerd=
omain
>> support.
>>
>> Flags support is independent from powerdomain; however, powerdomain
> support
>> is NOT stable without flags support. Without flags support, powerdom=
ain
> may lock
>> up the system with some conditions although they are rare. Thus, whe=
n
>> powerdomain or block-gating is used, flags support should be turned =
on for
> the
>> system stability. (and that's why I'm sending flags support with
>> powerdomain/block-gating support).
>>
>> Although powerdomain support is requred for blockgating, blockgating=
 is
> NOT
>> required for powerdomain. Besides, powerdomain support is observed t=
o
> reduce
>> power consumption significantly (with 2.6.29 kernel); however, block=
gating
> support
>> didn't show any significant improvement.
>>
>>
>> MyungJoo Ham (4):
>> =C2=A0 ARM: SAMSUNG SoC: Powerdomain/Block-gating Support
>> =C2=A0 ARM: S5PV210: Powerdomain/Clock-gating Support
>> =C2=A0 ARM: SAMSUNG SoC: Clock Framework: Flag Support for struct cl=
k.
>> =C2=A0 ARM: S5PV210: Clock Framework: Flag Support for struct clk.
>>
>> =C2=A0arch/arm/mach-s5pv210/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 17 +
>> =C2=A0arch/arm/mach-s5pv210/clock.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0906
>> ++++++++++++++++++++++------
>> =C2=A0arch/arm/plat-samsung/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 19 +
>> =C2=A0arch/arm/plat-samsung/clock.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0146 +++++-
>> =C2=A0arch/arm/plat-samsung/include/plat/clock.h | =C2=A0 44 ++
>> =C2=A05 files changed, 935 insertions(+), 197 deletions(-)
>
> Already we discussed about power domain...
> And actually your code is similar with my member's 2.6.29 powerdomain
> scheme.
> So Ben's code review about that is available to your this patch.
>
> Following is from Ben Dooks note.
>
> =3D=3D=3D
>
> Powerdomain control notes
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>
> Copyright 2010 Simtec Electronics
> Ben Dooks <ben@simtec.co.uk>
>
> Code Review
> -----------
>
> The current implementation makes a number of #ifdef based additions t=
o
> the clock.c which currently lies in plat-s3c/clock.c (but to be moved
> to plat-samsung/clock.c). The following are the observations from rev=
iewing
> the code as presented:
>
> 1) The use of #ifdef is not recommended, as noted before in reviews i=
t
> =C2=A0 makes the code hard to read, allows bugs to creep in due to co=
de
> =C2=A0 either being skipped, and problems when we get to the stage se=
veral
> =C2=A0 conflicting configurations could live in the kernel.

I've been using #ifdef's for enabling/disabling powerdomain and
blockgating control (especially for machines that do not have support
for powerdomain/blockgating). However, it seems to be reasonable that
the #ifdef's are not needed and to be removed.

>
> 2) The code is changing the functionality of the clk_enable() and the
> =C2=A0 clk_disable() calls, which is bad for the following reasons:
>
> =C2=A0 A) Anyone reading or modifying a driver using this API may not=
 see
> =C2=A0 =C2=A0 =C2=A0what is going on underneath.
>
> =C2=A0 B) It ties the clock to the powerdomain, if any of the current=
 drivers
> =C2=A0 =C2=A0 =C2=A0wish to temporarily stop the clock to reduce the =
dynamic power
> =C2=A0 =C2=A0 =C2=A0consumption they cannot (see part A, if all drive=
rs are resting
> =C2=A0 =C2=A0 =C2=A0in the power domain the whole domain may shutdown=
 with a resulting
> =C2=A0 =C2=A0 =C2=A0cost to the work resumption).
>
> =C2=A0 C) It ties the drivers to the specific clock implementation an=
d thus
> =C2=A0 =C2=A0 =C2=A0restricts future use of standard drivers on futur=
e devices.
>
> =C2=A0 D) It ties policy into the kernel, as it forces the power doma=
ins to
> =C2=A0 =C2=A0 =C2=A0shut down if the driver is not in use. The develo=
per or end user
> =C2=A0 =C2=A0 =C2=A0may want to change this depending on either a dev=
ice wide or usage
> =C2=A0 =C2=A0 =C2=A0case. Policy decisions are best left out of the k=
ernel.
>

Um... yes, putting powerdomain/blockgating code at clk_* code is too
invasive to the clk_* code. And it'd be more problematic if we move on
to the common struct clk.

I'll implement powerdomain/blockgating control code
 at arch/arm/mach-s5pv210/clock.c:s5pv210_clk_*_ctrl.

=46or B) and D), we may need to leave an option not to control
powerdomain. How about leaving an option at sysfs if not using
#ifdef's?


>
> Part (1) is a definite barrier to merging, the code whilst functional=
 is
> both ugly and the use of #ifdefs like that are contrary to a number o=
f
> developers beliefs.
>
> The second part is also a stumbling block, as it is likely to be comm=
ented
> upon by a number of interested parties if it did come up for review. =
I am
> certainly not happy to see this sort of invasive change to the clock =
system
> merged. I expect others would also raise objections.
>
> ...
>
> =3D=3D=3D
>
> So need to another approach for it.
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



--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
