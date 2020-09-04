Return-Path: <SRS0=fnc5=CN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE8AC28E83
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Sep 2020 09:04:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08F5620748
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Sep 2020 09:04:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tPmold0c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729584AbgIDJEs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Sep 2020 05:04:48 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54262 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbgIDJEr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 05:04:47 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200904090444euoutp012b990f79df4318eea52d116fc3ae9ff5~xiUfJdy_B0628806288euoutp01L
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Sep 2020 09:04:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200904090444euoutp012b990f79df4318eea52d116fc3ae9ff5~xiUfJdy_B0628806288euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1599210284;
        bh=mF38BSySHgPh8tvLQxmYQQK6MX55B/1ONKhDz6AfEhI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=tPmold0cJcPEYPqxWEVW8JwJGdRywY6x7IM4W4P2Z3szDBINk5xbMi6vcnHVdc84F
         zQAFfgCXQg3KhXV6jptkmPDY5/Wvg4sk6FH6WDNz9mDbBPJedYvBcFRoQJFTzW9k4X
         N2B3KVhDpo2d/5wgzibk9x2K22Iz/j45p3r9NTlQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200904090443eucas1p11a1497b1fb6831405d4a792e65030627~xiUeYyRMA2446924469eucas1p1M;
        Fri,  4 Sep 2020 09:04:43 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id DA.A1.06318.B23025F5; Fri,  4
        Sep 2020 10:04:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200904090442eucas1p15e71990d4c731bde9d24f75cdb3359a8~xiUd-rHBN1074310743eucas1p1e;
        Fri,  4 Sep 2020 09:04:42 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200904090442eusmtrp1b3e8974e23c276069d71cc5053523f9d~xiUd-D_6m2538425384eusmtrp1h;
        Fri,  4 Sep 2020 09:04:42 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-e6-5f52032b129c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id DB.F7.06314.A23025F5; Fri,  4
        Sep 2020 10:04:42 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200904090442eusmtip11d5f0b64877b288f7214ca877a42d634~xiUdhvYWP1329713297eusmtip1M;
        Fri,  4 Sep 2020 09:04:42 +0000 (GMT)
Subject: Re: [PATCH 02/16] drm/exynos: extract helper functions for probe
To:     Michael Tretter <m.tretter@pengutronix.de>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     krzk@kernel.org, Laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, narmstrong@baylibre.com,
        Andrzej Hajda <a.hajda@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <c0d6aad1-5d9b-4a24-e9a5-3878fb289ac3@samsung.com>
