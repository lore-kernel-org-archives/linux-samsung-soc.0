From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [BUG stable v4.14.40-rc1] Kernel boot fail on Exynos5422
Date: Thu, 3 May 2018 06:10:05 -0700
Message-ID: <20180503131005.GG26088@linux.vnet.ibm.com>
References: <CAJKOXPdFNuoyf7WaqQsi57ipbHTR9yPZ-gxDBCbyH7AwkXiNFg@mail.gmail.com>
 <CAJKOXPezTgBZuNwHpEDO3t_yTh+CcoaLyQ2AsYDow1ByBpNOcg@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJKOXPezTgBZuNwHpEDO3t_yTh+CcoaLyQ2AsYDow1ByBpNOcg@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <alexander.levin@microsoft.com>, Tejun Heo <tj@kernel.org>, Prateek Sood <prsood@codeaurora.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, May 03, 2018 at 10:29:07AM +0200, Krzysztof Kozlowski wrote:
> On Thu, May 3, 2018 at 10:20 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > Hi,
> >
> > On stable v4.14.40-rc1, commit below breaks kernel boot on ARMv7 board
> > (Odroid XU3 with Samsung Exynos5422, exynos_defconfig). The kernel
> > hangs on "Starting kernel ...". Full log:
> > http://www.krzk.eu/#/builders/1/builds/1897
> >
> > The board boots from TFTP with NFS root (NFSv4).
> >
> > commit 449a8040a3b68a58131453b8f3dcfb411e85b1f5
> > Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > Date:   Mon Jan 8 14:35:52 2018 -0800
> >
> >     rcu: Create RCU-specific workqueues with rescuers
> >
> >     [ Upstream commit ad7c946b35ad455417fdd4bc0e17deda4011841b ]
> 
> Some more printks obtained with earlycon:
> 
> [    0.000000] Booting Linux on physical CPU 0x100
> [    0.000000] Linux version 4.14.39-00579-g449a8040a3b6
> (krzk@PC-kkoz) (gcc version 5.4.0 20160609 (Ubuntu/Linaro
> 5.4.0-6ubuntu1~16.04.9)) #18 SMP PREEMPT Thu May 3 09:59:37 CEST 2018
> [    0.000000] CPU: ARMv7 Processor [410fc073] revision 3 (ARMv7), cr=10c5387d
> [    0.000000] CPU: div instructions available: patching division code
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
> instruction cache
> [    0.000000] OF: fdt: Machine model: Hardkernel Odroid XU3 Lite
> [    0.000000] earlycon: exynos4210 at MMIO 0x12c20000 (options '115200n8')
> [    0.000000] bootconsole [exynos4210] enabled
> [    0.000000] Memory policy: Data cache writealloc
> [    0.000000] cma: Reserved 96 MiB at 0xb8800000
> [    0.000000] Samsung CPU ID: 0xe5422001
> [    0.000000] Running under secure firmware.
> [    0.000000] percpu: Embedded 16 pages/cpu @eef67000 s36136 r8192
> d21208 u65536
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 517120
> [    0.000000] Kernel command line: console=tty1
> console=ttySAC2,115200n8
> ip=192.168.1.11:192.168.1.10:192.168.1.1:255.255.255.0::eth0:none
> nfsrootdebug root=/dev/nfs
> nfsroot=192.168.1.10:/srv/nfs/odroidxu3,vers=4,nolock rootwait rw
> smsc95xx.macaddr=00:1e:06:61:7a:93 no_console_suspend earlycon
> [    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
> [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
> [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
> [    0.000000] Memory: 1932176K/2074624K available (8192K kernel code,
> 433K rwdata, 2744K rodata, 1024K init, 7588K bss, 44144K reserved,
> 98304K cma-reserved, 1189888K highmem)
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> [    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
> [    0.000000]     vmalloc : 0xf0800000 - 0xff800000   ( 240 MB)
> [    0.000000]     lowmem  : 0xc0000000 - 0xf0000000   ( 768 MB)
> [    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
> [    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
> [    0.000000]       .text : 0xc0008000 - 0xc0900000   (9184 kB)
> [    0.000000]       .init : 0xc0c00000 - 0xc0d00000   (1024 kB)
> [    0.000000]       .data : 0xc0d00000 - 0xc0d6c520   ( 434 kB)
> [    0.000000]        .bss : 0xc0d741e0 - 0xc14dd3e4   (7589 kB)
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
> [    0.000000] Running RCU self tests
> [    0.000000] Preemptible hierarchical RCU implementation.
> [    0.000000] RCU lockdep checking is enabled.
> [    0.000000] Tasks RCU enabled.
> [    0.000000] Unable to handle kernel NULL pointer dereference at
> virtual address 000004c4
> [    0.000000] pgd = c0004000
> [    0.000000] [000004c4] *pgd=00000000
> [    0.000000] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
> 4.14.39-00579-g449a8040a3b6 #18
> [    0.000000] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> [    0.000000] task: c0d0a6c0 task.stack: c0d00000
> [    0.000000] PC is at __lock_acquire+0xa0/0x1a50
> [    0.000000] LR is at 0x1
> [    0.000000] pc : [<c016d838>]    lr : [<00000001>]    psr: 200000d3
> [    0.000000] sp : c0d01da8  ip : c0d00000  fp : c0d0a6c0
> [    0.000000] r10: 00000000  r9 : 00000000  r8 : 000004c4
> [    0.000000] r7 : 00000001  r6 : c0d1cf8c  r5 : c147f2a4  r4 : ffffe000
> [    0.000000] r3 : c12ded98  r2 : 00000000  r1 : 00000000  r0 : 000004c4
> [    0.000000] Flags: nzCv  IRQs off  FIQs off  Mode SVC_32  ISA ARM
> Segment none
> [    0.000000] Control: 10c5387d  Table: 4000406a  DAC: 00000051
> [    0.000000] Process swapper/0 (pid: 0, stack limit = 0xc0d00210)
> [    0.000000] Stack: (0xc0d01da8 to 0xc0d02000)
> [    0.000000] 1da0:                   c0ea0284 c103e328 c0d0a6c0
> c016af08 00000100 c0d0abf0
> [    0.000000] 1dc0: 00000008 c016cae4 c0d0abf0 c147f2a4 c0d1cf8c
> 00000019 c0d0ff3c 00000000
> [    0.000000] 1de0: 00000000 c016dae0 c0d0abf0 c147f2a4 f3a49223
> 8d4a1506 c0d0abf0 c12e3894
> [    0.000000] 1e00: c0ea01e4 00000000 00000000 c12ff0a8 00000038
> ffffe000 00000000 600000d3
> [    0.000000] 1e20: 00000001 00000001 ee803080 c0138da0 c0d01ec4
> c016f958 00000001 00000080
> [    0.000000] 1e40: 00000000 c0147da4 00000000 00000000 000004b4
> 200000d3 c0147da4 00000000
> [    0.000000] 1e60: 00000000 c087693c 00000001 00000000 c0147da4
> 00000000 00000000 000004b4
> [    0.000000] 1e80: 00000003 c0147da4 c013ec84 c016f7bc c0d0ff2c
> 00000000 c0d01ed4 c0d0ff2c
> [    0.000000] 1ea0: c0d7580c ee802600 c0d7580c c0d01ed4 00000000
> ffffffff ee803080 c0138da0
> [    0.000000] 1ec0: c0b4e7bc c013ec8c 00000000 c0d0ff2c 600000d3
> 00000000 00000000 dead4ead
> [    0.000000] 1ee0: ffffffff ffffffff c0d7580c 00000000 00000000
> c0ac7460 c0d01ef8 c0d01ef8
> [    0.000000] 1f00: 00000000 ee804e00 ee803080 ee804e10 00000008
> c0c68d40 ee804e08 c0d07428
> [    0.000000] 1f20: c0d07504 c013ed50 c0d01f40 ee804e08 c0d07428
> c0d01f40 c013c1b0 c0b4e7bc
> [    0.000000] 1f40: ee804ea4 00000000 800000d3 ee804ea4 ee804e08
> 00000008 c0d12d00 c0d01f8c
> [    0.000000] 1f60: 00000001 c0d12480 c14a2564 c0d07504 c0d12d1c
> c0d07420 c0d13140 00000424
> [    0.000000] 1f80: 00000008 c0c0cc2c c0ad0c28 c0d07428 00000000
> ffffffec efffefd8 00000001
> [    0.000000] 1fa0: c0d74200 c0d07400 ffffffff c0d74200 efffe800
> c0c38a48 00000000 c0c00b50
> [    0.000000] 1fc0: ffffffff ffffffff 00000000 c0c006a8 00000000
> c0c38a48 c0d74594 c0d07418
> [    0.000000] 1fe0: c0c38a44 c0d0c044 4000406a 410fc073 00000000
> 4000807c 00000000 00000000
> [    0.000000] [<c016d838>] (__lock_acquire) from [<c016f958>]
> (lock_acquire+0x6c/0x88)
> [    0.000000] [<c016f958>] (lock_acquire) from [<c087693c>]
> (_raw_spin_lock_irqsave+0x44/0x58)
> [    0.000000] [<c087693c>] (_raw_spin_lock_irqsave) from [<c0147da4>]
> (try_to_wake_up+0x28/0x3fc)
> [    0.000000] [<c0147da4>] (try_to_wake_up) from [<c013ec8c>]
> (__kthread_create_on_node+0xb8/0x15c)
> [    0.000000] [<c013ec8c>] (__kthread_create_on_node) from
> [<c013ed50>] (kthread_create_on_node+0x20/0x30)
> [    0.000000] [<c013ed50>] (kthread_create_on_node) from [<c013c1b0>]
> (__alloc_workqueue_key+0x2dc/0x458)
> [    0.000000] [<c013c1b0>] (__alloc_workqueue_key) from [<c0c0cc2c>]
> (rcu_init+0x378/0x3e0)
> [    0.000000] [<c0c0cc2c>] (rcu_init) from [<c0c00b50>]
> (start_kernel+0x248/0x3a4)
> [    0.000000] [<c0c00b50>] (start_kernel) from [<4000807c>] (0x4000807c)
> [    0.000000] Code: e1a00005 e28dd06c e8bd8ff0 e59f3e58 (e5982000)
> [    0.000000] random: get_random_bytes called from
> print_oops_end_marker+0x40/0x54 with crng_init=0
> [    0.000000] ---[ end trace 6394ab71d7b5d9aa ]---
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill
> the idle task!
> 
> Addresses from backtrace:
> c0147da4 - kernel/sched/core.c:1981
> c013c1b0 - kernel/workqueue.c:4035
> c0c0cc2c - kernel/rcu/tree.c:4211

Thank you for testing and translating the addresses!

Looks like this patch needs other things to also be backported.  If people
actually start running into the problem this patch addresses on normal
workloads, I will look more deeply into this.

						Thanx, Paul
