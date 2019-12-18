Return-Path: <SRS0=wFHd=2I=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE80C2D0CD
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Dec 2019 09:44:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02D31218AC
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Dec 2019 09:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576662261;
	bh=qSC6/H9GfsyCcelafyoAunXcGxJQCK0ulcmX0aIl0sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=iQMZ8GeXwneuJuM7aJ9ZzcgTWDkoK97EoOjw6L0ZWRKQnMFpvaUO4xv10tDuguJPI
	 22Wwwps8eW+88M/YtzpOVpuOGq7kvF1kJkiK623qGrrYl2OzJT+op0rM1UTyADZiF0
	 zzpsVX3FobDQNEw8RJ0UgD168xQ5PyiUrlaVqunM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbfLRJoU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 18 Dec 2019 04:44:20 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45387 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbfLRJoU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 04:44:20 -0500
Received: by mail-ed1-f68.google.com with SMTP id v28so1092959edw.12;
        Wed, 18 Dec 2019 01:44:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gJQXaXEKQkd+spSjYG8zG6Syqx3wWTMxVQgMC7CUTsA=;
        b=Gu2LbL7ju9/4SB4nM5tL2dXzeRDblF0AadXIM28geVf7kB5psnY+N3Ek7fbmLqAhcU
         So59xD9FqIRsYFMN/KD6owjbKBGxdyvQ2sNEYBwqEfZpsNf6qEiSbEOhP3THVXg40ube
         WFwmLVB+aOZpAI4V8luKqnLM8qY2knKHQCshJ1c23eGb8x981x6CF230yEF57hLsuMQA
         UbIDmIVZBarfGsex95/06T5XNVGwBDoUwfjI6VhUgLYCoCSMMkgdQ6fM/lzC47yd0TbX
         S6NGG3OgIXkxLf8xhwZdkkA/lzxDykfC/HeursWhhX6xpDEdXuXczghiO1NJrLjclwaz
         KylQ==
X-Gm-Message-State: APjAAAXfzycrcMhsz4zX39XCXtW5kENXgOIrUu0hVjpNE8tiqyaesTEY
        O8dsDLYGJYRhg5/dIoK+7q4=
X-Google-Smtp-Source: APXvYqwYiPXjMqEBn2DXb6aWt/7XHzF/wds2uZOh7jKved27Zg3XGn4BG+YB4raaOe3N9lsBmmDqgQ==
X-Received: by 2002:a05:6402:3059:: with SMTP id bu25mr1209953edb.216.1576662257949;
        Wed, 18 Dec 2019 01:44:17 -0800 (PST)
Received: from pi3 ([194.230.155.234])
        by smtp.googlemail.com with ESMTPSA id dx7sm71097ejb.81.2019.12.18.01.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 01:44:17 -0800 (PST)
Date:   Wed, 18 Dec 2019 10:44:15 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: samsung: exynos5420: Keep top G3D clocks enabled
Message-ID: <20191218094415.GA15819@pi3>
References: <CGME20191216131423eucas1p2162d6bf0a870357be9f0ab308641015b@eucas1p2.samsung.com>
 <20191216131407.17225-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191216131407.17225-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Dec 16, 2019 at 02:14:07PM +0100, Marek Szyprowski wrote:
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

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
