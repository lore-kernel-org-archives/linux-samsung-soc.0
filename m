From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [RFC] drm/exynos: move hdmi clk disable out of pm ops
Date: Fri, 30 Jan 2015 17:27:46 +0900
Message-ID: <54CB4082.1000005@samsung.com>
References: <CABxcv=nNKrF45TL3_1BZHMzfKj1xPm6TzUGRSZ3WgJxzyUSmxQ@mail.gmail.com>
 <1422538273-3097-1-git-send-email-gustavo@padovan.org>
 <54CAE64A.2040906@samsung.com>
 <CABxcv=n7=ujyOoy1rTL-SQg=-hnCXVHbLX_npp5tn5BpTYFTZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17590 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752519AbbA3I2N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Jan 2015 03:28:13 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NIZ009B2E6XOK20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Jan 2015 17:28:10 +0900 (KST)
In-reply-to: <CABxcv=n7=ujyOoy1rTL-SQg=-hnCXVHbLX_npp5tn5BpTYFTZA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Gustavo Padovan <gustavo@padovan.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <liquid.acid@gmx.net>, Inki Dae <inki.dae@samsung.com>, Prathyush K <prathyush.k@samsung.com>, Kukjin Kim <kgene@kernel.org>

Hi Javier,

On 01/30/2015 05:03 PM, Javier Martinez Canillas wrote:
> Hello Joonyoung,
> 
> On Fri, Jan 30, 2015 at 3:02 AM, Joonyoung Shim <jy0922.shim@samsung.com> wrote:
>> +Cc Kukjin,
>>
>> Hi,
>>
>> On 01/29/2015 10:31 PM, Gustavo Padovan wrote:
>>> From: Prathyush K <prathyush.k@samsung.com>
>>>
>>> When VPLL clock of less than 140 MHz was used and all the three
>>> clocks - hdmiphy, hdmi, sclk_hdmi are disabled, the system hangs
>>> during S2R when HDMI is connected. Since we want to use a vpll
>>> clock of 70.5 MHz, we cannot disable these 3 clocks before suspending.
>>> This patch moves the clk enable/disable of hdmi and sclk_hdmi
>>> outside of the pm ops. Now system suspends and resumes with HDMI
>>> connected with VPLL set at 70.5 MHz.
>>>
>>> Signed-off-by: Prathyush K <prathyush.k@samsung.com>
>>> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
>>> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>>
>>> ---
>>> This work depends on the HDMI support patches from Javier:
>>> https://lkml.org/lkml/2015/1/20/235
>>>
>>> This patch comes from a downstream tree (Google chormeOS) and it is
>>> authored by a Samsung employee, but we still think this may not fix
>>> the real cause of the bug, there might be something else that we
>>> haven't found that could be the cause of this issue. Anyone has some
>>> comment to add here?
>>
>> Hmm, do you test from which exynos SoC?
>>
> 
> I haven't the S2R case since it is broken in mainline for Exynos5420
> (even with $subject applied) but $subject fixes for me the system
> crash we have discussed before [0]. That is when mixer_poweron() tries
> to access the mixer register without hdmi_poweron() enabling the
> "hdmi" clock.
> 
>> Kukjin, if it is hw issue, do you know hw experts of exynos hdmi and
>> could we get any advice?
>>
> 
> It would be great if someone can shed some light on both issues.
> 
>>> ---
>>>  drivers/gpu/drm/exynos/exynos_hdmi.c | 17 +++++++++++------
>>>  1 file changed, 11 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
>>> index 6aa0d65..7a473cb 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>>> @@ -2064,9 +2064,6 @@ static void hdmi_poweron(struct exynos_drm_display *display)
>>>       regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
>>>                       PMU_HDMI_PHY_ENABLE_BIT, 1);
>>>
>>> -     clk_prepare_enable(res->hdmi);
>>> -     clk_prepare_enable(res->sclk_hdmi);
>>> -
>>>       hdmiphy_poweron(hdata);
>>>       hdmi_commit(display);
>>>  }
>>> @@ -2088,9 +2085,6 @@ static void hdmi_poweroff(struct exynos_drm_display *display)
>>>
>>>       cancel_delayed_work(&hdata->hotplug_work);
>>>
>>> -     clk_disable_unprepare(res->sclk_hdmi);
>>> -     clk_disable_unprepare(res->hdmi);
>>> -
>>>       /* reset pmu hdmiphy control bit to disable hdmiphy */
>>>       regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
>>>                       PMU_HDMI_PHY_ENABLE_BIT, 0);
>>> @@ -2254,6 +2248,14 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
>>>       } else
>>>               res->reg_hdmi_en = NULL;
>>>
>>> +     /*
>>> +      * These two clocks are not moved into hdmi_poweron/off since system
>>> +      * fails to suspend if VPLL clock of 70.5 MHz is used and these
>>> +      * clocks are disabled before suspend. So enable them here.
>>> +      */
>>> +     clk_prepare_enable(res->sclk_hdmi);
>>> +     clk_prepare_enable(res->hdmi);
>>> +
>>
>> Then twe clocks are turned on always. I don't think it's reasonable.
>>
> 
> Agreed that it would be better to gate/ungate the clocks as necessary
> to reduce power consumption but OTOH is better to leave some clocks
> enabled to avoid system crashes. Of course it would be even better to
> understand the root cause and fix it.
> 

It's ok to me if we apply workaround only about exynos5420 hdmi case.

Thanks.
