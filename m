From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 3/5] Late Samsung SoC updates for v4.4
Date: Mon, 26 Oct 2015 10:19:04 +0900
Message-ID: <20151026011904.GK14238@localhost>
References: <562AA40E.4050407@kernel.org>
 <562AA554.3040604@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:33292 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752348AbbJZBYy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 Oct 2015 21:24:54 -0400
Received: by padfb7 with SMTP id fb7so19675995pad.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Oct 2015 18:24:54 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <562AA554.3040604@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

On Sat, Oct 24, 2015 at 06:23:32AM +0900, Kukjin Kim wrote:
> The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:
> 
>   Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-soc
> 
> for you to fetch changes up to 97d5c7a77e39ab96a2a6137de0e35dd6e3f38325:
> 
>   Documentation: EXYNOS: Update bootloader interface on exynos542x
> (2015-10-24 04:43:31 +0900)
> 
> ----------------------------------------------------------------
> Samsung SoC updates for v4.4
> 
> - use PWM lookup table with pwm_add_table() for the following boards
>   : s3c24xx h1940 and rx1950
>   : s3c64xx smdk6410, crag6410, hmt and smartq
> - document: update bootloader interface on exynos542x

Merged, thanks.


-Olof
