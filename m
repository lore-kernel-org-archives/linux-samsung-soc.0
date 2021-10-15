Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76800C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 07:15:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 519CF611BD
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 07:15:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235945AbhJOHRR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 03:17:17 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36001 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234395AbhJOHRQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 03:17:16 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211015071509euoutp01df584be42058d6bf298e3bab88789102~uIutzBnha2681526815euoutp01t
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Oct 2021 07:15:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211015071509euoutp01df584be42058d6bf298e3bab88789102~uIutzBnha2681526815euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634282109;
        bh=olx3adYSe+y9HVK287/r5de4lld3M09z6O3SmXtaPr0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=lCkXKjRmlGRWxO5DXOI8a0rzGyQFiAPVTs4Gz1G0kKvqfKVmVxzXJqxvF3Wqta76n
         BdYl5LyBqYHfqw34RtsatzQd7YHYwHz5fbDy2Q+Z0ehTAD/FiQnCNHH+H1Dt3IXI9L
         quNYOfnicN8MaUkS+UNqkbF9IM9h0g9T3YEO84vk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20211015071509eucas1p2e28a5fa95ab394e3345d256308a1c59f~uIutdVxdk0465504655eucas1p2t;
        Fri, 15 Oct 2021 07:15:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id CC.DA.45756.C7A29616; Fri, 15
        Oct 2021 08:15:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20211015071508eucas1p296492b41e85eb1fb495c6b51b1cb6a31~uIus65T8f0463604636eucas1p2v;
        Fri, 15 Oct 2021 07:15:08 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211015071508eusmtrp17011cc227a1dc9aed56b2d0c9e6c1a77~uIus6FlIc0509605096eusmtrp10;
        Fri, 15 Oct 2021 07:15:08 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-2f-61692a7c13e4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 3F.F6.31287.C7A29616; Fri, 15
        Oct 2021 08:15:08 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211015071507eusmtip13b9c7af17b96d789037213cac8e02e5b~uIusOixKe2548325483eusmtip17;
        Fri, 15 Oct 2021 07:15:07 +0000 (GMT)
