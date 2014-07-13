From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung cleanup 2nd version for S5P SoCs for 3.17
Date: Sat, 12 Jul 2014 21:22:37 -0700
Message-ID: <20140713042237.GA14206@quad.lixom.net>
References: <53BB2658.4050808@samsung.com>
 <20140712165948.GA10012@quad.lixom.net>
 <20140712194416.GA6800@sirena.org.uk>
 <53C1B7F6.7050803@samsung.com>
 <53C1BA14.8060903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:40785 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750711AbaGMEWN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Jul 2014 00:22:13 -0400
Received: by mail-pa0-f44.google.com with SMTP id rd3so3592853pab.31
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Jul 2014 21:22:13 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <53C1BA14.8060903@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Sun, Jul 13, 2014 at 07:43:32AM +0900, Kukjin Kim wrote:
> (changed title)
> 
> Hi,
> 
> As per Mark's suggestion, I'm re-sending the cleanup S5P SoCs for
> v3.17 so please take this instead.
> 
> One more, I dropped serial related patches also because they also
> will be handled via Greg's tty tree for 3.17.
> 
> Thanks and if any problems, please let me know.
> 
> - Kukjin
> 
> ------------------
> The following changes since commit a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee:
> 
>   Linux 3.16-rc2 (2014-06-21 19:02:54 -1000)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/s5p-cleanup-v2
> 
> for you to fetch changes up to f86e0add813a3cc0e338089fa6c0928f5f6dc52d:
> 
>   video: fbdev: s3c-fb: remove s5pc100 related fimd and fb codes
> (2014-07-13 07:35:15 +0900)
> 
> ----------------------------------------------------------------
> Cleanup S5P SoCs for 3.17
> - removing s5p64x0 SoCs and s5pc100 SoC in mainline because
>   no more user and if it is required next time, it will be
>   supported with DT.

Pulled, thanks!


-Olof
