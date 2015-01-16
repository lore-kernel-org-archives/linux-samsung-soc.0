From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: [PATCH v2 0/6] Enable HDMI support on Exynos platforms
Date: Fri, 16 Jan 2015 23:44:50 +0100
Message-ID: <54B99462.6020609@gmx.net>
References: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com> <54B68A74.8070405@math.uni-bielefeld.de> <54B79123.4090200@samsung.com> <54B8533C.3070000@math.uni-bielefeld.de> <54B99178.1060006@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:52603 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750968AbbAPWpA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jan 2015 17:45:00 -0500
In-Reply-To: <54B99178.1060006@gmx.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

Tobias Jakobi wrote:
> Hello,
> 
> so OK, this doesn't look too good.
> 
> Tobias Jakobi wrote:
>> I checked with my panel just now and played around a bit with the DRM
>> (opening, vsync, etc.). However on deinitialization the entire system
>> locked up. I currently haven't hooked the board up to the serial
>> console, otherwise I would've tried to extract some more meaningful
>> information.
>>
>> Going to check again more thoroughly on the weekend what exactly
>> triggers the lockup.
> 
> So, first of all I did my initial test with the exynos video backend of
> RetroArch. But it turns out that there's no fancy application needed. I
> now tested this with the 'modetest' application from libdrm, and did this:
> 
> ./modetest -M exynos -s 16@13:1920x1080
> setting mode 1920x1080-60Hz@XR24 on connectors 16, crtc 13
> ^C
> ./modetest -M exynos -s 16@13:640x480
> setting mode 640x480-60Hz@XR24 on connectors 16, crtc 13
> ^C
> ./modetest -M exynos -s 16@13:640x480
> setting mode 640x480-60Hz@XR24 on connectors 16, crtc 13
> ^C
> ./modetest -M exynos -s 16@13:640x480
> 
> The board instantly died then. No kernel log output from the serial
> console, the heartbeat just stops and the board is dead. Need to
> power-cycle to get it running again.
> 
> I'm unsure how to triage this at all.
> 
> @Marek: Could you check if this also happens for you?

In addition to the simple 'set mode' test, I also tried the 'vsync page
flip' one:

./modetest -M exynos -v -s 16@13:1280x720

While I haven't managed to lock up the system that way (I didn't try to
repeatedly kill and start this test), I managed to produce kernel
warnings that way.

