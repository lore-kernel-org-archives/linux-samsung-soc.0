From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v2 0/3] refactoring on the s2mps11 device driver
Date: Tue, 19 Jan 2016 17:52:29 +0900
Message-ID: <1453193552-4761-1-git-send-email-andi.shyti@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This patchset contains some code refactoring on the s2mps11 clock
device driver. The main goal is to remove some dead code and
improve its readability.

Compared to the first version there is a patch more:

 - the order of the patches has changed
 - the second patch has been added and it merges a for loop inside
   a previous one
 - the 3rd patch (which in the first version was the 1st)
   contains some more redundant variables removal.

The patches have been applied on next-20160115 and tested on
Odroid Xu4.

Thanks,
Andi

Andi Shyti (3):
  clk: s2mps11: allocate only one structure for clock init
  clk: s2mps11: merge two for loop in one
  clk: s2mps11: remove redundant code

 drivers/clk/clk-s2mps11.c | 102 +++++++++++-----------------------------------
 1 file changed, 24 insertions(+), 78 deletions(-)

-- 
2.7.0.rc3

