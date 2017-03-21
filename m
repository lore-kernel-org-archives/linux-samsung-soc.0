From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2] drm/exynos/dsi: make te-gpios optional
Date: Tue, 21 Mar 2017 09:55:01 +0100
Message-ID: <96d1bfc1-f5d8-9efe-8150-d034acedd3f8@samsung.com>
References: <CGME20170315112050eucas1p10ac34c1093b97a338e098c539b84ded6@eucas1p1.samsung.com>
 <1489576842-17679-1-git-send-email-a.hajda@samsung.com>
 <58D0B5A8.9020203@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:10858 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756477AbdCUIzH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Mar 2017 04:55:07 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ON500KTNQ3S5M70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Mar 2017 08:55:04 +0000 (GMT)
In-reply-to: <58D0B5A8.9020203@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On 21.03.2017 06:10, Inki Dae wrote:
>
> 2017년 03월 15일 20:20에 Andrzej Hajda 이(가) 쓴 글:
>> DSI forwards te-gpios interrupts to display controller, but if display
>> controller works in HW-TRIGGER mode this interrupt is not necessary.
>> Making te-gpios property optional allows to avoid generating spare
>> interrupts.
>> With this patch we can get rid of 60 interrupt callbacks per second.
> As I said before like below,
> "If panel device node of command mode panel device doesn't provide te-gpios property then now the panel driver will fail to probe.
> Seems this patch makes it to allow the panel driver probing is always ok even if gpio is invalid."
>
> This patch will fix critical issue that the panel driver fails to probe if the panel device node has no te-gpios property.
> I think adding above sentence to this description would be good. So I will merge this patch after adding the description. I can do this.

Thanks, it seems I have misunderstood your previous post.

Regards
Andrzej

>
> Thanks,
> Inki Dae
>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> index 812e2ec..822094d 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> @@ -1348,9 +1348,12 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi)
>>  	int te_gpio_irq;
>>  
>>  	dsi->te_gpio = of_get_named_gpio(dsi->panel_node, "te-gpios", 0);
>> +	if (dsi->te_gpio == -ENOENT)
>> +		return 0;
>> +
>>  	if (!gpio_is_valid(dsi->te_gpio)) {
>> -		dev_err(dsi->dev, "no te-gpios specified\n");
>>  		ret = dsi->te_gpio;
>> +		dev_err(dsi->dev, "cannot get te-gpios, %d\n", ret);
>>  		goto out;
>>  	}
>>  
>>
>
