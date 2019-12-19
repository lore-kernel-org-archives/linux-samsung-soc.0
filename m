Return-Path: <SRS0=HBcY=2J=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C58C2D0D2
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Dec 2019 02:19:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E22821582
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Dec 2019 02:19:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vH+d8qzP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbfLSCTm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 18 Dec 2019 21:19:42 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:39754 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbfLSCTl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 21:19:41 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20191219021937epoutp013b6899f46434e187076d10da15509c6c~hpEj9NGFx2681826818epoutp01t
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2019 02:19:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20191219021937epoutp013b6899f46434e187076d10da15509c6c~hpEj9NGFx2681826818epoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576721977;
        bh=2bEgPNz5879oRaYJw7ww0pH7b7U+kl32EhNoUlrnluY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=vH+d8qzPrrkJ4ubTN1I9Rv54GpBY4ybCkXXQXOaEmEHzVgaec2+7FouWP0eahf5kR
         MqeDamr+grEmLLW1TzeqsEG4441AN8cefamUkFmMvrjkInTcIxFn3gv0zowvGCK4J8
         S9LLZj/Zbb9hyXaFUphb4gR8siam0AtvgInZJ7U8=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191219021936epcas1p1b4af8a9622da35aef5878eb3600b593d~hpEia-YWu0248402484epcas1p1l;
        Thu, 19 Dec 2019 02:19:36 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.157]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 47dbDP1yv6zMqYkb; Thu, 19 Dec
        2019 02:19:33 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        1C.79.52419.53EDAFD5; Thu, 19 Dec 2019 11:19:33 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191219021932epcas1p1e4d340dfa8a04323ee417730e7aba2e2~hpEeiToQR0478904789epcas1p14;
        Thu, 19 Dec 2019 02:19:32 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191219021932epsmtrp18ae6bc0dda2dcbc3ba8fa26c74e88dbd~hpEehqLqr2528325283epsmtrp1j;
        Thu, 19 Dec 2019 02:19:32 +0000 (GMT)
X-AuditID: b6c32a37-5b7ff7000001ccc3-84-5dfade35eea4
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        3A.EE.06569.43EDAFD5; Thu, 19 Dec 2019 11:19:32 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191219021931epsmtip2a52e5262ee375c57737099344ac1dbff~hpEeUt61l0670006700epsmtip2k;
        Thu, 19 Dec 2019 02:19:31 +0000 (GMT)
