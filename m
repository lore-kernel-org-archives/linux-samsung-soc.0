From: Olof Johansson <olof@lixom.net>
Subject: Re: arm-soc boot: 37 passed 3 failed (arm-soc/v3.15-rc6-1395-g436ff76)
Date: Sat, 31 May 2014 10:14:28 -0700
Message-ID: <CAOesGMh7HuKoEAg1+v+74CHstdET9wzya9HMeJQrUt0w+KpEFw@mail.gmail.com>
References: <53898e97.26dd420a.4bf3.774b@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f54.google.com ([209.85.192.54]:35466 "EHLO
	mail-qg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750970AbaEaRO3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 31 May 2014 13:14:29 -0400
Received: by mail-qg0-f54.google.com with SMTP id q108so8456423qgd.13
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 May 2014 10:14:28 -0700 (PDT)
In-Reply-To: <53898e97.26dd420a.4bf3.774b@mx.google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof's autobooter <build@lixom.net>
Cc: Kevin Hilman <khilman@linaro.org>, kernel-build-reports@lists.linaro.org, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Matt Porter <matt.porter@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Sat, May 31, 2014 at 1:11 AM, Olof's autobooter <build@lixom.net> wrote:
>
> Failed boards:
>
>     capri        multi_v7_defconfig            :        FAILED  0:56.33

> MMC read: dev # 0, block # 114688, count 32768 ... 32768 blocks read: OK
> ## Flattened Device Tree blob at 9e000000
>    Booting using the fdt blob at 0x9e000000
>    Using Device Tree in place at 9e000000, end 9e004ea1
>
> Starting kernel ...
>
> ~$off
> # PYBOOT: Exception: timeout


This is new, and triggered by enabling ARCH_EXYNOS. With DEBUG_LL, I get:

CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
Setting up static identity map for 0x9080cab0 - 0x9080cb48
Unhandled fault: imprecise external abort (0xc06) at 0x1efbe945
Internal error: : c06 [#1] SMP ARM
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.15.0-rc6-01364-g58a3e4d-dirty #821
task: ea860000 ti: ea852000 task.ti: ea852000
PC is at l2x0_inv_all+0x24/0x98
LR is at l2x0_inv_all+0x14/0x98
pc : [<c021fccc>]    lr : [<c021fcbc>]    psr: 60000093
sp : ea853e88  ip : 00000000  fp : 00000000
r10: ea852030  r9 : 00000000  r8 : 7e471001
r7 : c09a17cc  r6 : 00000010  r5 : 410000c8  r4 : c0c448ac
r3 : f0014000  r2 : 00000000  r1 : 60000013  r0 : 60000013
Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 10c5387d  Table: 9020404a  DAC: 00000015
Process swapper/0 (pid: 1, stack limit = 0xea852250)
Stack: (0xea853e88 to 0xea854000)
3e80:                   c0c448ac c0acd58c 00000000 00000000 00000000 c0b72424
3ea0: c0c448ac c080ecb0 c0ace2c0 c0acd7a4 c200ffff 7c470001 c09a1080 3ff20000
3ec0: 3ff20fff eb1d0234 00000200 00000000 00000000 00000000 00000000 c0b648c4
3ee0: c0b64910 00000000 00000000 c0208d1c c0c4479c c0805c58 c09a01e0 ea853f14
3f00: 00000000 ea853f14 c0814108 c021a0a4 c09a01e0 00000000 ffffffff 00000000
3f20: 00000000 80000000 c0c44708 c0c4470c ea853f64 00000001 c0b72468 00000001
3f40: 00000000 c0b648c4 c0b64910 00000000 00000000 00000000 00000000 00000000
3f60: 00000000 c0ac6b84 c0c0c0c0 c0c0c0c0 c0c0c0c0 c0c0c0c0 c0c0c0c0 c0c0c0c0
3f80: c0c0c0c0 00000000 c08029b8 00000000 00000000 00000000 00000000 00000000
3fa0: 00000000 c08029c0 00000000 c020e778 00000000 00000000 00000000 00000000
3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
3fe0: 00000000 00000000 00000000 00000000 00000013 00000000 c0c0c0c0 c0c0c0c0
[<c021fccc>] (l2x0_inv_all) from [<c0acd58c>] (l2x0_init+0x150/0x21c)
[<c0acd58c>] (l2x0_init) from [<c0acd7a4>] (l2x0_of_init+0x14c/0x158)
[<c0acd7a4>] (l2x0_of_init) from [<c0208d1c>] (do_one_initcall+0xf8/0x144)
[<c0208d1c>] (do_one_initcall) from [<c0ac6b84>]
(kernel_init_freeable+0x84/0x1dc)
[<c0ac6b84>] (kernel_init_freeable) from [<c08029c0>] (kernel_init+0x8/0xf0)
[<c08029c0>] (kernel_init) from [<c020e778>] (ret_from_fork+0x14/0x3c)

This is actually the exynos4_l2x0_cache_init() call, not the capri
one. Seems like it's running everywhere, always.

Patch is trivial and I'll check it in on top of next/soc. This will
have conflict with Russell's cleanup of l2x0 which will remove this
code alltogether, but to keep arm-soc testable we still need it in our
tree. Patch mailed separately.


-Olof
