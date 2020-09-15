Return-Path: <SRS0=0LAj=CY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5689C433E2
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 08:35:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37294206BE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 08:35:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KV9Mu4oX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgIOIfg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Sep 2020 04:35:36 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:57949 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIOIfa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 04:35:30 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200915083527euoutp015f7d6140715eb530e35e9a070b34ed7a~06BEcHCEN0416104161euoutp01T
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2020 08:35:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200915083527euoutp015f7d6140715eb530e35e9a070b34ed7a~06BEcHCEN0416104161euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600158927;
        bh=/iCCE+uW6KfoGiIpgmshkLRMJ4Et+d8CskxdhxPm4V8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=KV9Mu4oXYHQgWTmtBVk0FksmJvDlLWRcRedcquizLvd/ZLK3PF7CLgUpLtt7oGpAl
         yv2iWoeBEtalYWXHq5pjUyCi+jTqrAkL+iRTrWNak2cMS74AB8sqDNHOeDeS51lykJ
         869AAbq013682AwHt7sEOo253HyzxxJG/NoJZKhQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200915083527eucas1p2abf4408ac3abf820bb35c29f4e86af9f~06BD6-YZi1844418444eucas1p2c;
        Tue, 15 Sep 2020 08:35:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 59.16.06318.FCC706F5; Tue, 15
        Sep 2020 09:35:27 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200915083526eucas1p12f1a89018084d8391d1f05462b4caa3d~06BDjqUVb3097230972eucas1p1Z;
        Tue, 15 Sep 2020 08:35:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200915083526eusmtrp2fe8edb7413467bd6ba0c70d371d7877e~06BDiuLp93043130431eusmtrp2T;
        Tue, 15 Sep 2020 08:35:26 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-3b-5f607ccf893e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 06.3F.06017.ECC706F5; Tue, 15
        Sep 2020 09:35:26 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200915083525eusmtip1d8fe93038d8632582af65a216547b195~06BCmI4c13220332203eusmtip1R;
        Tue, 15 Sep 2020 08:35:25 +0000 (GMT)
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Russell King <linux@arm.linux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Sumit Garg <sumit.garg@linaro.org>,
        Valentin Schneider <Valentin.Schneider@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Saravana Kannan <saravanak@google.com>,
        kernel-team@android.com,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <ce90375a-6752-1fa9-6927-991a99168b33@samsung.com>
