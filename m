From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 5/5] [CPUFREQ] EXYNOS4210: Add support ASV feature
Date: Mon, 7 Nov 2011 13:23:11 +0900
Message-ID: <CAJ0PZbQ2OLKwOtFA_d+u1jrnZ+aF5xT83OzVYv3w4iUuWTZBiA@mail.gmail.com>
References: <005801cc995c$fee5dd60$fcb19820$%kim@samsung.com>
	<CAJ0PZbQEHXpRdCkcAwNwtK7AmH=nxG+KjOcw91gwagAvFr_pxA@mail.gmail.com>
	<02e001cc9b59$d09ff400$71dfdc00$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:44380 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751104Ab1KGEXN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 6 Nov 2011 23:23:13 -0500
In-Reply-To: <02e001cc9b59$d09ff400$71dfdc00$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, davej@redhat.com, Jaecheol Lee <jc.lee@samsung.com>

On Sat, Nov 5, 2011 at 10:25 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> MyungJoo Ham wrote:
>>
>> Hello,
>>
> Hi,
>
> I got the comments from Jaecheol Lee but his mail client has some pro=
blem so
> I'm sending instead.
>
>> On Wed, Nov 2, 2011 at 9:43 PM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
>> []
>> > +static void __init set_volt_table(void)
>> > +{
>> > + =A0 =A0 =A0 unsigned int tmp, i, asv_group =3D 0;
>> > +
>> > + =A0 =A0 =A0 tmp =3D __raw_readl(S5P_INFORM2);
>>
>> As I've mentioned in the ASV patch thread, do we really need to use =
an
>> INFORM register simply to save the id of supported voltage ranges?
>>
>> Why aren't we using an extern variable here? For example, "extern in=
t
>> asv_group_id;" and define it at "asv.h" or somewhere else.
>>
>> At reboot, we are going to init ASV driver and will get the ASV valu=
e
>> again; thus, we don't need to use such a preserving register anyway.
>> At suspend/resume, the value in RAM does not disappear and the IPL
>> does not care this value; thus, it is meaningless to use INFORM2 for
>> this value.
>>
> ASV feature had been implemented in bootloader hence inform register =
was
> used to return the result value to cpufreq driver. If there is no pro=
blem to
> use the inform register why don't you keep this manner.

The concern is that
1. INFORM2 is a hard-to-read special register, not a reader-friendly
variable. A variable such as "extern int exynos4_asv_value" is much
easier for readers.
2. We are not using such a special-purpose bootloader and we can't
sure which bootloader is being used often.
3. Other device drivers will start using this ASV value (such as
/drivers/devfreq/exynos4210-busfreq.c). Having such machine/bootloader
specific register addresses in a device driver really doesn't look
good. Also, we will be able to share the variable name for other SoCs
depending on how we name it; Exynos4xxx or more.


Thank you.



Cheers!
MyungJoo

>
> (snip)
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
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
