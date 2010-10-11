From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v2 0/6] ARM: S5PV210: Add support S5PV210/S5PC110 CPUFREQ
Date: Mon, 11 Oct 2010 09:11:46 +0900
Message-ID: <AANLkTikJL+94qODxkQGxzEPj0SCS3BA4=XQozJSHCpyR@mail.gmail.com>
References: <1284962695-8542-1-git-send-email-sbkim73@samsung.com>
	<004001cb6605$01ff4f90$05fdeeb0$@com>
	<001501cb66ce$9dc54b40$d94fe1c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:32881 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752515Ab0JKALs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Oct 2010 20:11:48 -0400
Received: by iwn6 with SMTP id 6so2673928iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Oct 2010 17:11:48 -0700 (PDT)
In-Reply-To: <001501cb66ce$9dc54b40$d94fe1c0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hello,

On Fri, Oct 8, 2010 at 6:52 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> Sangbeom Kim wrote:
>>
>> Hi all,
>> I know that there is another S5PV210 CPUFREQ patch from Mr. Ham.
>> But, That patchset seems to have unclear part.
>>
> http://lists.infradead.org/pipermail/linux-arm-kernel/2010-August/023=
626.htm
>> l
>> The part of 'CONFIG_PM' is unclear and still have PM support part.
>> So, I think that this patch is more suitable for S5PV210/S5PC110 CPU=
=46REQ
> in
>> the mainline.
>> because this patch implemented basic pm functionality and already te=
sted
> on
>> smdkv210 board.
>>
> Hi,
>
> So...I'd like to merge this for this merge window.
>
> Mr. Ham, how do you think?
> If any problems or opinions, please let me know.


You can go ahead as long as this patch include features that the
another addresses.


Anyway, the part that is under "CONFIG_PM" is intended to block
frequency changing while PM is doing something. For example, when the
system enters a sleep, if CPUFREQ somehow enters "100MHz/0.95V" just
before the sleep and wakes up, the voltage may stay at 0.95V (PMIC is
not turned off during sleep) while the frequency is reset to 800MHz
(by the bootloader), which requires, let's say, 1.1V. Such
inconsistency may lead to system hang and we have observed such cases
a few times. I intended to refuse any CPUFREQ requests at the
/mach-s5pv210/cpufreq.c when PM seems to start.

It may seem that such feature is not needed if the voltage is not
optimized, however, CPUFREQ is useless if the voltage stays at 1.2V
and if the voltage changes properly according to the frequency, such
feature is required anyway.


ps. Anyway, such feature is also not included in my patch, either. :(
(tried to included, but the code was excluded at the patch patching
the patch.)

>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>> Thanks and regards,
>> S.B. Kim
>>
>> > on Monday, September 20, 2010 3:05 PM, Sangbeom Kim
>> <sbkim73@samsung.com>
>> wrote:
>> >
>> > This patch adds CPUFREQ for S5PV210/S5PC110.
>> >
>> > Changes since v1:
>> >
>> > - Added MOUT_DMC0 and SCLK_DMC0 for checking the dmc0 clock in
>> CPUFREQ
>> > driver.
>> > - Removed hardcoding of DRAM refresh counter.
>> > - Added to calculate refresh counter function based on DRAM operat=
ion
>> freq.
>> >
>> > [PATCH v2 1/6] ARM: S5PV210: Add DMC map_desc table for supporting=
 DMC
>> > access
>> > [PATCH v2 2/6] ARM: S5PV210: Add struct clk_ops for clk_fout_apll
>> > [PATCH v2 3/6] ARM: S5PV210: Add MOUT_DMC0 and SCLK_DMC0 clocks
>> > [PATCH v2 4/6] ARM: S5PV210: Add Register definition for CMU
>> > [PATCH v2 5/6] ARM: S5PV210: Add support CPUFREQ
>> > [PATCH v2 6/6] ARM: S5PV210: Update Kconfig and Makefile for suppo=
rting
>> > CPUFREQ driver
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe linux-sa=
msung-
>> > soc" in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info=
=2Ehtml
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
