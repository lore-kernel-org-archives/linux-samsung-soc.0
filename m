From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RESEND][PATCH] pinctrl: exynos: remove duplicate calls in irq
 handler
Date: Tue, 16 Aug 2016 11:16:10 +0200
Message-ID: <41a0d7c4-c199-0c1a-a861-10ba25337594@samsung.com>
References: <156921d1559.dd4cb9f127644.6244938289269001596@zoho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <156921d1559.dd4cb9f127644.6244938289269001596@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: perr perr <strongbox8@zoho.com>, tomasz.figa@gmail.com
Cc: s.nawrocki@samsung.com, linus.walleij@linaro.org, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08/16/2016 08:49 AM, perr perr wrote:
> Because chained_irq_enter() has already called chip->irq_mask() and 
> chip->irq_ack(), also chained_irq_exit() will call chip->irq_unmask(), 
> so it's not necessary to call chip->irq_*() here. 
>  
> Signed-off-by: Perr Zhang<strongbox8@zoho.com> 
>  
> --- 
>  drivers/pinctrl/samsung/pinctrl-exynos.c | 6 +----- 
>  1 file changed, 1 insertion(+), 5 deletions(-) 

Hi,

Thanks for fixing Signed-off-by but now the commiter name does not match
Signed-off-by. In the same time you skipped the tags you got already
(Tomasz's ack and my reviewed-by).

BR,
Krzysztof

>  
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c 
> index 051b5bf..d32fa2b 100644 
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c 
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c 
> @@ -428,14 +428,10 @@ static void exynos_irq_eint0_15(struct irq_desc *desc) 
>      int eint_irq; 
>   
>      chained_irq_enter(chip, desc); 
> -    chip->irq_mask(&desc->irq_data); 
> - 
> -    if (chip->irq_ack) 
> -        chip->irq_ack(&desc->irq_data); 
>   
>      eint_irq = irq_linear_revmap(bank->irq_domain, eintd->irq); 
>      generic_handle_irq(eint_irq); 
> -    chip->irq_unmask(&desc->irq_data); 
> + 
>      chained_irq_exit(chip, desc); 
>  } 
>   
> --  
> 1.9.3 
>  
> 
> 
> 
