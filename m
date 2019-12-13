Return-Path: <SRS0=lSeZ=2D=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EB8C3F68F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Dec 2019 07:11:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F122A2465B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Dec 2019 07:11:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YUkfdHqi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbfLMHLM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 13 Dec 2019 02:11:12 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38568 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfLMHLM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 02:11:12 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191213071110euoutp013b6f8db9b74c477305439bd03037495a~f3LZILUOG1831418314euoutp01E
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2019 07:11:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191213071110euoutp013b6f8db9b74c477305439bd03037495a~f3LZILUOG1831418314euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576221070;
        bh=9MFF1DgA6jOh20cwUA3buAYtqMYITdDHGKWBQk55rfM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=YUkfdHqie3jDYfZrULS7Abxes4sFNY7V60UM+QX8CdIId9E88cbmzh2j4gKw6TpmR
         UjY9ErUgHivAniuY88Xf3OZI+y5qEuDwKuylP97Sjre4uIAakgCKW50td+GBgrlbZ4
         8Y8vNQnjYaUKcpltUdv/Wm0y1AZrikb9wO2lra/M=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191213071109eucas1p1b900024f81d99b63a224c894843450c4~f3LYsALdI3260032600eucas1p1Y;
        Fri, 13 Dec 2019 07:11:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id BA.E2.60679.D8933FD5; Fri, 13
        Dec 2019 07:11:09 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191213071109eucas1p2db8fbed1f41e7c5356a98dd73a5a6f29~f3LYW3d1J0096700967eucas1p2B;
        Fri, 13 Dec 2019 07:11:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191213071109eusmtrp19842c9bfe2d78e4cd72f34de9f761b1a~f3LYK1-iE0791407914eusmtrp1U;
        Fri, 13 Dec 2019 07:11:09 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-04-5df3398d7cd8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id E4.35.07950.C8933FD5; Fri, 13
        Dec 2019 07:11:08 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191213071108eusmtip14c4416a857d9b9d647772afe9814d4a8~f3LXkDxuS1042310423eusmtip1N;
        Fri, 13 Dec 2019 07:11:08 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5420: Keep top G3D clocks enabled
To:     Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <f7fbb6a3-6890-7a25-3a15-b608aa2e69dc@samsung.com>
Date:   Fri, 13 Dec 2019 08:11:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191213030311.8FB3F2253D@mail.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djP87q9lp9jDXb+lrXYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWT/vJanHxlKvF4TftrBb/rm1ksWh/+pLZgcvj/Y1Wdo+ds+6y
        e2xa1cnm0bdlFaPH501yAaxRXDYpqTmZZalF+nYJXBnTzs1lLjhjWnG06yxLA+MqnS5GTg4J
        AROJtX1zmLoYuTiEBFYwSkw7s50VwvnCKLHj5yUo5zOjxOINe1hhWhbuX8QIkVjOKLFrwXuo
        qreMEveb+phAqoQFvCTWTLkClhARmMQo0X2rhRnEYRboZ5Lovf8bbBabgKFE19suNhCbV8BO
        YkfPYTCbRUBV4u31C0A1HByiArESHcszIEoEJU7OfMICYnMKWEhs2DgRzGYWkJfY/nYOM4Qt
        LnHryXwmiFOPsUu8fGYIYbtI3Jt8gB3CFpZ4dXwLlC0jcXpyDwvIbRICzYwSD8+tZYdwehgl
        LjfNYISospY4fPwi2EHMApoS63fpQ4QdJa4+PgEWlhDgk7jxVhDiBj6JSdumM0OEeSU62oQg
        qtUkZh1fB7f24IVLzBMYlWYh+WwWkm9mIflmFsLeBYwsqxjFU0uLc9NTi43yUsv1ihNzi0vz
        0vWS83M3MQJT1Ol/x7/sYNz1J+kQowAHoxIPL0PKp1gh1sSy4srcQ4wSHMxKIryp2p9jhXhT
        EiurUovy44tKc1KLDzFKc7AoifMaL3oZKySQnliSmp2aWpBaBJNl4uCUamBUep+18Itt4rpn
        5w6tXGI5d467xon6XS0pfAlfo65bPH6148eblcbW0WqKRlU6hzQ3/g5428hTt3m7fsDKbIvu
        vr8lngv6bqxIDl3CdnrfwVtdUxerhZVraxbsqahQbNpxhu9VvpjkJMlorYMt22//iVEpVt5x
        IOX3/C/Xth58csTYvSA50fqgEktxRqKhFnNRcSIA1jdiwk0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsVy+t/xu7o9lp9jDaY8tbLYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWT/vJanHxlKvF4TftrBb/rm1ksWh/+pLZgcvj/Y1Wdo+ds+6y
        e2xa1cnm0bdlFaPH501yAaxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6
        djYpqTmZZalF+nYJehnTzs1lLjhjWnG06yxLA+MqnS5GTg4JAROJhfsXMXYxcnEICSxllJjX
        9IUZIiEjcXJaAyuELSzx51oXG0TRa0aJX00gHZwcwgJeEmumXGEFSYgITGKU2Hv4IxNIgllg
        IpPE6rm6EB1fGCVON/ezgSTYBAwlut52gdm8AnYSO3oOg9ksAqoSb69fAFsnKhAr8X3lJ0aI
        GkGJkzOfsIDYnAIWEhs2TmSBWGAmMW/zQ2YIW15i+9s5ULa4xK0n85kmMArNQtI+C0nLLCQt
        s5C0LGBkWcUoklpanJueW2ykV5yYW1yal66XnJ+7iREYlduO/dyyg7HrXfAhRgEORiUe3hWJ
        n2KFWBPLiitzDzFKcDArifCman+OFeJNSaysSi3Kjy8qzUktPsRoCvTcRGYp0eR8YMLIK4k3
        NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAaMJ9SvuTbZBAoKWMj7X3
        L9nm9V492hc/x82+vePT9IefNyncuHY7+L92qM6Eqi1rDoR8bjFb92DC7K8vIy8xFwsFvXSa
        tPyY4CS/nZ96NrgePOvpfrg04Mq1Z+nSdjNkFdYIamvV6AW+8Ge209O1vupumzVdJ26Z+4J3
        PbbWH3/37tjzJHvhbCWW4oxEQy3mouJEABUJe3rgAgAA
