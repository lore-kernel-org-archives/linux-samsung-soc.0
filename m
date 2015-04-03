From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 1/5] Samsung non-critical-fixes for v4.1
Date: Fri, 3 Apr 2015 14:57:15 -0700
Message-ID: <20150403215715.GT23023@localhost>
References: <551C35DA.6070003@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:35534 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752112AbbDCV5R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Apr 2015 17:57:17 -0400
Received: by pddn5 with SMTP id n5so133494633pdd.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Apr 2015 14:57:17 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <551C35DA.6070003@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Thu, Apr 02, 2015 at 03:15:54AM +0900, Kukjin Kim wrote:
> The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:
> 
>   Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-fixes-v4.1
> 
> for you to fetch changes up to a11176e65b8727158bc355ca0cb00bf70cd69e48:
> 
>   ARM: S3C24XX: avoid a Kconfig warning (2015-02-27 05:50:25 +0900)
> 
> ----------------------------------------------------------------
> Samsung non-critical fixes for v4.1
> 
> - mostly trivial build fixes with random configurations
>   from Arnd Bergmann
> 
>   for s3c24xx:
>   avoid a Kconfig warning and fix header file inclusions,
>   and fix building without PM_SLEEP and use SAMSUNG_WAKEMASK
> 
>   for s3c64xx:
>   fix __initdata section mismatch and add I2C dependencies,
>   and fix building with PM_SLEEP

Merged, thanks.


-Olof
