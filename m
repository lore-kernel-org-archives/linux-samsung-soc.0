Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810564734C2
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Aug 2026 12:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106509; cv=none; b=hkxaYoCMVsWnva1u5gFB6sjtwImUkI399Z8lIIxmZYVYi3UnFLO1oo+oj9nsb52+VbhDj31/SPSQr+pToybkKg/BLtqW/BJrmj8WKKy5jeipVoYYMZE/fvS0GsAwAy/b65b4u+5V0DdNFDjaxOUf29DPkMbwihMLg5UAOO6R6cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106509; c=relaxed/simple;
	bh=wFNzE40Ymv2+LaUU5/1TiOaLPVcmym9cOJl91bmVRPc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:In-Reply-To:
	 Content-Type:References; b=Hqt4gAcZMRnR+bNwJ4pzQgCZJE4vitYPsUaR2riHfI/YsAmPqXpKRXbAVw9Bg5H3WogTF592UE8xStUehZI/cVBl+Lkep3hIFsvN0iYx/JoN4Gp5Bqo3VAxYWGUO9lRcCXeLGqvcPzh9RuGJf5bOw3qwAj+ACJ1pomT4fzagkxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=tb9qL6WY; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tb9qL6WY"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260807124134euoutp02d8fec5361f3affba794b170d3b543b80~JhmS0XQCM1104011040euoutp02-
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Aug 2026 12:41:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260807124134euoutp02d8fec5361f3affba794b170d3b543b80~JhmS0XQCM1104011040euoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1786106494;
	bh=vcU2V2rNi/Q4/Tzd/KVUpgzPRPp15jyUgegKZOy2Oeo=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=tb9qL6WYpQKGKeHBYwoMBDGgf4Cq4GgeWUzIk7XR8JYMvFOs7CvSeU5JDzEegqN5U
	 uNFqE1fdIgt8XLQtQyGzDwhAmo0S8xdpcmSGOEelhvtprzgoOZP/+qjNmgZVKxWYpA
	 BKFsHltzE633E8A6cPN8KOaZzVAD7ElQyptsIIfk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260807124134eucas1p22aa7ed81b96bfc482fa520eb4e5333b1~JhmSiUKij0406604066eucas1p2g;
	Fri,  7 Aug 2026 12:41:34 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260807124133eusmtip27e7ec09ec3063cc991dd9d28e924ae96~JhmR79SEz2432824328eusmtip2M;
	Fri,  7 Aug 2026 12:41:33 +0000 (GMT)
Message-ID: <8296b9aa-987a-4544-8ec8-9a0227fc16a2@samsung.com>
Date: Fri, 7 Aug 2026 14:41:32 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [BUG] exynos5_i2c_xfer_atomic() can sleep.
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Waiman
	Long <longman@redhat.com>, linux-rt-devel@lists.linux.dev, Andi Shyti
	<andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Content-Language: en-US
In-Reply-To: <55bdf688-85f5-4b2b-9e90-b4a2c671250f@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260807124134eucas1p22aa7ed81b96bfc482fa520eb4e5333b1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260506065541eucas1p2f986355d0a06ac1f72aa00e8d3148ad0
X-EPHeader: CA
X-CMS-RootMailID: 20260506065541eucas1p2f986355d0a06ac1f72aa00e8d3148ad0
References: <CGME20260506065541eucas1p2f986355d0a06ac1f72aa00e8d3148ad0@eucas1p2.samsung.com>
	<20260506065110.sY3jKS7G@linutronix.de>
	<03c06142-12eb-45b7-8d22-ce12fab6e132@samsung.com>
	<20260508100910.nxRkt3mA@linutronix.de>
	<dbacd56b-2914-40ce-9139-78b819a81c13@samsung.com>
	<20260508104235.n9gGOYqU@linutronix.de>
	<55bdf688-85f5-4b2b-9e90-b4a2c671250f@samsung.com>

On 08.05.2026 17:28, Marek Szyprowski wrote:
> On 08.05.2026 12:42, Sebastian Andrzej Siewior wrote:
>> On 2026-05-08 12:35:51 [+0200], Marek Szyprowski wrote:
>>> Ah, it looks that I've checked irq_disable() code, so that's why I
>>> didn't find might_sleep() call. In the case of exynos5_i2c driver,
>>> probably switching to disable_irq_nosync() will be enough. I assume
>>> that all previous transfers have to be finished to start this atomic
>>> one, so waiting for interrupts to finish is not needed.
>> This looks kind of odd. Are the "other" transfers really done at this
>> point? Do you have a backtrace for me from the atomic path?
> I thought that i2c core somehow serializes the transfers for the given master.
>
>> Is this needed because you need to send the "power off" command via i2c?
> Yes, most embedded boards do power off by sending i2c command to PMIC chip.

