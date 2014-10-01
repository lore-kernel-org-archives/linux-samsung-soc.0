From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 2/3] 3rd Round of Samsung-DT-3 updates for v3.18
Date: Wed, 1 Oct 2014 17:56:11 +0200
Message-ID: <201410011756.11635.arnd@arndb.de>
References: <54244910.3050609@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:61120 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751399AbaJAP4q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Oct 2014 11:56:46 -0400
In-Reply-To: <54244910.3050609@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Thursday 25 September 2014, Kukjin Kim wrote:
> Samsung 3rd DT updates for v3.18
> 
> - Fix rebase conflcits in previous tags/samsung-dt-2
>    : Fix chip select GPIO for exynos5250-smdk5250
>    : Remove display timings node for exynos5250-snow
> 
> - Fix Exynos USB on kernels with USB Gadget support
>    : Explicitly set dr_mode for the dwc3 controller
>    for exynos5420-arndale-octa, exynos5420-peach-pit
>    and exynos5800-peach-pi boards
> 
> - add CPU nodes for exynos4210, exynos4212, exynos4412
> 

Pulled into next/late, thanks

	Arnd
