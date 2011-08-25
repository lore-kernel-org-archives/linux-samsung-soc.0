From: Boojin Kim <boojin.kim@samsung.com>
Subject: To use DMA generic APIs for Samsung DMA
Date: Thu, 25 Aug 2011 11:13:30 +0900
Message-ID: <1314238425-6480-1-git-send-email-boojin.kim@samsung.com>
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
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dan Williams <dan.j.williams@intel.com>
List-Id: linux-samsung-soc@vger.kernel.org

Changes from V7 are following:
- [PATCH v7 03/15]: Change commit message
- [PATCH v7 04/15]: Change the data type of 'cyclic' variable from 'enum'
  to 'bool'. It removes the redundant status.
- [PATCH v7 05/15]: Change the build configuration name of samsung DMA from
  'SAMSUNG_DMA_PL330' to 'SAMSUNG_DMADEV' in order to remove the PL330
  dependency on it.

[PATCH v7 01/15] DMA: PL330: Add support runtime PM for PL330 DMAC
[PATCH v7 02/15] DMA: PL330: Update PL330 DMA API driver
[PATCH v7 03/15] DMA: PL330: Modify device_control()
[PATCH v7 04/15] DMA: PL330: Add DMA_CYCLIC capability
[PATCH v7 05/15] ARM: SAMSUNG: Update to use PL330-DMA driver
[PATCH v7 06/15] ARM: SAMSUNG: Add common DMA operations
[PATCH v7 07/15] ARM: EXYNOS4: Use generic DMA PL330 driver
[PATCH v7 08/15] ARM: S5PV210: Use generic DMA PL330 driver
[PATCH v7 09/15] ARM: S5PC100: Use generic DMA PL330 driver
[PATCH v7 10/15] ARM: S5P64X0: Use generic DMA PL330 driver
[PATCH v7 11/15] ARM: SAMSUNG: Remove S3C-PL330-DMA driver
[PATCH v7 12/15] spi/s3c64xx: Add support DMA engine API
[PATCH v7 13/15] spi/s3c64xx: Merge dma control code
[PATCH v7 14/15] ASoC: Samsung: Update DMA interface
[PATCH v7 15/15] ARM: SAMSUNG: Remove Samsung specific enum type for dma direction
