From: Lonsn <lonsn2005@gmail.com>
Subject: ac97 failed in kernel 3.8 for s5pv210
Date: Fri, 19 Apr 2013 21:52:44 +0800
Message-ID: <51714C2C.8020806@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:55873 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030427Ab3DSNwp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Apr 2013 09:52:45 -0400
Received: by mail-pb0-f53.google.com with SMTP id un15so73035pbc.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Apr 2013 06:52:45 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi,
My board is almost the same SMDKV210 and use ac97 interface to WM9713
audio codec.
If use original kernel 3.8, then kernel print:
-------------------------------------------------
samsung-ac97 samsung-ac97: ac97 failed to get ac97_clock
soc-audio soc-audio: ASoC: machine SMDK WM9713 should use
snd_soc_register_card()
soc-audio soc-audio: ASoC: CPU DAI samsung-ac97 not registered
platform soc-audio: Driver soc-audio requests probe deferral
TCP: cubic registered
NET: Registered protocol family 17
Key type dns_resolver registered
VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev 2
soc-audio: probe of soc-audio failed with error -22
dm9000 dm9000 eth0: link up, 100Mbps, full-duplex, lpa 0xCDE1
IP-Config: Complete:
     device=eth0, hwaddr=00:09:c0:ff:ec:48, ipaddr=192.168.2.20,
mask=255.255.255.0, gw=192.168.2.1
     host=L210, domain=, nis-domain=(none)
     bootserver=192.168.2.200, rootserver=192.168.2.200, rootpath=
ALSA device list:
  No soundcards found.
VFS: Mounted root (nfs filesystem) on device 0:9.
-------------------------------------------------
After ac97 clock in the arch/arm/mach-s5pv210/clock.c line 481:
	}, {
		.name		= "iis",
		.devname	= "samsung-i2s.2",
		.parent		= &clk_p,
		.enable		= s5pv210_clk_ip3_ctrl,
		.ctrlbit	= (1 << 6),
        }, {
                .name           = "ac97",
                .id             = "samsung-ac97",
                .parent         = &clk_p,
                .enable         = s5pv210_clk_ip3_ctrl,
                .ctrlbit        = (1 << 1),
	}, {
		.name		= "spdif",
		.parent		= &clk_p,
		.enable		= s5pv210_clk_ip3_ctrl,
		.ctrlbit	= (1 << 0),
	},
then kernel print:
------------------------------------------------
soc-audio soc-audio: ASoC: machine SMDK WM9713 should use
snd_soc_register_card()
soc-audio soc-audio:  wm9713-hifi <-> samsung-ac97 mapping ok
TCP: cubic registered
NET: Registered protocol family 17
Key type dns_resolver registered
VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev 2
dm9000 dm9000 eth0: link up, 100Mbps, full-duplex, lpa 0xCDE1
IP-Config: Complete:
     device=eth0, hwaddr=00:09:c0:ff:ec:48, ipaddr=192.168.2.20,
mask=255.255.255.0, gw=192.168.2.1
     host=L210, domain=, nis-domain=(none)
     bootserver=192.168.2.200, rootserver=192.168.2.200, rootpath=
ALSA device list:
  #0: SMDK WM9713
VFS: Mounted root (nfs filesystem) on device 0:10.
Freeing init memory: 132K
--------------------------------------------------------

