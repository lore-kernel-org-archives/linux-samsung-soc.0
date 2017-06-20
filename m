From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v2] drm/exynos/dsi: Remove error handling for
 bridge_node DT parsing
Date: Tue, 20 Jun 2017 13:51:50 +0900
Message-ID: <435f9640-379d-acfd-a445-50a2894a1259@samsung.com>
References: <CGME20170614063359epcas5p46658bba447468cd367d0684bd9485bf8@epcas5p4.samsung.com>
        <1497422020-8810-1-git-send-email-hoegeun.kwon@samsung.com>
        <e8ea4c40-4065-54de-7277-26c236bab36a@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14474 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750808AbdFTEvv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Jun 2017 00:51:51 -0400
In-reply-to: <e8ea4c40-4065-54de-7277-26c236bab36a@math.uni-bielefeld.de>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org
Cc: javier@osg.samsung.com, a.hajda@samsung.com, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Hello Tobias,

Sorry for late reply.

On 06/14/2017 09:30 PM, Tobias Jakobi wrote:
> Hello Hoegeun,
>
> my last question (does this regress the case "node required, but
> absent") still stands.
>
>
> Hoegeun Kwon wrote:
>> Remove the error handling of bridge_node because the bridge_node is
>> required optionally.
> I don't think a construction like that exists. Either it's required, or
> it's optional. "required optionally" makes no sense to me (but I'm not a
> native speaker).
>
> - Tobias

The bridge_node is optional.
I will change commit message and send ver3 patch.

Best regards,
Hoegeun

>
>
>> For example, In case of Exynos SoC, a bridge device such as mDNIe and
>> MIC could be placed between Display Controller and MIPI DSI device but
>> the bridge device is required optionally.
>>
>> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
>> ---
>>
>> Hi Inki and Tobias,
>>
>> Thanks for your review.
>>
>> Changes for V2:
>> - Modified the commit message in more detail than before.
>>
>> Best Regards,
>> Hoegeun
>>
>>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> index a11b795..6ee0dac 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> @@ -1651,8 +1651,6 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
>>   		return ret;
>>   
>>   	dsi->bridge_node = of_graph_get_remote_node(node, DSI_PORT_IN, 0);
>> -	if (!dsi->bridge_node)
>> -		return -EINVAL;
>>   
>>   	return 0;
>>   }
>>
>
>
>
