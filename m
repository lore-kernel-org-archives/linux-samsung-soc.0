Return-Path: <SRS0=luaX=4P=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5AE9C4BA24
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 27 Feb 2020 09:03:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D7D724680
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 27 Feb 2020 09:03:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="d3pn+ICS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728614AbgB0JDa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 27 Feb 2020 04:03:30 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39075 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728555AbgB0JD3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Feb 2020 04:03:29 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200227090327euoutp0101bcce8bc734ac235ed4e65fcf89dcc8~3NvIkaiie0060400604euoutp01K
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Feb 2020 09:03:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200227090327euoutp0101bcce8bc734ac235ed4e65fcf89dcc8~3NvIkaiie0060400604euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582794207;
        bh=VSYeQmmnVB2Spf8qkN4V5hPy1ERmEG1Vx16y5XLczSM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=d3pn+ICSWbbQYhgdwc6JznXj6///m1nz7y/BG1PoUP+WOHZ59r3MYfdc2YmyyoMCd
         eCr5VSsDjWXXHLRO8+d4N4DGowvGZJT/+ZEM5zysTtBAiJtLvAJlT0dWxpMaDqX3mO
         x/3yXGNB5NZ8K0efNkI91+Wq8eqBNkzjjm3uZdq4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200227090327eucas1p1e933b5f526259b70024a0f515f22f728~3NvITntRI0317403174eucas1p1E;
        Thu, 27 Feb 2020 09:03:27 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 8A.34.60698.FD5875E5; Thu, 27
        Feb 2020 09:03:27 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200227090327eucas1p28916eb777ad652053b002960a4d9c704~3NvH-faAy0147001470eucas1p2P;
        Thu, 27 Feb 2020 09:03:27 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200227090327eusmtrp2849f24f15a6099488014b836cb24a504~3NvH_uAls2350023500eusmtrp2r;
        Thu, 27 Feb 2020 09:03:27 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-44-5e5785df6564
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id F2.47.07950.ED5875E5; Thu, 27
        Feb 2020 09:03:26 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200227090326eusmtip1497eabb3846ce67fdacbeaed906f3c47~3NvHp97J80715207152eusmtip1b;
        Thu, 27 Feb 2020 09:03:26 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: hdmi: don't leak enable HDMI_EN regulator
 if probe fails
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <846fe12b-4326-9901-c276-2ebf16d2ba98@samsung.com>
Date:   Thu, 27 Feb 2020 10:03:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220125726.19442-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7djP87r3W8PjDM6fE7DYOGM9q8WVr+/Z
        LGac38dksfbIXXaLGZNfsjmwetzvPs7k0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBkfzp5n
        KtigWHF/1kT2Bsb1Ml2MHBwSAiYSDZfzuxi5OIQEVjBK7Ll8mgXC+cIosbt9CTuE85lR4ubL
        s2xdjJxgHU8fXGaGSCxnlGja2gVV9ZZRYtOElSwgVcIC0RLdzcfBOkQESiXm/j/GDmIzCyRJ
        7FzVyQpiswloSvzdfBOshlfATmLRhJuMIDaLgKrE7PbZzCC2qECExLTt/xghagQlTs58wgJy
        NydQ/fFviRAj5SWat0KUMwuIS9x6Mp8J5B4JgensEp07JjJBXO0i0f/zLdQHwhKvjm9hh7Bl
        JP7vnA9VUy9xf0ULM0RzB6PE1g07mSES1hJ3zv1iA1nMDHT0+l36EGFHifUPm5kh4cgnceOt
        IMQNfBKTtk2HCvNKdLQJQVQrStw/uxVqoLjE0gtf2SYwKs1C8tgsJN/MQvLNLIS9CxhZVjGK
        p5YW56anFhvnpZbrFSfmFpfmpesl5+duYgQmltP/jn/dwbjvT9IhRgEORiUe3oKksDgh1sSy
        4srcQ4wSHMxKIrwbv4bGCfGmJFZWpRblxxeV5qQWH2KU5mBREuc1XvQyVkggPbEkNTs1tSC1
        CCbLxMEp1cAY03175pbIbmEzH3sbfqv6C0tq2vpsLb0m+IjsstaX49j34fqlQKv6L/NP2hxe
        cltCa2b81ITIM/f/78p5k3nb58YGddm7ixlaH+3lsV608b6g89ZbSw/bT98YPdc8Ifx5c9jb
        2AuXmv5+3bFu6+7Nlo9zV5b1Tnh2Je0QY9FXrW+V1V9qkguWKrEUZyQaajEXFScCAH8MSyoo
        AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xu7r3WsPjDNY0W1psnLGe1eLK1/ds
        FjPO72OyWHvkLrvFjMkv2RxYPe53H2fy6NuyitHj8ya5AOYoPZui/NKSVIWM/OISW6VoQwsj
        PUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYwPZ88zFWxQrLg/ayJ7A+N6mS5GTg4J
        AROJpw8uM3cxcnEICSxllHjz6iILREJcYvf8t8wQtrDEn2tdbBBFrxklVt48zgSSEBaIlrj8
        7QBYkYhAqcSr/vuMXYwcHMwCSRL7LilA1E9klHh86ijYUDYBTYm/m2+ygdi8AnYSiybcZASx
        WQRUJWa3zwabIyoQIfF4YjsjRI2gxMmZT1hAZnIC1R//lggSZhZQl/gz7xIzhC0v0bx1NpQt
        LnHryXymCYxCs5B0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIExtK2
        Yz+37GDsehd8iFGAg1GJh7cgKSxOiDWxrLgy9xCjBAezkgjvxq+hcUK8KYmVValF+fFFpTmp
        xYcYTYF+m8gsJZqcD4zzvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUwfUwc
        nFINjKUMay1vv2L8+Ev6ezTj7my9yee+zI0/7D3LMiEtdO9rPucV/x8/KV0ZWTix7uDC8P0J
        u5cv29RoFb/sS8rMPDGJvbrmW87a75gR4Lxj4g3Nbp3i+J3SmxYZrnrGtOPm+7NT7OfdFnmx
        6dk3ponxG1mOfuTZ2ffujZ/hjPqf61XO9qRK/7ze/Pu+EktxRqKhFnNRcSIAa34heLsCAAA=
