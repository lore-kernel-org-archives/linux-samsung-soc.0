From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v4 0/5] Exynos Performance Monitoring Counters enhancements
Date: Wed,  5 Jun 2019 11:12:31 +0200
Message-ID: <20190605091236.24263-1-l.luba@partner.samsung.com>
References: <CGME20190605091301eucas1p278a554a15879a1b6fbc3d2bb5168f8cb@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, willy.mh.wolff.ml@gmail.com, kgene@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, l.luba@partner.samsung.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, myungjoo.ham@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi all,

This patch set extends PPMU on Samsung Exynos by choosing type of data
which shell be counter in the PPMU registers.
It is possible to count e.g. read or write requests, read or write data
or latency.
A new field has been added in the DT 'event' node called 'event-data-type'.
It is them used during the setup of the counter. In the prevoius
implementation there was always one option used: count read+write data.
Sometimes we need more precised information and this patch set tries to
address it.

Changes:
v4:
- changed the way how 'ops' are matched according to Chanwoo's sugestions
  in his example code (added his Signed-off-by to patch 2)
- changed documentation description accoriding to Chanwoo's sugestions
  (added his Signed-off-by to patch 4)
- collected ACKs for patch 1 from Rob and from Chanwoo for patch 2 and
  'Reviewed-by' for patch 1
- patch set is now based on v5.2-rc3 and tested on Odroid u3 
v3 [1]:
- fixed wrong interpretation of ret value during DT parsing, which caused
  alwasy taking default value.
v2 [2]:
 - removed new entry in MAINTAINERS file as suggested by Bartek Zolnierkiewicz
   and added new file to existing list for devfreq events
 - added in the dt-bindings/pmu/exynos_ppmu.h 2 new entries for RO and WO for
   counters in Exynos5433
 - changed initialization with default values when data_type is not provided
   in DT (as sugessted by Chanwoo)
 - added 4th patch which adds 'event-data-type' to 'event' node for Exynos4412
   PPMU events (asked by Chanwoo)

Regards,
Lukasz Luba

[1] https://lkml.org/lkml/2019/4/19/158
[2] https://lkml.org/lkml/2019/4/18/453

Lukasz Luba (5):
  include: dt-bindings: add Performance Monitoring Unit for Exynos
  drivers: devfreq: events: change matching code during probe
  drivers: devfreq: events: extend events by type of counted data
  Documentation: devicetree: add PPMU events description
  DT: arm: exynos4412: add event data type which is monitored

 .../bindings/devfreq/event/exynos-ppmu.txt    | 26 ++++-
 MAINTAINERS                                   |  1 +
 arch/arm/boot/dts/exynos4412-ppmu-common.dtsi | 10 ++
 drivers/devfreq/event/exynos-ppmu.c           | 98 +++++++++++++------
 include/dt-bindings/pmu/exynos_ppmu.h         | 25 +++++
 include/linux/devfreq-event.h                 |  6 ++
 6 files changed, 132 insertions(+), 34 deletions(-)
 create mode 100644 include/dt-bindings/pmu/exynos_ppmu.h

-- 
2.17.1
