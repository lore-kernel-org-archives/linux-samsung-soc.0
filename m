From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] drm/exynos: fimd: fix trigger mode change regression
Date: Mon, 6 Jun 2016 15:28:30 -0400
Message-ID: <1a7200de-9140-a6b3-d7ff-0058a0bb424c@osg.samsung.com>
References: <1464760434-16709-1-git-send-email-inki.dae@samsung.com>
 <2934a74a530dbc5ad3d85065eaed4887@www.loen.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:42895 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751718AbcFFT2m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jun 2016 15:28:42 -0400
In-Reply-To: <2934a74a530dbc5ad3d85065eaed4887@www.loen.fr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hello Marc,

On 06/06/2016 12:45 PM, Marc Zyngier wrote:
> On 2016-06-01 06:53, Inki Dae wrote:
>> This patch fixes a regression that Display panel doesn't work
>> since HW trigger mode was supported.
>>
>> The trigger mode should be changed on PSR(Panel Self Refresh)
>> mode of Panel device according to HW guy's saying. However,
>> with previous HW trigger support, trigger mode could been changed
>> in normal mode of Panel device.
>>
>> So this patch makes sure to change the trigger mode after power off
>> and on again. Later we need to add PSR relevant codes instead.
> 
> I'm afraid this patch doesn't fix the regression I'm seeing on my Exynos5250 Chromebook.
> 
> I found out that using the 4.6 device tree allows the display to function correctly (at least for a while), just enough to see it dying before reaching userspace (and it scrolls up way to quickly for me to read it). Adding printk_delay results in a hanging system.
> 
> Can someone with a servo-board investigate this? I'll try to bisect it further, but an actual backtrace would help.
>

I don't have physical access to a Snow but have access to Collabora's LAVA
server that has a Snow with serial console output so I ran some boot tests:

linux-next + v4.7 DTB [0]
linux-next + v4.6 DTB [1]
linux-next + v4.7 DTB + a partial revert to a v4.7 commit for Snow DTS [2].

There are 2 different issues with the Exynos DRM display port driver on Snow.