Subject: Re: [PATCH v4 1/2] [RFT] clk: samsung: add support for CPU clocks
To:     Will McVicker <willmcvicker@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     kernel-team@android.com, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <ac82af87-5dcd-07c9-9b09-3a7c33503f8d@samsung.com>
Date:   Fri, 15 Oct 2021 09:15:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211014195347.3635601-2-willmcvicker@google.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se1BMYRjGfXsue3ZZTlvaL8JYMS4jtow5VK4ZhzSaYZQMWZzZot2y29rc
        V25bSpRJHUwhanbcdpktNaSYFtGNkhAJjYhqMyiVdo9L//2e733eed/nnY9AxPexEUSEKoZR
        q+SRUlyIWkp/VkzdNTlCPr3skw/1rLMZo/LzXChT6w8eZW6qxaj2xAaMelJwGqfSK27zqKqH
        i6i7nw9jVG+tCaWMBb8AZezoA/OG0JZCC0Z/rTvIp1l9Ek7fZF/x6SyzljYb43H6evZe+ugN
        I6Bt5tFBglCh7yYmMmIbo542Z70wnH3TzI9OlsY+tWYhepA/MgEQBCRnwPc13glASIjJXAAL
        u17wONEJYO+dCzgnbAA+MRj6KwJHR25yKp8r5ADI7juCcqIdwJ7sXGB3OZNLYWPRMUe7C2nm
        Qf2t95hdIORZAD+b8nC7CydlMKE1wcEicg7sK2cRO6PkeFhdV4nZeTi5Eab1xCGcxwk+yHiH
        2llAzoXGR70OD0KOgXmtpxGOJbD+XeafXU8J4IFXFMf+MLWvE3DsDFusN/gcu8Oy1ERHBEju
        B7Cx/DKfE4n9qePS/3T4wJflXbj9Zgg5CV4tmMY9z4c/bKkod8qhsK7VidthKEyxnES4ZxE0
        HBJz7gmQtV75N7a4sho5BqTsgGTsgDTsgDTs/7lZADUCCaPVKBWMRqZidJ4auVKjVSk8N0Yp
        zaD/s5X1WjvywZmWds8SwCNACYAEInURfbmjkItFm+TbdzDqqDC1NpLRlICRBCqViIynLoWJ
        SYU8htnCMNGM+m+VRwhG6HkpIa4eLU1tW03uK1dnf2wkTEXq12Yv9GK8qcb3WsrJUQ3+9bN+
        eSu3t61ezt7SDc5xL5RoZu1RNqUpB8dd+Khbr6p+gOgzdj0e9jh3qS1J271g7aBPWLVTo3Pg
        Ymmnvzh+WVSm7NtC1ifokLdeGFh/ZmxwrELdVLonyG1899zvmzu8Q0uv5pTd7a4y8EJsMwPe
        9nhUrPIqsBkCL5+/Zy061xVe4/8ouK34zbPnEt3UBreQE0B3fPfuysRBgeOKi0fvrPWbOLsl
        70OAh1ua3xpXWWlolNc8y4roIF+RFxp9va8naZnfwg7Xe9/XxZ6LCZ6OZDZXzcS/8JMFszeE
        LZnim96NSFFNuFw2GVFr5L8B3BrNo9sDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsVy+t/xu7o1WpmJBp/mi1tc//Kc1WLHdhGL
        jW9/MFlsenyN1eJjzz1Wi8u75rBZzDi/j8ni4ilXi8Nv2lkt/l3byGKxatcfRotVn/4zOvB4
        bNu9jdXj/Y1Wdo9ZDb1sHjtn3WX3WLCp1GPTqk42j81L6j36tqxi9Pi8SS6AM0rPpii/tCRV
        ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY9aD5+wF/UoVV44v
        YG5g3CHdxcjJISFgIrGifzJ7FyMXh5DAUkaJDzu2M0IkZCROTmtghbCFJf5c62KDKHrPKDFl
        5jwWkISwgJfEw/0TwBIiApuYJPpObwNzmAUWMkq0bHrJAtFynFHi28ZfYC1sAoYSXW9BZnFy
        8ArYSfw/N4sZxGYRUJW4dOMC2D5RgWSJt6+/M0HUCEqcnPkErJdTwF5i1Zl/YDXMAmYS8zY/
        ZIaw5SW2v50DZYtL3Hoyn2kCo9AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV5
        6XrJ+bmbGIHRvO3Yz807GOe9+qh3iJGJg/EQowQHs5II77sD6YlCvCmJlVWpRfnxRaU5qcWH
        GE2B/pnILCWanA9MJ3kl8YZmBqaGJmaWBqaWZsZK4rxb566JFxJITyxJzU5NLUgtgulj4uCU
        amBKqeZnmW42aWly16Ijh2u/Jz9yqIzNvB85rXI/99oXfPKeiVdOHOZ8p+Kz4UToLONj/lu9
        FYQZF55eXHQstvKK0Gq+/5PLJqx2OfBl2bz0QylTDj8T2v7CtGrXE+6nK+ZN2bnS29Razmbz
        fvWix5H157hCjqQteLHlDPNRpUOOEyJe2Ht4yt4tzjxVtTb1T6mcrdLaDzlyEy/5Wog27i8v
        vbE+R+dnzqvVUZkWbGe8f+d3h02trqt33bL+JefW+3rWz8XPfDn06193zJU9Ooe55v2S2aL9
        7NGLhoM1P3OcnuQxMPz5ZxzOr7xJlEE9QePACgfHmjOHimS6O8vKZku/OJlwR1A6bdcVkZaq
        rCnzlViKMxINtZiLihMBffqhQ28DAAA=
X-CMS-MailID: 20211015071508eucas1p296492b41e85eb1fb495c6b51b1cb6a31
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211014195358eucas1p28a79dc8ac217ee813be2a028c29191ea
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211014195358eucas1p28a79dc8ac217ee813be2a028c29191ea
References: <20211014195347.3635601-1-willmcvicker@google.com>
        <CGME20211014195358eucas1p28a79dc8ac217ee813be2a028c29191ea@eucas1p2.samsung.com>
        <20211014195347.3635601-2-willmcvicker@google.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14.10.2021 21:53, Will McVicker wrote:
