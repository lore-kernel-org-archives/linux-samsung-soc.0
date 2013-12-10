From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH v5 0/3] Exynos 5410 support
Date: Tue, 10 Dec 2013 08:40:39 -0800
Message-ID: <87ppp48xrs.fsf@linaro.org>
References: <1386685599-31536-1-git-send-email-v.tyrtov@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1386685599-31536-1-git-send-email-v.tyrtov@samsung.com>
	(Vyacheslav Tyrtov's message of "Tue, 10 Dec 2013 18:26:36 +0400")
Sender: linux-doc-owner@vger.kernel.org
To: Vyacheslav Tyrtov <v.tyrtov@samsung.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Heiko Stuebner <heiko@sntech.de>, Naour Romain <romain.naour@openwide.fr>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tarek Dakhran <t.dakhran@samsung.com>, Dave.Martin@arm.com, nicolas.pitre@linaro.org, tomasz.figa@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Vyacheslav Tyrtov <v.tyrtov@samsung.com> writes:

> The series of patches represent support of Exynos 5410 SoC
>
> The Exynos 5410 is the first Samsung SoC based on bigLITTLE architecture
>
> Patches add new platform description, support of clock controller and device 
> tree for Exynos 5410.
>
> Dual cluster support for Exynos 5410 (EDCS) has been removed from this series 
> This patches is activating only the big cluster (all A15 cores)

Testing this series on top of v3.13-rc3, plus a couple of other
necessary changes (which should've probably been noted in the changelog):

1) change CONFIG_NR_CPUS=8 in .config
2) add the exynos combiner patch from Chander:
   [PATCH v2] irqchip: exynos-combiner: remove hard-coded irq_base value

I'm still only seeing 2 out of 4 cores come up on my odroid-xu:

[    0.045000] CPU: Testing write buffer coherency: ok
[    0.045000] CPU0: update cpu_power 1024
[    0.045000] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.045000] Setting up static identity map for 0x403717d8 - 0x40371830
[    0.045000] CPU1: Booted secondary processor
[    0.065000] CPU1: update cpu_power 1024
[    0.065000] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    1.075000] CPU2: failed to boot: -38
[    2.075000] CPU3: failed to boot: -38
[    2.075000] Brought up 2 CPUs
[    2.075000] SMP: Total of 2 processors activated.
[    2.075000] CPU: All CPU(s) started in SVC mode.

Full boot log below.

Kevin


Connected to odroid-xu console [channel connected] (~$quit to exit)
(user:khilman) is already connected
(user:khilman) is already connected

~$hardreset

/ # 
Command(odroid-xu console)> hardreset
(user:khilman) Reboot odroid-xu
.~;+wQt.
