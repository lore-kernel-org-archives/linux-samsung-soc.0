From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung related to updating multi_v7_defconfig
Date: Fri, 22 May 2015 17:15:36 +0200
Message-ID: <2227456.dXyEpqfCYe@wuerfel>
References: <555D4BF5.20008@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:55274 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756672AbbEVPQR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 May 2015 11:16:17 -0400
In-Reply-To: <555D4BF5.20008@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On Thursday 21 May 2015 12:07:33 Kukjin Kim wrote:
> 
> Here is multi_v7_defconfig update and mostly including regarding exynos
> stuff based on savedefconfig which could remove useless configs based on
> checking of dependencies.
> 
> This series is based on v4.1-rc1 and I can provide resolution of
> conflicts with arm-soc/next/defconfig. See below.
> 
> Note that, IMHO we need to check 'savedefconfig when defconfig is
> updated so that we could remove useless lines and avoid to miss some
> defconfigs because of dependency.
> 
> Anyway please pull and if any concerns, please kindly let me know.
> 
> 

The conflict got a little too wild for my taste, so I dropped your
'savedefconfig' commit and rebased the other ones on top of the
branch I already had.

Please check that the result is still ok for you.

	Arnd
