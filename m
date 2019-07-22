From: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC/RFT 0/5] Exynos USB 3.0 PHY tune setting
Date: Tue, 23 Jul 2019 00:29:33 +0530
Message-ID: <20190722185938.9043-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Anand Moon <linux.amoon@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Dear All,

Here are some patches which help tune USB 3.0 phy.
changes have been testing on Odroid XU3 / XU4 / HC1.
with suspend and resume working with usb hdd device connected.

These patches have been build on top on Marek Szyprowski
Fix USB3.0 DRD PHY calibration issues.

[0] https://patchwork.kernel.org/cover/11049823/

Anand Moon (5):
  phy: exynos5-usbdrd: read from correct offset of xhci linksystem
  phy: exynos5-usbdrd: add missing tuning of the phyutmi signal
  phy: exynos5-usbdrd: UTMI tune signal
  phy: exynos5-usbdrd: PIPE3 tune signal
  phy: exynos5-usbdrd: drop duplicate setting PIPE3 tune signal

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 101 ++++++++++++++++++-----
 1 file changed, 82 insertions(+), 19 deletions(-)

-- 
2.22.0
