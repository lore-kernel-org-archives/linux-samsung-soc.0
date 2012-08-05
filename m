From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH 0/2] ARM: S3C24XX: Fix compilation errors with 3.6-rc1
Date: Sun, 5 Aug 2012 17:38:27 +0200
Message-ID: <201208051738.27728.heiko@sntech.de>
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
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Small fallout from from the s3c64xx spi changes and from a dma change from
last year, that only surfaced after a gcc update.

Heiko Stuebner (2):
  ARM: S3C24XX: Add missing DMACH_DT_PROP
  ARM: S3C24XX: Fix s3c2410_dma_enqueue parameters

 arch/arm/mach-s3c24xx/include/mach/dma.h |    3 ++-
 arch/arm/plat-s3c24xx/dma.c              |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.7.2.3
