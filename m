From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 6/6] s3c24xx driver
Date: Wed, 12 Jun 2013 16:51:58 -0700
Message-ID: <20130612235158.GC9067@quad.lixom.net>
References: <51B791F6.4000004@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:63426 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756907Ab3FLXvy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 19:51:54 -0400
Received: by mail-pa0-f52.google.com with SMTP id kq13so4381216pab.39
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 16:51:53 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <51B791F6.4000004@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Wed, Jun 12, 2013 at 06:09:10AM +0900, Kukjin Kim wrote:
> The following changes since commit 317ddd256b9c24b0d78fa8018f80f1e495481a10:
> 
>   Linux 3.10-rc5 (2013-06-08 17:41:04 -0700)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/s3c24xx-driver-1
> 
> for you to fetch changes up to ae7b6dccf6711e8d5815688f1572ab55bf5b3069:
> 
>   Merge branch 'v3.11-next/driver-cpufreq' into
> v3.11-next/s3c24xx-driver (2013-06-12 05:24:22 +0900)
> 
> ----------------------------------------------------------------
> 
> update driver for s3c24xx
> - move cpufreq driver into drivers/
> - add pinctrl-s3c24xx driver
> - cleanup OF in gpio driver
> 
> ----------------------------------------------------------------
> Heiko Stuebner (1):
>       pinctrl: Add pinctrl-s3c24xx driver
> 
> Kukjin Kim (3):
>       Merge branch 'v3.11-next/driver-gpio' into v3.11-next/s3c24xx-driver
>       Merge branch 'v3.11-next/driver-pinctrl' into
> v3.11-next/s3c24xx-driver
>       Merge branch 'v3.11-next/driver-cpufreq' into
> v3.11-next/s3c24xx-driver

Hi,

No need to do a merge commit per patch, just do them on a single branch in the
future, please.

Pulled.


-Olof
