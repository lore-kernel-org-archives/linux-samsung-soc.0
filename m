Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B55C2BC11
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 08:29:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6791E221EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 08:29:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="knVlnWgs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgINI3c (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 04:29:32 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52924 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgINI33 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 04:29:29 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200914082926euoutp01c92ceccdff401033f269c19f23b14642~0mSh3oYZf1038110381euoutp014
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2020 08:29:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200914082926euoutp01c92ceccdff401033f269c19f23b14642~0mSh3oYZf1038110381euoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600072166;
        bh=Z0bcxMS9MOrvEm/bdHncuXzywHhWO/GtSwTBvxZCxfQ=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=knVlnWgsDjCU7QEN3rd0dUSA0lRcQXIC365YbD6gbg7+WhPzVJ3JGJtCWUmrdbqv3
         B9DTV/yGz9bqiEsnCiFTbW6ktFZUCWDyr6wqe6xToKnqXvlkucUBGp4qm28EzFMe9u
         JsJHwwvDPDcySpyTsBPMczjfK7qEMjmfjDdHRS5w=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200914082926eucas1p163ef636004961638896a9e3752d521bc~0mShUe_qG0160401604eucas1p1H;
        Mon, 14 Sep 2020 08:29:26 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 27.19.06456.5E92F5F5; Mon, 14
        Sep 2020 09:29:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200914082925eucas1p1a3974549309b90d1ff7f971b8d73e2bc~0mSgzu3CU1746317463eucas1p1O;
        Mon, 14 Sep 2020 08:29:25 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200914082925eusmtrp270fe86baf77719a95badf48e764a9226~0mSgyxrf72062620626eusmtrp2b;
        Mon, 14 Sep 2020 08:29:25 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-1d-5f5f29e57714
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 3B.BE.06314.5E92F5F5; Mon, 14
        Sep 2020 09:29:25 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200914082924eusmtip214a6cd7cf3a132f0a8c65422f8c368c2~0mSgC8liS0878808788eusmtip2X;
        Mon, 14 Sep 2020 08:29:24 +0000 (GMT)
