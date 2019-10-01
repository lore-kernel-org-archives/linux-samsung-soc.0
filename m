From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v2 0/4] Exynos5 DMC interrupt mode
Date: Tue,  1 Oct 2019 14:54:32 +0200
Message-ID: <20191001125436.24086-1-l.luba@partner.samsung.com>
References: <CGME20191001125444eucas1p1c31d1492ed64a9417486f471b97eae8c@eucas1p1.samsung.com>
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
Cc: mark.rutland@arm.com, willy.mh.wolff.ml@gmail.com, robh+dt@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, Lukasz Luba <l.luba@partner.samsung.com>, cw00.choi@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, myungjoo.ham@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi all,

This is a v2 patch set for the Exynos5 Dynamic Memory Controller
driver which could be found in Krzysztof's tree [1]. It is on top of a
merge of the two branches [1][2].

It adds interrupt mode which does not relay on devfreq polling.
Instead of checking the device state by the framework, driver uses local
performance event counters which could trigger interrupt when overflow.
Thanks to this approach the driver avoids issues present in devfreq framework,
when default polling check does not occur.
The algorithm calculates 'busy_time' and 'total_time' needed for devfreq
governors (simple_ondemand) based on requests transactions traffic.

Changes:
v2:
  changes suggested by Krzysztof
- added interrupt line for the channel 1
- added desription for bindings with interrupt lines
- fixed fallback path in probe function
- added comments, blank lines, removed unneeded dev_dbg() in irq handler

Regards,
Lukasz Luba

[1] https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=for-v5.4-5.5/memory-samsung-dmc
[2] https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=for-v5.4-5.5/memory-samsung-dmc-dt

Lukasz Luba (4):
  dt-bindings: memory-controllers: Add Exynos5422 DMC interrupts
    description
  ARM: dts: exynos: Add interrupt to DMC controller in Exynos5422
  ARM: dts: exynos: map 0x10000 SFR instead of 0x100 in DMC Exynos5422
  memory: samsung: exynos5422-dmc: Add support for interrupt from
    performance counters

 .../memory-controllers/exynos5422-dmc.txt     |  10 +
 arch/arm/boot/dts/exynos5420.dtsi             |   5 +-
 drivers/memory/samsung/exynos5422-dmc.c       | 345 ++++++++++++++++--
 3 files changed, 334 insertions(+), 26 deletions(-)

-- 
2.17.1
