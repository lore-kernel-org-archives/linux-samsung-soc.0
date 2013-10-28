From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 4/6] Samsung s3c64xx-dt for v3.13
Date: Sun, 27 Oct 2013 21:38:38 -0700
Message-ID: <20131028043838.GJ22890@quad.lixom.net>
References: <526455F0.201@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:52577 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751269Ab3J1EjA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Oct 2013 00:39:00 -0400
Received: by mail-pd0-f176.google.com with SMTP id g10so6422040pdj.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Oct 2013 21:38:59 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <526455F0.201@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, arm@kernel.org

On Mon, Oct 21, 2013 at 07:15:12AM +0900, Kukjin Kim wrote:
> The following changes since commit 272b98c6455f00884f0350f775c5342358ebb73f:
> 
>   Linux 3.12-rc1 (2013-09-16 16:17:51 -0400)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/s3c64xx-dt
> 
> for you to fetch changes up to 2ec35a4252eae3d5277af041bd1b5ae4f6183cad:
> 
>   ARM: dts: Add dts file for S3C6410-based SMDK6410 board
> (2013-09-17 06:48:29 +0900)
> 
> ----------------------------------------------------------------
> Device tree for S3C64XX
> - based on common-clk-s3c64xx branch
> - add s3c64xx dt board file for using dt
> - add dts file for s3c6410-smdk6410 board
> - add dts file for s3c6410-mini6410 board

Same here, we already have it.

If you try to merge the different pull requests into our for-next branch before
you send them out you would see this. It would also give you an indication
whether we would see merge conflicts at our end so you can give us a heads up
about it.


-Olof
