From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] ARM: dts: exynos: add CCI-400 PMU nodes support to
 Exynos542x SoCs
Date: Fri, 19 Apr 2019 22:18:02 +0100
Message-ID: <38dee054-19ce-a545-fb62-dea4d0036c94@arm.com>
References: <20190412172545.fkxnpnymhcw7xncc@macpro-scc.lancs.ac.uk>
 <CACfOrNdEpC2vNgCOBXtrW-HjGHNG_6iLAFUCtVoZstGASPtcsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACfOrNdEpC2vNgCOBXtrW-HjGHNG_6iLAFUCtVoZstGASPtcsA@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Willy Wolff <willy.mh.wolff.ml@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 2019-04-19 6:53 pm, Willy Wolff wrote:
> Hi,
> 
> This patch can be dropped, as it needs more work.
> 
> In fact, the interrupts seems to be wrong. The interrupts suggested by
> Anand Moon gave the same following results.
> 
> export CCI_DEV=CCI_400
> export OMP_NUM_THREADS=2
> sudo --preserve-env ./perf stat -a \
>    -e armv7_cortex_a7/config=0x11,name=a7_cycles/ \
>    -e armv7_cortex_a15/config=0x11,name=a15_cycles/ \
>    -e armv7_cortex_a7/config=0x19,name=a7_bus/ \
>    -e armv7_cortex_a15/config=0x19,name=a15_bus/ \
>    -e ${CCI_DEV}/config=0xff,name=cci400_cycles/ \
>    -e ${CCI_DEV}/config=0x0,name=cci400_si_rrq_hs_any/ \
>    -e ${CCI_DEV}/config=0xc,name=cci400_si_wrq_hs_any/ \

 From the look of those configs, you'll be counting events on slave 
interface 0, which may not even have anything connected anyway. The CPU 
clusters on a CCI-400 will be on slave interfaces 3 and 4, so try 
something like '-e CCI_400/cci400_si_rrq_hs_any,source=4/'.

The interrupts only matter for counter overflow, so confirming those 
could be done by picking a sufficiently frequent event, counting for 
long enough to capture slightly more than 2^32 of those, then seeing 
whether the overflow accumulates correctly or the count appears to go 
backwards (and/or checking what fired in /proc/interrupts). I believe 
the cycle counter is also 32-bit on CCI, so that should be relatively 
easy; for the other counters beyond the first one it should be feasible 
to schedule additional dummy events before the event of interest in 
order to trick pmu_get_event_idx() into allocating the desired counter 
for it.

Robin.

>    taskset -c 0,7 /home/user/cg.x.A 1
> 
> [..]
> 
>   Performance counter stats for 'system wide':
> 
>       9,362,850,550      a7_cycles
>       1,682,125,760      a15_cycles
>          68,920,347      a7_bus
>          61,484,352      a15_bus
>       3,789,936,935      cci400_cycles
>                   0      cci400_si_rrq_hs_any
>                   0      cci400_si_wrq_hs_any
> 
>         9.541340558 seconds time elapsed
> 
> cg.x.A comes from NAS benchmark suite, compiled with fopenmp support, setup
> to run 2 threads and taskmapped to ran on both a7 and a15 clusters.
> a7_bus and a15_bus report main memory accesses.
> 
> Only cci400_cycles seems to be correct. However, all pmcs from the master
> interface are reported as unsupported and all pmcs from the slave interface
> return 0, which is probably not correct.
> http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0470f/CJHICFBF.html
> 
> Would it be possible that someone from Samsung provide the right
> interrupts values?
> Many thanks.
> 
> Regards,
> Willy
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
