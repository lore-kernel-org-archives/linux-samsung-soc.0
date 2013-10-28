From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 5/6] Samsung s3c24xx-dma for v3.13
Date: Sun, 27 Oct 2013 21:45:58 -0700
Message-ID: <20131028044558.GK22890@quad.lixom.net>
References: <526455FD.3070702@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:34727 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751215Ab3J1EqU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Oct 2013 00:46:20 -0400
Received: by mail-pb0-f42.google.com with SMTP id jt11so5953103pbb.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Oct 2013 21:46:20 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <526455FD.3070702@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, arm@kernel.org

On Mon, Oct 21, 2013 at 07:15:25AM +0900, Kukjin Kim wrote:
> The following changes since commit 15c03dd4859ab16f9212238f29dd315654aa94f6:
> 
>   Linux 3.12-rc3 (2013-09-29 15:02:38 -0700)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/s3c24xx-dma
> 
> for you to fetch changes up to 1fecf8958eb7f90791f2c7e99afac393b64fa976:
> 
>   ARM: S3C24XX: add dma pdata for s3c2410, s3c2440 and s3c2442
> (2013-10-21 05:32:48 +0900)
> 
> ----------------------------------------------------------------
> add dmaengine based s3c24xx dma driver

Thanks, pulled into next/drivers.

But please write better tag descriptions. What I ended up writing up for this
was:


    From Kukjin Kim, this branch adds device-tree support to the DMA controller
    on the older Samsung SoCs. It also adds support for one of the missing SoCs
    in the family (2410).
    
    The driver has been Ack:ed by Vinod Koul, but is merged through here due
    to dependencies with platform code.



-Olof
