From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm: exynos: dsi: release DSI_PORT_OUT node right after
 of_drm_find_bridge()
Date: Tue, 27 Jun 2017 18:13:03 +0900
Message-ID: <5952219F.1030902@samsung.com>
References: <CGME20170626004946epcas4p40785020666ae6d43476822d067604baa@epcas4p4.samsung.com>
        <20170624005628.5896-1-shuahkh@osg.samsung.com>
        <5d308e03-e92a-7bac-f65e-23c2ccbe161a@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:61039 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751504AbdF0JNH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Jun 2017 05:13:07 -0400
In-reply-to: <5d308e03-e92a-7bac-f65e-23c2ccbe161a@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Shuah Khan <shuahkh@osg.samsung.com>, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

Hi Andrzej,

2017년 06월 26일 16:02에 Andrzej Hajda 이(가) 쓴 글:
> Hi Shuah,
> 
> 
> On 24.06.2017 02:56, Shuah Khan wrote:
>> Fix to call of_node_put() right after of_drm_find_bridge() instead of
>> holding on to it until exynos_dsi_remove().
> 
> I think the current implementation is OK, node is get in probe and put
> in remove.
> There could be many bind/unbind during lifetime of the bound driver.
> For example, there is possible sequence:
> 1. probe -
> 2. bind
> 3. unbind
> 4. bind
> 
> With this patch on 2nd bind (point 4) driver will call
> of_drm_find_bridge on dsi->bridge_node which was put earlier (point 2.).
> 

Right. This is a problem.

How about moving of_drm_find_bridge function call to probe and keeping drm_bridge_attach call in bind for cleanup?
Seems it doesn't need to call of_drm_find_bridge function every time bind callback is called.

Thanks,
Inki Dae

> Regards
> Andrzej
> 
> 
>>
>> Suggested-by: Inki Dae <inki.dae@samsung.com>
>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> index e337cd2..7513b88 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> @@ -1689,6 +1689,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
>>  
>>  	if (dsi->bridge_node) {
>>  		bridge = of_drm_find_bridge(dsi->bridge_node);
>> +		of_node_put(dsi->bridge_node);
>>  		if (bridge)
>>  			drm_bridge_attach(encoder, bridge, NULL);
>>  	}
>> @@ -1807,10 +1808,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>>  
>>  static int exynos_dsi_remove(struct platform_device *pdev)
>>  {
>> -	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
>> -
>> -	of_node_put(dsi->bridge_node);
>> -
>>  	pm_runtime_disable(&pdev->dev);
>>  
>>  	component_del(&pdev->dev, &exynos_dsi_component_ops);
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
