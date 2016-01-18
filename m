From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH 0/2] s2mps11 code refactoring
Date: Mon, 18 Jan 2016 17:25:23 +0900
Message-ID: <1453105525-31506-1-git-send-email-andi.shyti@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

the two patches are related to some refactoring of the s2mps11
device driver.

The first patch is quite trivial, but it removes a variable which
I consider redundant and doesn't improve any readability.

The second patch is removing some structures which will be never
used in the kernel. The structure removed are merged in a single
more generic structure.

Thanks,
Andi

Andi Shyti (2):
  clk: s2mps11: remove redundant variable
  clk: s2mps11: allocate only one structure for clock init

 drivers/clk/clk-s2mps11.c | 82 +++++++++++++----------------------------------
 1 file changed, 23 insertions(+), 59 deletions(-)

-- 
2.6.4

