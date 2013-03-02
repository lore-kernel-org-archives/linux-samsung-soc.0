From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Boot failure on Origen board using latest kernel
Date: Sat, 2 Mar 2013 09:40:40 +0530
Message-ID: <CAK9yfHw7-LJx31poPqxn_GRfEDyfReqeYTPX7Fqwzi7vtC98UQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "Koul, Vinod" <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Padma,

While trying to boot the latest mainline kernel (Linus tree tip at
commit b0af9cd9) on Exynos4210 based Origen board, it stops at
"Uncompressing Linux... done, booting the kernel."

Git bisect pointed to the commit 421da89aa ("DMA: PL330: Register the
DMA controller with the generic DMA helpers").
Reverting this commit helped me boot the board again.
Could you please look into this?

-- 
With warm regards,
Sachin
