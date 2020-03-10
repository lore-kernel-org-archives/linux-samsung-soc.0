Return-Path: <SRS0=2oIG=43=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E81C10F25
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Mar 2020 01:10:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B903D24673
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Mar 2020 01:10:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgCJBK6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Mar 2020 21:10:58 -0400
Received: from lucky1.263xmail.com ([211.157.147.132]:52222 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgCJBK6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Mar 2020 21:10:58 -0400
Received: from localhost (unknown [192.168.167.32])
        by lucky1.263xmail.com (Postfix) with ESMTP id A0A7AAC25E;
        Tue, 10 Mar 2020 09:10:51 +0800 (CST)
X-MAIL-GRAY: 1
X-MAIL-DELIVERY: 0
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.218] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P22135T139627910395648S1583802648955018_;
        Tue, 10 Mar 2020 09:10:50 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7656b6359cf79eebf507cba2b0090190>
X-RL-SENDER: andy.yan@rock-chips.com
X-SENDER: yxj@rock-chips.com
X-LOGIN-NAME: andy.yan@rock-chips.com
X-FST-TO: laurent.pinchart@ideasonboard.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH=5d_drm/bridge=3a_analogix=5fdp=3a_Split_bi?=
 =?UTF-8?B?bmQoKSBpbnRvIHByb2JlKCkgYW5kIHJlYWwgYmluZCgp44CQ6K+35rOo5oSP77yM?=
 =?UTF-8?B?6YKu5Lu255SxbGludXgtcm9ja2NoaXAtYm91bmNlcythbmR5Lnlhbj1yb2NrLWNo?=
 =?UTF-8?B?aXBzLmNvbUBsaXN0cy5pbmZyYWRlYWQub3Jn5Luj5Y+R44CR?=
From:   Andy Yan <andy.yan@rock-chips.com>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <CGME20200302142626eucas1p25b7aec18264b1483fab9cceb86989aa8@eucas1p2.samsung.com>
 <20200302142615.14947-1-m.szyprowski@samsung.com>
 <30f64c8f-2a12-46c2-e5eb-505bbb2088ed@samsung.com>
 <331b5d65-f619-ff84-d4e7-55d2257a90c5@rock-chips.com>
Message-ID: <0a287abf-12ed-7e34-c765-144a8c10230d@rock-chips.com>
Date:   Tue, 10 Mar 2020 09:10:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <331b5d65-f619-ff84-d4e7-55d2257a90c5@rock-chips.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek:


