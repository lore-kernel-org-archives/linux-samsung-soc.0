From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: Help connect s3c2410-lcd device to SMDK2443
Date: Tue, 5 Feb 2013 23:17:43 +0100
Message-ID: <201302052317.44431.heiko@sntech.de>
References: <51115F34.8030503@mail.ru>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:58536 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757074Ab3BEWRs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 17:17:48 -0500
In-Reply-To: <51115F34.8030503@mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Varnin <fenixk19@mail.ru>
Cc: linux-samsung-soc@vger.kernel.org

Hi Alexander,

Am Dienstag, 5. Februar 2013, 20:36:20 schrieb Alexander Varnin:
> Hello. I'm trying to setup "s3c2410-lcd" device on SMDK2443 with 3.6
> kernel. On requesting interrupt it fails with EINVAL:
> ~ # dmesg | grep lcd
> s3c2410-lcd s3c2410-lcd: cannot get irq 32 - err -22
> s3c2410-lcd: probe of s3c2410-lcd failed with error -16

If I remember correctly the s3c2443 has a new-style framebuffer. So using the 
s3c2410-fb/lcd driver is the wrong approach. The correct driver to use would 
be the s3cfb.

Take a look at mach-smdk2416.c which uses this driver. The init for the 
s3c2443 should probably be similar.


Also the irq you requested is a parent irq to different lcd-irqs in the sub-
register on the s3c2443 and s3c2416. Therfore requesting it directly is 
disabled by the irq-subsystem.


Hope that helps
Heiko

> 
> The interrupt is not busy by something else. Here is my table:
> ~ # cat /proc/interrupts
> CPU0
>   17:          0  s3c-ext0 s3c-mci
>   30:     409934       s3c  S3C2410 Timer Tick
>   37:          0       s3c s3c-mci
>   42:        416       s3c ohci_hcd:usb1
>   43:          0       s3c s3c2410-i2c
>   56:          1   s3c-ext uio_mcross
>   57:      72585   s3c-ext eth0
>   73:         63  s3c-uart1 s3c2440-uart
>   74:        108  s3c-uart1 s3c2440-uart
>   97:          0         - s3c2410-wdt
> Err:
> 
> Please, help me to find the reason.