> Adds 'struct samsung_cpu_clock' and corresponding CPU clock registration
> function to the samsung common clk driver. This allows samsung clock
> drivers to register their CPU clocks with the samsung_cmu_register_one()
> API.
>
> Currently the exynos5433 apollo and atlas clks have their own custom
> init functions to handle registering their CPU clocks. With this patch
> we can drop their custom CLK_OF_DECLARE functions and directly call
> samsung_cmu_register_one().
>
> Signed-off-by: Will McVicker <willmcvicker@google.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/clk/samsung/clk-cpu.c | 18 ++++++++++++++++++
>   drivers/clk/samsung/clk.c     |  2 ++
>   drivers/clk/samsung/clk.h     | 26 ++++++++++++++++++++++++++
>   3 files changed, 46 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
> index 00ef4d1b0888..7f20d9aedaa9 100644
> --- a/drivers/clk/samsung/clk-cpu.c
> +++ b/drivers/clk/samsung/clk-cpu.c
> @@ -469,3 +469,21 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
>   	kfree(cpuclk);
>   	return ret;
>   }
> +
> +void __init samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
> +		const struct samsung_cpu_clock *list, unsigned int nr_clk)
> +{
> +	unsigned int idx;
> +	unsigned int num_cfgs;
> +	struct clk_hw **hws = ctx->clk_data.hws;
> +
> +	for (idx = 0; idx < nr_clk; idx++, list++) {
> +		/* find count of configuration rates in cfg */
> +		for (num_cfgs = 0; list->cfg[num_cfgs].prate != 0; )
> +			num_cfgs++;
> +
> +		exynos_register_cpu_clock(ctx, list->id, list->name, hws[list->parent_id],
> +				hws[list->alt_parent_id], list->offset, list->cfg, num_cfgs,
> +				list->flags);
> +	}
> +}
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index 1949ae7851b2..336243c6f120 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -378,6 +378,8 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
>   		samsung_clk_extended_sleep_init(reg_base,
>   			cmu->clk_regs, cmu->nr_clk_regs,
>   			cmu->suspend_regs, cmu->nr_suspend_regs);
> +	if (cmu->cpu_clks)
> +		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
>   
>   	samsung_clk_of_add_provider(np, ctx);
>   
> diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
> index c1e1a6b2f499..26499e97275b 100644
> --- a/drivers/clk/samsung/clk.h
> +++ b/drivers/clk/samsung/clk.h
> @@ -271,6 +271,27 @@ struct samsung_pll_clock {
>   	__PLL(_typ, _id, _name, _pname, CLK_GET_RATE_NOCACHE, _lock,	\
>   	      _con, _rtable)
>   
> +struct samsung_cpu_clock {
> +	unsigned int	id;
> +	const char	*name;
> +	unsigned int	parent_id;
> +	unsigned int	alt_parent_id;
> +	unsigned long	flags;
> +	int		offset;
> +	const struct exynos_cpuclk_cfg_data *cfg;
> +};
> +
> +#define CPU_CLK(_id, _name, _pid, _apid, _flags, _offset, _cfg) \
> +	{							\
> +		.id		  = _id,			\
> +		.name		  = _name,			\
> +		.parent_id	  = _pid,			\
> +		.alt_parent_id	  = _apid,			\
> +		.flags		  = _flags,			\
> +		.offset		  = _offset,			\
> +		.cfg		  = _cfg,			\
> +	}
> +
>   struct samsung_clock_reg_cache {
>   	struct list_head node;
>   	void __iomem *reg_base;
> @@ -301,6 +322,9 @@ struct samsung_cmu_info {
>   	unsigned int nr_fixed_factor_clks;
>   	/* total number of clocks with IDs assigned*/
>   	unsigned int nr_clk_ids;
> +	/* list of cpu clocks and respective count */
> +	const struct samsung_cpu_clock *cpu_clks;
> +	unsigned int nr_cpu_clks;
>   
>   	/* list and number of clocks registers */
>   	const unsigned long *clk_regs;
> @@ -350,6 +374,8 @@ extern void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
>   extern void __init samsung_clk_register_pll(struct samsung_clk_provider *ctx,
>   			const struct samsung_pll_clock *pll_list,
>   			unsigned int nr_clk, void __iomem *base);
> +extern void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
> +		const struct samsung_cpu_clock *list, unsigned int nr_clk);
>   
>   extern struct samsung_clk_provider __init *samsung_cmu_register_one(
>   			struct device_node *,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

