From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v5 3/5] drm/exynos: dsi: Fix the parse_dt function
Date: Tue, 28 Mar 2017 17:26:32 +0900
Message-ID: <58DA1E38.50907@samsung.com>
References: <1488948852-5380-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170308045502epcas1p2d2f7a0f768082b7a54b2ebe260e78436@epcas1p2.samsung.com>
 <1488948852-5380-4-git-send-email-hoegeun.kwon@samsung.com>
 <93e79e92-a102-e931-8d63-843031848888@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:33367 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754679AbdC1I0g (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 04:26:36 -0400
In-reply-to: <93e79e92-a102-e931-8d63-843031848888@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>, jy0922.shim@samsung.com, sw0312.kim@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: javier@osg.samsung.com, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, a.hajda@samsung.com, andi.shyti@samsung.com, LW@KARO-electronics.de

Merged.

Thanks,
Inki Dae

2017년 03월 22일 10:36에 Hoegeun Kwon 이(가) 쓴 글:
> Hi inki,
> 
> Could you check the this patch?
> For reference, patch 1/5 and 2/5 have already been applied to Krzysztof tree.
> 
> Best regards,
> Hoegeun
> 
> 
> On 03/08/2017 01:54 PM, Hoegeun Kwon wrote:
>> The dsi + panel is a parental relationship, so OF grpah is not needed.
>> Therefore, the current dsi_parse_dt function will throw an error,
>> because there is no linked OF graph for the case fimd + dsi + panel.
>>
>> Parse the Pll burst and esc clock frequency properties in dsi_parse_dt()
>> and create a bridge_node only if there is an OF graph associated with dsi.
>>
>> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
>> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
>> Reviewed-by: Andi Shyti <andi.shyti@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 32 ++++++++------------------------
>>   1 file changed, 8 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> index f5c04d0..2d4e118 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> @@ -1652,39 +1652,23 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
>>       if (ret < 0)
>>           return ret;
>>   -    ep = of_graph_get_endpoint_by_regs(node, DSI_PORT_OUT, 0);
>> -    if (!ep) {
>> -        dev_err(dev, "no output port with endpoint specified\n");
>> -        return -EINVAL;
>> -    }
>> -
>> -    ret = exynos_dsi_of_read_u32(ep, "samsung,burst-clock-frequency",
>> +    ret = exynos_dsi_of_read_u32(node, "samsung,burst-clock-frequency",
>>                        &dsi->burst_clk_rate);
>>       if (ret < 0)
>> -        goto end;
>> +        return ret;
>>   -    ret = exynos_dsi_of_read_u32(ep, "samsung,esc-clock-frequency",
>> +    ret = exynos_dsi_of_read_u32(node, "samsung,esc-clock-frequency",
>>                        &dsi->esc_clk_rate);
>>       if (ret < 0)
>> -        goto end;
>> -
>> -    of_node_put(ep);
>> +        return ret;
>>         ep = of_graph_get_next_endpoint(node, NULL);
>> -    if (!ep) {
>> -        ret = -EINVAL;
>> -        goto end;
>> -    }
>> -
>> -    dsi->bridge_node = of_graph_get_remote_port_parent(ep);
>> -    if (!dsi->bridge_node) {
>> -        ret = -EINVAL;
>> -        goto end;
>> +    if (ep) {
>> +        dsi->bridge_node = of_graph_get_remote_port_parent(ep);
>> +        of_node_put(ep);
>>       }
>> -end:
>> -    of_node_put(ep);
>>   -    return ret;
>> +    return 0;
>>   }
>>     static int exynos_dsi_bind(struct device *dev, struct device *master,
> 
> -- 
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
