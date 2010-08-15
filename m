From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 0/3] ARM: S3C64XX: (S)DMA related patches
Date: Sun, 15 Aug 2010 15:02:11 +0200
Message-ID: <4c67e6ab.887b0e0a.53f9.23bc@mx.google.com>
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
Cc: ben-linux@fluff.org
List-Id: linux-samsung-soc@vger.kernel.org

These patches add support for the SDMA channels support in the S3C64XX SoC. The
main user of this is the not-yet-submitted Samsung crypto driver.

Additionally, it fixes an issue with the DMA core not stopping and flushing the
requests when the channel is freed.

Maurus Cuelenaere (3):
  ARM: S3C64XX: Add SDMA clocks
  ARM: S3C64XX: Add SDMA support to DMA core
  ARM: S3C64XX: Stop and flush requests on freeing

 arch/arm/mach-s3c64xx/clock.c |   12 +++++++++
 arch/arm/mach-s3c64xx/dma.c   |   54 ++++++++++++++++++++++++++++++++--------
 2 files changed, 55 insertions(+), 11 deletions(-)
