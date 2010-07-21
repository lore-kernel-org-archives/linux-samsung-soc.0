From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v3 1/7] ARM: S5PV210: Add a Kconfig entry
	"S5PC110_EVT0_WORKAROUND"
Date: Wed, 21 Jul 2010 10:13:30 +0900
Message-ID: <AANLkTikaUugKaDFCHW234eWLPn7KnV-wudeNY2-KwWR0@mail.gmail.com>
References: <1279517483-22751-1-git-send-email-myungjoo.ham@samsung.com>
	<1279517483-22751-2-git-send-email-myungjoo.ham@samsung.com>
	<4C464127.5040405@simtec.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:45137 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761926Ab0GUBNd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jul 2010 21:13:33 -0400
Received: by iwn7 with SMTP id 7so6265353iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Jul 2010 18:13:31 -0700 (PDT)
In-Reply-To: <4C464127.5040405@simtec.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@simtec.co.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

On Wed, Jul 21, 2010 at 9:36 AM, Ben Dooks <ben@simtec.co.uk> wrote:
> On 07/19/10 06:31, MyungJoo Ham wrote:
>>
>> Early S5PC110 (EVT0) chip had some issues required workaround from a
>> kernel. We can add such workaround codes with this Kconfig entry.
>>
>> Signed-off-by: MyungJoo Ham<myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>> ---
>> =C2=A0arch/arm/mach-s5pv210/Kconfig | =C2=A0 =C2=A07 +++++++
>> =C2=A01 files changed, 7 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/K=
config
>> index 631019a..18802e7 100644
>> --- a/arch/arm/mach-s5pv210/Kconfig
>> +++ b/arch/arm/mach-s5pv210/Kconfig
>> @@ -101,4 +101,11 @@ config MACH_SMDKC110
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machine support for Samsung SMDKC1=
10
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S5PC110(MCP) is one of package opt=
ion of S5PV210
>>
>> +config S5PC110_EVT0_WORKAROUND
>> + =C2=A0 =C2=A0 =C2=A0 bool "S5PC110 Early Chip Workaround (EVT0)"
>> + =C2=A0 =C2=A0 =C2=A0 help
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Early S5PC110 (so called EVT0) has err=
ata items that should be
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 addressed; otherwise the kernel may pa=
nic or be locked up.
>> Enable
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 this option to execute workaround inst=
ructions.
>> +
>> =C2=A0endif
>
> What happens for non EVT0, is the a performance issue or is it exclus=
ive?
>

This S5PC110_EVT0_WORKAROUND addresses issues (erratic behaviors, not
performance issues) of "EVT-0" revisions, which is exclusive for these
EVT-0 only. They do not apply to the later (EVT-1 and so on) chips.



--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
