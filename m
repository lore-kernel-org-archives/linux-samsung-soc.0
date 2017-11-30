From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: exynos: Add MSCL power domain to
 Exynos 5433 SoC
Date: Thu, 30 Nov 2017 10:35:27 +0100
Message-ID: <dc21a17f-c281-cb71-8d06-5a15f8d9a04e@samsung.com>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
        <CGME20171129112650eucas1p13a3cc167bc64d133cf24e4f621865203@eucas1p1.samsung.com>
        <20171129112638.15813-4-m.szyprowski@samsung.com>
        <5A1F6AF3.5050809@samsung.com> <5A1F7219.5080506@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40826 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751846AbdK3Jfc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 04:35:32 -0500
In-reply-to: <5A1F7219.5080506@samsung.com>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>

Dear Chanwoo,

On 2017-11-30 03:51, Chanwoo Choi wrote:
> On 2017년 11월 30일 11:20, Chanwoo Choi wrote:
>> On 2017년 11월 29일 20:26, Marek Szyprowski wrote:
>>> This patch adds support for MSCL power domain to Exynos 5433 SoCs, which
>>> contains following devices: a clock controller, JPEG codec device and its
>>> SYSMMU.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   arch/arm64/boot/dts/exynos/exynos5433.dtsi | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>> Looks good to me.
>> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>>
>> [snip]
>>
> When I tested this patch with enabling exynos-bus.c,
> I got the following external abort. In order to fix this abort,
> I add the power-domain property to arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
> as following:

Thanks for this report. You are right that exynos-bus devices should be
also added to respective power domains. I will also check how to add
runtime PM support and awareness of power domain to exynos-bus driver,
to avoid blocking respective power domains in turned on state.