On 3/5/20 5:03 PM, Andy Yan wrote:
>
> Hi:
>
> I tested it on a rk3399 board, but the eDP was broken after this patch 
> applied:
>
>
> [    0.891873] registered taskstats version 1
> [    0.892243] Loading compiled-in X.509 certificates
> [    0.929147] rockchip-dp ff970000.edp: no DP phy configured
> [    0.931676] random: fast init done
> [    0.932594] rockchip-drm display-subsystem: bound ff900000.vop (ops 
> vop_component_ops)
> [    0.934117] rockchip-drm display-subsystem: bound ff970000.edp (ops 
> rockchip_dp_component_ops)
> [    0.934878] [drm] Supports vblank timestamp caching Rev 2 
> (21.10.2013).
> [    0.935459] [drm] No driver support for vblank timestamp query.
> [    0.956708] mmc0: new HS400 MMC card at address 0001
> [    0.958261] mmcblk0: mmc0:0001 AWPD3R 14.6 GiB
> [    0.958952] mmcblk0boot0: mmc0:0001 AWPD3R partition 1 4.00 MiB
> [    0.959804] mmcblk0boot1: mmc0:0001 AWPD3R partition 2 4.00 MiB
> [    0.960540] mmcblk0rpmb: mmc0:0001 AWPD3R partition 3 4.00 MiB, 
> chardev (242:0)
> [    0.965428] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.966228] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.967025] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.967104]  mmcblk0: p1 p2 p3 p4 p5
> [    0.967823] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.968620] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.969417] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.970216] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.971012] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.971811] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.972608] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.973404] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.974201] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.974998] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.975799] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.976596] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.977393] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.978189] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.978986] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.979786] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.980584] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
>
>
> Before this patch :
>
>
> [    0.877707] 9pnet: Installing 9P2000 support
> [    0.878156] Key type dns_resolver registered
> [    0.879188] registered taskstats version 1
> [    0.879558] Loading compiled-in X.509 certificates
> [    0.918227] rockchip-drm display-subsystem: bound ff900000.vop (ops 
> vop_component_ops)
> [    0.918965] rockchip-dp ff970000.edp: no DP phy configured
> [    0.921003] rockchip-drm display-subsystem: bound ff970000.edp (ops 
> rockchip_dp_component_ops)
> [    0.921766] [drm] Supports vblank timestamp caching Rev 2 
> (21.10.2013).
> [    0.922347] [drm] No driver support for vblank timestamp query.
> [    0.922620] random: fast init done
> [    0.944772] mmc0: new HS400 MMC card at address 0001
> [    0.946330] mmcblk0: mmc0:0001 AWPD3R 14.6 GiB
> [    0.947022] mmcblk0boot0: mmc0:0001 AWPD3R partition 1 4.00 MiB
> [    0.947835] mmcblk0boot1: mmc0:0001 AWPD3R partition 2 4.00 MiB
> [    0.948706] mmcblk0rpmb: mmc0:0001 AWPD3R partition 3 4.00 MiB, 
> chardev (242:0)
> [    0.948928] [drm] vop_crtc_atomic_enable
> [    0.954614]  mmcblk0: p1 p2 p3 p4 p5
> [    1.061071] Console: switching to colour frame buffer device 192x128
> [    1.095819] rockchip-drm display-subsystem: fb0: rockchipdrmfb 
> frame buffer device
> [    1.098090] [drm] Initialized rockchip 1.0.0 20140818 for 
> display-subsystem on minor 0
> [    1.100342] hctosys: unable to open rtc device (rtc0)
> 75,1          Bot
>
> On 3/3/20 8:38 PM, Andrzej Hajda wrote:
>> On 02.03.2020 15:26, Marek Szyprowski wrote:
>>> Analogix_dp driver acquires all its resources in ->bind() callback, 
>>> what
>>> is a bit against the driver component based approach, where driver
>>> initialization is split into probe(), where all resources are 
>>> gathered, and
>>> bind(), where objects are created and compound driver is initialized.
>>> Extract resource related operations to analogix_dp_probe() and
>>> analogix_dp_remove() and call them before/after registration of the 
>>> device
>>> components from the main Exynos and Rockchip DP drivers.
>>>
>>> This fixes multiple tries of DRM compound driver bind() when example 
>>> when
>>> DP PHY driver is not yet loaded/probed():
>>>
>>> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
>>> exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops 
>>> [exynosdrm])
>>> exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops 
>>> [exynosdrm])
>>> exynos-dp 145b0000.dp-controller: no DP phy configured
>>> exynos-drm exynos-drm: failed to bind 145b0000.dp-controller (ops 
>>> exynos_dp_ops [exynosdrm]): -517
>>> exynos-drm exynos-drm: master bind failed: -517
>>> ...
>>> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
>>> exynos-drm exynos-drm: bound 14400000.fimd (ops hdmi_enable 
>>> [exynosdrm])
>>> exynos-drm exynos-drm: bound 14450000.mixer (ops hdmi_enable 
>>> [exynosdrm])
>>> exynos-drm exynos-drm: bound 145b0000.dp-controller (ops hdmi_enable 
>>> [exynosdrm])
>>> exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_enable 
>>> [exynosdrm])
>>> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>>> Console: switching to colour frame buffer device 170x48
>>> exynos-drm exynos-drm: fb0: exynosdrmfb frame buffer device
>>> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 1
>>> ...
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> I hope someone with rockchip will test the patch.
>>
>> I am little bit worried about power/resource management:
>>
>> 1. dp->clock enabled in probe.
>>
>> 2. pm_runtime enabled in bind.
>>
>> Both seems to me too early, but it could be hw issue and should be
>> addressed in separate patches if possible.
>>
>>
>> As I understand the patch tries to split things without changing order
>> of calls, so for me it is OK:
>>
>>
>> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
>>
>>   --
>>
>> Regards
>> Andrzej
>>
>>> ---
>>>   .../drm/bridge/analogix/analogix_dp_core.c    | 33 
>>> ++++++++++++-------
>>>   drivers/gpu/drm/exynos/exynos_dp.c            | 15 ++++++---
>>>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 15 +++++----
>>>   include/drm/bridge/analogix_dp.h              |  5 +--
>>>   4 files changed, 44 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c 
>>> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> index dfb59a5fefea..a89a03b66bf2 100644
>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> @@ -1646,8 +1646,7 @@ static ssize_t analogix_dpaux_transfer(struct 
>>> drm_dp_aux *aux,
>>>   }
>>>     struct analogix_dp_device *
>>> -analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
>>> -         struct analogix_dp_plat_data *plat_data)
>>> +analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data 
>>> *plat_data)
>>>   {
>>>       struct platform_device *pdev = to_platform_device(dev);
>>>       struct analogix_dp_device *dp;

          ret = analogix_dp_dt_parse_pdata(dp);
         if (ret)
                 return ERR_PTR(ret);


     I think this is the problem I tested。 Now the pdata were parse in 
probe, but the plata_data->dev_type was populated in 
rockchip_dp_bind/exynos_dp_bind after probe.So we can't parse the right 
configuration here.



>>> @@ -1750,22 +1749,30 @@ analogix_dp_bind(struct device *dev, struct 
>>> drm_device *drm_dev,
>>>                       irq_flags, "analogix-dp", dp);
>>>       if (ret) {
>>>           dev_err(&pdev->dev, "failed to request irq\n");
>>> -        goto err_disable_pm_runtime;
>>> +        return ERR_PTR(ret);
>>>       }
>>>       disable_irq(dp->irq);
>>>   +    return dp;
>>> +}
>>> +EXPORT_SYMBOL_GPL(analogix_dp_probe);
>>> +
>>> +int analogix_dp_bind(struct analogix_dp_device *dp, struct 
>>> drm_device *drm_dev)
>>> +{
>>> +    int ret;
>>> +
>>>       dp->drm_dev = drm_dev;
>>>       dp->encoder = dp->plat_data->encoder;
>>>         dp->aux.name = "DP-AUX";
>>>       dp->aux.transfer = analogix_dpaux_transfer;
>>> -    dp->aux.dev = &pdev->dev;
>>> +    dp->aux.dev = dp->dev;
>>>         ret = drm_dp_aux_register(&dp->aux);
>>>       if (ret)
>>> -        return ERR_PTR(ret);
>>> +        return ret;
>>>   -    pm_runtime_enable(dev);
>>> +    pm_runtime_enable(dp->dev);
>>>         ret = analogix_dp_create_bridge(drm_dev, dp);
>>>       if (ret) {
>>> @@ -1773,13 +1780,12 @@ analogix_dp_bind(struct device *dev, struct 
>>> drm_device *drm_dev,
>>>           goto err_disable_pm_runtime;
>>>       }
>>>   -    return dp;
>>> +    return 0;
>>>     err_disable_pm_runtime:
>>> +    pm_runtime_disable(dp->dev);
>>>   -    pm_runtime_disable(dev);
>>> -
>>> -    return ERR_PTR(ret);
>>> +    return ret;
>>>   }
>>>   EXPORT_SYMBOL_GPL(analogix_dp_bind);
>>>   @@ -1796,10 +1802,15 @@ void analogix_dp_unbind(struct 
>>> analogix_dp_device *dp)
>>>         drm_dp_aux_unregister(&dp->aux);
>>>       pm_runtime_disable(dp->dev);
>>> -    clk_disable_unprepare(dp->clock);
>>>   }
>>>   EXPORT_SYMBOL_GPL(analogix_dp_unbind);
>>>   +void analogix_dp_remove(struct analogix_dp_device *dp)
>>> +{
>>> +    clk_disable_unprepare(dp->clock);
>>> +}
>>> +EXPORT_SYMBOL_GPL(analogix_dp_remove);
>>> +
>>>   #ifdef CONFIG_PM
>>>   int analogix_dp_suspend(struct analogix_dp_device *dp)
>>>   {
>>> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c 
>>> b/drivers/gpu/drm/exynos/exynos_dp.c
>>> index 4785885c0f4f..558b78e8cc32 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_dp.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
>>> @@ -184,13 +184,11 @@ static int exynos_dp_bind(struct device *dev, 
>>> struct device *master, void *data)
>>>         dp->plat_data.encoder = encoder;
>>>   -    dp->adp = analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
>>> -    if (IS_ERR(dp->adp)) {
>>> +    ret = analogix_dp_bind(dp->adp, dp->drm_dev);
>>> +    if (ret)
>>> dp->encoder.funcs->destroy(&dp->encoder);
>>> -        return PTR_ERR(dp->adp);
>>> -    }
>>>   -    return 0;
>>> +    return ret;
>>>   }
>>>     static void exynos_dp_unbind(struct device *dev, struct device 
>>> *master,
>>> @@ -250,12 +248,19 @@ static int exynos_dp_probe(struct 
>>> platform_device *pdev)
>>>       dp->ptn_bridge = bridge;
>>>     out:
>>> +    dp->adp = analogix_dp_probe(dev, &dp->plat_data);
>>> +    if (IS_ERR(dp->adp))
>>> +        return PTR_ERR(dp->adp);
>>> +
>>>       return component_add(&pdev->dev, &exynos_dp_ops);
>>>   }
>>>     static int exynos_dp_remove(struct platform_device *pdev)
>>>   {
>>> +    struct exynos_dp_device *dp = platform_get_drvdata(pdev);
>>> +
>>>       component_del(&pdev->dev, &exynos_dp_ops);
>>> +    analogix_dp_remove(dp->adp);
>>>         return 0;
>>>   }
>>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c 
>>> b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>> index f38f5e113c6b..b85cf2582864 100644
>>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>> @@ -349,11 +349,9 @@ static int rockchip_dp_bind(struct device *dev, 
>>> struct device *master,
>>>       dp->plat_data.power_off = rockchip_dp_powerdown;
>>>       dp->plat_data.get_modes = rockchip_dp_get_modes;
>>>   -    dp->adp = analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
>>> -    if (IS_ERR(dp->adp)) {
>>> -        ret = PTR_ERR(dp->adp);
>>> +    ret = analogix_dp_bind(dp->adp, drm_dev);
>>> +    if (ret)
>>>           goto err_cleanup_encoder;
>>> -    }
>>>         return 0;
>>>   err_cleanup_encoder:
>>> @@ -368,8 +366,6 @@ static void rockchip_dp_unbind(struct device 
>>> *dev, struct device *master,
>>>         analogix_dp_unbind(dp->adp);
>>>       dp->encoder.funcs->destroy(&dp->encoder);
>>> -
>>> -    dp->adp = ERR_PTR(-ENODEV);
>>>   }
>>>     static const struct component_ops rockchip_dp_component_ops = {
>>> @@ -402,12 +398,19 @@ static int rockchip_dp_probe(struct 
>>> platform_device *pdev)
>>>         platform_set_drvdata(pdev, dp);
>>>   +    dp->adp = analogix_dp_probe(dev, &dp->plat_data);
>>> +    if (IS_ERR(dp->adp))
>>> +        return PTR_ERR(dp->adp);
>>> +
>>>       return component_add(dev, &rockchip_dp_component_ops);
>>>   }
>>>     static int rockchip_dp_remove(struct platform_device *pdev)
>>>   {
>>> +    struct rockchip_dp_device *dp = platform_get_drvdata(pdev);
>>> +
>>>       component_del(&pdev->dev, &rockchip_dp_component_ops);
>>> +    analogix_dp_remove(dp->adp);
>>>         return 0;
>>>   }
>>> diff --git a/include/drm/bridge/analogix_dp.h 
>>> b/include/drm/bridge/analogix_dp.h
>>> index 7aa2f93da49c..b0dcc07334a1 100644
>>> --- a/include/drm/bridge/analogix_dp.h
>>> +++ b/include/drm/bridge/analogix_dp.h
>>> @@ -42,9 +42,10 @@ int analogix_dp_resume(struct analogix_dp_device 
>>> *dp);
>>>   int analogix_dp_suspend(struct analogix_dp_device *dp);
>>>     struct analogix_dp_device *
>>> -analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
>>> -         struct analogix_dp_plat_data *plat_data);
>>> +analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data 
>>> *plat_data);
>>> +int analogix_dp_bind(struct analogix_dp_device *dp, struct 
>>> drm_device *drm_dev);
>>>   void analogix_dp_unbind(struct analogix_dp_device *dp);
>>> +void analogix_dp_remove(struct analogix_dp_device *dp);
>>>     int analogix_dp_start_crc(struct drm_connector *connector);
>>>   int analogix_dp_stop_crc(struct drm_connector *connector);
>>
>>
>> _______________________________________________
>> Linux-rockchip mailing list
>> Linux-rockchip@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