Subject: Re: [PATCH v2] clk: samsung: exynos5420: Keep top G3D clocks
 enabled
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <3e7016c8-7c1b-3046-9a53-416ec78046a9@samsung.com>
Date:   Thu, 19 Dec 2019 11:26:05 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20191216131407.17225-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm2zk7O1arr2n6NsLm6UaGutPcOoaK3Y2ipCsEsg56mLIrO9PK
        oCwtbWVXlFpXK4m0sMRMi5qsqByVSRiWLaILXaCLReUFrG1HyX/P9zzP+73v830vTahqKDWd
        b3MJThtvYahRZNOdmdoE/av+bG3p+zHc1aP1cq69/YqC69n3Ss4dbb8t4y7fDSi4+qo+OTf4
        7CrJlb3/RGTQmS2egCKzoXYPlbm/sRZl/myIzSI3mFPzBD5XcGoEW449N99mSmOWrTYuMOoN
        WjaBTeHmMBobbxXSmIXLsxIW51uCYzCaQt5SEKSyeFFkktJTnfYCl6DJs4uuNEZw5FocKY5E
        kbeKBTZTYo7dOpfVamfrg8aN5ryyymLScX7G5gs7uhXFaGecG0XQgJPB7e6TudEoWoWbEdxr
        9VMhQYV/IKj7PlkSfiN4/OQkNVzR2tpBSMItBA/8txXS4RuCl+dayJArEq8Ed0lA7kY0HYXt
        4PmyJuQhcDcC/95uFPJQOB68H7vCt47DcdDZ+zbMK3E6XLzlDfMkngYfqjrlITwBr4O2ptIh
        z3hoO/Yu3Csi6C/tGQz7CRwDL96dlkl4Mlz/ciI8KeA/FBz2dJFShIXQeaNCIeFI+Hy/cQir
        4dOB3UN4K1xsu0tJxeUIGr1P5JKgA2/NEVkoGYFnQv2NJImOg5aBk0hqPBa+/toXDg9YCeW7
        VZJlCjx9HZBJeCKcK9tDHUSMZ0Qcz4gInhERPP+bnUFkLYoWHKLVJIisQzfytxtQeEXj5zSj
        K4+X+xCmETNG2buoP1sl5wvFLVYfAppgopTd5X3ZKmUuv6VIcNqNzgKLIPqQPvjahwj1hBx7
        cOFtLiOrn63T6bhk1qBnWSZGSfd2ZKuwiXcJZkFwCM7hOhkdoS5GJkNi9Cy/79Jg79/FNW8q
        5unco5uX9KQ+zMhPRt4M2jx1Fa/fsGCb79SpP3X0jkLN9b3M9kqi/WBTZPXqvyfwdN/Zscdf
        f045FltXIj5ffzPwaH/0oaVRuoF0f8m1BxUxDrP6ZvUuer1/TaVrbWHfpklFK/oTrEmG+Ybq
        H1+NEzu6GFLM49l4winy/wDFIJghuAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsWy7bCSvK7JvV+xBt/3sVpsnLGe1eL8+Q3s
        Fh977rFazDi/j8li7ZG77Bbrp/1ktfh3bSOLRfvTl8wOHB47Z91l99i0qpPNo2/LKkaPz5vk
        AliiuGxSUnMyy1KL9O0SuDLapzawFCxRr1jeeJu9gbFJsYuRk0NCwETiwIGLzF2MXBxCArsZ
        JR71XWCGSEhKTLt4FMjmALKFJQ4fLoaoecsocejSXnaQGmEBX4l/HaeYQGwRgXyJGXd6GUGK
        mAXuMkq0X4BwhAQmMkpM73rDAlLFJqAlsf/FDTYQm19AUeLqj8eMIDavgJ3Eyr37weIsAqoS
        z6ddZQWxRQXCJHYuecwEUSMocXLmE7A5nED1LR//gdUzC6hL/Jl3iRnCFpe49WQ+E4QtL7H9
        7RzmCYzCs5C0z0LSMgtJyywkLQsYWVYxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl5+duYgRH
        lJbWDsYTJ+IPMQpwMCrx8P5w/RUrxJpYVlyZe4hRgoNZSYT3dsfPWCHelMTKqtSi/Pii0pzU
        4kOM0hwsSuK88vnHIoUE0hNLUrNTUwtSi2CyTBycUg2Mq5xk0pevVhCbu/bVjbO3FnOuk7W0
        mVty6qDuVf6LUTXLPRpNZWZXH++azxt+tuXgiu9ThTZxut9LUHt401hF4NhWv0/2xydNDAwI
        l/X4J/Eu4n338+0lLC0r7849I6T45PzDq+7zVJ/yXTC1m/Oyt0iro3B+zpmr+5zvXPgdXP37
        7rvji45d2arEUpyRaKjFXFScCACwlqrwpAIAAA==
X-CMS-MailID: 20191219021932epcas1p1e4d340dfa8a04323ee417730e7aba2e2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191216131423eucas1p2162d6bf0a870357be9f0ab308641015b
References: <CGME20191216131423eucas1p2162d6bf0a870357be9f0ab308641015b@eucas1p2.samsung.com>
        <20191216131407.17225-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/16/19 10:14 PM, Marek Szyprowski wrote:
