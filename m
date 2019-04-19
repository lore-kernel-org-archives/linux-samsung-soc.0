From: Willy Wolff <willy.mh.wolff.ml@gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos: add CCI-400 PMU nodes support to
 Exynos542x SoCs
Date: Fri, 19 Apr 2019 18:53:44 +0100
Message-ID: <CACfOrNdEpC2vNgCOBXtrW-HjGHNG_6iLAFUCtVoZstGASPtcsA@mail.gmail.com>
References: <20190412172545.fkxnpnymhcw7xncc@macpro-scc.lancs.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190412172545.fkxnpnymhcw7xncc@macpro-scc.lancs.ac.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This patch can be dropped, as it needs more work.

In fact, the interrupts seems to be wrong. The interrupts suggested by
Anand Moon gave the same following results.

export CCI_DEV=CCI_400
export OMP_NUM_THREADS=2
sudo --preserve-env ./perf stat -a \
  -e armv7_cortex_a7/config=0x11,name=a7_cycles/ \
  -e armv7_cortex_a15/config=0x11,name=a15_cycles/ \
  -e armv7_cortex_a7/config=0x19,name=a7_bus/ \
  -e armv7_cortex_a15/config=0x19,name=a15_bus/ \
  -e ${CCI_DEV}/config=0xff,name=cci400_cycles/ \
  -e ${CCI_DEV}/config=0x0,name=cci400_si_rrq_hs_any/ \
  -e ${CCI_DEV}/config=0xc,name=cci400_si_wrq_hs_any/ \
  taskset -c 0,7 /home/user/cg.x.A 1

[..]

 Performance counter stats for 'system wide':

     9,362,850,550      a7_cycles
     1,682,125,760      a15_cycles
        68,920,347      a7_bus
        61,484,352      a15_bus
     3,789,936,935      cci400_cycles
                 0      cci400_si_rrq_hs_any
                 0      cci400_si_wrq_hs_any

       9.541340558 seconds time elapsed

cg.x.A comes from NAS benchmark suite, compiled with fopenmp support, setup
to run 2 threads and taskmapped to ran on both a7 and a15 clusters.
a7_bus and a15_bus report main memory accesses.

Only cci400_cycles seems to be correct. However, all pmcs from the master
interface are reported as unsupported and all pmcs from the slave interface
return 0, which is probably not correct.
http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0470f/CJHICFBF.html

Would it be possible that someone from Samsung provide the right
interrupts values?
Many thanks.

Regards,
Willy
