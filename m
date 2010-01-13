From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] S3C: serial: Modify UART low-level debug port
	initialization procedure.
Date: Wed, 13 Jan 2010 01:11:31 +0000
Message-ID: <20100113011131.GD3738@trinity.fluff.org>
References: <1263341420-10771-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:57343 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751038Ab0AMBLh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jan 2010 20:11:37 -0500
Content-Disposition: inline
In-Reply-To: <1263341420-10771-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Wed, Jan 13, 2010 at 09:10:20AM +0900, Thomas Abraham wrote:
> The s3c24xx_serial_init_ports function is called only during low-level
> debug port initialization. This function intializes all the available
> uart ports when called, but it can be reduced to initializing just the
> port needed for debug message output.
> 
> This patch modifies the s3c24xx_serial_init_ports to initialize only the
> uart port that will be used for low-level debug output. The UART port
> that is used for low-level debug output is found from the config option
> S3C_LOWLEVEL_UART_PORT.

Not always, console=ttySAC<x> could also be used to find the console.

We could change the s3c24xx_serial_initconsole() call to take a
'struct s3c24xx_uart_info **info'and change init_ports to take the
same. This does unfortunately mean that each of the s3cxxx.c serial
drivers will need to be changed.

You could change s3c24xx_console_init() to fill an array of info before
calling s3c24xx_serial_initconsole() in drivers/serial/samsung.h and
then have the s5pc110 serial code do its own console initialisation
without using the s3c24xx_console_init() macro.

If you don't want to change s3c24xx_console_init() to create an array,
then you could always change s3c24xx_serial_initconsole() to take
a third argument, so it would be:

s3c24xx_serial_initconsole(struct platform_driver *drv,
		           struct s3c24xx_uart_info *info,
			   struct s3c24xx_uart_info *infos)

and then change the behaviour of s3c24xx_serial_init_ports() if infos is
NULL, use the info field, otherwise take the info from infos+hwport.
 
There may of course be other options.

> Since the functionlity of the s3c24xx_serial_init_ports function has
> changed, it has been renamed as s3c24xx_serial_init_console_port by
> this patch.
> 
> This patch is required on platforms that use different platform
> configuration for available instances of UART module. For instance,
> FIFO sizes could be different for each instance of UART. Such platforms
> pass mutiple instances of platform configuration to the serial driver
> instead of just one. The serial console init can then be specified as
> below in the platform specific code.
> 
> s3c24xx_console_init(&s5p_serial_drv, \
> 	&s5p_uart_inf[CONFIG_S3C_LOWLEVEL_UART_PORT]);
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  drivers/serial/samsung.c |   22 ++++++++++------------
>  1 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/serial/samsung.c b/drivers/serial/samsung.c
> index 52e3df1..dc9c51e 100644
> --- a/drivers/serial/samsung.c
> +++ b/drivers/serial/samsung.c
> @@ -1368,26 +1368,24 @@ s3c24xx_serial_get_options(struct uart_port *port, int *baud,
>  
>  }
>  
> -/* s3c24xx_serial_init_ports
> +/* s3c24xx_serial_init_console_port
>   *
> - * initialise the serial ports from the machine provided initialisation
> - * data.
> + * initialise the serial port, which used as console, from the machine 
> + * provided initialisation data.
>  */
>  
> -static int s3c24xx_serial_init_ports(struct s3c24xx_uart_info *info)
> +static int s3c24xx_serial_init_console_port(struct s3c24xx_uart_info *info)
>  {
>  	struct s3c24xx_uart_port *ptr = s3c24xx_serial_ports;
>  	struct platform_device **platdev_ptr;
> -	int i;
>  
> -	dbg("s3c24xx_serial_init_ports: initialising ports...\n");
> +	dbg("s3c24xx_serial_init_console_port: initialising ports...\n");
>  
>  	platdev_ptr = s3c24xx_uart_devs;
> -
> -	for (i = 0; i < CONFIG_SERIAL_SAMSUNG_UARTS; i++, ptr++, platdev_ptr++) {
> -		s3c24xx_serial_init_port(ptr, info, *platdev_ptr);
> -	}
> -
> +	ptr += CONFIG_S3C_LOWLEVEL_UART_PORT;
> +	platdev_ptr += CONFIG_S3C_LOWLEVEL_UART_PORT;
> +	
> +	s3c24xx_serial_init_port(ptr, info, *platdev_ptr);
>  	return 0;
>  }
>  
> @@ -1469,7 +1467,7 @@ int s3c24xx_serial_initconsole(struct platform_driver *drv,
>  		return 0;
>  
>  	s3c24xx_serial_console.data = &s3c24xx_uart_drv;
> -	s3c24xx_serial_init_ports(info);
> +	s3c24xx_serial_init_console_port(info);
>  
>  	register_console(&s3c24xx_serial_console);
>  	return 0;
> -- 
> 1.6.3.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
