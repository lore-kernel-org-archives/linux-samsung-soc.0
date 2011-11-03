From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Add clk enable/disable of pwm
Date: Thu, 03 Nov 2011 10:59:14 +0900
Message-ID: <012701cc99cc$300dca50$90295ef0$%kim@samsung.com>
References: <1319505701-9784-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1319505701-9784-1-git-send-email-jy0922.shim@samsung.com>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Joonyoung Shim' <jy0922.shim@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org
List-Id: linux-samsung-soc@vger.kernel.org

Joonyoung Shim wrote:
> 
> PWM timers use pclk("timers" clk) as parent clk. If this pclk is the
> disabled state when PWM driver is probed, then it causes wrong read and
> write operation about registers of PWM.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/plat-samsung/pwm.c |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/pwm.c b/arch/arm/plat-samsung/pwm.c
> index f37457c..dc1185d 100644
> --- a/arch/arm/plat-samsung/pwm.c
> +++ b/arch/arm/plat-samsung/pwm.c
> @@ -299,6 +299,9 @@ static int s3c_pwm_probe(struct platform_device *pdev)
>  		goto err_clk_tin;
>  	}
> 
> +	clk_enable(pwm->clk);
> +	clk_enable(pwm->clk_div);
> +
>  	local_irq_save(flags);
> 
>  	tcon = __raw_readl(S3C2410_TCON);
> @@ -326,6 +329,8 @@ static int s3c_pwm_probe(struct platform_device *pdev)
>  	return 0;
> 
>   err_clk_tdiv:
> +	clk_disable(pwm->clk_div);
> +	clk_disable(pwm->clk);
>  	clk_put(pwm->clk_div);
> 
>   err_clk_tin:
> @@ -340,6 +345,8 @@ static int __devexit s3c_pwm_remove(struct
> platform_device *pdev)
>  {
>  	struct pwm_device *pwm = platform_get_drvdata(pdev);
> 
> +	clk_disable(pwm->clk_div);
> +	clk_disable(pwm->clk);
>  	clk_put(pwm->clk_div);
>  	clk_put(pwm->clk);
>  	kfree(pwm);
> --
> 1.7.5.4

Well, I wonder when this is needed. I think it should be enabled during
kernel booting...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
