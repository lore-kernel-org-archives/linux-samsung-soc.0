From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [GIT PULL 4/7] Samsung dev for v3.14
Date: Wed, 18 Dec 2013 11:20:44 +0100
Message-ID: <201312181120.44544.heiko@sntech.de>
References: <52AE0F62.80409@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:47258 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752642Ab3LRKVE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 05:21:04 -0500
In-Reply-To: <52AE0F62.80409@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Kukjin,

Am Sonntag, 15. Dezember 2013, 21:21:54 schrieb Kukjin Kim:
> The following changes since commit
> 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:
> 
>    Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)
> 
> are available in the git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-dev
> 
> for you to fetch changes up to 70bacadbd07248576290de40cc217c06f0f2d3c3:
> 
>    ARM: S3C64XX: Select CPU_V6K instead of CPU_V6 (2013-12-16 04:08:51
> +0900)
> 
> ----------------------------------------------------------------
> Samsung updates for v3.14
> - Skip eint_init() for pinctrl-exynos because of re-executing
> - Use CPU_V6K for S3C64XX(ARM1176JZF-s) instead of CPU_V6
> 
> ----------------------------------------------------------------
> Mateusz Krawczuk (1):
>        ARM: SAMSUNG: if detected device tree skip irq init for S5P
> 
> Tomasz Figa (1):
>        ARM: S3C64XX: Select CPU_V6K instead of CPU_V6
> 
>   arch/arm/Kconfig                     | 2 +-
>   arch/arm/plat-samsung/s5p-irq-eint.c | 4 ++++
>   2 files changed, 5 insertions(+), 1 deletion(-)

do you also have time for a look at at least the s3c2416/s3c2443 common clock 
patches for your second round you wrote about yesterday? :-)


Thanks
Heiko
