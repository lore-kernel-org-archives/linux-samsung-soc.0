From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH V2 6/7] ARM: EXYNOS5: Add the bus clock for FIMD
Date: Tue, 24 Jul 2012 10:55:47 +0900
Message-ID: <500E00A3.8080203@samsung.com>
References: <1342591053-7092-1-git-send-email-l.krishna@samsung.com>
 <1342591053-7092-7-git-send-email-l.krishna@samsung.com>
 <500D0C8B.3080007@samsung.com> <500D1F59.9030807@samsung.com>
 <000301cd6928$e5021660$af064320$%han@samsung.com>
 <500DE22F.5010006@samsung.com>
 <000601cd692e$b2ba7a70$182f6f50$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:26892 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755091Ab2GXBzg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jul 2012 21:55:36 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7N00AH16OHDPH0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Jul 2012 10:55:34 +0900 (KST)
Received: from [10.90.51.60] by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0M7N00IHP6OMO7V0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Jul 2012 10:55:34 +0900 (KST)
In-reply-to: <000601cd692e$b2ba7a70$182f6f50$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Leela Krishna Amudala' <l.krishna@samsung.com>, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, joshi@samsung.com, grant.likely@secretlab.ca, linux-samsung-soc@vger.kernel.org, thomas.ab@samsung.com, olofj@google.com, linux-arm-kernel@lists.infradead.org

On 07/24/2012 08:55 AM, Jingoo Han wrote:
> On Tuesday, July 24, 2012 8:46 AM, Joonyoung Shim Wrote:
>> On 07/24/2012 08:14 AM, Jingoo Han wrote:
>>> On Monday, July 23, 2012 6:55 PM, Joonyoung Shim wrote:
>>>> Hi, Jingoo.
>>>>
>>>> On 07/23/2012 05:34 PM, Joonyoung Shim wrote:
>>>>> On 07/18/2012 02:57 PM, Leela Krishna Amudala wrote:
>>>>>> This patch adds the bus clock for FIMD and changes
>>>>>> the device name for lcd clock
>>>>> Please refer below patch for exynos4.
>>>>>
>>>>> http://lists.linaro.org/pipermail/linaro-dev/2011-December/008872.html
>>>>>
>>>>>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>>>>>> ---
>>>>>>     arch/arm/mach-exynos/clock-exynos5.c |    7 ++++++-
>>>>>>     1 files changed, 6 insertions(+), 1 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm/mach-exynos/clock-exynos5.c
>>>>>> b/arch/arm/mach-exynos/clock-exynos5.c
>>>>>> index 774533c..f001876 100644
>>>>>> --- a/arch/arm/mach-exynos/clock-exynos5.c
>>>>>> +++ b/arch/arm/mach-exynos/clock-exynos5.c
>>>>>> @@ -634,6 +634,11 @@ static struct clk exynos5_init_clocks_off[] = {
>>>>>>             .enable        = exynos5_clk_ip_disp1_ctrl,
>>>>>>             .ctrlbit    = (1 << 3),
>>>>>>         }, {
>>>>>> +        .name           = "fimd",
>>>>>> +        .devname        = "exynos5-fb",
>>>>>> +        .enable         = exynos5_clk_ip_disp1_ctrl,
>>>>>> +        .ctrlbit        = (1 << 0),
>>>>>> +    }, {
>>>> With this patch, it causes below error at the DP driver because fimd
>>>> clock is disabled.
>>>>
>>>> [    0.210000] exynos-dp exynos-dp: Timeout of video streamclk ok
>>>> [    0.210000] exynos-dp exynos-dp: unable to config video
>>>> [    0.210000] exynos-dp: probe of exynos-dp failed with error -110
>>>>
>>>> I wonder fimd clock has any dependency with DP
>>> FIMD pixel clock is necessary to enable DP.
>> So then, i think DP driver also should control FIMD pixel clock.
>> Do you have any patch or plan for it?
> Um, I don't think so.
> Because, DP cannot work by itself.
> In order to use DP, FIMD should be enabled.
>
> If FIMD is enabled, FIMD pixel clock is enabled;
> therefore, DP driver does not need to control FIMD pixel clock.

Why does DP driver have FIMD driver dependency? Also for this, it needs
FIMD driver is probed earlier then DP driver.  We cannot decide driver
probe order if they are same level drivers and itself is weird
condition.  Although there is hardware dependency, DP and FIMD driver
don't have any code relations. They are each other drivers. But DP
needs FIMD pixel clock and because the clock can be control at the
several drivers and the clock framework exists for that, then i think
it's better DP driver also control FIMD pixel clock.

>
> In my opinion, adding config dependency would be better, such as FB_S3C or DRM_EXYNOS_FIMD.

I think this is not solution. How do you ensure FIMD driver is probed
earlier than DP driver? Even if it's possible, when FIMD driver only
controls pixel clock, DP driver will execute any operations regardless
status of FIMD pixel clock, so if FIMD driver turns off pixel clock,
then DP will occur any error.
