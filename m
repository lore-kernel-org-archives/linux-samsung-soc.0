From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: S5PV210 boot problem
Date: Tue, 1 Nov 2016 22:39:54 +0200
Message-ID: <20161101203954.GA15706@kozik-lap>
References: <20161030221021.GB27754@smart-ThinkPad-T410>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:36580 "EHLO
        mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752039AbcKAUj7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Nov 2016 16:39:59 -0400
Received: by mail-wm0-f50.google.com with SMTP id p190so228346208wmp.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Nov 2016 13:39:58 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20161030221021.GB27754@smart-ThinkPad-T410>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nasser <nasix.embedded@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

On Mon, Oct 31, 2016 at 01:40:21AM +0330, Nasser wrote:
> Dear friends, I have problem booting my custom HW (around s5pv210 SoC) 

Oh, amazing! Someone is really using this! :)

> using the latest stable kernel release (v4.8.5). Of course this is the first DT
> based kernel I'm trying to boot with in this HW. I chose s5pv210_defconfig and 
> by checking CONFIG_ARM_APPENDED_DTB, appended the DTB (s5pv210-smdkv210.dtb) at the end of zImage.
> 
> The boot loader is based on the old u-boot v1.3.4.
> Due to some problems with kernel decompression, I revert 
> 1fdc08abfa26f30fcef0ce1333e9ac6f80350f30 ARM: decompressor: avoid speculative prefetch from non-RAM areas 
> for a successful boot on every new kernel and it worked till now (for non-DT
> kernels)
> 
> Boot log messages is attached. There are some problems with clock
> settings and obviously "Division by zero in kernel".
> Can anybody shed some light on the possible issue(s)?
> 
> ## Transferring control to Linux (at address 20008000) ...
> 
> Starting kernel ...
> 
> Uncompressing Linux... done, booting the kernel.
> Booting Linux on physical CPU 0x0
> Linux version 4.8.5-00001-gbbbb0ab (smart@smart-ThinkPad-T410) (gcc version 4.7.3 (Ubuntu/Linaro 4.7.3-12ubuntu1) ) #5 PREEMPT Mon Oct 36
> CPU: ARMv7 Processor [412fc082] revision 2 (ARMv7), cr=10c5387d
> CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
> OF: fdt:Machine model: YIC System SMDKV210 based on S5PV210
> debug: ignoring loglevel setting.
> bootconsole [earlycon0] enabled
> Memory policy: Data cache writeback
> On node 0 totalpages: 262144
> free_area_init_node: node 0, pgdat 80517730, node_mem_map bf7f8000
>   Normal zone: 2048 pages used for memmap
>   Normal zone: 0 pages reserved
>   Normal zone: 262144 pages, LIFO batch:31
> CPU: All CPU(s) started in SVC mode.
> pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
> pcpu-alloc: [0] 0 
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 260096
> Kernel command line: console=ttySAC0,115200n8 root=/dev/mmcblk0p1 rw rootwait ignore_loglevel earlyprintk
> PID hash table entries: 4096 (order: 2, 16384 bytes)
> Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
> Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
> Memory: 1034972K/1048576K available (2048K kernel code, 95K rwdata, 700K rodata, 1024K init, 208K bss, 13604K reserved, 0K cma-reserved)
> Virtual kernel memory layout:
>     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
>     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
>     vmalloc : 0xc0800000 - 0xff800000   (1008 MB)
>     lowmem  : 0x80000000 - 0xc0000000   (1024 MB)
>     modules : 0x7f000000 - 0x80000000   (  16 MB)
>       .text : 0x80008000 - 0x80300000   (3040 kB)
>       .init : 0x80400000 - 0x80500000   (1024 kB)
>       .data : 0x80500000 - 0x80517e40   (  96 kB)
>        .bss : 0x80517e40 - 0x8054bfec   ( 209 kB)
> SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> Preemptible hierarchical RCU implementation.
>         Build-time adjustment of leaf fanout to 32.
> NR_IRQS:16 nr_irqs:16 16
> VIC @c0800000: id 0x00041192, vendor 0x41
> VIC @c0802000: id 0x00041192, vendor 0x41
> VIC @c0804000: id 0x00041192, vendor 0x41
> VIC @c0806000: id 0x00041192, vendor 0x41
> S5PV210 clocks: mout_apll = 0, mout_mpll = 0
>         mout_epll = 0, mout_vpll = 0

This is weird - these clocks probably should not be zero. In the
samsung_clockevent_init() there is clk_get_rate() so maybe the rate (0)
is used later in clockevents.

Just put there a lot of printks for everything and happy debugging! :)

Best regards,
Krzysztof
