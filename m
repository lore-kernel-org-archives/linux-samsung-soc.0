From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: i2s: disable secondary DAI until it gets fixed" to the asoc tree
Date: Wed, 18 Oct 2017 12:12:07 +0100
Message-ID: <E1e4mGd-0002HX-Eb@debutante>
References: <20171018072534.21204-1-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:44126 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751969AbdJRLMJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Oct 2017 07:12:09 -0400
In-Reply-To: <20171018072534.21204-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>alsa-devel@alsa-project.org

The patch

   ASoC: samsung: i2s: disable secondary DAI until it gets fixed

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 064970a0aae978073a859aaf0793bfe14762d4f3 Mon Sep 17 00:00:00 2001
From: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Wed, 18 Oct 2017 09:25:34 +0200
Subject: [PATCH] ASoC: samsung: i2s: disable secondary DAI until it gets fixed

Secondary DAI in Exynos I2S driver is not used by any of the currently
supported boards and it causes problems due to some limitations in the
ASoC code. Disable it until it gets proper support both by board-specific
and ASoC core code. Also disable IDMA support, which relies on secondary
DAI presence.

This patch fixes following kernel warning:
samsung-i2s 3830000.i2s: ASoC: Failed to create component debugfs directory
samsung-i2s 3830000.i2s: ASoC: Failed to create component debugfs directory
------------[ cut here ]------------
WARNING: CPU: 3 PID: 82 at fs/proc/generic.c:330 proc_register+0xec/0x10c
proc_dir_entry 'sub0/prealloc' already registered
Modules linked in:
CPU: 3 PID: 82 Comm: kworker/3:1 Not tainted 4.14.0-rc5-next-20171017 #3089
Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
Workqueue: events deferred_probe_work_func
[<c0110114>] (unwind_backtrace) from [<c010c900>] (show_stack+0x10/0x14)
[<c010c900>] (show_stack) from [<c083e664>] (dump_stack+0x90/0xc8)
[<c083e664>] (dump_stack) from [<c011d2b8>] (__warn+0xd4/0x100)
[<c011d2b8>] (__warn) from [<c011d384>] (warn_slowpath_fmt+0x38/0x48)
[<c011d384>] (warn_slowpath_fmt) from [<c0271268>] (proc_register+0xec/0x10c)
[<c0271268>] (proc_register) from [<c027130c>] (proc_create_data+0x84/0xc8)
[<c027130c>] (proc_create_data) from [<c061afbc>] (snd_info_register+0x64/0xcc)
[<c061afbc>] (snd_info_register) from [<c062a6e0>] (snd_pcm_lib_preallocate_pages1+0x78/0x1a0)
[<c062a6e0>] (snd_pcm_lib_preallocate_pages1) from [<c063eef4>] (dmaengine_pcm_new+0xa0/0x1ec)
[<c063eef4>] (dmaengine_pcm_new) from [<c062b9f8>] (snd_soc_platform_drv_pcm_new+0x1c/0x28)
[<c062b9f8>] (snd_soc_platform_drv_pcm_new) from [<c063d54c>] (soc_new_pcm+0x2f4/0x4f4)
[<c063d54c>] (soc_new_pcm) from [<c063107c>] (snd_soc_register_card+0xc4c/0xdc4)
[<c063107c>] (snd_soc_register_card) from [<c063db30>] (devm_snd_soc_register_card+0x34/0x70)
[<c063db30>] (devm_snd_soc_register_card) from [<c064af60>] (asoc_simple_card_probe+0x230/0x47c)
[<c064af60>] (asoc_simple_card_probe) from [<c047f8fc>] (platform_drv_probe+0x50/0xb0)
[<c047f8fc>] (platform_drv_probe) from [<c047dee0>] (driver_probe_device+0x2a0/0x46c)
[<c047dee0>] (driver_probe_device) from [<c047c0bc>] (bus_for_each_drv+0x44/0x8c)
[<c047c0bc>] (bus_for_each_drv) from [<c047db50>] (__device_attach+0xa0/0x134)
[<c047db50>] (__device_attach) from [<c047cf7c>] (bus_probe_device+0x88/0x90)
[<c047cf7c>] (bus_probe_device) from [<c047d484>] (deferred_probe_work_func+0x3c/0x168)
[<c047d484>] (deferred_probe_work_func) from [<c01371f8>] (process_one_work+0x188/0x41c)
[<c01371f8>] (process_one_work) from [<c01374b4>] (process_scheduled_works+0x28/0x38)
[<c01374b4>] (process_scheduled_works) from [<c01376d4>] (worker_thread+0x210/0x4dc)
[<c01376d4>] (worker_thread) from [<c013d9cc>] (kthread+0x128/0x164)
[<c013d9cc>] (kthread) from [<c0108848>] (ret_from_fork+0x14/0x2c)
---[ end trace bad8db6ee771d094 ]--

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/i2s.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index d7e7f4244d38..de783c6d2a70 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1288,6 +1288,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 			}
 		}
 	}
+	quirks &= ~(QUIRK_SEC_DAI | QUIRK_SUPPORTS_IDMA);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	pri_dai->addr = devm_ioremap_resource(&pdev->dev, res);
-- 
2.14.1
