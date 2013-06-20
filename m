From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 05/10] Samsung common clk audio for v3.11
Date: Thu, 20 Jun 2013 22:28:56 +0200
Message-ID: <201306202228.56642.arnd@arndb.de>
References: <51C0BC59.10907@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:58844 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030387Ab3FTU33 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 16:29:29 -0400
In-Reply-To: <51C0BC59.10907@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, 'Padmavathi Venna' <padma.v@samsung.com>

On Tuesday 18 June 2013, Kukjin Kim wrote:
> The following changes since commit 166bc934f54cef4588fc141e709e376244e70106:
> 
>    Merge branch 'v3.11-next/s3c24xx-dt-2' into v3.11-next/dt-n-clk-audio 
> (2013-06-19 03:27:44 +0900)
> 
> are available in the git repository at:
> 
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
> tags/common-clk-audio
> 
> for you to fetch changes up to 79d743c177f99d6854e152d9e7fac5bbbeb7c25e:
> 
>    clk: exynos5250: Add enum entries for divider clock of i2s1 and i2s2 
> (2013-06-19 03:28:43 +0900)
> 
> ----------------------------------------------------------------
> based on exynos-dt-2 and s3c24xx-dt-2
> - use #include for all Samsung DT
> - add clk for exynos audio subsystem (audss) and i2s
> - support audss and i2s for exynos5250
> 

Pulled into next/drivers, thanks!

	Arnd
