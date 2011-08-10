From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 0/2] Remove hw_addr dma leftovers from S3C24xx machs
Date: Wed, 10 Aug 2011 12:27:32 +0200
Message-ID: <201108101227.32780.heiko@sntech.de>
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
To: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: heiko@sntech.de
List-Id: linux-samsung-soc@vger.kernel.org

While trying to sort the dma for S3C2416 I stumbled open the hw_addr
declarations in the other dma.c files.

It took me a while to figure out that they seem to be some sort
of leftover, i.e. they are used in dma-pl080.c of the old Samsung
kernels based on 2.6.21 but nowhere in current kernels.

Therefore I think removing this stuff is appropriate.

The patches apply against current linux-next and are
compile-tested against s3c2410_defconfig and mini2440_defconfig.

Heiko Stuebner (2):
  Remove hw_addr from s3c24XX dma channel declarations
  Remove s3c24xx_dma_addr definition

 arch/arm/mach-s3c2410/dma.c                      |   14 -----------
 arch/arm/mach-s3c2412/dma.c                      |   18 --------------
 arch/arm/mach-s3c2440/dma.c                      |   17 -------------
 arch/arm/mach-s3c2443/dma.c                      |   27 ----------------------
 arch/arm/plat-samsung/include/plat/dma-s3c24xx.h |    6 -----
 5 files changed, 0 insertions(+), 82 deletions(-)

-- 
1.7.5.4
