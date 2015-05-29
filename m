From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung 3rd fixes for v4.1
Date: Fri, 29 May 2015 14:30:13 +0200
Message-ID: <3055761.ZS9QcNqWCl@wuerfel>
References: <555FEF3A.303@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:61000 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752097AbbE2Ma3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 May 2015 08:30:29 -0400
In-Reply-To: <555FEF3A.303@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, arm@kernel.org, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Saturday 23 May 2015 12:08:42 Kukjin Kim wrote:
> Samsung fix for v4.1
> 
> - Set display clock correctly for exynos4412-trats2
>   : fix the following error
> 
>     exynos-drm: No connectors reported connected with modes
>     [drm] Cannot find any crtc or sizes - going 1024x768
> 

Pulled into fixes, thanks!

	Arnd
