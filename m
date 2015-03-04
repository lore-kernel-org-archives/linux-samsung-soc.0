From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 2/2] Samsung fixes-2 for v4.0
Date: Wed, 04 Mar 2015 21:04:40 +0100
Message-ID: <2064108.qlOP0oDx90@wuerfel>
References: <54F4B33E.3070803@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:57349 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932333AbbCDUEz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Mar 2015 15:04:55 -0500
In-Reply-To: <54F4B33E.3070803@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Kevin Hilman <khilman@linaro.org>, 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Lukasz Majewski <l.majewski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On Tuesday 03 March 2015 04:00:14 Kukjin Kim wrote:
> Please pull Samsung tmu and hdmi regression fixes for v4.0 and I know
> this is quite big for fixes but I couldn't handle this series for
> previous merge window because of dependency with driver side...sorry for
> that and please pull so that we could support them in v4.0 on exynos
> platforms.

What kind of dependency do you have there? It really should not be
necessary to wait for driver changes, unless you do an incompatible
DT binding change, which you should avoid.

I've pulled it into fixes, but won't forward it until I hear a
good explanation.

	Arnd
