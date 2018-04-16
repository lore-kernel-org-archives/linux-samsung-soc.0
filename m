From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v2 0/2] pinctrl/samsung: Fix incorrect EINTG banks order
Date: Mon, 16 Apr 2018 17:52:44 +0200
Message-ID: <1523893966-8884-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tomasz.figa@gmail.com, krzk@kernel.org, s.nawrocki@samsung.com
Cc: linus.walleij@linaro.org, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch series compose of 2 patches.

First patch, fixing incorrect order of banks for s5pv210 and exynos5410

Second patch, documenting required order of banks

Changes from v1:
  - Limit changes to s5pv210 and Exynos5410. Exynos3250 will be handled later.
  - Added cc stable
  - Added fixes tag
  - Add patch with comments to all banks documenting required order.

Paweł Chmiel (2):
  pinctrl/samsung: Correct EINTG banks order
  pinctrl/samsung: Document required order of banks

 drivers/pinctrl/samsung/pinctrl-exynos-arm.c   | 30 ++++++++++++++++++++++++--
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 20 +++++++++++++++++
 2 files changed, 48 insertions(+), 2 deletions(-)

-- 
2.7.4
