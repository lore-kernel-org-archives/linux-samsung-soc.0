Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EDAC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 30 Mar 2022 08:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244095AbiC3IIF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 30 Mar 2022 04:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241258AbiC3IIF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 04:08:05 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296912E6AA
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Mar 2022 01:06:17 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20220330080613euoutp02ddc0489077a088ccc6f2bc8378881825~hGgr9X5Sh2781027810euoutp02_
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Mar 2022 08:06:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20220330080613euoutp02ddc0489077a088ccc6f2bc8378881825~hGgr9X5Sh2781027810euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1648627573;
        bh=AOarGKGJKsPmRUR/CFihsJ9YMm/6LvpSFrTFm8x1wFg=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=gphk4rZfR6RwB0xcLI/5tppJyKebHmdgA3ny/HMMiXKkOJ3w+nxRVZ+bY42LdeC5T
         XhSILLwD+6GAvnoUlO0ZSehq8TE/f+aHiX8dsj+4hVL/Wrn6BGOpHyUmEx3PQmTVrK
         f7X9M0PgdGlRqrrch1Li4sIyGzavV4Y5U75n1ISs=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20220330080612eucas1p15d24e2e8da1d5a89e93633b8b6ea7f21~hGgr1kXWR3073130731eucas1p1P;
        Wed, 30 Mar 2022 08:06:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 05.00.10009.47F04426; Wed, 30
        Mar 2022 09:06:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e~hGgrelrKV3009130091eucas1p1N;
        Wed, 30 Mar 2022 08:06:12 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220330080612eusmtrp1218599d344fe371862828c9c9bf912b6~hGgrdPgOB2897828978eusmtrp1R;
        Wed, 30 Mar 2022 08:06:12 +0000 (GMT)
X-AuditID: cbfec7f2-e95ff70000002719-9a-62440f741bc6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 9F.B7.09404.47F04426; Wed, 30
        Mar 2022 09:06:12 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220330080612eusmtip2d1c65aeaef0e4075da4d5d8ebf0ffaf7~hGgq-w9JB2169821698eusmtip2X;
        Wed, 30 Mar 2022 08:06:12 +0000 (GMT)
