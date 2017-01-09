From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH] drm/bridge: analogix dp: Fix runtime PM state on driver
 bind
Date: Mon, 9 Jan 2017 15:17:22 +0530
Message-ID: <5552ad97-2043-8690-dcc9-fd7d4701c947@codeaurora.org>
References: <CGME20161230095831eucas1p2c315f7ca20a49e1a7ad421cc68b1101a@eucas1p2.samsung.com>
 <1483091866-1088-1-git-send-email-m.szyprowski@samsung.com>
 <CAOw6vbJLwm8nx5w6oF4LreLYPi8Mqi5f-W9CrAx8B_7DW6xf-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:34776 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751441AbdAIJra (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Jan 2017 04:47:30 -0500
In-Reply-To: <CAOw6vbJLwm8nx5w6oF4LreLYPi8Mqi5f-W9CrAx8B_7DW6xf-w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Yakir Yang <ykk@rock-chips.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>



On 01/05/2017 01:01 PM, Sean Paul wrote:
> On Fri, Dec 30, 2016 at 4:57 AM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> Analogix_dp_bind() can be called from component framework, which doesn't
>> guarantee proper runtime PM state of the device during bind operation,
>> so ensure that device is runtime active before doing any register access.
>> This ensures that the power domain, to which DP module belongs, is turned
>> on. While at it, also fix the unbalanced call to phy_power_on() in
>> analogix_dp_bind() function.

Pushed to drm-misc-fixes.

Thanks,
Archit

>>
>> This patch solves the following kernel oops on Samsung Exynos5250 Snow
>> board:
>>
>> Unhandled fault: imprecise external abort (0x406) at 0x00000000
>> pgd = c0004000
>> [00000000] *pgd=00000000
>> Internal error: : 406 [#1] PREEMPT SMP ARM
>> Modules linked in:
>> CPU: 0 PID: 75 Comm: kworker/0:2 Not tainted 4.9.0 #1046
>> Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
>> Workqueue: events deferred_probe_work_func
>> task: ee272300 task.stack: ee312000
>> PC is at analogix_dp_enable_sw_function+0x18/0x2c
>> LR is at analogix_dp_init_dp+0x2c/0x50
>> ...
>> [<c03fcb38>] (analogix_dp_enable_sw_function) from [<c03fa9c4>] (analogix_dp_init_dp+0x2c/0x50)
>> [<c03fa9c4>] (analogix_dp_init_dp) from [<c03fab6c>] (analogix_dp_bind+0x184/0x42c)
>> [<c03fab6c>] (analogix_dp_bind) from [<c03fdb84>] (component_bind_all+0xf0/0x218)
>> [<c03fdb84>] (component_bind_all) from [<c03ed64c>] (exynos_drm_load+0x134/0x200)
>> [<c03ed64c>] (exynos_drm_load) from [<c03d5058>] (drm_dev_register+0xa0/0xd0)
>> [<c03d5058>] (drm_dev_register) from [<c03d66b8>] (drm_platform_init+0x58/0xb0)
>> [<c03d66b8>] (drm_platform_init) from [<c03fe0c4>] (try_to_bring_up_master+0x14c/0x188)
>> [<c03fe0c4>] (try_to_bring_up_master) from [<c03fe188>] (component_add+0x88/0x138)
>> [<c03fe188>] (component_add) from [<c0403a38>] (platform_drv_probe+0x50/0xb0)
>> [<c0403a38>] (platform_drv_probe) from [<c0402470>] (driver_probe_device+0x1f0/0x2a8)
>> [<c0402470>] (driver_probe_device) from [<c0400a54>] (bus_for_each_drv+0x44/0x8c)
>> [<c0400a54>] (bus_for_each_drv) from [<c04021f8>] (__device_attach+0x9c/0x100)
>> [<c04021f8>] (__device_attach) from [<c04018e8>] (bus_probe_device+0x84/0x8c)
>> [<c04018e8>] (bus_probe_device) from [<c0401d1c>] (deferred_probe_work_func+0x60/0x8c)
>> [<c0401d1c>] (deferred_probe_work_func) from [<c012fc14>] (process_one_work+0x120/0x318)
>> [<c012fc14>] (process_one_work) from [<c012fe34>] (process_scheduled_works+0x28/0x38)
>> [<c012fe34>] (process_scheduled_works) from [<c0130048>] (worker_thread+0x204/0x4ac)
>> [<c0130048>] (worker_thread) from [<c01352c4>] (kthread+0xd8/0xf4)
>> [<c01352c4>] (kthread) from [<c0107978>] (ret_from_fork+0x14/0x3c)
>> Code: e59035f0 e5935018 f57ff04f e3c55001 (f57ff04e)
>> ---[ end trace 3d1d0d87796de344 ]---
>>
>
> Reviewed-by: Sean Paul <seanpaul@chromium.org>
>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index eb9bf8786c24..18eefdcbf1ba 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -1382,6 +1382,7 @@ int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
>>
>>         pm_runtime_enable(dev);
>>
>> +       pm_runtime_get_sync(dev);
>>         phy_power_on(dp->phy);
>>
>>         analogix_dp_init_dp(dp);
>> @@ -1414,9 +1415,15 @@ int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
>>                 goto err_disable_pm_runtime;
>>         }
>>
>> +       phy_power_off(dp->phy);
>> +       pm_runtime_put(dev);
>> +
>>         return 0;
>>
>>  err_disable_pm_runtime:
>> +
>> +       phy_power_off(dp->phy);
>> +       pm_runtime_put(dev);
>>         pm_runtime_disable(dev);
>>
>>         return ret;
>> --
>> 1.9.1
>>
>
>
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
