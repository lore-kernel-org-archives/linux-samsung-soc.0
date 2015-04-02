From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 0/2] Arndale Octa: Fix S2MPS11 RTC alarm IRQ
Date: Thu, 02 Apr 2015 16:36:14 +0200
Message-ID: <1427985376-20420-1-git-send-email-k.kozlowski@samsung.com>
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
To: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

After long struggle this finally fixes the S2MPS11 RTC alarm IRQ
on Arndale Octa board. It can easily be tested with:
rtcwake -d rtc0 -m on -s 5 -v

The patches are independent.

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  mfd: sec: Fix RTC alarm interrupt number on S2MPS11
  ARM: dts: Fix pinctrl settings for S2MPS11 RTC alarm IRQ on Arndale
    Octa

 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 13 ++++++++++++-
 drivers/mfd/sec-irq.c                         | 14 ++++++++++----
 include/linux/mfd/samsung/irq.h               |  2 +-
 3 files changed, 23 insertions(+), 6 deletions(-)

-- 
1.9.1