Subject: Re: [PATCH v2 10/16] drm/exynos: implement a drm bridge
To:     Michael Tretter <m.tretter@pengutronix.de>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <381a553a-5bc6-d070-fc40-7d48fdb89ca9@samsung.com>
Date:   Mon, 14 Sep 2020 10:29:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200911135413.3654800-11-m.tretter@pengutronix.de>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0gUYRSG+WZmd8atlXE19qCSsFSg4I0iJkrRMBoUwsI/GambDiqul3bW
        W1BIoukmZqvhuoJKGNqW10xaFUkxNTVNE2+YmphoZZaX8EKau5Plv/c95/nOOS98FC4bFtlT
        0XEaTh2nVCnEEqKxc7Pfdd45NNRj8xgzUd0vYur0NSJmeH1ZzOim8whmYWqQYIyPTAQzMFBL
        MtkPy0lGP9CKMY2Ve3B77jVGn78oZkpWTZiPlF0eyyBZk+EjyRZnFYnYemO2mJ2+34WxD357
        sLkNRsSu1h8NpIIl5yI4VXQSp3b3DpNEtWV/FSXs+qdspBWK0tCilxZZUUCfgpbydaRFEkpG
        VyJo+zmEC2YNwfa9GUwwqwi28pux/Sc/1p7+bVQgKMkZFQtmGUFpwbyFsqV9oK++e69BUXa0
        Br7NBpgZnE7DoLmgCZkZMe0J2iWt2KyltDd0ND/HzDxBHwfj2h1z+QgdAp09s4SA2MDbojmL
        tqJ9IfN1t2UMTjtB+stiXNBymJgrtRwH9DoJb6amSfNMoP1gQRckBLCFL10NpKAdYde0z6cj
        +NRfRQomB8GHu3okUGdhsn/LEgannaGmyV0o+8L4/Q5MmG8NY0s2wg3WoGssxIWyFLIyZQJ9
        Agxd1f/Wtr0fwvOQwnAgmeFAGsOBNIb/e8sQYURyLpGPjeR4zzgu2Y1XxvKJcZFu4fGx9Wjv
        r/XudK28QutDN9oRTSHFYWmgV0ioTKRM4lNj2xFQuMJOev5db4hMGqFMvcWp40PViSqOb0cO
        FKGQS08+XrwuoyOVGi6G4xI49X4Xo6zs05DLZOmaM9tRaGiZ8R/x6dVUDlKtT0ZdHaMcrspz
        dr2jdP59FS8uO2v4lbagCK39laa6neymHlf/z2xyWMDCBuFqmisbVoWryIwgQ63Rq2xM76Tn
        WyWaSnlPlc/0iIvp+3ZJkH774hlM7JvySz0+F36a1N10vB38zO/CpZhDoCD4KKWnC67mlX8A
        xvf6pmcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRmVeSWpSXmKPExsVy+t/xe7pPNePjDe5PkLe4te4cq8XGGetZ
        La58fc9mMen+BBaLF/cuslismrqTxeL8+Q3sFp0Tl7BbzDi/j8li2wqg4kN90RYzJr9ks5j3
        eSeTA6/H+xut7B47Z91l95jdMZPVY9OqTjaP+93HmTz6/xp49G1ZxejxeZNcAEeUnk1RfmlJ
        qkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbBztesBf+9Kn40
        TGdtYHxp28XIySEhYCLx4ctKpi5GLg4hgaWMEl0XdjNDJGQkTk5rYIWwhSX+XOtigyh6yygx
        f/tVFpCEsICDxJlNJ9hAbBGBEolP5x6BTWIWaGCSWPwRpBuk4xSjxKUtd9lBqtgEDCW63naB
        dfAK2Ekc2b0GqIODg0VAVWLVlzqQsKhAnMSZnhdQJYISJ2c+AVvGKeAo0XbgBCOIzSxgJjFv
        80NmCFteonnrbChbXOLWk/lMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy021CtOzC0u
        zUvXS87P3cQIjOZtx35u3sF4aWPwIUYBDkYlHt4A27h4IdbEsuLK3EOMEhzMSiK8TmdPxwnx
        piRWVqUW5ccXleakFh9iNAX6bSKzlGhyPjDR5JXEG5oamltYGpobmxubWSiJ83YIHIwREkhP
        LEnNTk0tSC2C6WPi4JRqYAz4F/VtkdyF9NPPhKf6P5Os61m7/fJapzk665V6dTfPnhm0b/at
        g+G+vPWL5hv7n+nRV7Gc/brw/UT+xUU3ma0Pd17hVJVYO2vx0gJNzhamBfHRpXpV7ZNKwxae
        ifiYsVhi0+vYa+ynHLjO9+99lPZqdYjvzOA97csMVp16+soyolrcwdnTUFGJpTgj0VCLuag4
        EQBRSTZ4/AIAAA==
X-CMS-MailID: 20200914082925eucas1p1a3974549309b90d1ff7f971b8d73e2bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200911164817eucas1p2a0907a3d4c5c0a8d8dc4bc97301f1517
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200911164817eucas1p2a0907a3d4c5c0a8d8dc4bc97301f1517
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
        <CGME20200911164817eucas1p2a0907a3d4c5c0a8d8dc4bc97301f1517@eucas1p2.samsung.com>
        <20200911135413.3654800-11-m.tretter@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Michael,

On 11.09.2020 15:54, Michael Tretter wrote:
> Make the exynos_dsi driver a full drm bridge that can be found and used
> from other drivers.
>
> Other drivers can only attach to the bridge, if a mipi dsi device
> already attached to the bridge. This allows to defer the probe of the
> display pipe until the downstream bridges are available, too.
>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