I finally had some time to dig into this history. I've added support for atomic

transfers to the s3c23xx, exynos5 and brcmstd i2c controller drivers to get rid

of the warnings observed during the system reboot (example log from v6.7-rc1):

[info] Will now restart.
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1788 at drivers/i2c/i2c-core.h:40 i2c_transfer+0xe8/0xf4
No atomic I2C transfer handler for 'i2c-0'
Modules linked in: snd_soc_hdmi_codec s5p_csis s5p_fimc exynos4_is_common v4l2_fwnode v4l2_async snd_soc_i2s snd_soc_idma snd_soc_odroid snd_soc_s3c_dma spi_s3c64xx lima snd_soc_max98090 drm_shmem_helper gpu_sched snd_soc_core ac97_bus snd_pcm_dmaengine snd_pcm snd_timer snd soundcore pwm_samsung s5p_mfc exynosdrm analogix_dp samsung_dsim ehci_exynos s5p_jpeg phy_exynos_usb2 v4l2_mem2mem videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videodev videobuf2_common mc exynos_rng s5p_sss s5p_cec rtc_s3c s3c2410_wdt phy_exynos_mipi_video governor_passive exynos_bus pwm_fan exynos_ppmu
CPU: 0 PID: 1788 Comm: reboot Not tainted 6.7.0-rc1-00001-g4ce67e6b4b7a #13398
Hardware name: Samsung Exynos (Flattened Device Tree)
 unwind_backtrace from show_stack+0x10/0x14
 show_stack from dump_stack_lvl+0x40/0x4c
 dump_stack_lvl from __warn+0x78/0x124
 __warn from warn_slowpath_fmt+0x124/0x18c
 warn_slowpath_fmt from i2c_transfer+0xe8/0xf4
 i2c_transfer from regmap_i2c_read+0x64/0x9c
 regmap_i2c_read from _regmap_raw_read+0x10c/0x258
 _regmap_raw_read from _regmap_bus_read+0x40/0x6c
 _regmap_bus_read from _regmap_read+0x60/0x148
 _regmap_read from regmap_read+0x3c/0x60
 regmap_read from regulator_get_voltage_sel_regmap+0x38/0x88
 regulator_get_voltage_sel_regmap from regulator_get_voltage_rdev+0x70/0x170
 regulator_get_voltage_rdev from _regulator_do_set_voltage+0x38/0x600
 _regulator_do_set_voltage from regulator_set_voltage_rdev+0x5c/0x248
 regulator_set_voltage_rdev from regulator_do_balance_voltage+0x338/0x4c8
 regulator_do_balance_voltage from regulator_set_voltage_unlocked+0xd0/0x128
 regulator_set_voltage_unlocked from regulator_set_voltage+0x58/0x94
 regulator_set_voltage from _opp_config_regulator_single+0x44/0x118
 _opp_config_regulator_single from _set_opp+0x110/0x4e0
 _set_opp from dev_pm_opp_set_rate+0x114/0x220
 dev_pm_opp_set_rate from __cpufreq_driver_target+0x178/0x72c
 __cpufreq_driver_target from cpufreq_generic_suspend+0x28/0x50
 cpufreq_generic_suspend from cpufreq_suspend+0x98/0x11c
 cpufreq_suspend from device_shutdown+0x18/0x22c
 device_shutdown from kernel_restart+0x38/0x90
 kernel_restart from __do_sys_reboot+0x164/0x210
 __do_sys_reboot from ret_fast_syscall+0x0/0x54
Exception stack(0xf18edfa8 to 0xf18edff0)
dfa0:                   beb56e14 00000004 fee1dead 28121969 01234567 00000000
dfc0: beb56e14 00000004 004b269c 00000058 004c3000 00000000 00000000 00000000
dfe0: b6f196d0 beb56c78 004b0fec b6f196e8
---[ end trace 0000000000000000 ]---

In meantime the commit a3368e1186e3 ("i2c: core: Fix atomic xfer check for non-preempt

config") has been merged to final v6.7, which removed the need to use atomic i2c

transfers during system reboot/shutdown phases, so it turned out that the atomic

transfers are not really used on my setup.

>> Could you try to test with PREEMPT_RT? I'm sure how this works there.
> I will check this, but so far I run all my tests without PREEMPT_RT

I've added PREEMPT_RT to my test configs but so far I see no issue related to i2c

transfers.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