> In Exynos542x/5800 SoCs, the G3D leaf clocks are located in the G3D power
> domain. This is similar to the other hardware modules and their power
> domains. However there is one thing specific to G3D clocks hierarchy.
> Unlike other hardware modules, the G3D clocks hierarchy doesn't have any
> gate clock between the TOP part of the hierarchy and the part located in
> the power domain and some SoC internal busses are sourced directly from
> the TOP muxes. The consequence of this design if the fact that the TOP
> part of the hierarchy has to be enabled permanently to ensure proper
> operation of the SoC power related components (G3D power domain and
> Exynos Power Management Unit for system suspend/resume).
> 
> This patch adds an explicit call to clk_prepare_enable() on the last MUX
> in the TOP part of G3D clock hierarchy to keep it enabled permanently to
> ensure that the internal busses get their clock regardless of the main
> G3D clock enablement status.
> 
> This fixes following imprecise abort issue observed on Odroid XU3/XU4
> after enabling Panfrost driver by commit 1a5a85c56402 "ARM: dts: exynos:
> Add Mali/GPU node on Exynos5420 and enable it on Odroid XU3/4"):
> 
> panfrost 11800000.gpu: clock rate = 400000000
> panfrost 11800000.gpu: failed to get regulator: -517
> panfrost 11800000.gpu: regulator init failed -517
> Power domain G3D disable failed
> ...
> panfrost 11800000.gpu: clock rate = 400000000
> 8<--- cut here ---
> Unhandled fault: imprecise external abort (0x1406) at 0x00000000
> pgd = (ptrval)
> [00000000] *pgd=00000000
> Internal error: : 1406 [#1] PREEMPT SMP ARM
> Modules linked in:
> CPU: 7 PID: 53 Comm: kworker/7:1 Not tainted 5.4.0-rc8-next-20191119-00032-g56f1001191a6 #6923
> Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> Workqueue: events deferred_probe_work_func
> PC is at panfrost_gpu_soft_reset+0x94/0x110
> LR is at ___might_sleep+0x128/0x2dc
> ...
> [<c05c231c>] (panfrost_gpu_soft_reset) from [<c05c2704>] (panfrost_gpu_init+0x10/0x67c)
> [<c05c2704>] (panfrost_gpu_init) from [<c05c15d0>] (panfrost_device_init+0x158/0x2cc)
> [<c05c15d0>] (panfrost_device_init) from [<c05c0cb0>] (panfrost_probe+0x80/0x178)
> [<c05c0cb0>] (panfrost_probe) from [<c05cfaa0>] (platform_drv_probe+0x48/0x9c)
> [<c05cfaa0>] (platform_drv_probe) from [<c05cd20c>] (really_probe+0x1c4/0x474)
> [<c05cd20c>] (really_probe) from [<c05cd694>] (driver_probe_device+0x78/0x1bc)
> [<c05cd694>] (driver_probe_device) from [<c05cb374>] (bus_for_each_drv+0x74/0xb8)
> [<c05cb374>] (bus_for_each_drv) from [<c05ccfa8>] (__device_attach+0xd4/0x16c)
> [<c05ccfa8>] (__device_attach) from [<c05cc110>] (bus_probe_device+0x88/0x90)
> [<c05cc110>] (bus_probe_device) from [<c05cc634>] (deferred_probe_work_func+0x4c/0xd0)
> [<c05cc634>] (deferred_probe_work_func) from [<c0149df0>] (process_one_work+0x300/0x864)
> [<c0149df0>] (process_one_work) from [<c014a3ac>] (worker_thread+0x58/0x5a0)
> [<c014a3ac>] (worker_thread) from [<c0151174>] (kthread+0x12c/0x160)
> [<c0151174>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
> Exception stack(0xee03dfb0 to 0xee03dff8)
> ...
> Code: e594300c e5933020 e3130c01 1a00000f (ebefff50).
> ---[ end trace badde2b74a65a540 ]---
> 
> In the above case, the Panfrost driver disables G3D clocks after failure
> of getting the needed regulator and return with -EPROVE_DEFER code. This
> causes G3D power domain disable failure and then, during second probe
> an imprecise abort is triggered due to undefined power domain state.
> 
> Fixes: 45f10dabb56b ("clk: samsung: exynos5420: Add SET_RATE_PARENT flag to clocks on G3D path")
> Fixes: c9f7567aff31 ("clk: samsung: exynos542x: Move G3D subsystem clocks to its sub-CMU")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 3a991ca1ee36..c9e5a1fb6653 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -12,6 +12,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/clk.h>
>  
>  #include "clk.h"
>  #include "clk-cpu.h"
> @@ -1646,6 +1647,13 @@ static void __init exynos5x_clk_init(struct device_node *np,
>  				     exynos5x_subcmus);
>  	}
>  
> +	/*
> +	 * Keep top part of G3D clock path enabled permanently to ensure
> +	 * that the internal busses get their clock regardless of the
> +	 * main G3D clock enablement status.
> +	 */
> +	clk_prepare_enable(__clk_lookup("mout_sw_aclk_g3d"));
> +
>  	samsung_clk_of_add_provider(np, ctx);
>  }
>  
> 

I tested it by checking the enable count of 'mout_sw_aclk_g3d'.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
