From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S3C24XX: Add clkdev entry for camif-upll clock
Date: Thu, 22 Nov 2012 15:51:23 +0900
Message-ID: <0f5c01cdc87d$c91b2900$5b517b00$%kim@samsung.com>
References: <1352325657-28885-1-git-send-email-sylvester.nawrocki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1352325657-28885-1-git-send-email-sylvester.nawrocki@gmail.com>
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
To: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Sylwester Nawrocki wrote:
> 
> The s3c-camif driver uses "camera" clock conn_id for the "camif-upll"
> (s3c244x) and "camera" (s3c64xx) platform clock. By adding this new
> clkdev entry the platform differences are isolated from the driver.
> 
> Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> ---
>  arch/arm/mach-s3c24xx/clock-s3c2440.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/clock-s3c2440.c b/arch/arm/mach-
> s3c24xx/clock-s3c2440.c
> index 4407b17..04b87ec 100644
> --- a/arch/arm/mach-s3c24xx/clock-s3c2440.c
> +++ b/arch/arm/mach-s3c24xx/clock-s3c2440.c
> @@ -161,6 +161,7 @@ static struct clk_lookup s3c2440_clk_lookup[] = {
>  	CLKDEV_INIT(NULL, "clk_uart_baud1", &s3c24xx_uclk),
>  	CLKDEV_INIT(NULL, "clk_uart_baud2", &clk_p),
>  	CLKDEV_INIT(NULL, "clk_uart_baud3", &s3c2440_clk_fclk_n),
> +	CLKDEV_INIT("s3c2440-camif", "camera", &s3c2440_clk_cam_upll),
>  };
> 
>  static int __init_refok s3c2440_clk_add(struct device *dev, struct
> subsys_interface *sif)
> --
> 1.7.4.1

Applied, thanks.

K-Gene <kgene@kernel.org>
