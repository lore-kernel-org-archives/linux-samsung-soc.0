From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] S3C: serial: Modify console initialization.
Date: Thu, 14 Jan 2010 06:41:35 +0000
Message-ID: <20100114064135.GQ3738@trinity.fluff.org>
References: <1263449138-8199-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:57168 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755374Ab0ANGli (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jan 2010 01:41:38 -0500
Content-Disposition: inline
In-Reply-To: <1263449138-8199-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Thu, Jan 14, 2010 at 03:05:38PM +0900, Thomas Abraham wrote:
> This patch modifies s3c24xx_serial_initconsole function to accept multiple
> platform UART information structures. This is required on platforms that have
> differences among the instances of UART ports. As an example, the FIFO sizes
> could be different for each UART instance and hence multiple platform UART
> information structures would be needed.

I seem to have two copies of this?;
 
> This patch also modifies the s3c24xx_console_init macro since it wraps the
> call to the s3c24xx_serial_initconsole function.
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  drivers/serial/samsung.c |    6 +++---
>  drivers/serial/samsung.h |   19 ++++++++++++-------
>  2 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/serial/samsung.c b/drivers/serial/samsung.c
> index 52e3df1..6982243 100644
> --- a/drivers/serial/samsung.c
> +++ b/drivers/serial/samsung.c
> @@ -1374,7 +1374,7 @@ s3c24xx_serial_get_options(struct uart_port *port, int *baud,
>   * data.
>  */
> 
> -static int s3c24xx_serial_init_ports(struct s3c24xx_uart_info *info)
> +static int s3c24xx_serial_init_ports(struct s3c24xx_uart_info **info)
>  {
>  	struct s3c24xx_uart_port *ptr = s3c24xx_serial_ports;
>  	struct platform_device **platdev_ptr;
> @@ -1385,7 +1385,7 @@ static int s3c24xx_serial_init_ports(struct s3c24xx_uart_info *info)
>  	platdev_ptr = s3c24xx_uart_devs;
> 
>  	for (i = 0; i < CONFIG_SERIAL_SAMSUNG_UARTS; i++, ptr++, platdev_ptr++) {
> -		s3c24xx_serial_init_port(ptr, info, *platdev_ptr);
> +		s3c24xx_serial_init_port(ptr, info[i], *platdev_ptr);
>  	}
> 
>  	return 0;
> @@ -1451,7 +1451,7 @@ static struct console s3c24xx_serial_console = {
>  };
> 
>  int s3c24xx_serial_initconsole(struct platform_driver *drv,
> -			       struct s3c24xx_uart_info *info)
> +			       struct s3c24xx_uart_info **info)
> 
>  {
>  	struct platform_device *dev = s3c24xx_uart_devs[0];
> diff --git a/drivers/serial/samsung.h b/drivers/serial/samsung.h
> index 1fb2234..0ac06a0 100644
> --- a/drivers/serial/samsung.h
> +++ b/drivers/serial/samsung.h
> @@ -75,19 +75,24 @@ extern int s3c24xx_serial_probe(struct platform_device *dev,
>  extern int __devexit s3c24xx_serial_remove(struct platform_device *dev);
> 
>  extern int s3c24xx_serial_initconsole(struct platform_driver *drv,
> -				      struct s3c24xx_uart_info *uart);
> +				      struct s3c24xx_uart_info **uart);
> 
>  extern int s3c24xx_serial_init(struct platform_driver *drv,
>  			       struct s3c24xx_uart_info *info);
> 
>  #ifdef CONFIG_SERIAL_SAMSUNG_CONSOLE
> 
> -#define s3c24xx_console_init(__drv, __inf)			\
> -static int __init s3c_serial_console_init(void)			\
> -{								\
> -	return s3c24xx_serial_initconsole(__drv, __inf);	\
> -}								\
> -								\
> +#define s3c24xx_console_init(__drv, __inf)				\
> +static int __init s3c_serial_console_init(void)				\
> +{									\
> +	struct s3c24xx_uart_info *uinfo[CONFIG_SERIAL_SAMSUNG_UARTS];	\
> +	int i;								\
> +									\
> +	for (i = 0; i < CONFIG_SERIAL_SAMSUNG_UARTS; i++)		\
> +		uinfo[i] = __inf;					\
> +	return s3c24xx_serial_initconsole(__drv, uinfo);		\
> +}									\
> +									\
>  console_initcall(s3c_serial_console_init)
> 
>  #else
> --
> 1.6.3.3
> 

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
