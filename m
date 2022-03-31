Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5823EC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 31 Mar 2022 09:57:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234385AbiCaJ6v (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 31 Mar 2022 05:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234340AbiCaJ6s (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 05:58:48 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FA9202167
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Mar 2022 02:56:59 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20220331095653euoutp02ce5becdb3aec54b5bb1c2d26dd77fa9d~hbqmlb1aG1024110241euoutp02N
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Mar 2022 09:56:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20220331095653euoutp02ce5becdb3aec54b5bb1c2d26dd77fa9d~hbqmlb1aG1024110241euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1648720613;
        bh=/NMz6n8aL7PXsymzKWz1HCMBHBCnjrjE/emfCvZi+r8=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=k09FTyCAdB8TPqySngtYCQZoxMAGevnAyi+Zx1dxsUU5kLrgmFjetHhCT6uSoOwdA
         UiEFAKdN0ucE9G7xNoRk83ITYuUtuBwa8uHOq4DYWdVLa0k6DYuXutzSWWcYh/nxqV
         qduZb0kG3GPsp4cZUKjqBaek0uIRADcclYHkANBg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20220331095653eucas1p249c83675a4ebe10079f8e255c84099c0~hbqmLVSFi1559515595eucas1p2Z;
        Thu, 31 Mar 2022 09:56:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 4C.EE.09887.4EA75426; Thu, 31
        Mar 2022 10:56:53 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20220331095652eucas1p2d06107b8c2a39bec14fcd67d001429d7~hbqlx5qV71955319553eucas1p2B;
        Thu, 31 Mar 2022 09:56:52 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220331095652eusmtrp1f5b02a90c92a1709ebcb558cfb83bb9b~hbqlwg4EQ1929019290eusmtrp1O;
        Thu, 31 Mar 2022 09:56:52 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-c4-62457ae47739
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id A4.0F.09522.4EA75426; Thu, 31
        Mar 2022 10:56:52 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220331095652eusmtip145d4f0a4d9c65f3b4556f18a28a89306~hbqlTyTA_2482824828eusmtip1o;
        Thu, 31 Mar 2022 09:56:52 +0000 (GMT)
Message-ID: <7465a7dc-c45e-2612-4c39-d15eceb9b75c@samsung.com>
Date:   Thu, 31 Mar 2022 11:56:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-amlogic@lists.infradead.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220330084710.3r6b5pjspz5hdmy6@houat>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsWy7djP87pPq1yTDDomMFqcfHKd3WLBbG6L
        jz33WC1mnN/HZDHjxz9Gi4unXC3+XdvI4sDu8f5GK7vHnXPn2Tx23F3C6LFpVSebx+Yl9R6f
        N8kFsEVx2aSk5mSWpRbp2yVwZaxZdYOl4KJ4RfdlqwbGlcJdjJwcEgImEs83rGTqYuTiEBJY
        wSix5vhlRgjnC6PEu5mvoZzPQM6iVexdjBxgLUsvhELElzNKXDn/gB3C+cgo0XtmHzvIXF4B
        O4lDP/6D2SwCqhLzrjSxQcQFJU7OfMICYosKJEms3r4aLC4sYC9xZWczI4jNLCAucevJfCYQ
        WwSo90rvXmaI+G9GiTMf5UFsNgFDia63XWwgB3ECHdS+IxqiRF6ieetsZpB7JATucEjs2ryW
        HeJPF4kpk28yQtjCEq+Ob4GKy0icntzDAvFYvsTfGcYQ4QqJa6/XMEPY1hJ3zv0CW8UsoCmx
        fpc+RNhRYtbcLWwQnXwSN94KQlzAJzFp23RmiDCvREebEES1msSs4+vgdh68cIl5AqPSLKQg
        mYXk9VlIfpmFsHcBI8sqRvHU0uLc9NRio7zUcr3ixNzi0rx0veT83E2MwPRz+t/xLzsYl7/6
        qHeIkYmD8RCjBAezkgjv1VjXJCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8yZkbEoUE0hNLUrNT
        UwtSi2CyTBycUg1MxnIe//wFF4gXr6prmPpnv8f5q3xOe+Uvc87Z7niPO+7EVT+NWa6em30f
        rmdtWOTdPreARUwiNq4iO01fL/C9z5EtzfyNLiW7Poecz8gx+KQnvGn/hqDwzLVyexQOr1iU
        FDphh/Xa2Voed/1+r4qy/X6vfqaKV1fo8ZuXOW7nrinV1V/nV7HWql7NXHOX4ZrtxlacmxiF
        Did5nxb2WnTA62/IrYOHfZ/q3k/Lujp9zcYF3hcbS4rmz1mdUse06iKbxRSVSwUedjrKs7W3
        x7QHlAQ+4vuQsLLOue/Yg6ZNSVHrU9v/9S+x6q/vyOJ/e1lHfNWOT2sUdDZO9PoRpaypa2Vz
        9tS3jUFXu94VPhdWYinOSDTUYi4qTgQARoq1pq4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xu7pPqlyTDBZuVLQ4+eQ6u8WC2dwW
        H3vusVrMOL+PyWLGj3+MFhdPuVr8u7aRxYHd4/2NVnaPO+fOs3nsuLuE0WPTqk42j81L6j0+
        b5ILYIvSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQ
        y1iz6gZLwUXxiu7LVg2MK4W7GDk4JARMJJZeCO1i5OIQEljKKLG+o5+pi5ETKC4jcXJaAyuE
        LSzx51oXG0TRe0aJix+XsIMkeAXsJA79+A9mswioSsy70sQGEReUODnzCQuILSqQJHGpq50R
        xBYWsJe4srMZzGYWEJe49WQ+2DIRoN4rvXuZQRYwC/xllNi+5ysrxLZZTBKz/twCm8QmYCjR
        9RbkDA4OTqCz23dEQwwyk+ja2gU1VF6ieets5gmMQrOQ3DELyb5ZSFpmIWlZwMiyilEktbQ4
        Nz232FCvODG3uDQvXS85P3cTIzDuth37uXkH47xXH/UOMTJxMB5ilOBgVhLhvRrrmiTEm5JY
        WZValB9fVJqTWnyI0RQYGBOZpUST84GRn1cSb2hmYGpoYmZpYGppZqwkzutZ0JEoJJCeWJKa
        nZpakFoE08fEwSnVwLRDof5PA+ejuI0XtDYvdvQILbqvPu111YPgKE8lNr7k5UsLhJ+I+b1K
        dDzYvkk4jVFN1WLGZIuCBCXO7fMjI/92ZCRcX23xw35xdshN3iNrlztuPtebqXy96anWKpYE
        Bz+fGQ0fNjTLfGh36pvOuXuR88wThR7uzc35yzf9/vFlhwxb6cTeWcazXt7y2FJ55K9yfVi9
        gO0u7XRf2WPtOyMO5sWV7/+459T0WskoLzdb9i0M4XMKVb97X1P723F8GscL3iOvPmYnOphs
        0Y6vZ3x66n+J65Pa0gWZImzSWS07WRy5mh4d+n07085+TbDE8VSXzFglD+G6L65WZ/9aMK4+
        /bNWac63aS/2iV88r8RSnJFoqMVcVJwIAG1LOmJEAwAA
X-CMS-MailID: 20220331095652eucas1p2d06107b8c2a39bec14fcd67d001429d7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e
References: <20220325161144.1901695-1-maxime@cerno.tech>
        <20220325161144.1901695-4-maxime@cerno.tech>
        <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
        <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
        <20220330084710.3r6b5pjspz5hdmy6@houat>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 30.03.2022 10:47, Maxime Ripard wrote:
> On Wed, Mar 30, 2022 at 10:06:13AM +0200, Marek Szyprowski wrote:
>> On 25.03.2022 17:11, Maxime Ripard wrote:
>>> While the current code will trigger a new clk_set_rate call whenever the
>>> rate boundaries are changed through clk_set_rate_range, this doesn't
>>> occur when clk_put() is called.
>>>
>>> However, this is essentially equivalent since, after clk_put()
>>> completes, those boundaries won't be enforced anymore.
>>>
>>> Let's add a call to clk_set_rate_range in clk_put to make sure those
>>> rate boundaries are dropped and the clock drivers can react.
>>>
>>> Let's also add a few tests to make sure this case is covered.
>>>
>>> Fixes: c80ac50cbb37 ("clk: Always set the rate on clk_set_range_rate")
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>> This patch landed recently in linux-next 20220328 as commit 7dabfa2bc480
>> ("clk: Drop the rate range on clk_put()"). Sadly it breaks booting of
>> the few of my test systems: Samsung ARM 32bit Exynos3250 based Rinato
>> board and all Amlogic Meson G12B/SM1 based boards (Odroid C4, N2, Khadas
>> VIM3/VIM3l). Rinato hangs always with the following oops:
>>
>> --->8---
>>
>> Kernel panic - not syncing: MCT hangs after writing 4 (offset:0x420)
>> CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.17.0-rc1-00014-g7dabfa2bc480
>> #11551
>> Hardware name: Samsung Exynos (Flattened Device Tree)
>>    unwind_backtrace from show_stack+0x10/0x14
>>    show_stack from dump_stack_lvl+0x58/0x70
>>    dump_stack_lvl from panic+0x10c/0x328
>>    panic from exynos4_mct_tick_stop+0x0/0x2c
>> ---[ end Kernel panic - not syncing: MCT hangs after writing 4
>> (offset:0x420) ]---
>>
>> --->8---
>>
>> Amlogic boards hang randomly during early userspace init, usually just
>> after loading the driver modules.
>>
>> Reverting $subject on top of linux-next fixes all those problems.
>>
>> I will try to analyze it a bit more and if possible provide some more
>> useful/meaning full logs later.
> I'm not sure what could go wrong there, but if you can figure out the
> clock, if it tries to set a new rate and what rate it is, it would be
> awesome :)

So far I've noticed that the problem is caused by setting rate of some 
clocks to zero. The following patch fixes my issues:

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 32a9eaf35c6b..39cab08dbecb 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2201,6 +2201,9 @@ static int clk_core_set_rate_nolock(struct 
clk_core *core,
         if (!core)
                 return 0;

+       if (req_rate == 0)
+               return 0;
+
         rate = clk_core_req_round_rate_nolock(core, req_rate);

         /* bail early if nothing to do */
--

I will soon grab the call stack and relevant clock topology show how the 
rate is set to zero.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

