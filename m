From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 07/10] Samsung S3C24XX PINCTRL-2 for v3.11
Date: Thu, 20 Jun 2013 22:28:42 +0200
Message-ID: <201306202228.42435.arnd@arndb.de>
References: <51C0BC6B.2080507@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:58734 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030362Ab3FTU3T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 16:29:19 -0400
In-Reply-To: <51C0BC6B.2080507@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

On Tuesday 18 June 2013, Kukjin Kim wrote:
> The following changes since commit af99a7507469d4fa6dd4d8d633e093b1ff7aff6e:
> 
>    pinctrl: Add pinctrl-s3c24xx driver (2013-05-21 00:56:13 +0900)
> 
> are available in the git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
> tags/s3c24xx-pinctrl-2
> 
> for you to fetch changes up to c2c70a7905dbf97472e9a5fa6919675462373994:
> 
>    pinctrl: s3c24xx: use correct header for chained_irq functions 
> (2013-06-19 02:41:20 +0900)
> 
> ----------------------------------------------------------------
> based on s3c24xx-pinctrl
> - use correct header for chained_irq functions for s3c24xx-pinctrl
> 
> ----------------------------------------------------------------
> Heiko Stuebner (1):
>        pinctrl: s3c24xx: use correct header for chained_irq functions
> 
>   drivers/pinctrl/pinctrl-s3c24xx.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 

Pulled into next/drivers, thanks!

	Arnd
