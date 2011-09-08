From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 0/7] S3C2443/S3C2416: Implement support for ADC
Date: Thu, 8 Sep 2011 21:51:28 +0200
Message-ID: <201109082151.29076.heiko@sntech.de>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The adc blocks of S3C2443 and S3C2416/2450 differ in some regards
from previous (S3C2410, etc) and later (S3C64XX, S5P) SoCs.

Defining more TYPE_ADCVx types for these SoCs would complicate the
necessary checks a lot. Therefore I opted for the use of quirk
constants which can describe the features of the respective adc
block and can be tested directly against.

This patch series replaces the type checks with checks for specific
quirks and adds support for S3C2443 and S3C2416/2450 on top of this.

Each patch was compile tested, and I tried to only do "equivalent
transforms" for the stuff on lower levels. But as I have only
access to S3C2416 hardware, real life testing happened only there.


Heiko Stuebner (7):
  S3C2443/S3C2416: Add adc registers
  s3c-adc: describe features via quirk constants
  s3c-adc: Replace TYPE_ADCVx conditionals with quirks
  s3c-adc: Fix mux bit modification in s3c_adc_select
  S3C24XX: Allow overriding of adc device name
  s3c-adc: Add support for S3C2443
  s3c-adc: Add support for S3C2416/S3C2450

 arch/arm/mach-s3c2416/mach-smdk2416.c         |    3 +
 arch/arm/mach-s3c2443/mach-smdk2443.c         |    3 +
 arch/arm/plat-samsung/adc.c                   |   89 +++++++++++++++++++-----
 arch/arm/plat-samsung/include/plat/adc-core.h |    2 +-
 arch/arm/plat-samsung/include/plat/regs-adc.h |    3 +
 5 files changed, 80 insertions(+), 20 deletions(-)

-- 
1.7.2.3