Date:   Tue, 15 Sep 2020 10:35:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <731a70ded2e2e862483d1df96224d039@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHe3cuO44mp7XYQ0XRoOhCmljxdpMKo9OHQKJPQc5VJ7W2FTvN
        tIQsRWqKZSTpkpToKrPlZmvLsjqZY5k75WJ00Q+l0YVUSku0i7mdLL/9/s/zf97n/8DLEBo7
        PZ3JthzgrRajSU+rSG/rcGixlJ9hWOJ7H4elLpHADZUuCvdfLkV4pK9Fiauv5uGjF8Mk9t3S
        Ykm6ocTu7giFw7eraVwpNSvw67Aa+6uDFLaLv2h8vbmMxh53BYFv1QwTuKhz2VoN523yUpzz
        vBNxRYWlNHfeeZjzO7qUXK3bxrnrTtBcwX2J5Dojd2iuLxRScp6LRzi/b0DBlTXWIW7APSst
        fptq9S7elJ3DWxNTMlRZ0ugXcv+ZlNygWEIWoHtL7SiOAXYpFEbaSDtSMRr2KoKWR2//ikEE
        UlPPXzGAoOtXGTE+UlUuKeTGFQQnhlqQLPoRtDa9U0RdU9kt0FVSjqKsZefA16fBmIlgvRSI
        ohhr0GwS2HvtdJTVbAp0BzqpKJPsXPBGgjGexqZD6+NoqKhnCgSremIcx66ElidS7B2CnQ2F
        N88RMuvgVU9NLB6wPgYueH6Qcu5UKB4spmSeCp8CjUqZZ8Kof3ygEMGbUL1SFqUIwscqkexa
        BZ2hkbGozNiKBeC6nSiX18Gn45eoaBnYeHjRO0UOEQ+nvWcJuayG48Ua2T0PHIHr/9Y+eNpB
        nEJ6x4TTHBPOcUw4x/F/by0i65COtwnmTF5ItvAHEwSjWbBZMhN27jO70dgPbfsd+OZDzT93
        iIhlkH6ymrEZDBrKmCPkmUUEDKHXqte3t6Vr1LuMeYd46z6D1WbiBRHNYEi9Tp184eN2DZtp
        PMDv5fn9vHW8q2DiphegorT63Tpkqayqeck/cIlrqKR5MyclBCq2GlK1qENYUZ7zqp/zG87B
        Zu5+jfnsUGR0Q/rIHlC0m54fTpi/PFLf/q0xW+fp3vpzRPmsz8V4awe0zuySh85r1as/eErT
        LqvRSde69EW54dwsZCpz3/2+UZXo7e81NnzelK/Ju6EnhSxj0kLCKhj/AFo5acydAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHe3bv7q7S4jbfnix6udCHAqdXnT6aDRGiS/QhWkGUOYdeVHKb
        3LtZVthMg5pi2hu5xpJYJct8mW+zUusiyTSdIIwoR4h+6ItWWpaVlW4Gfvtxzv93DgcOiSns
        0liyyGDieIOumCbC8ZE/Q4G4sYu52oSvgXjkC4gYar/bKkWfHtUA9HNuUIbsTWWowjmBI09P
        JPL52mTIPe2XoolndgLd9fVL0PsJOeq1e6XIKi4TqKW/lkAd7tsY6rm/hKGqSVWmgu1+3i1l
        mx3NgK2qrCFYR/MFttcWkLGNbjPrdl0jWMtLH85O+l8Q7NzYmIztcF5iez0LEra20wXYBff2
        I5tOKjN4o9nE7Sw0Cqb99CkGJSqZNKRMTE5TMkmpp9MTVXS8OiOfKy4q5fh4da6y0Pf3C15y
        S33OK1bjFjCQbAVhJKSSYUO9T2IF4aSCeghg05JfFmpsg947FmmII+Bvv5UIhWYBvHG5NRiK
        oI7CQHU9WOVIahecH/eC1RBGeaSwoU3EQ8YMBive9gdHERQDrbOro8JIOaWG00OTwTpO7Ybd
        fm+Qo6gc+Kbm41pmM/Q2zOCrHEalw8E3vuA2jEqBjo4pLMQ7YGXXvTWOge9m7kvqgMK2Tret
        U2zrFNs6pRHgLhDJmQV9gV5IVAo6vWA2FCjzjHo3WPmM7tdLnR5gndOIgCIBvVGee1arVUh1
        pUKZXgSQxOhIedboSI5Cnq8rO8/xRi1vLuYEEahWjqvHYqPyjCt/ZjBpGRWTitKY1KTUpBRE
        x8ivUq+yFVSBzsSd4bgSjv/vSciwWAvYivcPXS8/qPowHEsvjX+fJMTSlLJWuym+9vMPTaNm
        M3+T6VPwXXsOzWeSU45AeTWd0CaO1j1O08wd6BMWDz9pbYlYtLiErA3fRqKdI9lxw1sG9jkH
        n/ZsaM/yNrkeXMk5odR4o3fF7Tgz+GvG4Rk+3mk7pjKYnzQvRzWou7JpXCjUMXsxXtD9Axij
        pWsvAwAA
X-CMS-MailID: 20200915083526eucas1p12f1a89018084d8391d1f05462b4caa3d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200914130601eucas1p23ce276d168dee37909b22c75499e68da
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200914130601eucas1p23ce276d168dee37909b22c75499e68da
References: <20200901144324.1071694-1-maz@kernel.org>
        <20200901144324.1071694-9-maz@kernel.org>
        <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
        <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
        <8642847d83ef5bb15663d0246d6af668@kernel.org>
        <65565f85-d932-37f3-a8cd-dbd13d7dbfad@samsung.com>
        <14e2c690bf99280588538989014c7356@kernel.org>
        <33e3ef7c-44e9-a509-74ad-c2e39779fd9d@samsung.com>
        <731a70ded2e2e862483d1df96224d039@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marc,

