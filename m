From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: EXYNOS will support only DT from v3.10
Date: Mon, 25 Mar 2013 11:36:36 +0000
Message-ID: <201303251136.36542.arnd@arndb.de>
References: <17a501ce2948$17037610$450a6230$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:61509 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756275Ab3CYLgk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Mar 2013 07:36:40 -0400
In-Reply-To: <17a501ce2948$17037610$450a6230$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, olof@lixom.net, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Thomas P Abraham' <thomas.ab@samsung.com>, heiko@sntech.de, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>

On Monday 25 March 2013, Kukjin Kim wrote:
> 
> Hi all,
> 
> As we discussed before, it's time to decide to support non-DT for EXYNOS
> SoCs.
> 
> If everybody else agrees to drop non-DT support from v3.10, I will. Feel
> free to talk your opinion about that.

+1

That will certainly simplify enabling multiplatform support as well.
I still have my series that I did recently for multiplatform support,
but I guess we need to coordinate better. Do you have a branch that
I can rebase on? There are still a couple of open questions in my
patches that I'd like to resolve as soon as possible.

	Arnd
