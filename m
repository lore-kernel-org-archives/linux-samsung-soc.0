From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: [PATCH 0/3] DMA: PL330: Fix mem leaks and balance probe/remove
Date: Tue, 25 Sep 2012 14:27:33 +0530
Message-ID: <1348563456-30569-1-git-send-email-inderpal.singh@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jassisinghbrar@gmail.com, boojin.kim@samsung.com, vinod.koul@intel.com, patches@linaro.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The first 2 patches of this series fix memory leaks because the memory
allocated for peripheral channels and DMA descriptors were not getting
freed.

The third patch balances the module's remove function.

This patchset is based on slave-dma tree's "next" branch merged with
"fixes" branch and applied patch at [1] to fix the build error.

[1] http://permalink.gmane.org/gmane.linux.kernel.next/24274

Inderpal Singh (3):
  DMA: PL330: Free memory allocated for peripheral channels
  DMA: PL330: Change allocation method to properly free DMA descriptors
  DMA: PL330: Balance module remove function with probe

 drivers/dma/pl330.c |   37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

-- 
1.7.9.5
