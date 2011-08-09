From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH 06/13] ARM: gpio: davinci: convert drivers to use asm/gpio.h
 rather than mach/gpio.h
Date: Tue, 09 Aug 2011 16:06:14 +0400
Message-ID: <4E4122B6.2070706@ru.mvista.com>
References: <20110809080411.GA1831@n2100.arm.linux.org.uk> <E1QqhKP-0003aK-9R@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:34786 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753173Ab1HIMG6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Aug 2011 08:06:58 -0400
In-Reply-To: <E1QqhKP-0003aK-9R@rmk-PC.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-sh@vger.kernel.org, linux-tegra@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Nicolas Pitre <nico@fluxnic.net>, linux-usb@vger.kernel.org, Felipe Balbi <balbi@ti.com>

Hello.

On 09-08-2011 12:06, Russell King - ARM Linux wrote:

    CCing linux-usb and Felipe...

> Signed-off-by: Russell King<rmk+kernel@arm.linux.org.uk>
> ---
>   drivers/usb/musb/davinci.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)

> diff --git a/drivers/usb/musb/davinci.c b/drivers/usb/musb/davinci.c
> index 8bdf25a..f9a3f62 100644
> --- a/drivers/usb/musb/davinci.c
> +++ b/drivers/usb/musb/davinci.c
> @@ -35,7 +35,7 @@
>
>   #include<mach/hardware.h>
>   #include<mach/memory.h>
> -#include<mach/gpio.h>
> +#include<asm/gpio.h>

    Shouldn't this now be moved to the below #include group?

>   #include<mach/cputype.h>
>
>   #include<asm/mach-types.h>

WBR, Sergei
