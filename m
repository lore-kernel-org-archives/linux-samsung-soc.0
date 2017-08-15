From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.12 59/65] pinctrl: samsung: Remove bogus irq_[un]mask from
 resource management
Date: Mon, 14 Aug 2017 18:19:50 -0700
Message-ID: <20170815011944.741233665@linuxfoundation.org>
References: <20170815011942.395714306@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170815011942.395714306@linuxfoundation.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, stable@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

4.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Gleixner <tglx@linutronix.de>

commit 3fa53ec2ed885b0aec3f0472e3b4a8a6f1cd748c upstream.

The irq chip callbacks irq_request/release_resources() have absolutely no
business with masking and unmasking the irq.

The core code unmasks the interrupt after complete setup and masks it
before invoking irq_release_resources().

The unmask is actually harmful as it happens before the interrupt is
completely initialized in __setup_irq().

Remove it.

Fixes: f6a8249f9e55 ("pinctrl: exynos: Lock GPIOs as interrupts when used as EINTs")
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/pinctrl/samsung/pinctrl-exynos.c |    4 ----
 1 file changed, 4 deletions(-)

--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -205,8 +205,6 @@ static int exynos_irq_request_resources(
 
 	spin_unlock_irqrestore(&bank->slock, flags);
 
-	exynos_irq_unmask(irqd);
-
 	return 0;
 }
 
@@ -226,8 +224,6 @@ static void exynos_irq_release_resources
 	shift = irqd->hwirq * bank_type->fld_width[PINCFG_TYPE_FUNC];
 	mask = (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
 
-	exynos_irq_mask(irqd);
-
 	spin_lock_irqsave(&bank->slock, flags);
 
 	con = readl(bank->eint_base + reg_con);
