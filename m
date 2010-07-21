From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v3 1/7] ARM: S5PV210: Add a Kconfig entry
	"S5PC110_EVT0_WORKAROUND"
Date: Wed, 21 Jul 2010 22:51:32 +0900
Message-ID: <AANLkTikbou_klg7xeGTk42HsKQJIJa5sbFIwpNQzk5eJ@mail.gmail.com>
References: <1279517483-22751-1-git-send-email-myungjoo.ham@samsung.com>
	<1279517483-22751-2-git-send-email-myungjoo.ham@samsung.com>
	<4C464127.5040405@simtec.co.uk>
	<AANLkTikaUugKaDFCHW234eWLPn7KnV-wudeNY2-KwWR0@mail.gmail.com>
	<4C46DE37.5060105@simtec.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:42353 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753670Ab0GUNvd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jul 2010 09:51:33 -0400
Received: by vws14 with SMTP id 14so1624275vws.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Jul 2010 06:51:33 -0700 (PDT)
In-Reply-To: <4C46DE37.5060105@simtec.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@simtec.co.uk>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

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
>>>> =A0arch/arm/mach-s5pv210/Kconfig | =A0 =A07 +++++++
>>>> =A01 files changed, 7 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210=
/Kconfig
>>>> index 631019a..18802e7 100644
>>>> --- a/arch/arm/mach-s5pv210/Kconfig
>>>> +++ b/arch/arm/mach-s5pv210/Kconfig
>>>> @@ -101,4 +101,11 @@ config MACH_SMDKC110
>>>> =A0 =A0 =A0 =A0 =A0Machine support for Samsung SMDKC110
>>>> =A0 =A0 =A0 =A0 =A0S5PC110(MCP) is one of package option of S5PV21=
0
>>>>
>>>> +config S5PC110_EVT0_WORKAROUND
>>>> + =A0 =A0 =A0 bool "S5PC110 Early Chip Workaround (EVT0)"
>>>> + =A0 =A0 =A0 help
>>>> + =A0 =A0 =A0 =A0 Early S5PC110 (so called EVT0) has errata items =
that should be
>>>> + =A0 =A0 =A0 =A0 addressed; otherwise the kernel may panic or be =
locked up.
>>>> Enable
>>>> + =A0 =A0 =A0 =A0 this option to execute workaround instructions.
>>>> +
>>>> =A0endif
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

Mr. Ham will reply it.

As I know "yes", just FYI now Mr. Ham works on it. you can see it
http://git.infradead.org/users/kmpark/linux-2.6-samsung clock and
cpufreq branch.

If you have a good idea, give your opinions.

Thank you,
Kyungmin Park