X-CMS-MailID: 20200227090327eucas1p28916eb777ad652053b002960a4d9c704
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200220125900eucas1p11f6e56f11c8fcf25acf28b082107c89d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200220125900eucas1p11f6e56f11c8fcf25acf28b082107c89d
References: <CGME20200220125900eucas1p11f6e56f11c8fcf25acf28b082107c89d@eucas1p1.samsung.com>
        <20200220125726.19442-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20.02.2020 13:57, Marek Szyprowski wrote:
> Move enabling and disabling HDMI_EN optional regulator to probe() function
> to keep track on the regulator status. This fixes following warning if
> probe() fails (for example when I2C DDC adapter cannot be yet gathered
> due to the missing driver). This fixes following warning observed on
> Arndale5250 board with multi_v7_defconfig:
>
> [drm] Failed to get ddc i2c adapter by node
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 214 at drivers/regulator/core.c:2051 _regulator_put+0x16c/0x184
> Modules linked in: ...
> CPU: 0 PID: 214 Comm: systemd-udevd Not tainted 5.6.0-rc2-next-20200219-00040-g38af1dfafdbb #7570
> Hardware name: Samsung Exynos (Flattened Device Tree)
> [<c0312258>] (unwind_backtrace) from [<c030cc10>] (show_stack+0x10/0x14)
> [<c030cc10>] (show_stack) from [<c0f0d3a0>] (dump_stack+0xcc/0xe0)
> [<c0f0d3a0>] (dump_stack) from [<c0346a58>] (__warn+0xe0/0xf8)
> [<c0346a58>] (__warn) from [<c0346b20>] (warn_slowpath_fmt+0xb0/0xb8)
> [<c0346b20>] (warn_slowpath_fmt) from [<c0893f58>] (_regulator_put+0x16c/0x184)
> [<c0893f58>] (_regulator_put) from [<c0893f8c>] (regulator_put+0x1c/0x2c)
> [<c0893f8c>] (regulator_put) from [<c09b2664>] (release_nodes+0x17c/0x200)
> [<c09b2664>] (release_nodes) from [<c09aebe8>] (really_probe+0x10c/0x350)
> [<c09aebe8>] (really_probe) from [<c09aefa8>] (driver_probe_device+0x60/0x1a0)
> [<c09aefa8>] (driver_probe_device) from [<c09af288>] (device_driver_attach+0x58/0x60)
> [<c09af288>] (device_driver_attach) from [<c09af310>] (__driver_attach+0x80/0xbc)
> [<c09af310>] (__driver_attach) from [<c09ace34>] (bus_for_each_dev+0x68/0xb4)
> [<c09ace34>] (bus_for_each_dev) from [<c09ae00c>] (bus_add_driver+0x130/0x1e8)
> [<c09ae00c>] (bus_add_driver) from [<c09afd98>] (driver_register+0x78/0x110)
> [<c09afd98>] (driver_register) from [<bf139558>] (exynos_drm_init+0xe8/0x11c [exynosdrm])
> [<bf139558>] (exynos_drm_init [exynosdrm]) from [<c0302fa8>] (do_one_initcall+0x50/0x220)
> [<c0302fa8>] (do_one_initcall) from [<c03dc02c>] (do_init_module+0x60/0x210)
> [<c03dc02c>] (do_init_module) from [<c03daf44>] (load_module+0x1c0c/0x2310)
> [<c03daf44>] (load_module) from [<c03db85c>] (sys_finit_module+0xac/0xbc)
> [<c03db85c>] (sys_finit_module) from [<c0301000>] (ret_fast_syscall+0x0/0x54)
> Exception stack(0xecca3fa8 to 0xecca3ff0)
> ...
> ---[ end trace 276c91214635905c ]---
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>


Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej


> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 9ff921f43a93..f141916eade6 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1805,18 +1805,10 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
>  
>  	hdata->reg_hdmi_en = devm_regulator_get_optional(dev, "hdmi-en");
>  
> -	if (PTR_ERR(hdata->reg_hdmi_en) != -ENODEV) {
> +	if (PTR_ERR(hdata->reg_hdmi_en) != -ENODEV)
>  		if (IS_ERR(hdata->reg_hdmi_en))
>  			return PTR_ERR(hdata->reg_hdmi_en);
>  
> -		ret = regulator_enable(hdata->reg_hdmi_en);
> -		if (ret) {
> -			DRM_DEV_ERROR(dev,
> -				      "failed to enable hdmi-en regulator\n");
> -			return ret;
> -		}
> -	}
> -
>  	return hdmi_bridge_init(hdata);
>  }
>  
> @@ -2023,6 +2015,15 @@ static int hdmi_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	if (!IS_ERR(hdata->reg_hdmi_en)) {
> +		ret = regulator_enable(hdata->reg_hdmi_en);
> +		if (ret) {
> +			DRM_DEV_ERROR(dev,
> +			      "failed to enable hdmi-en regulator\n");
> +			goto err_hdmiphy;
> +		}
> +	}
> +
>  	pm_runtime_enable(dev);
>  
>  	audio_infoframe = &hdata->audio.infoframe;
> @@ -2047,7 +2048,8 @@ static int hdmi_probe(struct platform_device *pdev)
>  
>  err_rpm_disable:
>  	pm_runtime_disable(dev);
> -
> +	if (!IS_ERR(hdata->reg_hdmi_en))
> +		regulator_disable(hdata->reg_hdmi_en);
>  err_hdmiphy:
>  	if (hdata->hdmiphy_port)
>  		put_device(&hdata->hdmiphy_port->dev);