It seems kernel has detected the sound card, but when I run aplay in
linux, kernel print following segment fault info:
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = ae16c000
[00000000] *pgd=4eb7c831, *pte=00000000, *ppte=00000000
Internal error: Oops: 80000007 [#1] PREEMPT ARM
Modules linked in:
CPU: 0    Not tainted  (3.8.0-dirty #40)
PC is at 0x0
LR is at s3c_ac97_trigger+0x7c/0xc8
pc : [<00000000>]    lr : [<802d4f90>]    psr: a0000093
sp : ae021e48  ip : 00000001  fp : 7e8236c4
r10: 00000000  r9 : ae020000  r8 : 8050a488
r7 : ae8ce000  r6 : 00000001  r5 : ae8ce180  r4 : 8050bab0
r3 : 804e8a70  r2 : 0000200c  r1 : 00000002  r0 : 0000001e
Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 10c5387d  Table: 4e16c019  DAC: 00000015
Process aplay (pid: 2286, stack limit = 0xae020230)
Stack: (0xae021e48 to 0xae022000)
1e40:                   aeab1800 802cf994 aeab1800 aeab1800 8050a488
00000003
1e60: 00000000 802b8710 aeab1800 802b8620 ae85f500 aeab1800 aeab18bc
aeab18bc
1e80: 00000003 802b92f4 aeab1800 aeab1800 0002a680 aebb9a80 000021b0
802bc5cc
1ea0: 22222222 aebefa94 aeb4bf20 aebefa84 aeb4b488 aebefa94 00000000
aebefab4
1ec0: aebefab4 aeab1800 aebb9a80 ae5931c8 00004142 000021b0 ae020000
00000000
1ee0: 7e8236c4 802bd6e4 76f91000 aeb4b488 00000000 aebd2a80 00000003
80090078
1f00: aeb4b488 0002a680 aebb9a80 ae5931c8 00004142 800b72b4 ae020000
00000000
1f20: 00000020 803876d0 aebd2ac8 801872f4 aebd2acc 80000013 00100100
aebd2ac8
1f40: 76f91000 00000003 00003000 00000000 80000013 803875f4 aebd2ac8
8007ff60
1f60: 040444ff 00000000 aebb9a80 0002a680 00004142 00000004 ae020000
00000000
1f80: 7e8236c4 800b7890 00000000 00000000 76f64168 0002a518 0002a568
00000036
1fa0: 8000ede8 8000ec40 76f64168 0002a518 00000004 00004142 0002a680
00000000
1fc0: 76f64168 0002a518 0002a568 00000036 76f94128 0002a278 7e823548
7e8236c4
1fe0: 00000000 7e823368 76ef1390 76d8b7bc 60000010 00000004 722f0000
00746f6f
[<802d4f90>] (s3c_ac97_trigger+0x7c/0xc8) from [<802cf994>]
(soc_pcm_trigger+0x94/0x9c)
[<802cf994>] (soc_pcm_trigger+0x94/0x9c) from [<802b8710>]
(snd_pcm_do_start+0x28/0x2c)
[<802b8710>] (snd_pcm_do_start+0x28/0x2c) from [<802b8620>]
(snd_pcm_action_single+0x38/0x78)
[<802b8620>] (snd_pcm_action_single+0x38/0x78) from [<802b92f4>]
(snd_pcm_action_lock_irq+0x88/0xa8)
[<802b92f4>] (snd_pcm_action_lock_irq+0x88/0xa8) from [<802bc5cc>]
(snd_pcm_common_ioctl1+0x168/0xda0)
[<802bc5cc>] (snd_pcm_common_ioctl1+0x168/0xda0) from [<802bd6e4>]
(snd_pcm_playback_ioctl1+0x38/0x4a0)
[<802bd6e4>] (snd_pcm_playback_ioctl1+0x38/0x4a0) from [<800b72b4>]
(do_vfs_ioctl+0x84/0x624)
[<800b72b4>] (do_vfs_ioctl+0x84/0x624) from [<800b7890>]
(sys_ioctl+0x3c/0x60)
[<800b7890>] (sys_ioctl+0x3c/0x60) from [<8000ec40>]
(ret_fast_syscall+0x0/0x30)
Code: bad PC value
---[ end trace 03d7b34e36e7e128 ]---
note: aplay[2286] exited with preempt_count 2
BUG: spinlock lockup suspected on CPU#0, aplay/2286
 lock: 0xaeab18bc, .magic: dead4ead, .owner: aplay/2286, .owner_cpu: 0
[<800149a8>] (unwind_backtrace+0x0/0xfc) from [<8019268c>]
(do_raw_spin_lock+0x128/0x1b0)
[<8019268c>] (do_raw_spin_lock+0x128/0x1b0) from [<802b9f90>]
(snd_pcm_drop+0x4c/0x9c)
[<802b9f90>] (snd_pcm_drop+0x4c/0x9c) from [<802ba45c>]
(snd_pcm_release_substream+0x20/0xa8)
[<802ba45c>] (snd_pcm_release_substream+0x20/0xa8) from [<802ba50c>]
(snd_pcm_release+0x28/0x6c)
[<802ba50c>] (snd_pcm_release+0x28/0x6c) from [<800a9150>]
(__fput+0x88/0x228)
[<800a9150>] (__fput+0x88/0x228) from [<80039348>] (task_work_run+0xa8/0xdc)
[<80039348>] (task_work_run+0xa8/0xdc) from [<8002509c>]
(do_exit+0x1f8/0x82c)
[<8002509c>] (do_exit+0x1f8/0x82c) from [<800127bc>] (die+0x1a8/0x254)
[<800127bc>] (die+0x1a8/0x254) from [<80016354>]
(__do_kernel_fault+0x74/0x84)
[<80016354>] (__do_kernel_fault+0x74/0x84) from [<80016528>]
(do_page_fault+0x1c4/0x260)
[<80016528>] (do_page_fault+0x1c4/0x260) from [<80008418>]
(do_PrefetchAbort+0x34/0x98)
[<80008418>] (do_PrefetchAbort+0x34/0x98) from [<8000e938>]
(__pabt_svc+0x38/0x80)
Exception stack(0xae021e00 to 0xae021e48)
1e00: 0000001e 00000002 0000200c 804e8a70 8050bab0 ae8ce180 00000001
ae8ce000
1e20: 8050a488 ae020000 00000000 7e8236c4 00000001 ae021e48 802d4f90
00000000
1e40: a0000093 ffffffff
[<8000e938>] (__pabt_svc+0x38/0x80) from [<802d4f90>]
(s3c_ac97_trigger+0x7c/0xc8)
[<802d4f90>] (s3c_ac97_trigger+0x7c/0xc8) from [<802cf994>]
(soc_pcm_trigger+0x94/0x9c)
[<802cf994>] (soc_pcm_trigger+0x94/0x9c) from [<802b8710>]
(snd_pcm_do_start+0x28/0x2c)
[<802b8710>] (snd_pcm_do_start+0x28/0x2c) from [<802b8620>]
(snd_pcm_action_single+0x38/0x78)
[<802b8620>] (snd_pcm_action_single+0x38/0x78) from [<802b92f4>]
(snd_pcm_action_lock_irq+0x88/0xa8)
[<802b92f4>] (snd_pcm_action_lock_irq+0x88/0xa8) from [<802bc5cc>]
(snd_pcm_common_ioctl1+0x168/0xda0)
[<802bc5cc>] (snd_pcm_common_ioctl1+0x168/0xda0) from [<802bd6e4>]
(snd_pcm_playback_ioctl1+0x38/0x4a0)
[<802bd6e4>] (snd_pcm_playback_ioctl1+0x38/0x4a0) from [<800b72b4>]
(do_vfs_ioctl+0x84/0x624)
[<800b72b4>] (do_vfs_ioctl+0x84/0x624) from [<800b7890>]
(sys_ioctl+0x3c/0x60)
[<800b7890>] (sys_ioctl+0x3c/0x60) from [<8000ec40>]
(ret_fast_syscall+0x0/0x30)

Can anyone help? Thanks!