Date:   Fri, 4 Sep 2020 11:04:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200903165717.1272492-3-m.tretter@pengutronix.de>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJKsWRmVeSWpSXmKPExsWy7djPc7razEHxBsc281jcWneO1eLK1/ds
        Fqum7mSxOH9+A7tF58Ql7BYzzu9jsti2Aih7qC/agcPj/Y1Wdo/ZHTNZPTat6mTzuN99nMmj
        /6+BR9+WVYwenzfJBbBHcdmkpOZklqUW6dslcGW0b+piK7jkWvHg3l2mBsYpVl2MnBwSAiYS
        y/fMYupi5OIQEljBKDHp7WcWCOcLo8T7G5vYIZzPjBJnpq5ghWn50/qfFSKxnFHi46UzbBDO
        e0aJjuWbGUGqhAU8Jd7NXwg0mINDRKBE4s0jb5AaZoF+Rom1/9rYQGrYBAwlut52gdm8AnYS
        j47vYQaxWQRUJFZe6wabIyoQJ3Hs1CMWiBpBiZMzn4DZnAIOEsunLgCzmQXkJZq3zmaGsMUl
        bj2ZD/aQhMAhdolnTx6wQ5ztInF29lwmCFtY4tXxLVBxGYnTk3tYIBqaGSUenlvLDuH0MEpc
        bprBCFFlLXHn3C82kHeYBTQl1u/Shwg7SpztegH2pYQAn8SNt4IQR/BJTNo2nRkizCvR0SYE
        Ua0mMev4Ori1By9cYp7AqDQLyWuzkLwzC8k7sxD2LmBkWcUonlpanJueWmycl1quV5yYW1ya
        l66XnJ+7iRGYoE7/O/51B+O+P0mHGAU4GJV4eG+8D4gXYk0sK67MPcQowcGsJMLrdPZ0nBBv
        SmJlVWpRfnxRaU5q8SFGaQ4WJXFe40UvY4UE0hNLUrNTUwtSi2CyTBycUg2MCjPz0l6+1vRk
        3S32r+7NnByWhmCHxPvrHtaJJBxP+ri45WnS+2lswiE67QVMTB6M8x7/P73QLeTatevCSy8W
        BG+8drFJc4ffeZf1cRXbchsk9aykmVaqvwrX+PxfPvP0w0l9G1mL1FlsDks8aTCTCmPw+j33
        cq+J28kQLp6zDJretTNOrD2pxFKckWioxVxUnAgA7PCo00wDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xu7pazEHxBjsnGVrcWneO1eLK1/ds
        Fqum7mSxOH9+A7tF58Ql7BYzzu9jsti2Aih7qC/agcPj/Y1Wdo/ZHTNZPTat6mTzuN99nMmj
        /6+BR9+WVYwenzfJBbBH6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mk
        pOZklqUW6dsl6GW0b+piK7jkWvHg3l2mBsYpVl2MnBwSAiYSf1r/s3YxcnEICSxllFgw+wsj
        REJG4uS0BlYIW1jiz7UuNoiit4wSSzYvZAZJCAt4Srybv5AJxBYRKJH4dO4RE0gRs0A/o8Tk
        hTvYITpOMkq8WHiJDaSKTcBQouttF5jNK2An8ej4HrBJLAIqEiuvdYOtFhWIkzjT8wKqRlDi
        5MwnLCA2p4CDxPKpC8BsZgEziXmbHzJD2PISzVtnQ9niEreezGeawCg0C0n7LCQts5C0zELS
        soCRZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgTG479nPzDsZLG4MPMQpwMCrx8N54HxAv
        xJpYVlyZe4hRgoNZSYTX6ezpOCHelMTKqtSi/Pii0pzU4kOMpkDPTWSWEk3OB6aLvJJ4Q1ND
        cwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjOb2z2dVxzg5Xlq182KvKHd8
        hrt5bFCRrfVG/fvr2u5O6Axwd067kXmrMzuILylL+5+AzF8P53X/ly2pCFlyXmTd1doFycs5
        Tf9tfpgomPl+p9Om3M2ftsvGTW7vzec7/vqFxPkHokmH9p9PE042Vu3ILe09dOJzVrnZl7bb
        uTUn3t5sCFsopsRSnJFoqMVcVJwIAA/1+9vfAgAA
X-CMS-MailID: 20200904090442eucas1p15e71990d4c731bde9d24f75cdb3359a8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200903165747eucas1p2f644b3ae6d7c48cb77f5c5f8b9be66ba
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200903165747eucas1p2f644b3ae6d7c48cb77f5c5f8b9be66ba
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
        <CGME20200903165747eucas1p2f644b3ae6d7c48cb77f5c5f8b9be66ba@eucas1p2.samsung.com>
        <20200903165717.1272492-3-m.tretter@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Michael,

On 03.09.2020 18:57, Michael Tretter wrote:
> As the driver shall be usable with drivers that use the component
> framework and drivers that don't, split the common probing code into a
> separate function that can be called from different locations.
>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

This is the first patch that causes the crash on Exynos boards:

