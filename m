From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [RFC PATCH 02/11] dma: amba-pl08x: Refactor pl08x_getbytes_chan() to
 lower indentation
Date: Sun, 16 Jun 2013 22:54:09 +0200
Message-ID: <1371416058-22047-3-git-send-email-tomasz.figa@gmail.com>
References: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org
Cc: alsa-devel@alsa-project.org, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Padmavathi Venna <padma.v@samsung.com>, Takashi Iwai <tiwai@suse.de>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-kernel@vger.kernel.org, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Thomas Abraham <thomas.abraham@linaro.org>, Grant Likely <grant.likely@linaro.org>, Alessandro Rubini <rubini@gnudd.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org, Dan Williams <djbw@fb.com>Olof Johansson <o>
List-Id: linux-samsung-soc@vger.kernel.org

Further patch will introduce support for PL080S, which requires some
things to be done conditionally, thus increasing indentation level of
some functions even more.

This patch reduces indentation level of pl08x_getbytes_chan() function
by inverting several conditions and returning from function wherever
possible.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/dma/amba-pl08x.c | 51 ++++++++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 23 deletions(-)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index d443a68..1e57ded 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -473,47 +473,52 @@ static inline u32 get_bytes_in_cctl(u32 cctl)
 /* The channel should be paused when calling this */
 static u32 pl08x_getbytes_chan(struct pl08x_dma_chan *plchan)
 {
+	struct pl08x_lli *llis_va;
 	struct pl08x_phy_chan *ch;
+	dma_addr_t llis_bus;
 	struct pl08x_txd *txd;
 	size_t bytes = 0;
+	int index;
+	u32 clli;
 
 	ch = plchan->phychan;
 	txd = plchan->at;
 
+	if (!ch || !txd)
+		return bytes;
+
 	/*
 	 * Follow the LLIs to get the number of remaining
 	 * bytes in the currently active transaction.
 	 */
-	if (ch && txd) {
-		u32 clli = readl(ch->base + PL080_CH_LLI) & ~PL080_LLI_LM_AHB2;
+	clli = readl(ch->base + PL080_CH_LLI) & ~PL080_LLI_LM_AHB2;
+
+	/* First get the remaining bytes in the active transfer */
+	bytes = get_bytes_in_cctl(readl(ch->base + PL080_CH_CONTROL));
 
-		/* First get the remaining bytes in the active transfer */
-		bytes = get_bytes_in_cctl(readl(ch->base + PL080_CH_CONTROL));
+	if (!clli)
+		return bytes;
 
-		if (clli) {
-			struct pl08x_lli *llis_va = txd->llis_va;
-			dma_addr_t llis_bus = txd->llis_bus;
-			int index;
+	llis_va = txd->llis_va;
+	llis_bus = txd->llis_bus;
 
-			BUG_ON(clli < llis_bus || clli >= llis_bus +
+	BUG_ON(clli < llis_bus || clli >= llis_bus +
 				sizeof(struct pl08x_lli) * MAX_NUM_TSFR_LLIS);
 
-			/*
-			 * Locate the next LLI - as this is an array,
-			 * it's simple maths to find.
-			 */
-			index = (clli - llis_bus) / sizeof(struct pl08x_lli);
+	/*
+	 * Locate the next LLI - as this is an array,
+	 * it's simple maths to find.
+	 */
+	index = (clli - llis_bus) / sizeof(struct pl08x_lli);
 
-			for (; index < MAX_NUM_TSFR_LLIS; index++) {
-				bytes += get_bytes_in_cctl(llis_va[index].cctl);
+	for (; index < MAX_NUM_TSFR_LLIS; index++) {
+		bytes += get_bytes_in_cctl(llis_va[index].cctl);
 
-				/*
-				 * A LLI pointer of 0 terminates the LLI list
-				 */
-				if (!llis_va[index].lli)
-					break;
-			}
-		}
+		/*
+		 * A LLI pointer of 0 terminates the LLI list
+		 */
+		if (!llis_va[index].lli)
+			break;
 	}
 
 	return bytes;
-- 
1.8.2.1