On 15.09.2020 10:07, Marc Zyngier wrote:
> On 2020-09-15 07:48, Marek Szyprowski wrote:
>>>> Both Exynos 4210 and 4412 use non-zero cpu-offset in GIC node in
>>>> device-tree: arch/arm/boot/dts/exynos{4210,4412}.dtsi, so I assume 
>>>> that
>>>> the GIC registers are not banked.
>>>
>>> Annoyingly, it seems to work correctly in QEMU:
>
> [...]
>
>>> Do you happen to know whether the QEMU emulation is trustworthy?
>>
>> I didn't play much with Exynos emulation on QEMU. All I know is that
>> this patch simply doesn't work on the real hw.
>
> I don't doubt it. The question was more whether we could trust QEMU
> to be reliable, in which case the issue would be around a kernel
> configuration problem. Could you stash your kernel config somewhere?

I just use the vanilla exynos_defconfig for my tests.

>> If there is anything to check or test, let me know. I will try to help
>> as much as possible.
>
> It would be interesting to see whether the CPUs are getting any IPI.
> Can you try the following patch, and send the results back?

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x900
[    0.000000] Linux version 5.9.0-rc4-00008-gac063232d4b0-dirty 
(mszyprow@AMDC2765) (arm-linux-gnueabi-gcc (Linaro GCC 4.9-2017.01) 
4.9.4, GNU ld (Linaro_Binutils-2017.01) 2.24.0.20141017 Linaro 
2014_11-3-git) #9174 SMP PREEMPT Tue Sep 15 10:30:46 CEST 2020
[    0.000000] CPU: ARMv7 Processor [412fc091] revision 1 (ARMv7), 
cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing 
instruction cache
[    0.000000] OF: fdt: Machine model: Samsung Trats based on Exynos4210
[    0.000000] earlycon: exynos4210 at MMIO 0x13820000 (options '115200n8')
[    0.000000] printk: bootconsole [exynos4210] enabled
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] cma: Reserved 96 MiB at 0x7a000000
[    0.000000] Samsung CPU ID: 0x43210211
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000040000000-0x000000006fffffff]
[    0.000000]   HighMem  [mem 0x0000000070000000-0x000000007fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x000000007fffffff]
[    0.000000] Initmem setup node 0 [mem 
0x0000000040000000-0x000000007fffffff]
[    0.000000] percpu: Embedded 20 pages/cpu s51904 r8192 d21824 u81920
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 260608
[    0.000000] Kernel command line: root=PARTLABEL=data rootwait 
console=tty1 console=ttySAC2,115200n8 earlycon
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 
bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 
bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 917072K/1048576K available (10240K kernel code, 
958K rwdata, 4000K rodata, 1024K init, 6487K bss, 33200K reserved, 
98304K cma-reserved, 163840K highmem)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] Running RCU self tests
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU lockdep checking is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=2.
[    0.000000]  Trampoline variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay 
is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] CPU0 IPI0 base = f0800000
[    0.000000] CPU0 IPI1 base = f0800000
[    0.000000] CPU0 IPI2 base = f0800000
[    0.000000] CPU0 IPI3 base = f0800000
[    0.000000] CPU0 IPI4 base = f0800000
[    0.000000] CPU0 IPI5 base = f0800000
[    0.000000] CPU0 IPI6 base = f0800000
[    0.000000] CPU0 IPI7 base = f0800000
[    0.000000] L2C: platform modifies aux control register: 0x02070000 
-> 0x3e470000
[    0.000000] L2C: DT/platform modifies aux control register: 
0x02070000 -> 0x3e470000
[    0.000000] L2C-310 enabling early BRESP for Cortex-A9
[    0.000000] L2C-310 full line of zeros enabled for Cortex-A9
[    0.000000] L2C-310 dynamic clock gating enabled, standby mode enabled
[    0.000000] L2C-310 cache controller enabled, 16 ways, 1024 kB
[    0.000000] L2C-310: CACHE_ID 0x4100c4c5, AUX_CTRL 0x4e470001
[    0.000000] random: get_random_bytes called from 
start_kernel+0x4c0/0x67c with crng_init=0
[    0.000000] Exynos4210 clocks: sclk_apll = 800000000, sclk_mpll = 
800000000
[    0.000000]  sclk_epll = 96000000, sclk_vpll = 108000000, arm_clk = 
800000000
[    0.000000] Switching to timer-based delay loop, resolution 41ns
[    0.000000] clocksource: mct-frc: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 79635851949 ns
[    0.000007] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps 
every 89478484971ns
[    0.008850] Console: colour dummy device 80x30
[    0.017306] printk: console [tty1] enabled
[    0.019992] Lock dependency validator: Copyright (c) 2006 Red Hat, 
Inc., Ingo Molnar
[    0.027791] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.031793] ... MAX_LOCK_DEPTH:          48
[    0.035959] ... MAX_LOCKDEP_KEYS:        8192
[    0.040327] ... CLASSHASH_SIZE:          4096
[    0.044643] ... MAX_LOCKDEP_ENTRIES:     32768
[    0.049096] ... MAX_LOCKDEP_CHAINS:      65536
[    0.053497] ... CHAINHASH_SIZE:          32768
[    0.057948]  memory used by lock dependency info: 4029 kB
[    0.063318]  memory used for stack traces: 2112 kB
[    0.068110]  per task-struct memory footprint: 1536 bytes
[    0.073536] Calibrating delay loop (skipped), value calculated using 
timer frequency.. 48.00 BogoMIPS (lpj=240000)
[    0.083901] pid_max: default: 32768 minimum: 301
[    0.088789] Mount-cache hash table entries: 2048 (order: 1, 8192 
bytes, linear)
[    0.095733] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 
bytes, linear)
[    0.106706] CPU: Testing write buffer coherency: ok
[    0.110276] CPU0: Spectre v2: using BPIALL workaround
[    0.116474] CPU0: thread -1, cpu 0, socket 9, mpidr 80000900
[    0.124225] Setting up static identity map for 0x40100000 - 0x40100060
[    0.130539] rcu: Hierarchical SRCU implementation.
[    0.137562] soc soc0: Exynos: CPU[EXYNOS4210] PRO_ID[0x43210211] 
REV[0x11] Detected
[    0.145493] smp: Bringing up secondary CPUs ...
[    0.152740] CPU0 send IPI0 base = f0800000
[    0.152786] CPU1: Booted secondary processor
[    0.155582] CPU0 send IPI0 base = f0800000
[    0.163945] CPU1 IPI0 base = f0808000
[    0.163956] CPU1 IPI1 base = f0808000
[    0.163966] CPU1 IPI2 base = f0808000
[    0.163976] CPU1 IPI3 base = f0808000
[    0.163986] CPU1 IPI4 base = f0808000
[    0.163995] CPU1 IPI5 base = f0808000
[    0.164004] CPU1 IPI6 base = f0808000
[    0.164014] CPU1 IPI7 base = f0808000
[    0.164025] CPU1: thread -1, cpu 1, socket 9, mpidr 80000901
[    0.164035] CPU1: Spectre v2: using BPIALL workaround
[    0.203803] CPU1 send IPI2 base = f0808000
[    0.207834] CPU1 IPI0 received
[    0.207839] CPU0 IPI2 received
[    0.214052] CPU0 send IPI2 base = f0800000
[    0.217990] CPU1 IPI2 received
[    0.222188] CPU1 send IPI2 base = f0808000
[    2.754062] random: fast init done

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