This one (and the whole series applied) still fails on Exynos boards:

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
5.9.0-rc4-next-20200911-00010-g417dc70d70ec #1608
Hardware name: Samsung Exynos (Flattened Device Tree)
PC is at drm_bridge_attach+0x18/0x164
LR is at exynos_dsi_bind+0x88/0xa8
pc : [<c0628c08>]    lr : [<c064d560>]    psr: 20000013
sp : ef0dfca8  ip : 00000002  fp : c13190e0
r10: 00000000  r9 : ee46d580  r8 : c13190e0
r7 : ee438800  r6 : 00000018  r5 : ef253810  r4 : ef39e840
r3 : 00000000  r2 : 00000018  r1 : ef39e888  r0 : ef39e840
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: 4000404a  DAC: 00000051
Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
Stack: (0xef0dfca8 to 0xef0e0000)
...
[<c0628c08>] (drm_bridge_attach) from [<c064d560>] 
(exynos_dsi_bind+0x88/0xa8)
[<c064d560>] (exynos_dsi_bind) from [<c066a800>] 
(component_bind_all+0xfc/0x290)
[<c066a800>] (component_bind_all) from [<c0649dc0>] 
(exynos_drm_bind+0xe4/0x19c)
[<c0649dc0>] (exynos_drm_bind) from [<c066ad74>] 
(try_to_bring_up_master+0x1e4/0x2c4)
[<c066ad74>] (try_to_bring_up_master) from [<c066b2b4>] 
(component_master_add_with_match+0xd4/0x108)
[<c066b2b4>] (component_master_add_with_match) from [<c0649ae8>] 
(exynos_drm_platform_probe+0xe4/0x110)
[<c0649ae8>] (exynos_drm_platform_probe) from [<c0674e6c>] 
(platform_drv_probe+0x6c/0xa4)
[<c0674e6c>] (platform_drv_probe) from [<c067242c>] 
(really_probe+0x200/0x4fc)
[<c067242c>] (really_probe) from [<c06728f0>] 
(driver_probe_device+0x78/0x1fc)
[<c06728f0>] (driver_probe_device) from [<c0672cd8>] 
(device_driver_attach+0x58/0x60)
[<c0672cd8>] (device_driver_attach) from [<c0672dbc>] 
(__driver_attach+0xdc/0x174)
[<c0672dbc>] (__driver_attach) from [<c06701b4>] 
(bus_for_each_dev+0x68/0xb4)
[<c06701b4>] (bus_for_each_dev) from [<c06714e8>] 
(bus_add_driver+0x158/0x214)
[<c06714e8>] (bus_add_driver) from [<c0673c1c>] (driver_register+0x78/0x110)
[<c0673c1c>] (driver_register) from [<c0649ca8>] 
(exynos_drm_init+0xe4/0x118)
[<c0649ca8>] (exynos_drm_init) from [<c0102484>] 
(do_one_initcall+0x8c/0x42c)
[<c0102484>] (do_one_initcall) from [<c11011c0>] 
(kernel_init_freeable+0x190/0x1dc)
[<c11011c0>] (kernel_init_freeable) from [<c0af7880>] 
(kernel_init+0x8/0x118)
[<c0af7880>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
Exception stack(0xef0dffb0 to 0xef0dfff8)
...
---[ end trace ee27f313f9ed9da1 ]---

# arm-linux-gnueabi-addr2line -e vmlinux c0628c08
drivers/gpu/drm/drm_bridge.c:184 (discriminator 1)

I will try to debug it a bit more today.

> ---
> v2:
> - move attach of out_bridge to bridge_attach
> - add bridge_detach
> - don't cleanup encoder if create_connector failed
> ---
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 103 +++++++++++++++++-------
>   1 file changed, 75 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 2d75f9877dc0..5e7c1a99a3ee 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -266,6 +266,7 @@ struct exynos_dsi_driver_data {
>   
>   struct exynos_dsi {
>   	struct drm_encoder encoder;
> +	struct drm_bridge bridge;
>   	struct mipi_dsi_host dsi_host;
>   	struct drm_connector connector;
>   	struct drm_panel *panel;
> @@ -1602,6 +1603,60 @@ static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
>   	.disable = exynos_dsi_disable,
>   };
>   
> +static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
> +				    enum drm_bridge_attach_flags flags)
> +{
> +	struct exynos_dsi *dsi = bridge->driver_private;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	int ret;
> +
> +	if (!dsi->out_bridge && !dsi->panel)
> +		return -EPROBE_DEFER;
> +
> +	if (dsi->out_bridge) {
> +		ret = drm_bridge_attach(encoder, dsi->out_bridge,
> +					bridge, flags);
> +		if (ret)
> +			return ret;
> +		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
> +	} else {
> +		ret = exynos_dsi_create_connector(encoder);
> +		if (ret)
> +			return ret;
> +
> +		if (dsi->panel) {
> +			dsi->connector.status = connector_status_connected;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void exynos_dsi_bridge_detach(struct drm_bridge *bridge)
> +{
> +	struct exynos_dsi *dsi = bridge->driver_private;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_device *drm = encoder->dev;
> +
> +	if (dsi->panel) {
> +		mutex_lock(&drm->mode_config.mutex);
> +		exynos_dsi_disable(&dsi->encoder);
> +		dsi->panel = NULL;
> +		dsi->connector.status = connector_status_disconnected;
> +		mutex_unlock(&drm->mode_config.mutex);
> +	} else {
> +		if (dsi->out_bridge->funcs->detach)
> +			dsi->out_bridge->funcs->detach(dsi->out_bridge);
> +		dsi->out_bridge = NULL;
> +		INIT_LIST_HEAD(&dsi->bridge_chain);
> +	}
> +}
> +
> +static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> +	.attach = exynos_dsi_bridge_attach,
> +	.detach = exynos_dsi_bridge_detach,
> +};
> +
>   MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
>   
>   static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> @@ -1609,25 +1664,12 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   {
>   	struct exynos_dsi *dsi = host_to_dsi(host);
>   	const struct exynos_dsi_host_ops *ops = dsi->driver_data->host_ops;
> -	struct drm_encoder *encoder = &dsi->encoder;
>   	struct drm_bridge *out_bridge;
>   
> -	out_bridge  = of_drm_find_bridge(device->dev.of_node);
> +	out_bridge = of_drm_find_bridge(device->dev.of_node);
>   	if (out_bridge) {
> -		drm_bridge_attach(encoder, out_bridge, NULL, 0);
>   		dsi->out_bridge = out_bridge;
> -		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
>   	} else {
> -		int ret = exynos_dsi_create_connector(encoder);
> -
> -		if (ret) {
> -			DRM_DEV_ERROR(dsi->dev,
> -				      "failed to create connector ret = %d\n",
> -				      ret);
> -			drm_encoder_cleanup(encoder);
> -			return ret;
> -		}
> -
>   		dsi->panel = of_drm_find_panel(device->dev.of_node);
>   		if (IS_ERR(dsi->panel))
>   			dsi->panel = NULL;
> @@ -1662,20 +1704,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>   {
>   	struct exynos_dsi *dsi = host_to_dsi(host);
>   	const struct exynos_dsi_host_ops *ops = dsi->driver_data->host_ops;
> -	struct drm_device *drm = dsi->encoder.dev;
> -
> -	if (dsi->panel) {
> -		mutex_lock(&drm->mode_config.mutex);
> -		exynos_dsi_disable(&dsi->encoder);
> -		dsi->panel = NULL;
> -		dsi->connector.status = connector_status_disconnected;
> -		mutex_unlock(&drm->mode_config.mutex);
> -	} else {
> -		if (dsi->out_bridge->funcs->detach)
> -			dsi->out_bridge->funcs->detach(dsi->out_bridge);
> -		dsi->out_bridge = NULL;
> -		INIT_LIST_HEAD(&dsi->bridge_chain);
> -	}
>   
>   	if (ops && ops->detach)
>   		ops->detach(dsi->dsi_host.dev, device);
> @@ -1786,7 +1814,15 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
>   		of_node_put(in_bridge_node);
>   	}
>   
> +	ret = drm_bridge_attach(encoder, &dsi->bridge, in_bridge, 0);
> +	if (ret)
> +		goto err;
> +
>   	return 0;
> +
> +err:
> +	drm_encoder_cleanup(encoder);
> +	return ret;
>   }
>   
>   static void exynos_dsi_unbind(struct device *dev, struct device *master,
> @@ -1796,6 +1832,8 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
>   	struct drm_encoder *encoder = &dsi->encoder;
>   
>   	exynos_dsi_disable(encoder);
> +
> +	drm_encoder_cleanup(encoder);
>   }
>   
>   static const struct component_ops exynos_dsi_component_ops = {
> @@ -1806,6 +1844,7 @@ static const struct component_ops exynos_dsi_component_ops = {
>   static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> +	struct drm_bridge *bridge;
>   	struct resource *res;
>   	struct exynos_dsi *dsi;
>   	int ret, i;
> @@ -1894,11 +1933,19 @@ static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> +	bridge = &dsi->bridge;
> +	bridge->driver_private = dsi;
> +	bridge->funcs = &exynos_dsi_bridge_funcs;
> +	bridge->of_node = dev->of_node;
> +	drm_bridge_add(bridge);
> +
>   	return dsi;
>   }
>   
>   static void __exynos_dsi_remove(struct exynos_dsi *dsi)
>   {
> +	drm_bridge_remove(&dsi->bridge);
> +
>   	mipi_dsi_host_unregister(&dsi->dsi_host);
>   }
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

