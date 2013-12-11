From: Tarek Dakhran <t.dakhran@samsung.com>
Subject: Re: [PATCH v5 0/3] Exynos 5410 support
Date: Wed, 11 Dec 2013 13:56:25 +0400
Message-ID: <52A836C9.9020405@samsung.com>
References: <1386685599-31536-1-git-send-email-v.tyrtov@samsung.com>
 <87ppp48xrs.fsf@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <87ppp48xrs.fsf@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@linaro.org>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, nicolas.pitre@linaro.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org, tomasz.figa@gmail.com, Naour Romain <romain.naour@openwide.fr>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Dave.Martin@arm.com, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Landley <rob@landley.net>
List-Id: linux-samsung-soc@vger.kernel.org

On 12/10/2013 08:40 PM, Kevin Hilman wrote:
> Vyacheslav Tyrtov <v.tyrtov@samsung.com> writes:
>
>> The series of patches represent support of Exynos 5410 SoC
>>
>> The Exynos 5410 is the first Samsung SoC based on bigLITTLE architecture
>>
>> Patches add new platform description, support of clock controller and device
>> tree for Exynos 5410.
>>
>> Dual cluster support for Exynos 5410 (EDCS) has been removed from this series
>> This patches is activating only the big cluster (all A15 cores)
> Testing this series on top of v3.13-rc3, plus a couple of other
> necessary changes (which should've probably been noted in the changelog):
>
> 1) change CONFIG_NR_CPUS=8 in .config
> 2) add the exynos combiner patch from Chander:
>     [PATCH v2] irqchip: exynos-combiner: remove hard-coded irq_base value
>
> I'm still only seeing 2 out of 4 cores come up on my odroid-xu:
>
> [    0.045000] CPU: Testing write buffer coherency: ok
> [    0.045000] CPU0: update cpu_power 1024
> [    0.045000] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
> [    0.045000] Setting up static identity map for 0x403717d8 - 0x40371830
> [    0.045000] CPU1: Booted secondary processor
> [    0.065000] CPU1: update cpu_power 1024
> [    0.065000] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
> [    1.075000] CPU2: failed to boot: -38
> [    2.075000] CPU3: failed to boot: -38
> [    2.075000] Brought up 2 CPUs
> [    2.075000] SMP: Total of 2 processors activated.
> [    2.075000] CPU: All CPU(s) started in SVC mode.
>
Hi Kevin,

EDCS(exynos dual cluster support) moved to separate patch now.
This patches introduce only base SoC support  (2xA15).

Patches tested on samsung smdk5410 board.

Next version of EDCS patches will be available soon.
They allow power on and boot all 8 cores.

Best regards,
     Tarek Dakhran.
