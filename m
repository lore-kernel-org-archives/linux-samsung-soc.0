From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH] serial: samsung.c: Add FRACVAL support for newer UART
Date: Wed, 21 Jul 2010 13:11:52 +0400
Message-ID: <4C46B9D8.7020504@ru.mvista.com>
References: <1277474119-6897-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1277474119-6897-1-git-send-email-kgene.kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Changhwan Youn <chaos.youn@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello.

Kukjin Kim wrote:

> From: Changhwan Youn <chaos.youn@samsung.com>

> FRACVAL register provides the same function as UDIVSLOT register which is
> the 1/16ths adjustment to the baud rate but the implementaiton is easier.
> To support UDIVSLOT register, UDIVSLOT table search is necessary though
> supporting FRACVAL only needs the index value of UDIVSLOT table.

> This patch implements the FRACVAL supports for the newer Samsung SoC UARTs.

> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
[...]
> diff --git a/drivers/serial/samsung.c b/drivers/serial/samsung.c
> index a9d6c56..09805c7 100644
> --- a/drivers/serial/samsung.c
> +++ b/drivers/serial/samsung.c
> @@ -530,7 +530,7 @@ static int s3c24xx_serial_calcbaud(struct baud_calc *calc,
>  
>  	calc->clksrc = clksrc;
>  
> -	if (ourport->info->has_divslot) {
> +	if ((ourport->info->has_divslot) || (ourport->info->has_fracval)) {

    Parens around variables are not needed.


> @@ -755,7 +758,7 @@ static void s3c24xx_serial_set_termios(struct uart_port *port,
>  	wr_regl(port, S3C2410_UBRDIV, quot);
>  	wr_regl(port, S3C2410_UMCON, umcon);
>  
> -	if (ourport->info->has_divslot)
> +	if ((ourport->info->has_divslot) || (ourport->info->has_fracval))

    Here as well...

WBR, Sergei
