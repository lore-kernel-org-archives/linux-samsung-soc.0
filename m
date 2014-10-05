From: Shixin Zeng <zeng.shixin@gmail.com>
Subject: 3.17 fails to boot on Odroid U2 sometimes
Date: Sun, 5 Oct 2014 16:51:40 -0400
Message-ID: <CAOay_bwRDkCXwADqxgkFUrvGeZVsu+XWRd97+U04hvovm3z7-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f175.google.com ([209.85.220.175]:35758 "EHLO
	mail-vc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751855AbaJEUvk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 5 Oct 2014 16:51:40 -0400
Received: by mail-vc0-f175.google.com with SMTP id id10so2375869vcb.6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Oct 2014 13:51:40 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

I've run into this problem a few times, but it doesn't happen every
time. When it happens, booting just hangs with the following messages:

[  240.302126] INFO: task swapper/0:1 blocked for more than 120 seconds.
[  240.302937]       Not tainted 3.17.0-rc7-00097-g7b6ea43 #42
[  240.308514] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  240.316350] swapper/0       D c0703960     0     1      0 0x00000000
[  240.322667] [<c0703960>] (__schedule) from [<c070413c>]
(schedule_preempt_disabled+0x14/0x20)
[  240.331159] [<c070413c>] (schedule_preempt_disabled) from
[<c0706714>] (__mutex_lock_slowpath+0x190/0x3d4)
[  240.340782] [<c0706714>] (__mutex_lock_slowpath) from [<c0706964>]
(mutex_lock+0xc/0x24)
[  240.348856] [<c0706964>] (mutex_lock) from [<c046a6a4>]
(regmap_read+0x30/0x60)
[  240.356135] [<c046a6a4>] (regmap_read) from [<c0599e3c>]
(max77686_clk_is_prepared+0x20/0x3c)
[  240.364639] [<c0599e3c>] (max77686_clk_is_prepared) from
[<c059547c>] (clk_unprepare_unused_subtree+0x68/0xa0)
[  240.374607] [<c059547c>] (clk_unprepare_unused_subtree) from
[<c059692c>] (clk_disable_unused+0xa8/0x138)
[  240.384146] [<c059692c>] (clk_disable_unused) from [<c00088f0>]
(do_one_initcall+0x8c/0x1c4)
[  240.392561] [<c00088f0>] (do_one_initcall) from [<c099cd88>]
(kernel_init_freeable+0x1a0/0x240)
[  240.401234] [<c099cd88>] (kernel_init_freeable) from [<c06fec08>]
(kernel_init+0x8/0xe8)
[  240.409301] [<c06fec08>] (kernel_init) from [<c000e6b8>]
(ret_from_fork+0x14/0x3c)
[  240.416830] INFO: task kworker/u8:0:6 blocked for more than 120 seconds.
[  240.423505]       Not tainted 3.17.0-rc7-00097-g7b6ea43 #42
[  240.429050] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  240.436858] kworker/u8:0    D c0703960     0     6      2 0x00000000
[  240.443194] Workqueue: kmmcd mmc_rescan
[  240.447015] [<c0703960>] (__schedule) from [<c070413c>]
(schedule_preempt_disabled+0x14/0x20)
[  240.455520] [<c070413c>] (schedule_preempt_disabled) from
[<c0706714>] (__mutex_lock_slowpath+0x190/0x3d4)
[  240.465146] [<c0706714>] (__mutex_lock_slowpath) from [<c0706964>]
(mutex_lock+0xc/0x24)
[  240.473215] [<c0706964>] (mutex_lock) from [<c0595880>]
(clk_prepare_lock+0x88/0xfc)
[  240.480930] [<c0595880>] (clk_prepare_lock) from [<c05971c8>]
(clk_unprepare+0x1c/0x2c)
[  240.488916] [<c05971c8>] (clk_unprepare) from [<c05288cc>]
(s3c24xx_i2c_xfer+0x170/0x3d4)
[  240.497063] [<c05288cc>] (s3c24xx_i2c_xfer) from [<c05233f8>]
(__i2c_transfer+0x78/0x90)
[  240.505125] [<c05233f8>] (__i2c_transfer) from [<c0523d90>]
(i2c_transfer+0x94/0xc4)
[  240.512846] [<c0523d90>] (i2c_transfer) from [<c046ecd4>]
(regmap_i2c_read+0x48/0x64)
[  240.520654] [<c046ecd4>] (regmap_i2c_read) from [<c046ab8c>]
(_regmap_raw_read+0x98/0xf4)
[  240.528804] [<c046ab8c>] (_regmap_raw_read) from [<c046ac0c>]
(_regmap_bus_read+0x24/0x5c)
[  240.537040] [<c046ac0c>] (_regmap_bus_read) from [<c046a5fc>]
(_regmap_read+0x6c/0xe4)
[  240.544932] [<c046a5fc>] (_regmap_read) from [<c046a6b4>]
(regmap_read+0x40/0x60)
[  240.552391] [<c046a6b4>] (regmap_read) from [<c03e9a04>]
(regulator_get_voltage_sel_regmap+0x20/0x54)
[  240.561593] [<c03e9a04>] (regulator_get_voltage_sel_regmap) from
[<c03e4ec4>] (_regulator_get_voltage+0x20/0xb4)
[  240.571747] [<c03e4ec4>] (_regulator_get_voltage) from [<c03e4e8c>]
(regulator_get_voltage+0x1c/0x34)
[  240.580932] [<c03e4e8c>] (regulator_get_voltage) from [<c0562960>]
(mmc_regulator_set_ocr+0x44/0x128)
[  240.590129] [<c0562960>] (mmc_regulator_set_ocr) from [<c057678c>]
(sdhci_do_set_ios+0x130/0x5fc)
[  240.598968] [<c057678c>] (sdhci_do_set_ios) from [<c0576c80>]
(sdhci_set_ios+0x28/0x34)
[  240.606951] [<c0576c80>] (sdhci_set_ios) from [<c0569f10>]
(mmc_sd_init_card+0x454/0x664)
[  240.615097] [<c0569f10>] (mmc_sd_init_card) from [<c056a320>]
(mmc_attach_sd+0x84/0x150)
[  240.623161] [<c056a320>] (mmc_attach_sd) from [<c0564a0c>]
(mmc_rescan+0x2a0/0x308)
[  240.630796] [<c0564a0c>] (mmc_rescan) from [<c003b1c4>]
(process_one_work+0x128/0x318)
[  240.638688] [<c003b1c4>] (process_one_work) from [<c003b998>]
(worker_thread+0x44/0x4dc)
[  240.646757] [<c003b998>] (worker_thread) from [<c003fa1c>]
(kthread+0xd0/0xe8)
[  240.653958] [<c003fa1c>] (kthread) from [<c000e6b8>]
(ret_from_fork+0x14/0x3c)
[  360.657146] INFO: task swapper/0:1 blocked for more than 120 seconds.
[  360.657952]       Not tainted 3.17.0-rc7-00097-g7b6ea43 #42
[  360.663526] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  360.671336] swapper/0       D c0703960     0     1      0 0x00000000
[  360.677679] [<c0703960>] (__schedule) from [<c070413c>]
(schedule_preempt_disabled+0x14/0x20)
[  360.686175] [<c070413c>] (schedule_preempt_disabled) from
[<c0706714>] (__mutex_lock_slowpath+0x190/0x3d4)
[  360.695796] [<c0706714>] (__mutex_lock_slowpath) from [<c0706964>]
(mutex_lock+0xc/0x24)
[  360.703869] [<c0706964>] (mutex_lock) from [<c046a6a4>]
(regmap_read+0x30/0x60)
[  360.711149] [<c046a6a4>] (regmap_read) from [<c0599e3c>]
(max77686_clk_is_prepared+0x20/0x3c)
[  360.719653] [<c0599e3c>] (max77686_clk_is_prepared) from
[<c059547c>] (clk_unprepare_unused_subtree+0x68/0xa0)
[  360.729627] [<c059547c>] (clk_unprepare_unused_subtree) from
[<c059692c>] (clk_disable_unused+0xa8/0x138)
[  360.739164] [<c059692c>] (clk_disable_unused) from [<c00088f0>]
(do_one_initcall+0x8c/0x1c4)
[  360.747577] [<c00088f0>] (do_one_initcall) from [<c099cd88>]
(kernel_init_freeable+0x1a0/0x240)
[  360.756252] [<c099cd88>] (kernel_init_freeable) from [<c06fec08>]
(kernel_init+0x8/0xe8)
[  360.764317] [<c06fec08>] (kernel_init) from [<c000e6b8>]
(ret_from_fork+0x14/0x3c)
[  360.771852] INFO: task kworker/u8:0:6 blocked for more than 120 seconds.
[  360.778522]       Not tainted 3.17.0-rc7-00097-g7b6ea43 #42
[  360.784067] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  360.791876] kworker/u8:0    D c0703960     0     6      2 0x00000000
[  360.798211] Workqueue: kmmcd mmc_rescan
[  360.802033] [<c0703960>] (__schedule) from [<c070413c>]
(schedule_preempt_disabled+0x14/0x20)
[  360.810537] [<c070413c>] (schedule_preempt_disabled) from
[<c0706714>] (__mutex_lock_slowpath+0x190/0x3d4)
[  360.820160] [<c0706714>] (__mutex_lock_slowpath) from [<c0706964>]
(mutex_lock+0xc/0x24)
[  360.828233] [<c0706964>] (mutex_lock) from [<c0595880>]
(clk_prepare_lock+0x88/0xfc)
[  360.835949] [<c0595880>] (clk_prepare_lock) from [<c05971c8>]
(clk_unprepare+0x1c/0x2c)
[  360.843936] [<c05971c8>] (clk_unprepare) from [<c05288cc>]
(s3c24xx_i2c_xfer+0x170/0x3d4)
[  360.852079] [<c05288cc>] (s3c24xx_i2c_xfer) from [<c05233f8>]
(__i2c_transfer+0x78/0x90)
[  360.860143] [<c05233f8>] (__i2c_transfer) from [<c0523d90>]
(i2c_transfer+0x94/0xc4)
[  360.867865] [<c0523d90>] (i2c_transfer) from [<c046ecd4>]
(regmap_i2c_read+0x48/0x64)
[  360.875674] [<c046ecd4>] (regmap_i2c_read) from [<c046ab8c>]
(_regmap_raw_read+0x98/0xf4)
[  360.883819] [<c046ab8c>] (_regmap_raw_read) from [<c046ac0c>]
(_regmap_bus_read+0x24/0x5c)
[  360.892058] [<c046ac0c>] (_regmap_bus_read) from [<c046a5fc>]
(_regmap_read+0x6c/0xe4)
[  360.899949] [<c046a5fc>] (_regmap_read) from [<c046a6b4>]
(regmap_read+0x40/0x60)
[  360.907409] [<c046a6b4>] (regmap_read) from [<c03e9a04>]
(regulator_get_voltage_sel_regmap+0x20/0x54)
[  360.916610] [<c03e9a04>] (regulator_get_voltage_sel_regmap) from
[<c03e4ec4>] (_regulator_get_voltage+0x20/0xb4)
[  360.926764] [<c03e4ec4>] (_regulator_get_voltage) from [<c03e4e8c>]
(regulator_get_voltage+0x1c/0x34)
[  360.935951] [<c03e4e8c>] (regulator_get_voltage) from [<c0562960>]
(mmc_regulator_set_ocr+0x44/0x128)
[  360.945146] [<c0562960>] (mmc_regulator_set_ocr) from [<c057678c>]
(sdhci_do_set_ios+0x130/0x5fc)
[  360.953987] [<c057678c>] (sdhci_do_set_ios) from [<c0576c80>]
(sdhci_set_ios+0x28/0x34)
[  360.961967] [<c0576c80>] (sdhci_set_ios) from [<c0569f10>]
(mmc_sd_init_card+0x454/0x664)
[  360.970114] [<c0569f10>] (mmc_sd_init_card) from [<c056a320>]
(mmc_attach_sd+0x84/0x150)
[  360.978179] [<c056a320>] (mmc_attach_sd) from [<c0564a0c>]
(mmc_rescan+0x2a0/0x308)
[  360.985813] [<c0564a0c>] (mmc_rescan) from [<c003b1c4>]
(process_one_work+0x128/0x318)
[  360.993705] [<c003b1c4>] (process_one_work) from [<c003b998>]
(worker_thread+0x44/0x4dc)
[  361.001773] [<c003b998>] (worker_thread) from [<c003fa1c>]
(kthread+0xd0/0xe8)
[  361.008977] [<c003fa1c>] (kthread) from [<c000e6b8>]
(ret_from_fork+0x14/0x3c)


Best Regards

Shixin Zeng
