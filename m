From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 22/30] ASoC: samsung/idma: export
	idma_reg_addr_init
Date: Thu, 11 Apr 2013 02:05:04 +0200
Message-ID: <1365638712-1028578-23-git-send-email-arnd@arndb.de>
References: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: linux-arm-kernel@lists.infradead.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The idma_reg_addr_init function is used by the samsung i2s driver,
which can be a loadable module, so we have to export this function.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: alsa-devel@alsa-project.org
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
---
 sound/soc/samsung/idma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/samsung/idma.c b/sound/soc/samsung/idma.c
index f36a541..6e5fed3 100644
--- a/sound/soc/samsung/idma.c
+++ b/sound/soc/samsung/idma.c
@@ -411,6 +411,7 @@ void idma_reg_addr_init(void __iomem *regs, dma_addr_t addr)
 	idma.regs = regs;
 	idma.lp_tx_addr = addr;
 }
+EXPORT_SYMBOL_GPL(idma_reg_addr_init);
 
 static struct snd_soc_platform_driver asoc_idma_platform = {
 	.ops = &idma_ops,
-- 
1.8.1.2
