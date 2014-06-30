From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH V3 1/7] drm/exynos: Support DP CLKCON register in FIMD driver
Date: Tue, 1 Jul 2014 01:09:35 +0900
Message-ID: <CAAQKjZPCWhqY=adpg+9wWOxBEhLpuguEZaRuGv4GCxyyGatjcg@mail.gmail.com>
References: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
	<1403863946-15492-2-git-send-email-ajaykumar.rs@samsung.com>
	<53AD53E4.2020706@samsung.com>
	<CAEC9eQMXEEq_VBiZY+BHUuVWvbi7q4MkbbQ-XkcigtZBdgwO9w@mail.gmail.com>
	<53AD6734.9080909@samsung.com>
	<CAEC9eQPY+W_Wni7PLtWkHr0QrHW+G8x_+XWapV5tDiKebn=zpA@mail.gmail.com>
	<00a501cf9400$9d396950$d7ac3bf0$%han@samsung.com>
	<53B0F634.7090200@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:53227 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754626AbaF3QJg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 12:09:36 -0400
In-Reply-To: <53B0F634.7090200@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Jingoo Han <jg1.han@samsung.com>, Ajay kumar <ajaynumb@gmail.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, dri-devel@lists.freedesktop.org, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

2014-06-30 14:31 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
> On 06/30/2014 03:14 AM, Jingoo Han wrote:
>> On Friday, June 27, 2014 10:03 PM, Ajay kumar wrote:
>>> On Fri, Jun 27, 2014 at 6:14 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:
>>>> On 06/27/2014 01:48 PM, Ajay kumar wrote:
>>>>> On Fri, Jun 27, 2014 at 4:52 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:
>>>>>> +CC DT
>>>>>>
>>>>>> On 06/27/2014 12:12 PM, Ajay Kumar wrote:
>>>>>>> Add the missing setting for DP CLKCON register.
>>>>>>>
>>>>>>> This register is present on Exynos5 based FIMD controllers,
>>>>>>> and needs to be set if we are using DP.
>>>>>>>
>>>>>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>>>>>>> ---
>>>>>>>  .../devicetree/bindings/video/samsung-fimd.txt     |    1 +
>>>>>>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   23 ++++++++++++++++++++
>>>>>>>  include/video/samsung_fimd.h                       |    4 ++++
>>>>>>>  3 files changed, 28 insertions(+)
>> [.....]
>>
>>>>>>>  static const struct of_device_id fimd_driver_dt_match[] = {
>>>>>>> @@ -331,6 +341,10 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
>>>>>>>       if (clkdiv > 1)
>>>>>>>               val |= VIDCON0_CLKVAL_F(clkdiv - 1) | VIDCON0_CLKDIR;
>>>>>>>
>>>>>>> +     if (ctx->driver_data->has_dp_clkcon &&
>>>>>>> +             ctx->exynos_fimd_output_type == EXYNOS_FIMD_OUTPUT_DP)
>>>>>>> +             writel(DP_CLK_ENABLE, ctx->regs + DP_CLKCON);
>>>>>>> +
>>>>>>>       writel(val, ctx->regs + VIDCON0);
>>>> New code should not split VIDCON0 related code.It should be moved few
>>>> lines above or few lines below.
>>> Ok, for better readability.
>>>
>>>> Anyway this code should be rather placed in power related functions of
>>>> dp encoder, as it enables dp. The only question
>>>> is if DP_CLKCON update can be performed after VIDCON0 update. If yes the
>>>> solution of the whole problem
>>> I will check this.
>>>
>>>> seems to be simple:
>>>> - fimd should provide function fimd_set_dp_clk_gate or sth similar,
>>>> - this function should be called in exynos_dp_poweron/exynos_dp_poweroff.
>>>> I hope I have not missed anything this time.
>>> But, it won't look good to export a FIMD function which sets a FIMD register,
>>> and call it in DP driver!
>>> What does Inki/Jingoo have to say about this?
>> I agree with Ajay Kumar's opinion.
>> It doesn't look good to export the function to set FIMD register
>> and call it by DP driver.
>
> DP_CLKCON HW register shows clearly there is direct hardware dependency
> between DP and FIMD.
> Reflecting this dependency in drivers is just a consequence of HW design.

Right, and I cannot understand why mDNIe and DP clock enable bit
exists in FIMD ip. :(

> Moreover the register gates also clock for MDNIE, this solution can be
> used there as well.
>
> Anyway the most important is that we should avoid adding DT bindings for
> things we can evaluate in drivers.
>

It wouldn't be best way only to avoid adding DT binding. DT binding
could be good way to handle complicated hardware pipelines if needed.
Of course, if driver can handle it simply, it would be better to avoid
adding DT binding. However, Exynos SoC are complicated.

Exynos SoC have more IPs to should be considered; SMIES, mDNIe and MIE
as image enhancement devices, and eDP, MIPI-DSI, and DPI (FIMD
connected to panel directly) as Display bus devices and parallel panel
device. And image enhancement device and Display bus device can be
used together.

FIMD -------- Panel
FIMD -------- Display bus device -------- Panel
FIMD -------- image enhancement device -------- Panel
FIMD -------- image enhancement device -------- FIMD-Lite -------- Panel
FIMD -------- image enhancement device -------- Display bus device
-------- Panel
FIMD -------- image enhancement device -------- FIMD-Lite --------
Display bus device -------- Panel

And Display bus devices and parallel device couldn't be switched in
runtime since kernel has been booted. However, image enhancement
devices can be enabled or disabled in runtime so the output path of
FIMD can be changed to another path dynamically - actually, I had
handled such scenarios. So if Exynos drm driver should be considered
for above all cases, it'd make Eyxnos drm driver too complicated.

If DT people and other SoC maintainers give us your opinions, it would
be helpful for us. I will look into other SoC how they are handling
similar cases.

Thanks,
Inki Dae

> Regards
> Andrzej
>
>>
>> Best regards,
>> Jingoo Han
>>> Regards,
>>> Ajay
>>>
>> [....]
>>
>>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
