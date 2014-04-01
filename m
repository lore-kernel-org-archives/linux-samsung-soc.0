From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: exynos4: cpu hotplug + cpuidle/AFTR broken
Date: Tue, 01 Apr 2014 12:43:21 +0200
Message-ID: <533A9849.1080402@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:62357 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751089AbaDAKnI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Apr 2014 06:43:08 -0400
Received: by mail-wg0-f41.google.com with SMTP id n12so7368733wgh.24
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Apr 2014 03:43:06 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>


Hi all,

I tried the v3.14 kernel and unplugged the cpu1. That leads to a kernel=
=20
hang without any trace.

If I disable the cpuidle AFTR state through sysfs before unplugging=20
cpu1, it works well.

I reproduced the issue on v3.14, v3.13, v3.12, v3.11

v3.10 works fine.

I tried to git bisect but I finally gave up due to too much kernel=20
hanging at boot.

The git bisect log below.

Thanks
   -- Daniel


git bisect start
# bad: [6e4664525b1db28f8c4e1130957f70a94c19213e] Linux 3.11
git bisect bad 6e4664525b1db28f8c4e1130957f70a94c19213e
# good: [8bb495e3f02401ee6f76d1b1d77f3ac9f079e376] Linux 3.10
git bisect good 8bb495e3f02401ee6f76d1b1d77f3ac9f079e376
# good: [8b70a90cabafb6a6e1a0d3f838b38355fe48337e] Merge branch=20
'for-v3.11' of git://git.linaro.org/people/mszyprowski/linux-dma-mappin=
g
git bisect good 8b70a90cabafb6a6e1a0d3f838b38355fe48337e
# bad: [b41e6a51d57e231d2ed237f17f002cc536c0987c] sh_eth: SH_ETH should=
=20
depend on HAS_DMA
git bisect bad b41e6a51d57e231d2ed237f17f002cc536c0987c
# bad: [2e17c5a97e231f3cb426f4b7895eab5be5c5442e] Merge branch=20
'drm-next' of git://people.freedesktop.org/~airlied/linux
git bisect bad 2e17c5a97e231f3cb426f4b7895eab5be5c5442e
# good: [e631227f698f39969eb476d297f3ac65b43b51a5] drm/radeon: fix=20
endian bug in radeon_atom_get_mclk_range_table()
git bisect good e631227f698f39969eb476d297f3ac65b43b51a5
# bad: [9a5889ae1ce41f376e6a5b56e17e0c5a755fda80] Merge branch=20
'for-linus' of=20
git://git.kernel.org/pub/scm/linux/kernel/git/sage/ceph-client
git bisect bad 9a5889ae1ce41f376e6a5b56e17e0c5a755fda80
# bad: [be0c5d8c0bb0023e11f5c6d38e90f7b0f24edb64] Merge tag=20
'nfs-for-3.11-1' of git://git.linux-nfs.org/projects/trondmy/linux-nfs
git bisect bad be0c5d8c0bb0023e11f5c6d38e90f7b0f24edb64
# bad: [d2b4a646717153a1a180b64d4a8464054dbd700e] Merge branch=20
'for-linus' of git://git.infradead.org/users/vkoul/slave-dma
git bisect bad d2b4a646717153a1a180b64d4a8464054dbd700e
# skip: [07bd1172902e782f288e4d44b1fde7dec0f08b6f] tick: Sanitize=20
broadcast control logic
git bisect skip 07bd1172902e782f288e4d44b1fde7dec0f08b6f
# good: [757f4e51b74f7fb19251020e742a78111fdea194] MIPS: jz4740: Correc=
t=20
clock gate bit for DMA controller
git bisect good 757f4e51b74f7fb19251020e742a78111fdea194
# skip: [064706514ec3fea740c2656e03c4f01f6a551ac4] clocksource: Add=20
generic dummy timer driver
git bisect skip 064706514ec3fea740c2656e03c4f01f6a551ac4
# skip: [55a68c23e0a675b2b8ac2656fd6edbf98b78e4c6] dw_apb_timer_of.c:=20
Remove parts that were picoxcell-specific
git bisect skip 55a68c23e0a675b2b8ac2656fd6edbf98b78e4c6
# skip: [fc1f7d5606487ae28d6c84e95401952927d7379e] clocksource:=20
apb_timer: Remove unsused function
git bisect skip fc1f7d5606487ae28d6c84e95401952927d7379e
# skip: [6cffe00f7d4e24679eae6b7aae4caaf915288256] alarmtimer: Add=20
functions for timerfd support
git bisect skip 6cffe00f7d4e24679eae6b7aae4caaf915288256
# good: [e24f6628811e2d4531b443684b598f7050932012] modpost: remove all=20
traces of cpuinit/cpuexit sections
git bisect good e24f6628811e2d4531b443684b598f7050932012
# skip: [629a6a2b7762a474177d08043bea094dd27e0a54] sched_clock: Add=20
temporary asm/sched_clock.h
git bisect skip 629a6a2b7762a474177d08043bea094dd27e0a54
# skip: [5c83545f24ab3dd67e0ae0e2b795fea750f08c34] power: Add option to=
=20
log time spent in suspend
git bisect skip 5c83545f24ab3dd67e0ae0e2b795fea750f08c34
# good: [2473f3e7a97ce8bc0fe7596cdb361b21221418eb] posix_cpu_timers:=20
consolidate expired timers check
git bisect good 2473f3e7a97ce8bc0fe7596cdb361b21221418eb
# skip: [336ae1180df5f69b9e0fb6561bec01c5f64361cf] ARM: sched_clock:=20
Load cycle count after epoch stabilizes
git bisect skip 336ae1180df5f69b9e0fb6561bec01c5f64361cf
# skip: [f5a2e34375a5e2b711aea488ac3ae50eeba6d57c] clocksource: Allow=20
clocksource select to skip current clocksource
git bisect skip f5a2e34375a5e2b711aea488ac3ae50eeba6d57c
# skip: [ce0b098981544d9f4e910ea48f3af3e726ca6d6b] x86: Fix=20
vrtc_get_time/set_mmss to use new timespec interface
git bisect skip ce0b098981544d9f4e910ea48f3af3e726ca6d6b
# skip: [d0951a23383d09276f7976ed34d8f1cede629b48] DMA: shdma:=20
shdma_chan_filter() has to be in shdma-base.h
git bisect skip d0951a23383d09276f7976ed34d8f1cede629b48
# skip: [7c4c3a0f18ba57ea2a2985034532303d2929902a] hrtimers: Support=20
resuming with two or more CPUs online (but stopped)
git bisect skip 7c4c3a0f18ba57ea2a2985034532303d2929902a
# skip: [a89c7edbe7d7aa80f507915f3dd801211b116b79] clocksource: Let=20
clocksource_unregister() return success/error
git bisect skip a89c7edbe7d7aa80f507915f3dd801211b116b79
# skip: [2699339361a9bacb3fa663e6b8981a040cfca4ee] clocksource:=20
vf_pit_timer: Use linux/sched_clock.h
git bisect skip 2699339361a9bacb3fa663e6b8981a040cfca4ee
# skip: [7172a286ced0c1f4f239a0fa09db54ed37d3ead2] clockevents: Get rid=
=20
of the notifier chain
git bisect skip 7172a286ced0c1f4f239a0fa09db54ed37d3ead2
# skip: [762cf9695d714d312ef7369bed1b9f9467c9e64e] Merge branch=20
'timers/clockevents' of git://git.linaro.org/people/dlezcano/clockevent=
s=20
into timers/core
git bisect skip 762cf9695d714d312ef7369bed1b9f9467c9e64e
# bad: [21884a83b2192a00885d7244a1dda32debd2fbc7] Merge branch=20
'timers-core-for-linus' of=20
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad 21884a83b2192a00885d7244a1dda32debd2fbc7
# skip: [5a9b5855c248d0298eac4d5490c7bc11c2f1983b] ARM: sched_clock:=20
Remove unused needs_suspend member
git bisect skip 5a9b5855c248d0298eac4d5490c7bc11c2f1983b
# skip: [45cb8e01b2ecef1c2afb18333e95793fa1a90281] clockevents: Split=20
out selection logic
git bisect skip 45cb8e01b2ecef1c2afb18333e95793fa1a90281
# skip: [ffbfb5e316f0db486798ccf1db36a577ffe79637] ARM: sched_clock:=20
Return suspended count earlier
git bisect skip ffbfb5e316f0db486798ccf1db36a577ffe79637
# skip: [04397fe94ad65289884b9862b6a0c722ececaadf] timekeeping: Pass=20
flags instead of multiple bools to timekeeping_update()
git bisect skip 04397fe94ad65289884b9862b6a0c722ececaadf
# skip: [11682a41618f8094cb7a9330b4b6a12ffaef5774] alarmtimer: Export=20
symbols of functions declared in linux/alarmtimer.h
git bisect skip 11682a41618f8094cb7a9330b4b6a12ffaef5774
# skip: [fc1f7d5606487ae28d6c84e95401952927d7379e] clocksource:=20
apb_timer: Remove unsused function
git bisect skip fc1f7d5606487ae28d6c84e95401952927d7379e


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
