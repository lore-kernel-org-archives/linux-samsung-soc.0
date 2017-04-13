From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH] drm/exynos/dsi: fix bridge_node DT parsing
Date: Thu, 13 Apr 2017 10:58:50 +0900
Message-ID: <53efcb13-1fe8-8c4c-9ccf-d3ea669ca454@samsung.com>
References: <CGME20170412072216eucas1p136149c39438639424d3b8ab4f8d548e8@eucas1p1.samsung.com>
 <1491981729-6396-1-git-send-email-a.hajda@samsung.com>
 <b503ffe5-b2e5-2dce-0d1e-73c4a2207977@gmail.com>
 <a6d60da6-54b7-8dd0-b58e-6e45bd14c221@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55409 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755271AbdDMB6t (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 12 Apr 2017 21:58:49 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OOB01HG4S5ZYN10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Apr 2017 10:58:47 +0900 (KST)
In-reply-to: <a6d60da6-54b7-8dd0-b58e-6e45bd14c221@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Hoegeun Kwon <hoegeun.kwon@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, inki.dae@samsung.com, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

On 04/12/2017 11:13 PM, Marek Szyprowski wrote:
> Hi Hoegeun,
>
> On 2017-04-12 15:58, Hoegeun Kwon wrote:
>> On 04/12/2017 04:22 PM, Andrzej Hajda wrote:
>>> DSIM uses MIC bridge which is between DECON and DSIM, so the driver
>>> should expect bridge node on input side.
>>>
>>> Fixes: 86418f9 ("drm: convert drivers to use of_graph_get_remote_node")
>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>> ---
>>>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c 
>>> b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> index dcb50d4d..3ae459f 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> @@ -1659,7 +1659,7 @@ static int exynos_dsi_parse_dt(struct 
>>> exynos_dsi *dsi)
>>>         of_node_put(ep);
>>>   -    dsi->bridge_node = of_graph_get_remote_node(node, 
>>> DSI_PORT_OUT, 0);
>>> +    dsi->bridge_node = of_graph_get_remote_node(node, DSI_PORT_IN, 0);
>>>       if (!dsi->bridge_node)
>>>           return -EINVAL;
>>
>> Hi Andrzej,
>>
>> The of_graph_get_remote_node() does not exist in the kernel.
>> Also this patch  does not apply('git am') on drm-next tree.
>> Is this what you mean?
>>         dsi->bridge_node = of_graph_get_endpoint_by_regs(node, 
>> DSI_PORT_IN, 0);
>>         if (!dsi->bridge_node)
>>                 return -EINVAL;
>
> Please check latest drm-next branch at 
> git://people.freedesktop.org/~airlied/linux.git
>
> Commit 86418f90a4c "drm: convert drivers to use 
> of_graph_get_remote_node" got merged
> via drm-misc tree and Andrzej's patch is a fix for it.

Hi Marek,

I have checked the exynos drm-next branch
at http://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

Sorry, there was a mistake.

Best regards,
Hoegeun

>
> Best regards
