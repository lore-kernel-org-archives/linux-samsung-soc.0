From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v3 1/7] ARM: S5PV210: Add a Kconfig entry
	"S5PC110_EVT0_WORKAROUND"
Date: Thu, 22 Jul 2010 09:57:36 +0900
Message-ID: <AANLkTinV8lnFUd5aD5gQSZ9MauUq1LW8PCamZVo03B-m@mail.gmail.com>
References: <1279517483-22751-1-git-send-email-myungjoo.ham@samsung.com>
	<1279517483-22751-2-git-send-email-myungjoo.ham@samsung.com>
	<4C464127.5040405@simtec.co.uk>
	<AANLkTikaUugKaDFCHW234eWLPn7KnV-wudeNY2-KwWR0@mail.gmail.com>
	<4C46DE37.5060105@simtec.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:54294 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751170Ab0GVA5i convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jul 2010 20:57:38 -0400
Received: by iwn7 with SMTP id 7so7310645iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Jul 2010 17:57:37 -0700 (PDT)
In-Reply-To: <4C46DE37.5060105@simtec.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@simtec.co.uk>
Cc: kgene.kim@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Wed, Jul 21, 2010 at 8:47 PM, Ben Dooks <ben@simtec.co.uk> wrote:
> On 21/07/10 02:13, MyungJoo Ham wrote:
>> On Wed, Jul 21, 2010 at 9:36 AM, Ben Dooks <ben@simtec.co.uk> wrote:
>>> On 07/19/10 06:31, MyungJoo Ham wrote:
>>>>
>>>> Early S5PC110 (EVT0) chip had some issues required workaround from=
 a
>>>> kernel. We can add such workaround codes with this Kconfig entry.
>>>>
>>>> Signed-off-by: MyungJoo Ham<myungjoo.ham@samsung.com>
>>>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>>>> ---
>>>> =C2=A0arch/arm/mach-s5pv210/Kconfig | =C2=A0 =C2=A07 +++++++
>>>> =C2=A01 files changed, 7 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210=
/Kconfig
>>>> index 631019a..18802e7 100644
>>>> --- a/arch/arm/mach-s5pv210/Kconfig
>>>> +++ b/arch/arm/mach-s5pv210/Kconfig
>>>> @@ -101,4 +101,11 @@ config MACH_SMDKC110
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machine support for Samsung SMDK=
C110
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S5PC110(MCP) is one of package o=
ption of S5PV210
>>>>
>>>> +config S5PC110_EVT0_WORKAROUND
>>>> + =C2=A0 =C2=A0 =C2=A0 bool "S5PC110 Early Chip Workaround (EVT0)"
>>>> + =C2=A0 =C2=A0 =C2=A0 help
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Early S5PC110 (so called EVT0) has e=
rrata items that should be
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 addressed; otherwise the kernel may =
panic or be locked up.
>>>> Enable
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 this option to execute workaround in=
structions.
>>>> +
>>>> =C2=A0endif
>>>
>>> What happens for non EVT0, is the a performance issue or is it excl=
usive?
>>>
>>
>> This S5PC110_EVT0_WORKAROUND addresses issues (erratic behaviors, no=
t
>> performance issues) of "EVT-0" revisions, which is exclusive for the=
se
>> EVT-0 only. They do not apply to the later (EVT-1 and so on) chips.
>
> Ok, so does the fix work for just EVT0? Does it exclude supporting ot=
her
> EVT sillicon as well?

Yes, it works only for EVT0, not for EVT1 or later revisions. When
it's enabled, it does not support EVT1 or others.

However, in the next revision of patches, the EVT determination is
done at run-time, not at compile-time.

>
> --
> Ben
>
>
>
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
