From: Lihua Yao <ylhuajnu@163.com>
Subject: Re: [RFT v2] pinctrl: samsung: Fix NULL pointer exception on external
 interrupts on S3C24xx
Date: Sat, 17 Jun 2017 00:59:45 +0800
Message-ID: <fcd49f07-04ed-3968-23d8-8e5cba2718df@163.com>
References: <20170615154637.9830-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170615154637.9830-1-krzk@kernel.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Sergio Prado <sergio.prado@e-labworks.com>, stable@vger.kernel.org, Donglin Peng <dolinux.peng@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday, June 15, 2017 11:46 PM, Krzysztof Kozlowski wrote:
> After commit 8b1bd11c1f8f ("pinctrl: samsung: Add the support the
> multiple IORESOURCE_MEM for one pin-bank"), the S3C24xx (and probably
> S3C64xx as well) fails:
>
> 	Unable to handle kernel NULL pointer dereference at virtual address 000000a8
> 	...
> 	(s3c24xx_demux_eint4_7) from [<c004469c>] (__handle_domain_irq+0x6c/0xcc)
> 	(__handle_domain_irq) from [<c0009444>] (s3c24xx_handle_irq+0x6c/0x12c)
> 	(s3c24xx_handle_irq) from [<c000e5fc>] (__irq_svc+0x5c/0x78)
>
> Mentioned commit moved the pointer to controller's base IO memory address
> from each controller's driver data (samsung_pinctrl_drv_data) to per-bank
> structure (samsung_pin_bank).  The external interrupt demux
> handlers (s3c24xx_demux_eint()) tried to get this base address from opaque
> pointer stored under irq_chip data:
>
> 	struct irq_data *irqd = irq_desc_get_irq_data(desc);
> 	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(irqd);
> 	...
> 	pend = readl(bank->eint_base + EINTPEND_REG);
>
> which is wrong because this is hardware irq and it bank was never set
> for this irq_chip.
>
> For S3C24xx and S3C64xx, this partially reverts mentioned commit by
> bringing back the virt_base stored under each controller's driver data
> (samsung_pinctrl_drv_data).  This virt_base address will be now
> duplicated:
>   - samsung_pinctrl_drv_data->virt_base: used on S3C24xx and S3C64xx,
>   - samsung_pin_bank->pctl_base: used on Exynos.
>
> Fixes: 8b1bd11c1f8f ("pinctrl: samsung: Add the support the multiple IORESOURCE_MEM for one pin-bank")
> Cc: <stable@vger.kernel.org>
> Cc: Sergio Prado <sergio.prado@e-labworks.com>
> Reported-by: Sergio Prado <sergio.prado@e-labworks.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Tested on Odroid XU3.
> Please kindly test on S3C24xx and S3C64xx. Other tests, including
> Exynos5433 are also welcomed.
>
> Changes since v1:
> 1. Fix NULL pointer exception when setting virt_base because bdata
>     pointer is invalid at this point (incremented by loop). Spotted
>     by Yao Lihua.
> ---
Works well for me. Tested on TINY6410 board.

Tested-by: Lihua Yao <ylhuajnu@163.com>

Thanks!
Lihua
