From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [RE-SEND] [PATCH 3/4] s3c-fb: Add support EXYNOS4 FIMD
Date: Wed, 15 Jun 2011 15:34:40 +0530
Message-ID: <BANLkTi=K6SJ-Scnr6wBojFaWQMZQK6YT3w@mail.gmail.com>
References: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
	<1307693723-14971-4-git-send-email-anand.kn@samsung.com>
	<4DF39A92.5050609@gmail.com>
	<BANLkTinuAnaoo2hA6MLBDncXxXtL8NO2pg@mail.gmail.com>
	<4DF866D9.7090406@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:53190 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753098Ab1FOKEl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2011 06:04:41 -0400
Received: by qwk3 with SMTP id 3so104861qwk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jun 2011 03:04:40 -0700 (PDT)
In-Reply-To: <4DF866D9.7090406@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Sylwester Nawrocki <snjw23@gmail.com>, Anand Kumar N <anand.kn@samsung.com>, lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com, linux@arm.linux.org.uk

On 15 June 2011 13:31, Sylwester Nawrocki <s.nawrocki@samsung.com> wrot=
e:
> Hi Thomas,
>
> On 06/15/2011 08:14 AM, Thomas Abraham wrote:
>> Hi Sylwester,
>>
>> On 11 June 2011 22:10, Sylwester Nawrocki <snjw23@gmail.com> wrote:
>>> Hello,
>>>
>>> On 06/10/2011 10:15 AM, Anand Kumar N wrote:
>>>> From: Jonghun Han<jonghun.han@samsung.com>
>>>>
>>>> This patch adds struct s3c_fb_driverdata s3c_fb_data_exynos4 for E=
XYNOS4.
>>>> The clk_type is added to distinguish clock type in it and lcd_clk =
is added
>>>> in structure s3c_fb to calculate divider for lcd panel.

<snip>

>>
>> Sorry, I am not quite sure if I understand the problem here. For
>> instance, all Samsung SoC's and each instance of i2c device in a SoC=
,
>> use the same con_id for the i2c 'struct clock' instance. The con_id =
is
>> 'i2c'. The i2c driver uses the con_id 'i2c' to lookup the 'struct
>> clock' instance and it works for all Samsung SoC's and all instances
>> of i2c device in the SoC.
>>
>> Is your point different than what I understand? Please help.
>
> I appreciate your efforts in converting all Samsung platforms to clkd=
ev.
>
> With the above I2C example I was trying to illustrate the additional
> level of indirection that is present in case of OMAP clock mappings,
> comparing to your implementation.
> As long as IP clock names are same among various SoC there is no issu=
e
> at all with your clk lookup approach.
> But this is already not the case with LCD controller IP.
> On S3C series the IP bus clock name is "lcd" while on S5P series it's=
 "fimd".
> There is a common framebuffer driver for S3C and S5P SoCs.
> It just does not look right to me to be adding in the driver switch/c=
ase
> for the clock names. I thought clkdev is meant to resolve such differ=
ences.
>
> Then how it would be possible to map those clocks into single con_id =
with
> your patches? E.g.
>
> S3C clk | S5P =A0clk | con_id
> ---------------------------
> =A0"lcd" =A0| "fimd" =A0 | "lcd" ?

Ok. Thanks for clarifying this point. In this case, maybe we could use
the clk_add_alias API. With this API, we can have a instance of clock
by name 'fimd' and then create a clkdev alias by name 'lcd' in the
machine code. The driver can then continue to lookup with 'lcd' as the
con_id.

I understand that this is just a workaround. The real problem lies in
the fact that the clock name have not been consistent across various
SoC's.

Thanks,
Thomas.

>
> I believe there will come more differences like that in the future.
>
> Regards,
> Sylwester
>
>> Thanks,
>> Thomas.
>>>
>>> That said I wouldn't go for a "devname" in struct clk, just create
>>> an additional table matching device names, con_id and struct clk an=
d
>>> use it while registering clk_lookup items into clkdev.
> ...
>>> [1] http://www.spinics.net/lists/arm-kernel/msg127901.html
>>> =A0 =A0http://www.spinics.net/lists/arm-kernel/msg127907.html
>
