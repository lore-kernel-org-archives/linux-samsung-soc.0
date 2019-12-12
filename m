Return-Path: <SRS0=7hfY=2C=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93E4C43603
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Dec 2019 11:53:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86932227BF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Dec 2019 11:53:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="l4VLmlb0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729080AbfLLLxX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Dec 2019 06:53:23 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45579 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729114AbfLLLxW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Dec 2019 06:53:22 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191212115320euoutp0127dd0c2527d5322c6ef55c5fec37c150~fnYexbTqi0215802158euoutp01O
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2019 11:53:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191212115320euoutp0127dd0c2527d5322c6ef55c5fec37c150~fnYexbTqi0215802158euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576151600;
        bh=8l8ncOV96QoDDMTVFjUfrb/xSDbZtj7a8V1mHnZAkks=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=l4VLmlb0pn9EHXE27cwgRPs6zRFOLujauMjZuePKb0I2+Fa8TllVoK8X+8pEKq51t
         NToTTw61wK3mFAm7zsTCWRbbRfW7zqK2gxnqrLRUD6wvkNTGMYNdAZ68HjDK2DejA1
         mQXs94mU+N2ClSx0RI5unau7EZoKmfGxUzuwY7UE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191212115320eucas1p28e35ed2968d68853a5b9b13bb0f9a5e8~fnYeTKhiZ2915129151eucas1p2d;
        Thu, 12 Dec 2019 11:53:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 0C.9B.60698.03A22FD5; Thu, 12
        Dec 2019 11:53:20 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191212115319eucas1p1ae4de5a1788a432b68b1b639626a6fbc~fnYeBoDKb0269402694eucas1p1q;
        Thu, 12 Dec 2019 11:53:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191212115319eusmtrp2da56ee7867262f6601c08efc48bf9e63~fnYeA6ZkD1275012750eusmtrp2P;
        Thu, 12 Dec 2019 11:53:19 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-82-5df22a308fd2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 08.7F.08375.F2A22FD5; Thu, 12
        Dec 2019 11:53:19 +0000 (GMT)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191212115319eusmtip18db162ad3b0263f2f37a02972dc180f5~fnYdklOO92337923379eusmtip13;
        Thu, 12 Dec 2019 11:53:19 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5420: Keep top G3D clocks enabled
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <f46f7d3d-c107-2542-d9ed-124c9079aeca@samsung.com>
Date:   Thu, 12 Dec 2019 12:53:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191121101145.15899-1-m.szyprowski@samsung.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJKsWRmVeSWpSXmKPExsWy7djPc7oGWp9iDZ6/5LbYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbrF+2k9Wi4unXC3+XdvIYtH+9CWzA5fH+xut7B47Z91l
        99i0qpPNo2/LKkaPz5vkAlijuGxSUnMyy1KL9O0SuDK2r2thKjipXvFj5xymBsY1il2MnBwS
        AiYSb7YsYAWxhQRWMErMP2faxcgFZH9hlLj4ajs7hPOZUeL/8qtMMB1H7nSwQiSWM0qcfTyd
        DcJ5yygx/dd1ZpAqYQEviTVTrgBVcXCICORLzHobAlLDLLCJSaJrzhJGkBo2AUOJ3qN9YDav
        gJ1E74n1YDaLgKrEqtMr2UBsUYEIiemH9rFD1AhKnJz5hAXE5gSqPz/5NdhFzALiEk1fVrJC
        2PIS29/OYQZZJiFwil3i79rX7BBnu0i8eLyHEcIWlnh1fAtUXEbi/875TBANzYwSPbtvs0M4
        Exgl7h9fANVhLXH4+EWwd5gFNCXW79KHCDtKXH18AiwsIcAnceOtIMQRfBKTtk1nhgjzSnS0
        CUFUq0j8XjUdGopSEt1P/rNMYFSaheS1WUjemYXknVkIexcwsqxiFE8tLc5NTy02zkst1ytO
        zC0uzUvXS87P3cQITFCn/x3/uoNx35+kQ4wCHIxKPLwdkh9jhVgTy4orcw8xSnAwK4nwHm97
        FyvEm5JYWZValB9fVJqTWnyIUZqDRUmc13jRy1ghgfTEktTs1NSC1CKYLBMHp1QD44rMdavX
        moT/7n/xybm197LZtdpT7sF2/AtdahJrHEumNx49ekg1RPna+o31dp5dot6SjntYDwuWzKty
        s3myPir2Om9i+sS03fv/Re2PlI5u3rLVq3RK7MZtk7JX72heqrPQujEkUjsk6bhCk8CKPVmF
        LQe/KzJd/pzaF/Q13kq/NmqvydEzSizFGYmGWsxFxYkAkZ4pPUwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xu7r6Wp9iDd6uNrHYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbrF+2k9Wi4unXC3+XdvIYtH+9CWzA5fH+xut7B47Z91l
        99i0qpPNo2/LKkaPz5vkAlij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX0
        7WxSUnMyy1KL9O0S9DK2r2thKjipXvFj5xymBsY1il2MnBwSAiYSR+50sILYQgJLGSV294h3
        MXIAxaUk5rcoQZQIS/y51sXWxcgFVPKaUeJ8x35GkISwgJfEmilXwHpFBPIlZtzpZQQpYhbY
        xCTxcWInVMdERomH73vAqtgEDCV6j/aBdfMK2En0nlgPZrMIqEqsOr2SDcQWFYiQ+PColR2i
        RlDi5MwnLCA2J1D9+cmvmUBsZgF1iT/zLjFD2OISTV9WskLY8hLb385hnsAoNAtJ+ywkLbOQ
        tMxC0rKAkWUVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYERuO/Zz8w7GSxuDDzEKcDAq8fB2
        SH6MFWJNLCuuzD3EKMHBrCTCe7ztXawQb0piZVVqUX58UWlOavEhRlOg5yYyS4km5wOTRV5J
        vKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBsZuu60i1SwHL110mHzw
        M3v1DvkDakV9QdwSE85885PcsebyPY3VLm/UN6u+9931YjIX+yOetrAJcUfctnGfP+Kf/W87
        n1T7ElN341Y/zy9hAUwxX2oLbk/juOFkYyKm99DeNJ9R5cKcB7sWr8nWSGHdO8d2qe1P60dZ
        9ndW2y5+m318UYhf0XElluKMREMt5qLiRAAhUOmS3gIAAA==
