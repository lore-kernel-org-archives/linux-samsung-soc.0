From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 07/18] dmaengine: PL08x: Fix reading the byte count in cctl
Date: Sun, 11 Aug 2013 19:59:19 +0200
Message-ID: <1376243970-6489-8-git-send-email-tomasz.figa@gmail.com>
References: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
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
Cc: alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Padmavathi Venna <padma.v@samsung.com>, linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>, Dan Williams <djbw@fb.com>, Russell King <linux@arm.linux.org.uk>, linux-spi@vger.kernel.org, Alban Bedel <alban.bedel@avionic-design.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Alban Bedel <alban.bedel@avionic-design.de>

There are more fields than just SWIDTH in CH_CONTROL register, so read
register value must be masked in addition to shifting.

Signed-off-by: Alban Bedel <alban.bedel@avionic-design.de>
Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/dma/amba-pl08x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 4e4c3df..6b9cba2 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -480,6 +480,8 @@ static inline u32 get_bytes_in_cctl(u32 cctl)
 	/* The source width defines the number of bytes */
 	u32 bytes = cctl & PL080_CONTROL_TRANSFER_SIZE_MASK;
 
+	cctl &= PL080_CONTROL_SWIDTH_MASK;
+
 	switch (cctl >> PL080_CONTROL_SWIDTH_SHIFT) {
 	case PL080_WIDTH_8BIT:
 		break;
@@ -498,6 +500,8 @@ static inline u32 get_bytes_in_cctl_pl080s(u32 cctl, u32 cctl1)
 	/* The source width defines the number of bytes */
 	u32 bytes = cctl1 & PL080S_CONTROL_TRANSFER_SIZE_MASK;
 
+	cctl &= PL080_CONTROL_SWIDTH_MASK;
+
 	switch (cctl >> PL080_CONTROL_SWIDTH_SHIFT) {
 	case PL080_WIDTH_8BIT:
 		break;
-- 
1.8.3.2
