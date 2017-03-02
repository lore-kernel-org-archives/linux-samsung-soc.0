From: Sergio Prado <sergio.prado@e-labworks.com>
Subject: [PATCH] pinctrl: samsung: fix segfault when using external interrupts
 on s3c24xx
Date: Thu,  2 Mar 2017 18:23:19 -0300
Message-ID: <1488489799-18136-1-git-send-email-sergio.prado@e-labworks.com>
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
To: kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>
List-Id: linux-samsung-soc@vger.kernel.org

We are getting a NULL pointer dereference when working with external
interrupts on s3c24xx:

Unable to handle kernel NULL pointer dereference at virtual address 000000a8
pgd = c0104000
[000000a8] *pgd=00000000
Internal error: Oops: 5 [#1] ARM
Modules linked in:
CPU: 0 PID: 0 Comm: swapper Not tainted 4.10.0-rc8mini2440-sub-00047-g0722f57bfae9-dirty #3
Hardware name: Samsung S3C2416 (Flattened Device Tree)
task: c07399f8 task.stack: c0734000
PC is at s3c24xx_demux_eint4_7+0x24/0x10c
LR is at s3c24xx_demux_eint4_7+0x108/0x10c

The problem is in the function s3c24xx_demux_eint() when dereferencing
bank->eint_base.

At this point, we cannot get the bank pointer from the irq_desc
structure since it is pointing to the hardware irq, not virq.

So let's get the bank pointer directly from data->drvdata.

This is a regression from commit 8b1bd11c1f8f529057369c5b3702d13fd24e2765.

Tested on FriendlyARM mini2440.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
index b82a003546ae..1b8d887796e8 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
@@ -356,8 +356,8 @@ static inline void s3c24xx_demux_eint(struct irq_desc *desc,
 {
 	struct s3c24xx_eint_data *data = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	struct irq_data *irqd = irq_desc_get_irq_data(desc);
-	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(irqd);
+	struct samsung_pinctrl_drv_data *d = data->drvdata;
+	struct samsung_pin_bank *bank = d->pin_banks;
 	unsigned int pend, mask;
 
 	chained_irq_enter(chip, desc);
-- 
1.9.1