X-CMS-MailID: 20191212115319eucas1p1ae4de5a1788a432b68b1b639626a6fbc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8
References: <CGME20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8@eucas1p2.samsung.com>
        <20191121101145.15899-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Cc: Stephen and Michael

On 11/21/19 11:11, Marek Szyprowski wrote:
> All top clocks on G3D path has to be enabled all the time to allow proper
> G3D power domain operation. This is achieved by adding CRITICAL flag to
> "mout_sw_aclk_g3d" clock, what keeps this clock and all its parents
> enabled.
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
>  drivers/clk/samsung/clk-exynos5420.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 3a991ca1ee36..89126ba66995 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -712,7 +712,7 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
>  	MUX(0, "mout_sw_aclk266_g2d", mout_sw_aclk266_g2d_p,
>  			SRC_TOP12, 12, 1),
>  	MUX_F(0, "mout_sw_aclk_g3d", mout_sw_aclk_g3d_p, SRC_TOP12, 16, 1,
> -	      CLK_SET_RATE_PARENT, 0),
> +	      CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
>  	MUX(0, "mout_sw_aclk300_jpeg", mout_sw_aclk300_jpeg_p,
  			SRC_TOP12, 20, 1),

Adding that flag to a mux clock doesn't look right, it feels we are not
addressing the issue properly and the root cause is not known.

AFAICS CLK_IS_CRITICAL flag will also not ensure required root clock up 
in the clk tree is enabled in case any reparenting is done after that mux 
clock has been registered.  The flag seems misused and the fix looks dubious 
and fragile to me.

I would apply that to fix crashes we are seeing in -next but we ned to come
up with a better solution.

Perhaps we could add a comment like:

"CLK_IS_CRITICAL flag is added to this clock as a workaround for imprecise 
external abort triggered by the Panfrost driver and will be removed once 
the issue is properly addressed."

Can you resend with Stephen and Mike at Cc and with that comment added?
Feel free to add 
Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Alternatively, we could add an explicit clk_prepare_enable() call at the end
of exynos5x_clk_init() function, after the clock provider is registered,
so any possible reparenting through "assigned-clock-parents" is also taken 
into account. 

-- 
Thanks,
Sylwester
