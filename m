From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2nd 4/5] Samsung DT updates for v3.14
Date: Mon, 23 Dec 2013 18:56:37 -0800
Message-ID: <20131224025637.GA26914@quad.lixom.net>
References: <52B5DCB4.5030104@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:39982 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932272Ab3LXC6o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Dec 2013 21:58:44 -0500
Received: by mail-pd0-f173.google.com with SMTP id p10so5781196pdj.18
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2013 18:58:44 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <52B5DCB4.5030104@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Sun, Dec 22, 2013 at 03:23:48AM +0900, Kukjin Kim wrote:
> Note that this tags/samsung-dt-2 is based on previous Samsung DT
> request + Samsung 2nd fixes because of dependencies.
> 
> -----
> 
> The following changes since commit e0b51c2eae8ebf10d80530b7a306818252206325:
> 
>   ARM: dts: Update Samsung sysreg binding document (2013-12-16
> 04:47:38 +0900)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-dt-2
> 
> for you to fetch changes up to a22d060e3299ce672258d00070fa0ed398c035c5:
> 
>   ARM: dts: Rename Exynos5250 ChromeOS common file to have exynos
> prefix (2013-12-21 10:09:25 +0900)

Hi,

I've merged this, but in the future it would be useful to only see the
incremental diffstat from the dependencies onto the tip of this branch.

I.e. the below list of patches and diffstat also contains the changes that are
part of the fixes-2 branch.

It's not a big deal, but it's slightly easier not to get the patches accounted
for twice.


-Olof
