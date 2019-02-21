From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 0/2] clk: samsung: Fix kfree() of const memory on setting driver_override
Date: Thu, 21 Feb 2019 12:45:50 +0100
Message-ID: <1550749552-8133-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Changes since v1:
1. Split clock-related fixes out of bigger platform patchset.
2. Remove usage of driver_override.

Best regards,
Krzysztof


Krzysztof Kozlowski (2):
  clk: samsung: exynos5: Fix possible NULL pointer exception on
    platform_device_alloc() failure
  clk: samsung: exynos5: Fix kfree() of const memory on setting
    driver_override

 drivers/clk/samsung/clk-exynos5-subcmu.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

-- 
2.7.4