Message-ID: <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
Date:   Wed, 30 Mar 2022 10:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-amlogic@lists.infradead.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220325161144.1901695-4-maxime@cerno.tech>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsWy7djPc7ol/C5JBhMnmFicfHKd3WLBbG6L
        jz33WC1mnN/HZDHjxz9Gi4unXC3+XdvI4sDu8f5GK7vHnXPn2Tx23F3C6LFpVSebx+Yl9R6f
        N8kFsEVx2aSk5mSWpRbp2yVwZXxcuJKlYLJzxZ5nRQ2Mh027GDk5JARMJFpf9zKB2EICKxgl
        uu+7dDFyAdlfGCW2LHrGBOF8ZpSY+fwjK0zH5J+vWSESyxklvn44xgLhfGSUeDB5OjtIFa+A
        ncTiY1NYQGwWAVWJS4fnMULEBSVOznwCFhcVSJJYvX01G4gtLGAvcWVnM1gNs4C4xK0n88FW
        iwj0M0o8e3qDFSIxkVFi4UU5EJtNwFCi620XWDOngKXEyiXNTBA18hLNW2czgzRLCNzhkNh2
        o4sR4m4XicnLzrND2MISr45vgbJlJE5P7gG6iAPIzpf4O8MYIlwhce31GmYI21rizrlfbCAl
        zAKaEut36UOEHSVmzd3CBtHJJ3HjrSDEBXwSk7ZNZ4YI80p0tAlBVKtJzDq+Dm7nwQuXmCcw
        Ks1CCpRZSJ6fheSXWQh7FzCyrGIUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/dxAhMQaf/Hf+0
        g3Huq496hxiZOBgPMUpwMCuJ8H486JwkxJuSWFmVWpQfX1Sak1p8iFGag0VJnDc5c0OikEB6
        YklqdmpqQWoRTJaJg1OqgSlmw2V2lc6Yc7xdk09YhWUq/HV6zFPz+lzxJp0sr1Oxtw7OXHd/
        1stVxxLYEqqbJm/xTrcPmtiqUjHbSe1Gc9WHV5kzv5odfJh/Osji+/54x67NluZPP+vZ7GUQ
        vvzjYd/yzpQNq9cJvlWoW6W0YfNup4wq6aR9/TaPwx1amKRNmd2X+b5/0SLysd4j7UVyfl/Y
        ldR0rVORPw2ecE7JqJVt4BYwX2A1t8Fq/7pNCzR3SUuznZkoeKsj0PX6mYMXzzyqrZ/wMFut
        eOnuLFbV15zTBZYwz/bstDz96CfblrzVVvGlkS+TTa9YX7hdOs27MvHHszkJK697qVnKsnDm
        fixtPcEs78/wxXb3lhPn0pRYijMSDbWYi4oTAYMQeO2wAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsVy+t/xe7ol/C5JBv//ylicfHKd3WLBbG6L
        jz33WC1mnN/HZDHjxz9Gi4unXC3+XdvI4sDu8f5GK7vHnXPn2Tx23F3C6LFpVSebx+Yl9R6f
        N8kFsEXp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXo
        ZXxcuJKlYLJzxZ5nRQ2Mh027GDk5JARMJCb/fM3axcjFISSwlFHi84uFbBAJGYmT0xpYIWxh
        iT/XusDiQgLvGSXmfEkHsXkF7CQWH5vCAmKzCKhKXDo8jxEiLihxcuYTsLioQJLEpa52sLiw
        gL3ElZ3NYDazgLjErSfzmUAWiwj0M0pcOjgJ7ApmgcmMEu9ubWWF2JYucXjXHbAONgFDia63
        EFdwClhKrFzSzAQxyUyia2sX1FR5ieats5knMArNQnLILCQLZyFpmYWkZQEjyypGkdTS4tz0
        3GIjveLE3OLSvHS95PzcTYzAyNt27OeWHYwrX33UO8TIxMF4iFGCg1lJhPfjQeckId6UxMqq
        1KL8+KLSnNTiQ4ymwNCYyCwlmpwPjP28knhDMwNTQxMzSwNTSzNjJXFez4KORKDPEktSs1NT
        C1KLYPqYODilGpgad6wUYjDJrlzKnzY/t+G5hpfT5ochSxf9dqiumhM8Y+uHZ045lRaRb80N
        VDNPr5+n9uHpav2KTyGxIq65uc8L60RtnG22/OiQ9f/ss6L/kvIC4ZfNV2w/qLL1Xq/o9Ah1
        yONZYpqd++COcuGOze0bfjwNWl1erN/7/7DI+1/n73syas3e6RpusPF/3C4zjVBnte/9U484
        fFCUT2T5p1XyUpHrba7YEqMF0z/ICe/6vqPZxMw109Xx5V2lHD6d+saolpczHp8NWZJ6M26f
        vPfD9PVy7DVm1s4Vfz98Yvb59G9F2GelM1fEE2eWiJw48iHuL/f1I2cvV3LVndA9fOpmZMuM
        fVdbvrIaTQ2dJK7EUpyRaKjFXFScCACH5MwkRQMAAA==
X-CMS-MailID: 20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e
References: <20220325161144.1901695-1-maxime@cerno.tech>
        <20220325161144.1901695-4-maxime@cerno.tech>
        <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 25.03.2022 17:11, Maxime Ripard wrote:
> While the current code will trigger a new clk_set_rate call whenever the
> rate boundaries are changed through clk_set_rate_range, this doesn't
> occur when clk_put() is called.
>
> However, this is essentially equivalent since, after clk_put()
> completes, those boundaries won't be enforced anymore.
>
> Let's add a call to clk_set_rate_range in clk_put to make sure those
> rate boundaries are dropped and the clock drivers can react.
>
> Let's also add a few tests to make sure this case is covered.
>
> Fixes: c80ac50cbb37 ("clk: Always set the rate on clk_set_range_rate")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