exynos4-fb 11c00000.fimd: Adding to iommu group 0
OF: graph: no port node found in /soc/fimd@11c00000
[drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
OF: graph: no port node found in /soc/dsi@11c80000
8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000084
pgd = (ptrval)
[00000084] *pgd=00000000
Internal error: Oops: 5 [#1] PREEMPT SMP ARM
Modules linked in:
CPU: 1 PID: 1 Comm: swapper/0 Not tainted 
5.9.0-rc2-next-20200824-00004-g680baccba1c2 #1591
Hardware name: Samsung Exynos (Flattened Device Tree)
PC is at drm_bridge_attach+0x18/0x164
LR is at exynos_dsi_bind+0x88/0x9c
pc : [<c0620524>]    lr : [<c0644df8>]    psr: 20000013
...
Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
...
[<c0620524>] (drm_bridge_attach) from [<c0644df8>] 
(exynos_dsi_bind+0x88/0x9c)
[<c0644df8>] (exynos_dsi_bind) from [<c0661aec>] 
(component_bind_all+0xfc/0x290)
[<c0661aec>] (component_bind_all) from [<c06413d0>] 
(exynos_drm_bind+0xe4/0x19c)
[<c06413d0>] (exynos_drm_bind) from [<c0662060>] 
(try_to_bring_up_master+0x1e4/0x2c4)
[<c0662060>] (try_to_bring_up_master) from [<c06625a0>] 
(component_master_add_with_match+0xd4/0x108)
[<c06625a0>] (component_master_add_with_match) from [<c06410f8>] 
(exynos_drm_platform_probe+0xe4/0x110)
[<c06410f8>] (exynos_drm_platform_probe) from [<c066c788>] 
(platform_drv_probe+0x6c/0xa4)
[<c066c788>] (platform_drv_probe) from [<c0669cc4>] 
(really_probe+0x200/0x4fc)
[<c0669cc4>] (really_probe) from [<c066a188>] 
(driver_probe_device+0x78/0x1fc)
[<c066a188>] (driver_probe_device) from [<c066a570>] 
(device_driver_attach+0x58/0x60)
[<c066a570>] (device_driver_attach) from [<c066a654>] 
(__driver_attach+0xdc/0x174)
[<c066a654>] (__driver_attach) from [<c0667a4c>] 
(bus_for_each_dev+0x68/0xb4)
[<c0667a4c>] (bus_for_each_dev) from [<c0668d80>] 
(bus_add_driver+0x158/0x214)
[<c0668d80>] (bus_add_driver) from [<c066b538>] (driver_register+0x78/0x110)
[<c066b538>] (driver_register) from [<c06412b8>] 
(exynos_drm_init+0xe4/0x118)
[<c06412b8>] (exynos_drm_init) from [<c01023f4>] 
(do_one_initcall+0x8c/0x424)
[<c01023f4>] (do_one_initcall) from [<c10011a8>] 
(kernel_init_freeable+0x190/0x1dc)
[<c10011a8>] (kernel_init_freeable) from [<c0ae8ab4>] 
(kernel_init+0x8/0x118)
[<c0ae8ab4>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
Exception stack(0xef0dffb0 to 0xef0dfff8)
ffa0:                                     00000000 00000000 00000000 
00000000
ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
Code: e92d4070 0a00002e e3520000 0a000044 (e592c06c)
---[ end trace 1c93b26d166070f6 ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
CPU0: stopping
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G      D 
5.9.0-rc2-next-20200824-00004-g680baccba1c2 #1591
Hardware name: Samsung Exynos (Flattened Device Tree)
[<c011160c>] (unwind_backtrace) from [<c010cfc0>] (show_stack+0x10/0x14)
[<c010cfc0>] (show_stack) from [<c0533c3c>] (dump_stack+0xbc/0xe8)
[<c0533c3c>] (dump_stack) from [<c01104e0>] (handle_IPI+0x3e0/0x428)
[<c01104e0>] (handle_IPI) from [<c05511dc>] (gic_handle_irq+0x98/0x9c)
[<c05511dc>] (gic_handle_irq) from [<c0100af0>] (__irq_svc+0x70/0xb0)
Exception stack(0xc1101f08 to 0xc1101f50)
1f00:                   c01095d8 00000000 00000000 c1100000 c1108eec 
c1108f30
1f20: 00000001 c107d068 c1108ec8 00000000 00000000 00000000 00005dc0 
c1101f58
1f40: c01095d8 c01095dc 60000013 ffffffff
[<c0100af0>] (__irq_svc) from [<c01095dc>] (arch_cpu_idle+0x24/0x44)
[<c01095dc>] (arch_cpu_idle) from [<c01635dc>] (do_idle+0x1bc/0x2bc)
[<c01635dc>] (do_idle) from [<c0163a90>] (cpu_startup_entry+0x18/0x1c)
[<c0163a90>] (cpu_startup_entry) from [<c1000f88>] 
(start_kernel+0x628/0x664)
[<c1000f88>] (start_kernel) from [<00000000>] (0x0)
---[ end Kernel panic - not syncing: Attempted to kill init! 
exitcode=0x0000000b ]---

> ---
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 54 ++++++++++++++-----------
>   1 file changed, 30 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index b38e9b592b8a..32f999dfd8c1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1734,7 +1734,7 @@ static const struct component_ops exynos_dsi_component_ops = {
>   	.unbind	= exynos_dsi_unbind,
>   };
>   
> -static int exynos_dsi_probe(struct platform_device *pdev)
> +static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct resource *res;
> @@ -1743,7 +1743,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>   
>   	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
>   	if (!dsi)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>   
>   	/* To be checked as invalid one */
>   	dsi->te_gpio = -ENOENT;
> @@ -1766,14 +1766,14 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>   	if (ret) {
>   		if (ret != -EPROBE_DEFER)
>   			dev_info(dev, "failed to get regulators: %d\n", ret);
> -		return ret;
> +		return ERR_PTR(ret);
>   	}
>   
>   	dsi->clks = devm_kcalloc(dev,
>   			dsi->driver_data->num_clks, sizeof(*dsi->clks),
>   			GFP_KERNEL);
>   	if (!dsi->clks)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>   
>   	for (i = 0; i < dsi->driver_data->num_clks; i++) {
>   		dsi->clks[i] = devm_clk_get(dev, clk_names[i]);
> @@ -1787,7 +1787,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>   
>   			dev_info(dev, "failed to get the clock: %s\n",
>   					clk_names[i]);
> -			return PTR_ERR(dsi->clks[i]);
> +			return ERR_PTR(PTR_ERR(dsi->clks[i]));
>   		}
>   	}
>   
> @@ -1795,18 +1795,18 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>   	dsi->reg_base = devm_ioremap_resource(dev, res);
>   	if (IS_ERR(dsi->reg_base)) {
>   		dev_err(dev, "failed to remap io region\n");
> -		return PTR_ERR(dsi->reg_base);
> +		return dsi->reg_base;
>   	}
>   
>   	dsi->phy = devm_phy_get(dev, "dsim");
>   	if (IS_ERR(dsi->phy)) {
>   		dev_info(dev, "failed to get dsim phy\n");
> -		return PTR_ERR(dsi->phy);
> +		return ERR_PTR(PTR_ERR(dsi->phy));
>   	}
>   
>   	dsi->irq = platform_get_irq(pdev, 0);
>   	if (dsi->irq < 0)
> -		return dsi->irq;
> +		return ERR_PTR(dsi->irq);
>   
>   	irq_set_status_flags(dsi->irq, IRQ_NOAUTOEN);
>   	ret = devm_request_threaded_irq(dev, dsi->irq, NULL,
> @@ -1814,37 +1814,43 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>   					dev_name(dev), dsi);
>   	if (ret) {
>   		dev_err(dev, "failed to request dsi irq\n");
> -		return ret;
> +		return ERR_PTR(ret);
>   	}
>   
>   	ret = exynos_dsi_parse_dt(dsi);
>   	if (ret)
> -		return ret;
> -
> -	platform_set_drvdata(pdev, &dsi->encoder);
> +		return ERR_PTR(ret);
>   
>   	pm_runtime_enable(dev);
>   
> -	ret = component_add(dev, &exynos_dsi_component_ops);
> -	if (ret)
> -		goto err_disable_runtime;
> -
> -	return 0;
> +	return dsi;
> +}
>   
> -err_disable_runtime:
> -	pm_runtime_disable(dev);
> +static void __exynos_dsi_remove(struct exynos_dsi *dsi)
> +{
>   	of_node_put(dsi->in_bridge_node);
>   
> -	return ret;
> +	pm_runtime_disable(dsi->dev);
>   }
>   
> -static int exynos_dsi_remove(struct platform_device *pdev)
> +static int exynos_dsi_probe(struct platform_device *pdev)
>   {
> -	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
> +	struct exynos_dsi *dsi;
>   
> -	of_node_put(dsi->in_bridge_node);
> +	dsi = __exynos_dsi_probe(pdev);
> +	if (IS_ERR(dsi))
> +		return PTR_ERR(dsi);
> +	platform_set_drvdata(pdev, &dsi->encoder);
> +
> +	return component_add(&pdev->dev, &exynos_dsi_component_ops);
> +}
> +
> +static int exynos_dsi_remove(struct platform_device *pdev)
> +{
> +	struct drm_encoder *encoder = platform_get_drvdata(pdev);
> +	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
>   
> -	pm_runtime_disable(&pdev->dev);
> +	__exynos_dsi_remove(dsi);
>   
>   	component_del(&pdev->dev, &exynos_dsi_component_ops);
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

