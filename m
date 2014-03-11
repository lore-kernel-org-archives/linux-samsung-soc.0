From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/5] ARM: dts: exynos: Add missing dt data to bring kernel of
 Exynos4x12
Date: Tue, 11 Mar 2014 16:54:49 +0900
Message-ID: <1394524494-30641-1-git-send-email-cw00.choi@samsung.com>
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
To: kgene.kim@samsung.com, t.figa@samsung.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch add missing dt data of Exynos4x12 to bring up kernel feature and
code clean.

exynos4x12/exynos4412/exynos4212.dtsi
- Add ADC (Analog and Digital Converter) to get raw data
- Add PMU (Performance Monitoring Unit) for perf event
- Add gps_alive power domain to remove power leakage when gps-alive isn't used
- Remove duplicate dt data of interrput combiner controller

exynos4412-trats.dts
- Add ADC dt data with ntc thermistor child to read temperature

Chanwoo Choi (5):
  ARM: dts: exynos4x12: Add ADC's dt data to read raw data
  ARM: dts: exynos4x12: Add PMU dt data to support PMU(Perforamnce Monitoring Unit)
  ARM: dts: exynos4x12: Add GPS_ALIVE power domain
  ARM: dts: exynos: Move common dt data for interrupt combiner controller
  ARM: dts: exynos4412-trats2: Add ADC's dt data to get temperature of SoC/battery

 arch/arm/boot/dts/exynos4212.dtsi       | 13 ++++---------
 arch/arm/boot/dts/exynos4412-trats2.dts | 21 +++++++++++++++++++++
 arch/arm/boot/dts/exynos4412.dtsi       | 14 ++++----------
 arch/arm/boot/dts/exynos4x12.dtsi       | 31 +++++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+), 19 deletions(-)

-- 
1.8.0