This patch landed recently in linux-next 20220328 as commit 7dabfa2bc480 
("clk: Drop the rate range on clk_put()"). Sadly it breaks booting of 
the few of my test systems: Samsung ARM 32bit Exynos3250 based Rinato 
board and all Amlogic Meson G12B/SM1 based boards (Odroid C4, N2, Khadas 
VIM3/VIM3l). Rinato hangs always with the following oops:

--->8---

Kernel panic - not syncing: MCT hangs after writing 4 (offset:0x420)
CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.17.0-rc1-00014-g7dabfa2bc480 
#11551
Hardware name: Samsung Exynos (Flattened Device Tree)
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from panic+0x10c/0x328
  panic from exynos4_mct_tick_stop+0x0/0x2c
---[ end Kernel panic - not syncing: MCT hangs after writing 4 
(offset:0x420) ]---

--->8---

Amlogic boards hang randomly during early userspace init, usually just 
after loading the driver modules.

Reverting $subject on top of linux-next fixes all those problems.

I will try to analyze it a bit more and if possible provide some more 
useful/meaning full logs later.

> ---
>   drivers/clk/clk.c      |  42 ++++++++++------
>   drivers/clk/clk_test.c | 108 +++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 136 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 915a2fa363b1..91f863b7a824 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2332,19 +2332,15 @@ int clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
>   }
>   EXPORT_SYMBOL_GPL(clk_set_rate_exclusive);
>   
> -/**
> - * clk_set_rate_range - set a rate range for a clock source
> - * @clk: clock source
> - * @min: desired minimum clock rate in Hz, inclusive
> - * @max: desired maximum clock rate in Hz, inclusive
> - *
> - * Returns success (0) or negative errno.
> - */
> -int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
> +static int clk_set_rate_range_nolock(struct clk *clk,
> +				     unsigned long min,
> +				     unsigned long max)
>   {
>   	int ret = 0;
>   	unsigned long old_min, old_max, rate;
>   
> +	lockdep_assert_held(&prepare_lock);
> +
>   	if (!clk)
>   		return 0;
>   
> @@ -2357,8 +2353,6 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
>   		return -EINVAL;
>   	}
>   
> -	clk_prepare_lock();
> -
>   	if (clk->exclusive_count)
>   		clk_core_rate_unprotect(clk->core);
>   
> @@ -2402,6 +2396,28 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
>   	if (clk->exclusive_count)
>   		clk_core_rate_protect(clk->core);
>   
> +	return ret;
> +}
> +
> +/**
> + * clk_set_rate_range - set a rate range for a clock source
> + * @clk: clock source
> + * @min: desired minimum clock rate in Hz, inclusive
> + * @max: desired maximum clock rate in Hz, inclusive
> + *
> + * Returns success (0) or negative errno.
> + */
> +int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
> +{
> +	int ret;
> +
> +	if (!clk)
> +		return 0;
> +
> +	clk_prepare_lock();
> +
> +	ret = clk_set_rate_range_nolock(clk, min, max);
> +
>   	clk_prepare_unlock();
>   
>   	return ret;
> @@ -4403,9 +4419,7 @@ void __clk_put(struct clk *clk)
>   	}
>   
>   	hlist_del(&clk->clks_node);
> -	if (clk->min_rate > clk->core->req_rate ||
> -	    clk->max_rate < clk->core->req_rate)
> -		clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
> +	clk_set_rate_range_nolock(clk, 0, ULONG_MAX);
>   
>   	owner = clk->core->owner;
>   	kref_put(&clk->core->ref, __clk_release);
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index 146b1759798e..b205c329cf32 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -760,9 +760,65 @@ static void clk_range_test_multiple_set_range_rate_maximized(struct kunit *test)
>   	clk_put(user1);
>   }
>   
> +/*
> + * Test that if we have several subsequent calls to
> + * clk_set_rate_range(), across multiple users, the core will reevaluate
> + * whether a new rate is needed, including when a user drop its clock.
> + *
> + * With clk_dummy_maximize_rate_ops, this means that the the rate will
> + * trail along the maximum as it evolves.
> + */
> +static void clk_range_test_multiple_set_range_rate_put_maximized(struct kunit *test)
> +{
> +	struct clk_dummy_context *ctx = test->priv;
> +	struct clk_hw *hw = &ctx->hw;
> +	struct clk *clk = hw->clk;
> +	struct clk *user1, *user2;
> +	unsigned long rate;
> +
> +	user1 = clk_hw_get_clk(hw, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user1);
> +
> +	user2 = clk_hw_get_clk(hw, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user2);
> +
> +	KUNIT_ASSERT_EQ(test,
> +			clk_set_rate(clk, DUMMY_CLOCK_RATE_2 + 1000),
> +			0);
> +
> +	KUNIT_ASSERT_EQ(test,
> +			clk_set_rate_range(user1,
> +					   0,
> +					   DUMMY_CLOCK_RATE_2),
> +			0);
> +
> +	rate = clk_get_rate(clk);
> +	KUNIT_ASSERT_GT(test, rate, 0);
> +	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
> +
> +	KUNIT_ASSERT_EQ(test,
> +			clk_set_rate_range(user2,
> +					   0,
> +					   DUMMY_CLOCK_RATE_1),
> +			0);
> +
> +	rate = clk_get_rate(clk);
> +	KUNIT_ASSERT_GT(test, rate, 0);
> +	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
> +
> +	clk_put(user2);
> +
> +	rate = clk_get_rate(clk);
> +	KUNIT_ASSERT_GT(test, rate, 0);
> +	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
> +
> +	clk_put(user1);
> +}
> +
>   static struct kunit_case clk_range_maximize_test_cases[] = {
>   	KUNIT_CASE(clk_range_test_set_range_rate_maximized),
>   	KUNIT_CASE(clk_range_test_multiple_set_range_rate_maximized),
> +	KUNIT_CASE(clk_range_test_multiple_set_range_rate_put_maximized),
>   	{}
>   };
>   
> @@ -877,9 +933,61 @@ static void clk_range_test_multiple_set_range_rate_minimized(struct kunit *test)
>   	clk_put(user1);
>   }
>   
> +/*
> + * Test that if we have several subsequent calls to
> + * clk_set_rate_range(), across multiple users, the core will reevaluate
> + * whether a new rate is needed, including when a user drop its clock.
> + *
> + * With clk_dummy_minimize_rate_ops, this means that the the rate will
> + * trail along the minimum as it evolves.
> + */
> +static void clk_range_test_multiple_set_range_rate_put_minimized(struct kunit *test)
> +{
> +	struct clk_dummy_context *ctx = test->priv;
> +	struct clk_hw *hw = &ctx->hw;
> +	struct clk *clk = hw->clk;
> +	struct clk *user1, *user2;
> +	unsigned long rate;
> +
> +	user1 = clk_hw_get_clk(hw, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user1);
> +
> +	user2 = clk_hw_get_clk(hw, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user2);
> +
> +	KUNIT_ASSERT_EQ(test,
> +			clk_set_rate_range(user1,
> +					   DUMMY_CLOCK_RATE_1,
> +					   ULONG_MAX),
> +			0);
> +
> +	rate = clk_get_rate(clk);
> +	KUNIT_ASSERT_GT(test, rate, 0);
> +	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
> +
> +	KUNIT_ASSERT_EQ(test,
> +			clk_set_rate_range(user2,
> +					   DUMMY_CLOCK_RATE_2,
> +					   ULONG_MAX),
> +			0);
> +
> +	rate = clk_get_rate(clk);
> +	KUNIT_ASSERT_GT(test, rate, 0);
> +	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
> +
> +	clk_put(user2);
> +
> +	rate = clk_get_rate(clk);
> +	KUNIT_ASSERT_GT(test, rate, 0);
> +	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
> +
> +	clk_put(user1);
> +}
> +
>   static struct kunit_case clk_range_minimize_test_cases[] = {
>   	KUNIT_CASE(clk_range_test_set_range_rate_minimized),
>   	KUNIT_CASE(clk_range_test_multiple_set_range_rate_minimized),
> +	KUNIT_CASE(clk_range_test_multiple_set_range_rate_put_minimized),
>   	{}
>   };
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