First is the DTS regression that you found, commit 5c9cbade0629 ("ARM: dts:
exynos: Fix DTC unit name warnings in Exynos5250") broke this. But I think
the problem is really in the OF graph lookup logic since AFAICT the mentioned
commit is correct IMHO. Patch [3] has the same effect than using the v4.6 DTB.

Second, is the system hang that you found when using the old DTB. This also
happens with the partial revert to 5c9cbade0629 [3] and it seems that was being
masked by the exynos_dp driver failing to probe before but it is exposed once
probe succeeds. In [4] is the relevant trace for the error when booting [1,2].

I'll take a look to both issues.

[0]: https://lava.collabora.co.uk/scheduler/job/236892/log_file
[1]: https://lava.collabora.co.uk/scheduler/job/236893/log_file
[2]: https://lava.collabora.co.uk/scheduler/job/236901/log_file
[3]:
diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
index 419d59da1751..948bc7ff0bf0 100644
--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
@@ -242,7 +242,7 @@
 	hpd-gpios = <&gpx0 7 GPIO_ACTIVE_HIGH>;
 
 	ports {
-		port0 {
+		port@0 {
 			dp_out: endpoint {
 				remote-endpoint = <&bridge_in>;
 			};
@@ -485,13 +485,13 @@
 		edid-emulation = <5>;
 
 		ports {
-			port0 {
+			port@0 {
 				bridge_out: endpoint {
 					remote-endpoint = <&panel_in>;
 				};
 			};
 
-			port1 {
+			port@1 {
 				bridge_in: endpoint {
 					remote-endpoint = <&dp_out>;
 				};

[4]:
[    4.175676] Unable to handle kernel NULL pointer dereference at virtual address 00000210
[    4.182793] pgd = c0004000
[    4.185171] [00000210] *pgd=00000000
[    4.188657] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[    4.194164] Modules linked in:
[    4.196964] CPU: 1 PID: 68 Comm: kworker/1:1 Not tainted 4.7.0-rc2-next-20160606-00006-g876c3150327a #97
[    4.206565] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[    4.212582] Workqueue: events hdmi_hotplug_work_func
[    4.217383] task: ed758000 ti: ed75c000 task.ti: ed75c000
[    4.222887] PC is at __mutex_lock_slowpath+0x6c/0x404
[    4.227913] LR is at preempt_count_add+0xa4/0x140
[    4.232592] pc : [<c06d21d4>]    lr : [<c0139de4>]    psr: 60000093
[    4.232592] sp : ed75dd80  ip : 00000000  fp : ee8c1180
[    4.244193] r10: 00000300  r9 : ed758000  r8 : 00000001
[    4.249262] r7 : 60000013  r6 : c0b473a8  r5 : 00000210  r4 : 0000020c
[    4.261955] r3 : 00000000  r2 : 00000001  r1 : ee8c2808  r0 : 00000000
[    4.273270] Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    4.285336] Control: 10c5387d  Table: 4000406a  DAC: 00000051
[    4.295885] Process kworker/1:1 (pid: 68, stack limit = 0xed75c210)
[    4.306979] Stack: (0xed75dd80 to 0xed75e000)
[    4.316102] dd80: ee8c1180 c03dd21c ee8f0820 00000001 0000020c 0000020c 00000000 00000000
[    4.329201] dda0: 00000001 dededede 00000300 c06d2578 ee8c2808 c03d00f4 ee801d80 c0b0261c
[    4.342362] ddc0: 00000041 ee8c2800 00000000 00000001 ee8f0810 ee8f0b65 c074d2b4 c03d35b0
[    4.353140] dde0: 00000000 00000300 ee8c1180 c03d81d0 c387cf74 ee8f0820 00000001 c03eaffc
[    4.361811] de00: 00000000 ee8f0820 00000001 c03f28bc ee8f0b65 c06d400c ee8c1180 006d40a4
[    4.370483] de20: 00000000 01820a11 81010300 00000100 00000064 ee8f085c ee8f0820 c0b1f894
[    4.379150] de40: c3872800 c0b82fac c074d2b4 c03b7550 c0b13274 c0327974 00000001 eefb8530
[    4.387805] de60: 00000556 00000000 c38729b0 c3872800 ee8c1180 00000001 ee8c7000 00000000
[    4.396467] de80: 00000556 00000300 c38729b0 00000002 ee8c1180 c03c107c ee8c7000 c3872800
[    4.405121] dea0: ee8c7240 c3872800 c0b82fac c03c3268 c3872ad4 00000001 c3872ae0 c03b7af0
[    4.413776] dec0: eefb8000 c0139804 00000000 c0136484 ee8a0000 ee8c1180 c3870b4c eefb7b00
[    4.422415] dee0: eefbb000 00000000 00000000 eefb7b00 ee8c1180 c012ff2c 00000008 eefb7b24
[    4.431045] df00: eefb7b00 ee8c1198 00000008 eefb7b24 c0b02100 ed75c000 eefb7b00 c0130178
[    4.439664] df20: ed75c000 ee863040 ee8c1180 00000000 ee863040 ee8c1180 c0130140 00000000
[    4.448274] df40: 00000000 00000000 00000000 c0135454 00000000 00000000 00000000 ee8c1180
[    4.456879] df60: 00000000 00000000 dead4ead ffffffff ffffffff ed75df74 ed75df74 00000000
[    4.465462] df80: 00000000 dead4ead ffffffff ffffffff ed75df90 ed75df90 ed75dfac ee863040
[    4.474028] dfa0: c0135378 00000000 00000000 c0107978 00000000 00000000 00000000 00000000
[    4.482597] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    4.491133] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    4.499643] [<c06d21d4>] (__mutex_lock_slowpath) from [<c06d2578>] (mutex_lock+0xc/0x24)
[    4.507102] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[    4.514264] [<c06d2578>] (mutex_lock) from [<c03d00f4>] (drm_mode_object_get_reg+0x28/0x80)
[    4.522981] [<c03d00f4>] (drm_mode_object_get_reg) from [<c03d35b0>] (drm_mode_object_get+0x18/0x20)
[    4.532491] [<c03d35b0>] (drm_mode_object_get) from [<c03d81d0>] (drm_mode_create+0x3c/0x58)
[    4.541316] [<c03d81d0>] (drm_mode_create) from [<c03eaffc>] (exynos_dp_get_modes+0x24/0x80)
[    4.550160] [<c03eaffc>] (exynos_dp_get_modes) from [<c03f28bc>] (analogix_dp_get_modes+0x198/0x278)
[    4.559735] [<c03f28bc>] (analogix_dp_get_modes) from [<c03b7550>] (drm_helper_probe_single_connector_modes+0x114/0x554)
[    4.571078] [<c03b7550>] (drm_helper_probe_single_connector_modes) from [<c03c107c>] (drm_fb_helper_probe_connector_modes+0x48/0x68)
[    4.583513] [<c03c107c>] (drm_fb_helper_probe_connector_modes) from [<c03c3268>] (drm_fb_helper_hotplug_event+0x70/0xdc)
[    4.594921] [<c03c3268>] (drm_fb_helper_hotplug_event) from [<c03b7af0>] (drm_helper_hpd_irq_event+0xd4/0x160)
[    4.605474] [<c03b7af0>] (drm_helper_hpd_irq_event) from [<c012ff2c>] (process_one_work+0x124/0x338)
[    4.615144] [<c012ff2c>] (process_one_work) from [<c0130178>] (worker_thread+0x38/0x4d4)
[    4.623764] [<c0130178>] (worker_thread) from [<c0135454>] (kthread+0xdc/0xf4)
[    4.631512] [<c0135454>] (kthread) from [<c0107978>] (ret_from_fork+0x14/0x3c)
[    4.639239] Code: e10f7000 f10c0080 e2845004 f595f000 (e1953f9f) 
[    4.645845] ---[ end trace 3bfc770b9638a54b ]---

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
