Return-Path: <SRS0=HBcY=2J=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418ECC3F68F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Dec 2019 10:05:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 163602467E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Dec 2019 10:05:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Ag+1Fssh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfLSKFJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Dec 2019 05:05:09 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56926 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726759AbfLSKFI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Dec 2019 05:05:08 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191219100506euoutp01b9ad029b17f9d0b569887d89d26fcc36~hva_3M3md2043520435euoutp01e
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2019 10:05:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191219100506euoutp01b9ad029b17f9d0b569887d89d26fcc36~hva_3M3md2043520435euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576749906;
        bh=pH74D6f+oQZBNWZYsVqwklPPFDsLBR/ZagwamM+O/N8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Ag+1FsshMlYmheMjvCU8XQx7dEr0x5/ythDybb0s4wuuKXDOAFSytRhlOs91cY0iH
         B7s64duUBgAS4l6TqEWYpa5lO7pUy0gcqXR5vbwGj21UfnuTmi3tHN8zh/Ys75kk/l
         M5bwQIqN52SFbplUScxNeZQxH/ZV8dbazYSpS7no=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191219100506eucas1p2623c38b3c8bda0a4d6a9b2c64ca93421~hva_RTIQc1602316023eucas1p2N;
        Thu, 19 Dec 2019 10:05:06 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 5C.F9.60679.25B4BFD5; Thu, 19
        Dec 2019 10:05:06 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191219100505eucas1p1a5b0dc6c4ef9014dbfaacaf73a4f0ec2~hva99KSbW1111611116eucas1p1Z;
        Thu, 19 Dec 2019 10:05:05 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191219100505eusmtrp1b571898eb81dc36367031556a17523e5~hva98d4a43113331133eusmtrp1T;
        Thu, 19 Dec 2019 10:05:05 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-bf-5dfb4b5294f1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id E4.F4.08375.15B4BFD5; Thu, 19
        Dec 2019 10:05:05 +0000 (GMT)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191219100505eusmtip1dc684690d50a14523f6b05a3b5d5e0ad~hva9fOzfa1146811468eusmtip1A;
        Thu, 19 Dec 2019 10:05:05 +0000 (GMT)
Subject: Re: [PATCH v2] clk: samsung: exynos5420: Keep top G3D clocks
 enabled
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <f4f23b53-4eae-de3e-c8b2-099909522ce2@samsung.com>
Date:   Thu, 19 Dec 2019 11:05:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191216131407.17225-1-m.szyprowski@samsung.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHeXfO2TlbTt9NzQeVgqFlQZpZcKJQg4KBRWFkIQ1bebyUU9m8
        ZFGIZtlSEY201QeRQB3ovGXmyNQ0CTMNzBRZVi5l4cDLyCuax2Pkt9/zPv/n8n94GUJRS3kz
        iclpnC5Zk6QUS8mW90sDByIjVtQHZ8xubEO5mWK/OqcodmCgnmZnC75RbPlAu4it7bbSrPnJ
        EsWuDTeQ7INfdiJconpttNKqRtNDsaqo2YRU8427zpHR0uOxXFJiBqcLCr0iTcgffUmnduOb
        6z+islGdzIAYBvBhmHsmNyApo8DVCKyrI6QQOBEYvrxAQjCPYKjTRhmQZLNitfSNmGcFrkIw
        3y8T2IGguyyaZ3d8Fgy51k29B9ZCjr2J4hsROE8EJlPVZkKMg6GwpwjxLMOhMLzYRPNMYn+o
        LbOIePbEl8A2NEEJGjl8eGojeZZs6O/Nrm0uQWAvyHHWUALvhleO5wQ/DHA7Da3tc1tbn4QS
        4xQS2B1+9zbTAvtCX2kBKRTkIiiwjNFCUIxgvLdiq+IYvOv9TPEXI/A+MLcFCcc7Ad8rwwV0
        hRGHXNjBFUpaygjhWQb59xVCDz9YMZWJBPaGR7Z1shgpjducGbe5MW5zY/w/tgKRJuTFpeu1
        8Zz+UDKXGajXaPXpyfGB11K0jWjjE/Wt9TpbUdvq1S6EGaR0kS2eWlYrKE2GPkvbhYAhlB6y
        sfwltUIWq8m6xelSYnTpSZy+C/kwpNJLFlJpVytwvCaNu8FxqZzuX1bESLyzUW1+QEzHqDxv
        j8RylLi+1z5XrzrzMbLzSM30zlKLW0hcJR39uC4gsyjM92LL+MTP0MS34XdcdnjE6eBTj+0u
        94d14sv9C2zHeaYaWNdJx+RCX89tzzGt7nSoyeGxvDQ9cUFVbjf5hwxGRbSvWQeLS+NJ37Au
        8Uydn1HsA4VKUp+gCd5P6PSav4sLVGZAAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsVy+t/xu7qB3r9jDVZ1WFpsnLGe1eL6l+es
        FufPb2C3+Nhzj9Vixvl9TBZrj9xlt1g/7Serxb9rG1ks2p++ZHbg9Ng56y67x6ZVnWwefVtW
        MXp83iQXwBKlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqk
        b5egl9Fxcyt7wRGBiv8PwxoY1/F2MXJySAiYSPyZvJeti5GLQ0hgKaPErt51zF2MHEAJKYn5
        LUoQNcISf651QdW8ZpTY0DCZESQhLOAr8a/jFBNIvYhArsTpSfYgNcwC7UwSBya/ZIJomMgo
        Mb3rDQtIA5uAoUTv0T6wZl4BO4lrPzazg9gsAqoSa6fvZgKxRQUiJN7+vskKUSMocXLmE7Be
        TqD6lo//2EBsZgF1iT/zLjFD2OISTV9WskLY8hLb385hnsAoNAtJ+ywkLbOQtMxC0rKAkWUV
        o0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYPRtO/Zz8w7GSxuDDzEKcDAq8fD+cP0VK8SaWFZc
        mXuIUYKDWUmE93bHz1gh3pTEyqrUovz4otKc1OJDjKZAz01klhJNzgcmhrySeENTQ3MLS0Nz
        Y3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYzsRkcFN+WmrG6ac2PFhL1yPSrbnVXu
        ea9ZUKpo6iNxPOHq3hhf6UDGm3MbFdM3nH4WGbn8cpREx0Svx785nVqsJ+TejYlddnb5tg+Z
        FvePrecJ5runsqFBJulx5qlWVTfX110pYhJvjqb5dTSKm6sX1XmcflvB9nB7+iw9nnXHNjY3
        nerlXqbEUpyRaKjFXFScCABM1Utv1AIAAA==
X-CMS-MailID: 20191219100505eucas1p1a5b0dc6c4ef9014dbfaacaf73a4f0ec2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191216131423eucas1p2162d6bf0a870357be9f0ab308641015b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191216131423eucas1p2162d6bf0a870357be9f0ab308641015b
References: <CGME20191216131423eucas1p2162d6bf0a870357be9f0ab308641015b@eucas1p2.samsung.com>
        <20191216131407.17225-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/16/19 14:14, Marek Szyprowski wrote:
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

> ---
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 3a991ca1ee36..c9e5a1fb6653 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c

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

It's a bit unfortunate we don't store that clock in the driver internally,
which would let us avoid the __clk_lookup() call. I can't come up with any
simple alternative though so let's apply it for now.

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

I don't have any other bug fix patches for clk/samsung, could you take it 
directly into your tree Stephen? 

-- 
Thanks,
Sylwester
