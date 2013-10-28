From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 3/6] Samsung s3c64xx-common-clk for v3.13
Date: Sun, 27 Oct 2013 21:37:23 -0700
Message-ID: <20131028043723.GI22890@quad.lixom.net>
References: <526455E3.9030204@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:58257 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750998Ab3J1Eho (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Oct 2013 00:37:44 -0400
Received: by mail-pa0-f49.google.com with SMTP id lj1so6542517pab.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Oct 2013 21:37:44 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <526455E3.9030204@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, arm@kernel.org

On Mon, Oct 21, 2013 at 07:14:59AM +0900, Kukjin Kim wrote:
> The following changes since commit 272b98c6455f00884f0350f775c5342358ebb73f:
> 
>   Linux 3.12-rc1 (2013-09-16 16:17:51 -0400)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/s3c64xx-common-clk
> 
> for you to fetch changes up to 66fcbe6b7c2827866100837611c9838298a28486:
> 
>   ARM: S3C64XX: Remove old clock management code (2013-09-17
> 06:47:36 +0900)
> 
> ----------------------------------------------------------------
> use common clock for s3c64xx
> - remove old clock management code
> - migrate clock handling to common clock framework
> 
> ----------------------------------------------------------------
> Tomasz Figa (5):
>       ARM: SAMSUNG: Add soc_is_s3c6400/s3c6410 macros
>       ARM: S3C64XX: Use clk_prepare_enable/clk_disable_unprepare in dma.c
>       usb: ohci-s3c2410.c: Use clk_prepare_enable/clk_disable_unprepare
>       ARM: S3C64XX: Migrate clock handling to Common Clock Framework
>       ARM: S3C64XX: Remove old clock management code

We already have this branch in our tree, so there's no need to pull it. Please
check your workflow to avoid sending redundant pull requests in the future.


-Olof
