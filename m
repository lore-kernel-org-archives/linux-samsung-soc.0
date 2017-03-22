From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/2] pinctrl: samsung: Fix PINCFG_TYPE_DRV bitfields for
 Exynos5433
Date: Wed, 22 Mar 2017 17:03:30 +0900
Message-ID: <1490169812-25225-1-git-send-email-cw00.choi@samsung.com>
References: <CGME20170322080334epcas1p2531fbfdd3c3e033b0f67c5a5cf63b6a1@epcas1p2.samsung.com>
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
To: tomasz.figa@gmail.com, krzk@kernel.org, s.nawrocki@samsung.com, linus.walleij@linaro.org, kgene@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, javier@osg.samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This patches add the missing part about PINCFG_TYPE_DRV bitfields
for Exynos5433 when merged the multiple patches for pinctrl-exynos.c
and this patch removes the unused EXYNOS_PIN_BANK_EINTW_EXT macro.

Also, patch1 and patch2 will be possible squashed if the separate patch
is not necesasry.

Chanwoo Choi (2):
  pinctrl: samsung: Add missing part for PINCFG_TYPE_DRV of Exynos5433
  pinctrl: samsung: Remove unused pin-bank macro

 drivers/pinctrl/samsung/pinctrl-exynos.c | 80 ++++++++++++++++----------------
 drivers/pinctrl/samsung/pinctrl-exynos.h | 11 -----
 2 files changed, 40 insertions(+), 51 deletions(-)

-- 
1.9.1