Relevant parts here:
[  108.173644] lcd0-power-domain: Power-on latency exceeded, new value
364958 ns
[  108.174010] tv-power-domain: Power-on latency exceeded, new value
350083 ns
[  192.632246] lcd0-power-domain: Power-on latency exceeded, new value
419499 ns
[  192.632695] tv-power-domain: Power-on latency exceeded, new value
408167 ns
[  195.257343] ------------[ cut here ]------------
[  195.257379] WARNING: CPU: 0 PID: 0 at drivers/gpu/drm/drm_irq.c:1072
drm_vblank_put+0xd8/0xf0()
[  195.257385] Modules linked in: bridge stp llc bnep btrfs xor xor_neon
zlib_inflate zlib_deflate raid6_pq ecb btusb bluetooth usb_storage
[  195.257429] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.19.0-rc4+ #3
[  195.257435] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[  195.257440] Backtrace:
[  195.257462] [<c001212c>] (dump_backtrace) from [<c0012344>]
(show_stack+0x18/0x1c)
[  195.257468]  r6:c0595c30 r5:00000000 r4:c063ba90 r3:00000000
[  195.257494] [<c001232c>] (show_stack) from [<c048f8f8>]
(dump_stack+0x98/0xd8)
[  195.257507] [<c048f860>] (dump_stack) from [<c0028f9c>]
(warn_slowpath_common+0x88/0xb8)
[  195.257512]  r5:00000430 r4:00000000
[  195.257525] [<c0028f14>] (warn_slowpath_common) from [<c0029070>]
(warn_slowpath_null+0x24/0x2c)
[  195.257530]  r8:00200200 r7:ee3a9c00 r6:00000000 r5:ed89e380 r4:ed89e380
[  195.257552] [<c002904c>] (warn_slowpath_null) from [<c0268fac>]
(drm_vblank_put+0xd8/0xf0)
[  195.257570] [<c0268ed4>] (drm_vblank_put) from [<c028156c>]
(exynos_drm_crtc_finish_pageflip+0xc0/0xf0)
[  195.257586] [<c02814ac>] (exynos_drm_crtc_finish_pageflip) from
[<c0290358>] (mixer_irq_handler+0xdc/0x104)
[  195.257591]  r10:c06527ee r9:ee1e26c0 r8:00000041 r7:00000801
r6:ed804e68 r5:00000801
[  195.257607]  r4:ed804e10
[  195.257622] [<c029027c>] (mixer_irq_handler) from [<c00610b0>]
(handle_irq_event_percpu+0x3c/0x138)
[  195.257627]  r7:00000000 r6:00000000 r5:ee1e2720 r4:ed89e9c0
[  195.257644] [<c0061074>] (handle_irq_event_percpu) from [<c00611f0>]
(handle_irq_event+0x44/0x64)
[  195.257649]  r10:00000000 r9:f0020000 r8:ee008000 r7:00000001
r6:ed89e9c0 r5:ee1e2720
[  195.257664]  r4:ee1e26c0
[  195.257677] [<c00611ac>] (handle_irq_event) from [<c0063d84>]
(handle_fasteoi_irq+0xb8/0x188)
[  195.257683]  r6:c063be14 r5:ee1e2720 r4:ee1e26c0 r3:00000000
[  195.257701] [<c0063ccc>] (handle_fasteoi_irq) from [<c0060748>]
(generic_handle_irq+0x34/0x44)
[  195.257706]  r6:00000000 r5:00000000 r4:00000041 r3:c0063ccc
[  195.257723] [<c0060714>] (generic_handle_irq) from [<c0060a28>]
(__handle_domain_irq+0x64/0xb8)
[  195.257728]  r4:c0620a38 r3:00000062
[  195.257741] [<c00609c4>] (__handle_domain_irq) from [<c0008604>]
(gic_handle_irq+0x38/0x70)
[  195.257746]  r8:c0625f08 r7:c062c944 r6:0000006b r5:0000007b
r4:f002000c r3:c0625f08
[  195.257769] [<c00085cc>] (gic_handle_irq) from [<c0012ec0>]
(__irq_svc+0x40/0x74)
[  195.257775] Exception stack(0xc0625f08 to 0xc0625f50)
[  195.257785] 5f00:                   ffffffed 00000000 00000000
c001fa80 c062c510 c062c4c4
[  195.257794] 5f20: 00000000 00000000 c0625f60 c0624000 00000000
c0625f5c c0625f60 c0625f50
[  195.257801] 5f40: c000f780 c000f784 600f0053 ffffffff
[  195.257806]  r9:c0624000 r8:c0625f60 r7:c0625f3c r6:ffffffff
r5:600f0053 r4:c000f784
[  195.257832] [<c000f744>] (arch_cpu_idle) from [<c0057ccc>]
(cpu_startup_entry+0x19c/0x264)
[  195.257845] [<c0057b30>] (cpu_startup_entry) from [<c048bba8>]
(rest_init+0x8c/0x90)
[  195.257850]  r7:ffffffff
[  195.257863] [<c048bb1c>] (rest_init) from [<c05f0cd8>]
(start_kernel+0x37c/0x388)
[  195.257868]  r4:c062c5d8 r3:c0624000
[  195.257882] [<c05f095c>] (start_kernel) from [<40008070>] (0x40008070)
[  195.257888] ---[ end trace 540e9ba1a4f64db4 ]---
[  204.079572] lcd0-power-domain: Power-on latency exceeded, new value
470417 ns
[  204.080079] tv-power-domain: Power-on latency exceeded, new value
449208 ns


So something is fishy...

With best wishes,
Tobias