> [Adding power-domain to bus device-tree node]
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
> index ec11343dc528..0e1a7e01b8ed 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
> @@ -47,6 +47,7 @@
>                  clocks = <&cmu_top CLK_SCLK_JPEG_MSCL>;
>                  clock-names = "bus";
>                  operating-points-v2 = <&bus_g2d_400_opp_table>;
> +               power-domains = <&pd_mscl>;
>                  status = "disabled";
>          };
>   
> @@ -55,6 +56,7 @@
>                  clocks = <&cmu_top CLK_ACLK_MFC_400>;
>                  clock-names = "bus";
>                  operating-points-v2 = <&bus_g2d_400_opp_table>;
> +               power-domains = <&pd_mfc>;
>                  status = "disabled";
>          };
>   
> @@ -63,6 +65,7 @@
>                  clocks = <&cmu_top CLK_ACLK_MSCL_400>;
>                  clock-names = "bus";
>                  operating-points-v2 = <&bus_g2d_400_opp_table>;
> +               power-domains = <&pd_mscl>;
>                  status = "disabled";
>          };
>
> [Abort message]
>      5.314836] exynos5433-cmu 15280000.clock-controller: genpd_runtime_resume()
> [    5.314883] exynos5433-cmu 15280000.clock-controller: resume latency exceeded, 26291 ns
> [    5.314909] exynos5433-cmu 15280000.clock-controller: genpd_runtime_suspend()
> [    5.314949] exynos5433-cmu 15280000.clock-controller: suspend latency exceeded, 24334 ns
> [    5.314989] exynos5433-cmu 15280000.clock-controller: genpd_runtime_resume()
> [    5.315034] exynos5433-cmu 15280000.clock-controller: genpd_runtime_suspend()
> [    5.315109] exynos5433-cmu 15280000.clock-controller: genpd_runtime_resume()
> [    5.315157] exynos5433-cmu 15280000.clock-controller: genpd_runtime_suspend()
> [    5.315200] exynos5433-cmu 15280000.clock-controller: suspend latency exceeded, 27458 ns
> [    5.315252] exynos5433-cmu 150d0000.clock-controller: genpd_runtime_resume()
> [    5.315509] exynos5433-cmu 150d0000.clock-controller: genpd_runtime_suspend()
> [    5.315783] exynos5433-cmu 150d0000.clock-controller: genpd_runtime_resume()
> [    5.316027] exynos5433-cmu 150d0000.clock-controller: genpd_runtime_suspend()
> [    5.316295] Synchronous External Abort: synchronous external abort (0x96000210) at 0xffffff80093f5600
> [    5.316308] Internal error: : 96000210 [#1] PREEMPT SMP
> [    5.316317] Modules linked in:
> [    5.316336] CPU: 0 PID: 5 Comm: kworker/u16:0 Not tainted 4.15.0-rc1-next-20171129+ #4
> [    5.316342] Hardware name: Samsung TM2 board (DT)
> [    5.316364] Workqueue: devfreq_wq devfreq_monitor
> [    5.316377] task: ffffffc0ca96b600 task.stack: ffffff80093a8000
> [    5.316388] pstate: a0000085 (NzCv daIf -PAN -UAO)
> [    5.316405] pc : clk_divider_set_rate+0x54/0x118
> [    5.316417] lr : clk_divider_set_rate+0x44/0x118
> [    5.316422] sp : ffffff80093aba00
> [    5.316428] x29: ffffff80093aba00 x28: ffffffc0ca820080
> [    5.316445] x27: ffffffc0ca820030 x26: 0000000000000000
> [    5.316459] x25: 0000000005f5e100 x24: 0000000005f5e100
> [    5.316474] x23: ffffffc0ca213a00 x22: 00000000017d7840
> [    5.316488] x21: 0000000000000000 x20: 0000000000000003
> [    5.316503] x19: ffffffc0ca203380 x18: 0000000000000000
> [    5.316517] x17: ffffffffffffffff x16: 00000000ffffffff
> [    5.316532] x15: 00000000000c8dae x14: 28646e6570737573
> [    5.316547] x13: 5f656d69746e7572 x12: 5f64706e6567203a
> [    5.316562] x11: 72656c6c6f72746e x10: 0000000000000980
> [    5.316576] x9 : ffffff80093ab6b0 x8 : ffffffc0ca96bfe0
> [    5.316590] x7 : 0000000000000004 x6 : 003c14dc022e9800
> [    5.316604] x5 : 0000000000000003 x4 : ffffff80093ac000
> [    5.316619] x3 : ffffff80093f5600 x2 : 0000000000000000
> [    5.316633] x1 : 0000000000000000 x0 : 0000000000000000
> [    5.316650] Process kworker/u16:0 (pid: 5, stack limit = 0xffffff80093a8000)
> [    5.316655] Call trace:
> [    5.316668]  clk_divider_set_rate+0x54/0x118
> [    5.316680]  clk_change_rate+0xfc/0x4e0
> [    5.316691]  clk_change_rate+0x1f0/0x4e0
> [    5.316701]  clk_change_rate+0x1f0/0x4e0
> [    5.316712]  clk_change_rate+0x1f0/0x4e0
> [    5.316723]  clk_core_set_rate_nolock+0x138/0x148
> [    5.316733]  clk_set_rate+0x28/0x50
> [    5.316746]  exynos_bus_passive_target+0x6c/0x11c
> [    5.316758]  update_devfreq_passive+0x58/0xb4
> [    5.316769]  devfreq_passive_notifier_call+0x50/0x5c
> [    5.316780]  notifier_call_chain+0x4c/0x88
> [    5.316790]  __srcu_notifier_call_chain+0x54/0x80
> [    5.316800]  srcu_notifier_call_chain+0x14/0x1c
> [    5.316811]  update_devfreq+0x100/0x1b4
> [    5.316821]  devfreq_monitor+0x2c/0x88
> [    5.316833]  process_one_work+0x148/0x3d8
> [    5.316843]  worker_thread+0x13c/0x3f8
> [    5.316855]  kthread+0x100/0x12c
> [    5.316867]  ret_from_fork+0x10/0x18
>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