X-CMS-MailID: 20191213071109eucas1p2db8fbed1f41e7c5356a98dd73a5a6f29
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8
References: <CGME20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8@eucas1p2.samsung.com>
        <20191121101145.15899-1-m.szyprowski@samsung.com>
        <f46f7d3d-c107-2542-d9ed-124c9079aeca@samsung.com>
        <20191213030311.8FB3F2253D@mail.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On 13.12.2019 04:03, Stephen Boyd wrote:
> Quoting Sylwester Nawrocki (2019-12-12 03:53:17)
>> Cc: Stephen and Michael
>>
>> On 11/21/19 11:11, Marek Szyprowski wrote:
>>> All top clocks on G3D path has to be enabled all the time to allow proper
>>> G3D power domain operation. This is achieved by adding CRITICAL flag to
>>> "mout_sw_aclk_g3d" clock, what keeps this clock and all its parents
>>> enabled.
>>>
>>> This fixes following imprecise abort issue observed on Odroid XU3/XU4
>>> after enabling Panfrost driver by commit 1a5a85c56402 "ARM: dts: exynos:
>>> Add Mali/GPU node on Exynos5420 and enable it on Odroid XU3/4"):
>>>
>>> panfrost 11800000.gpu: clock rate = 400000000
>>> panfrost 11800000.gpu: failed to get regulator: -517
>>> panfrost 11800000.gpu: regulator init failed -517
>>> Power domain G3D disable failed
>>> ...
>>> panfrost 11800000.gpu: clock rate = 400000000
>>> 8<--- cut here ---
>>> Unhandled fault: imprecise external abort (0x1406) at 0x00000000
>>> pgd = (ptrval)
>>> [00000000] *pgd=00000000
>>> Internal error: : 1406 [#1] PREEMPT SMP ARM
>>> Modules linked in:
>>> CPU: 7 PID: 53 Comm: kworker/7:1 Not tainted 5.4.0-rc8-next-20191119-00032-g56f1001191a6 #6923
>>> Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
>>> Workqueue: events deferred_probe_work_func
>>> PC is at panfrost_gpu_soft_reset+0x94/0x110
>>> LR is at ___might_sleep+0x128/0x2dc
>>> ...
>>> [<c05c231c>] (panfrost_gpu_soft_reset) from [<c05c2704>] (panfrost_gpu_init+0x10/0x67c)
>>> [<c05c2704>] (panfrost_gpu_init) from [<c05c15d0>] (panfrost_device_init+0x158/0x2cc)
>>> [<c05c15d0>] (panfrost_device_init) from [<c05c0cb0>] (panfrost_probe+0x80/0x178)
>>> [<c05c0cb0>] (panfrost_probe) from [<c05cfaa0>] (platform_drv_probe+0x48/0x9c)
>>> [<c05cfaa0>] (platform_drv_probe) from [<c05cd20c>] (really_probe+0x1c4/0x474)
>>> [<c05cd20c>] (really_probe) from [<c05cd694>] (driver_probe_device+0x78/0x1bc)
>>> [<c05cd694>] (driver_probe_device) from [<c05cb374>] (bus_for_each_drv+0x74/0xb8)
>>> [<c05cb374>] (bus_for_each_drv) from [<c05ccfa8>] (__device_attach+0xd4/0x16c)
>>> [<c05ccfa8>] (__device_attach) from [<c05cc110>] (bus_probe_device+0x88/0x90)
>>> [<c05cc110>] (bus_probe_device) from [<c05cc634>] (deferred_probe_work_func+0x4c/0xd0)
>>> [<c05cc634>] (deferred_probe_work_func) from [<c0149df0>] (process_one_work+0x300/0x864)
>>> [<c0149df0>] (process_one_work) from [<c014a3ac>] (worker_thread+0x58/0x5a0)
>>> [<c014a3ac>] (worker_thread) from [<c0151174>] (kthread+0x12c/0x160)
>>> [<c0151174>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
>>> Exception stack(0xee03dfb0 to 0xee03dff8)
>>> ...
>>> Code: e594300c e5933020 e3130c01 1a00000f (ebefff50).
>>> ---[ end trace badde2b74a65a540 ]---
>>>
>>> In the above case, the Panfrost driver disables G3D clocks after failure
>>> of getting the needed regulator and return with -EPROVE_DEFER code. This
>>> causes G3D power domain disable failure and then, during second probe
>>> an imprecise abort is triggered due to undefined power domain state.
>>>
>>> Fixes: 45f10dabb56b ("clk: samsung: exynos5420: Add SET_RATE_PARENT flag to clocks on G3D path")
>>> Fixes: c9f7567aff31 ("clk: samsung: exynos542x: Move G3D subsystem clocks to its sub-CMU")
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   drivers/clk/samsung/clk-exynos5420.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
>>> index 3a991ca1ee36..89126ba66995 100644
>>> --- a/drivers/clk/samsung/clk-exynos5420.c
>>> +++ b/drivers/clk/samsung/clk-exynos5420.c
>>> @@ -712,7 +712,7 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
>>>        MUX(0, "mout_sw_aclk266_g2d", mout_sw_aclk266_g2d_p,
>>>                        SRC_TOP12, 12, 1),
>>>        MUX_F(0, "mout_sw_aclk_g3d", mout_sw_aclk_g3d_p, SRC_TOP12, 16, 1,
>>> -           CLK_SET_RATE_PARENT, 0),
>>> +           CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
>>>        MUX(0, "mout_sw_aclk300_jpeg", mout_sw_aclk300_jpeg_p,
>>                          SRC_TOP12, 20, 1),
>>
>> Adding that flag to a mux clock doesn't look right, it feels we are not
>> addressing the issue properly and the root cause is not known.
>>
>> AFAICS CLK_IS_CRITICAL flag will also not ensure required root clock up
>> in the clk tree is enabled in case any reparenting is done after that mux
>> clock has been registered.  The flag seems misused and the fix looks dubious
>> and fragile to me.
>>
>> I would apply that to fix crashes we are seeing in -next but we ned to come
>> up with a better solution.
>>
>> Perhaps we could add a comment like:
>>
>> "CLK_IS_CRITICAL flag is added to this clock as a workaround for imprecise
>> external abort triggered by the Panfrost driver and will be removed once
>> the issue is properly addressed."
> You should always add a comment to CLK_IS_CRITICAL usage. This sort of
> comment is not comforting though. When will the issue be properly
> addressed? Maybe we should block panfrost from being enabled on this
> platform until it is root caused?

I can add a comment, no problem.

This issue is not related to the panfrost driver at all. Panfrost driver 
simply enables and disables the clock of its HW module. It is nothing 
extraordinary.

The real issue here is that some SoC internal busses (not assigned to 
any driver at all) are sourced from the same MUX, which that patch 
flagged as CRITICAL without any additional gates, thus if the only 
client of that MUX disables its gate clock, the whole path up to the 
root PLL is disabled what causes the HW issue. The driver (or user via 
dts) might change the root PLL, so that CRITICAL flag cannot be moved to 
the top clock in this hierarchy.

I can change that CRITICAL flag to a explicit call to 
clk_prepare_enable() during exynos542x-clk driver probe, but IMHO the 
flag better fits in such case.

I'm not sure if the issue can be properly addressed in a better way. The 
main problem here is that the whole clock topology for Exynos5422 SoCs 
is not fully documented in datasheet (especially the relation of the 
clocks and SoC's power domains) and the driver doesn't also fully model 
it, because other Exynos542x HW module drivers doesn't expect such fine 
grained clocks (mainly for historical compatibility).

I can take a look how to better model some problematic parts, but this 
won't be a simple, single patch. The issue mitigated by this patch 
already prevents v5.5-rc1 from booting with the default 
exynos_defconfig/multi_v7_defconfig, so I would like to merge it as a 
fix for v5.5 first.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

