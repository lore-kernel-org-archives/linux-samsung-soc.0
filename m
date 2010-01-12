From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: S5PC1XX: Use common UART IRQ handling code
Date: Tue, 12 Jan 2010 15:43:11 +0100
Message-ID: <002101ca9395$926e41f0$b74ac5d0$%szyprowski@samsung.com>
References: <1263273657-27986-1-git-send-email-ben@trinity.fluff.org>
 <1263273657-27986-2-git-send-email-ben@trinity.fluff.org>
 <1263273657-27986-3-git-send-email-ben@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50495 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753081Ab0ALOpb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jan 2010 09:45:31 -0500
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KW500FKL29MZV@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 23:44:10 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KW500I0C29ITI@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 23:44:10 +0900 (KST)
In-reply-to: <1263273657-27986-3-git-send-email-ben@trinity.fluff.org>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben@trinity.fluff.org>, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>

Hello,

On Tuesday, January 12, 2010 6:21 AM Ben Dooks wrote:

> From: Ben Dooks <ben-linux@fluff.org>
> 
> Use the common UART IRQ handling code for the S5PC100 system.
> 
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>

Tested and works fine on SMDKC100.

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>  arch/arm/plat-s5pc1xx/Kconfig |    1 +
>  arch/arm/plat-s5pc1xx/irq.c   |  116 +---------------------------------------
>  2 files changed, 4 insertions(+), 113 deletions(-)
> 
> diff --git a/arch/arm/plat-s5pc1xx/Kconfig b/arch/arm/plat-s5pc1xx/Kconfig
> index 6438bcd..b7f442b 100644
> --- a/arch/arm/plat-s5pc1xx/Kconfig
> +++ b/arch/arm/plat-s5pc1xx/Kconfig
> @@ -12,6 +12,7 @@ config PLAT_S5PC1XX
>  	select NO_IOPORT
>  	select ARCH_REQUIRE_GPIOLIB
>  	select SAMSUNG_CLKSRC
> +	select SAMSUNG_IRQ_UART
>  	select SAMSUNG_IRQ_VIC_TIMER
>  	select S3C_GPIO_TRACK
>  	select S3C_GPIO_PULL_UPDOWN
> diff --git a/arch/arm/plat-s5pc1xx/irq.c b/arch/arm/plat-s5pc1xx/irq.c
> index ae233bd..bfc5248 100644
> --- a/arch/arm/plat-s5pc1xx/irq.c
> +++ b/arch/arm/plat-s5pc1xx/irq.c
> @@ -21,18 +21,13 @@
> 
>  #include <mach/map.h>
>  #include <plat/irq-vic-timer.h>
> +#include <plat/irq-uart.h>
>  #include <plat/cpu.h>
> 
> -struct uart_irq {
> -	void __iomem	*regs;
> -	unsigned int	 base_irq;
> -	unsigned int	 parent_irq;
> -};
> -
>  /* Note, we make use of the fact that the parent IRQs, IRQ_UART[0..3]
>   * are consecutive when looking up the interrupt in the demux routines.
>   */
> -static struct uart_irq uart_irqs[] = {
> +static struct s3c_uart_irq uart_irqs[] = {
>  	[0] = {
>  		.regs		= (void *)S3C_VA_UART0,
>  		.base_irq	= IRQ_S3CUART_BASE0,
> @@ -55,113 +50,9 @@ static struct uart_irq uart_irqs[] = {
>  	},
>  };
> 
> -static inline void __iomem *s3c_irq_uart_base(unsigned int irq)
> -{
> -	struct uart_irq *uirq = get_irq_chip_data(irq);
> -	return uirq->regs;
> -}
> -
> -static inline unsigned int s3c_irq_uart_bit(unsigned int irq)
> -{
> -	return irq & 3;
> -}
> -
> -/* UART interrupt registers, not worth adding to seperate include header */
> -#define S3C64XX_UINTP	0x30
> -#define S3C64XX_UINTSP	0x34
> -#define S3C64XX_UINTM	0x38
> -
> -static void s3c_irq_uart_mask(unsigned int irq)
> -{
> -	void __iomem *regs = s3c_irq_uart_base(irq);
> -	unsigned int bit = s3c_irq_uart_bit(irq);
> -	u32 reg;
> -
> -	reg = __raw_readl(regs + S3C64XX_UINTM);
> -	reg |= (1 << bit);
> -	__raw_writel(reg, regs + S3C64XX_UINTM);
> -}
> -
> -static void s3c_irq_uart_maskack(unsigned int irq)
> -{
> -	void __iomem *regs = s3c_irq_uart_base(irq);
> -	unsigned int bit = s3c_irq_uart_bit(irq);
> -	u32 reg;
> -
> -	reg = __raw_readl(regs + S3C64XX_UINTM);
> -	reg |= (1 << bit);
> -	__raw_writel(reg, regs + S3C64XX_UINTM);
> -	__raw_writel(1 << bit, regs + S3C64XX_UINTP);
> -}
> -
> -static void s3c_irq_uart_unmask(unsigned int irq)
> -{
> -	void __iomem *regs = s3c_irq_uart_base(irq);
> -	unsigned int bit = s3c_irq_uart_bit(irq);
> -	u32 reg;
> -
> -	reg = __raw_readl(regs + S3C64XX_UINTM);
> -	reg &= ~(1 << bit);
> -	__raw_writel(reg, regs + S3C64XX_UINTM);
> -}
> -
> -static void s3c_irq_uart_ack(unsigned int irq)
> -{
> -	void __iomem *regs = s3c_irq_uart_base(irq);
> -	unsigned int bit = s3c_irq_uart_bit(irq);
> -
> -	__raw_writel(1 << bit, regs + S3C64XX_UINTP);
> -}
> -
> -static void s3c_irq_demux_uart(unsigned int irq, struct irq_desc *desc)
> -{
> -	struct uart_irq *uirq = &uart_irqs[irq - IRQ_UART0];
> -	u32 pend = __raw_readl(uirq->regs + S3C64XX_UINTP);
> -	int base = uirq->base_irq;
> -
> -	if (pend & (1 << 0))
> -		generic_handle_irq(base);
> -	if (pend & (1 << 1))
> -		generic_handle_irq(base + 1);
> -	if (pend & (1 << 2))
> -		generic_handle_irq(base + 2);
> -	if (pend & (1 << 3))
> -		generic_handle_irq(base + 3);
> -}
> -
> -static struct irq_chip s3c_irq_uart = {
> -	.name		= "s3c-uart",
> -	.mask		= s3c_irq_uart_mask,
> -	.unmask		= s3c_irq_uart_unmask,
> -	.mask_ack	= s3c_irq_uart_maskack,
> -	.ack		= s3c_irq_uart_ack,
> -};
> -
> -static void __init s5pc1xx_uart_irq(struct uart_irq *uirq)
> -{
> -	void __iomem *reg_base = uirq->regs;
> -	unsigned int irq;
> -	int offs;
> -
> -	/* mask all interrupts at the start. */
> -	__raw_writel(0xf, reg_base + S3C64XX_UINTM);
> -
> -	for (offs = 0; offs < 3; offs++) {
> -		irq = uirq->base_irq + offs;
> -
> -		set_irq_chip(irq, &s3c_irq_uart);
> -		set_irq_chip_data(irq, uirq);
> -		set_irq_handler(irq, handle_level_irq);
> -		set_irq_flags(irq, IRQF_VALID);
> -	}
> -
> -	set_irq_chained_handler(uirq->parent_irq, s3c_irq_demux_uart);
> -}
> -
>  void __init s5pc1xx_init_irq(u32 *vic_valid, int num)
>  {
>  	int i;
> -	int uart;
> 
>  	printk(KERN_DEBUG "%s: initialising interrupts\n", __func__);
> 
> @@ -178,8 +69,7 @@ void __init s5pc1xx_init_irq(u32 *vic_valid, int num)
>  	s3c_init_vic_timer_irq(IRQ_TIMER3_VIC, IRQ_TIMER3);
>  	s3c_init_vic_timer_irq(IRQ_TIMER4_VIC, IRQ_TIMER4);
> 
> -	for (uart = 0; uart < ARRAY_SIZE(uart_irqs); uart++)
> -		s5pc1xx_uart_irq(&uart_irqs[uart]);
> +	s3c_init_uart_irqs(uart_irqs, ARRAY_SIZE(uart_irqs));
>  }
> 
> 
> --
> 1.6.0.4


Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
