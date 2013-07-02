From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH RESEND] ARM: plat-samsung: Fix switching FIFO in
 arch_enable_uart_fifo function
Date: Tue,  2 Jul 2013 23:16:33 +0400
Message-ID: <1372792593-7457-1-git-send-email-shc_work@mail.ru>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>, Ben Dooks <ben-linux@fluff.org>
List-Id: linux-samsung-soc@vger.kernel.org

When CONFIG_S3C_BOOT_UART_FORCE_FIFO symbol is set, we should
enable FIFO but actually switch command is missing in the code.
This patch adds this switching.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 arch/arm/plat-samsung/include/plat/uncompress.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/plat-samsung/include/plat/uncompress.h b/arch/arm/plat-samsung/include/plat/uncompress.h
index 4afc32f..f48dc0a 100644
--- a/arch/arm/plat-samsung/include/plat/uncompress.h
+++ b/arch/arm/plat-samsung/include/plat/uncompress.h
@@ -145,6 +145,8 @@ static inline void arch_enable_uart_fifo(void)
 			if (!(fifocon & S3C2410_UFCON_RESETBOTH))
 				break;
 		}
+
+		uart_wr(S3C2410_UFCON, S3C2410_UFCON_FIFOMODE);
 	}
 }
 #else
-- 
1.8.1.5
