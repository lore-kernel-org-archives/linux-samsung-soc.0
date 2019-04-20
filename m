From: Willy Wolff <willy.mh.wolff.ml@gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos: add CCI-400 PMU nodes support to
 Exynos542x SoCs
Date: Sat, 20 Apr 2019 07:50:42 +0100
Message-ID: <20190420065041.eyynz7ol2uhv3w5g@macpro-scc.lancs.ac.uk>
References: <20190412172545.fkxnpnymhcw7xncc@macpro-scc.lancs.ac.uk>
 <CACfOrNdEpC2vNgCOBXtrW-HjGHNG_6iLAFUCtVoZstGASPtcsA@mail.gmail.com>
 <38dee054-19ce-a545-fb62-dea4d0036c94@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <38dee054-19ce-a545-fb62-dea4d0036c94@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Indeed, many thanks Robin.

Using this, values sound better.
export OMP_NUM_THREADS=2
sudo --preserve-env ./perf stat -a \
  -e armv7_cortex_a7/config=0x11,name=a7_cycles/ \
  -e armv7_cortex_a15/config=0x11,name=a15_cycles/ \
  -e armv7_cortex_a7/config=0x19,name=a7_bus/ \
  -e armv7_cortex_a15/config=0x19,name=a15_bus/ \
  -e CCI_400/config=0xff,name=cci400_cycles/ \
  -e CCI_400/config=0x0,source=4,name=cci400_si_rrq_hs_any_s4/ \
  -e CCI_400/config=0xc,source=4,name=cci400_si_wrq_hs_any_s4/ \
  -e CCI_400/config=0x0,source=3,name=cci400_si_rrq_hs_any_s3/ \
  -e CCI_400/config=0xc,source=3,name=cci400_si_wrq_hs_any_s3/ \
  taskset -c 0,4 /home/user/EnergyManager/temperature_bench_install/bin/cg.x.A 1

[..]
 Performance counter stats for 'system wide':

     6,201,513,834      a7_cycles
     2,781,009,706      a15_cycles
        64,200,721      a7_bus
        60,237,019      a15_bus
     1,158,303,323      cci400_cycles
        11,390,649      cci400_si_rrq_hs_any_s4
         1,253,383      cci400_si_wrq_hs_any_s4
        13,379,256      cci400_si_rrq_hs_any_s3
        13,200,717      cci400_si_wrq_hs_any_s3

       3.685087167 seconds time elapsed


Do you think that I should write a v2 with a better cover letter that shows
how to access this? By the way, I see that you contribute to that driver. I
haven't seen anything about this source=, do you think that it should be
documented somewhere?

Also, 0 and 4 on the interrupts represent GIC_SPI and IRQ_TYPE_LEVEL_HIGH,
I will do a v2 for this. Don't you think that the doc at
Documentation/devicetree/bindings/arm/cci.txt should use this too?

Willy

On Fri, Apr 19, 2019 at 10:18:02PM +0100, Robin Murphy wrote:
> On 2019-04-19 6:53 pm, Willy Wolff wrote:
> > Hi,
> > 
> > This patch can be dropped, as it needs more work.
> > 
> > In fact, the interrupts seems to be wrong. The interrupts suggested by
> > Anand Moon gave the same following results.
> > 
> > export CCI_DEV=CCI_400
> > export OMP_NUM_THREADS=2
> > sudo --preserve-env ./perf stat -a \
> >    -e armv7_cortex_a7/config=0x11,name=a7_cycles/ \
> >    -e armv7_cortex_a15/config=0x11,name=a15_cycles/ \
> >    -e armv7_cortex_a7/config=0x19,name=a7_bus/ \
> >    -e armv7_cortex_a15/config=0x19,name=a15_bus/ \
> >    -e ${CCI_DEV}/config=0xff,name=cci400_cycles/ \
> >    -e ${CCI_DEV}/config=0x0,name=cci400_si_rrq_hs_any/ \
> >    -e ${CCI_DEV}/config=0xc,name=cci400_si_wrq_hs_any/ \
> 
> From the look of those configs, you'll be counting events on slave interface
> 0, which may not even have anything connected anyway. The CPU clusters on a
> CCI-400 will be on slave interfaces 3 and 4, so try something like '-e
> CCI_400/cci400_si_rrq_hs_any,source=4/'.
> 
> The interrupts only matter for counter overflow, so confirming those could
> be done by picking a sufficiently frequent event, counting for long enough
> to capture slightly more than 2^32 of those, then seeing whether the
> overflow accumulates correctly or the count appears to go backwards (and/or
> checking what fired in /proc/interrupts). I believe the cycle counter is
> also 32-bit on CCI, so that should be relatively easy; for the other
> counters beyond the first one it should be feasible to schedule additional
> dummy events before the event of interest in order to trick
> pmu_get_event_idx() into allocating the desired counter for it.
> 
> Robin.
