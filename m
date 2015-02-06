From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/3] Samsung 4th DT updates for v3.20
Date: Fri, 6 Feb 2015 01:05:57 -0800
Message-ID: <20150206090557.GK23582@quad.lixom.net>
References: <54D22D45.2090000@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:33873 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751839AbbBFJF7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Feb 2015 04:05:59 -0500
Received: by mail-pa0-f50.google.com with SMTP id rd3so15954805pab.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Feb 2015 01:05:58 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <54D22D45.2090000@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Wed, Feb 04, 2015 at 11:31:33PM +0900, Kukjin Kim wrote:
> Hi,
> 
> Here is 4th DT updates for v3.20.
> Please pull.
> 
> Note there are several dt updates in my tree which has a dependency with
> driver side for v3.20 and I hope it can be sent to upstream via arm-soc
> during late merge window. If it is OK to you guys, I'll send a pull
> request soon. (example tmu, asoc and devfreq)

Why do they have driver dependencies? Can't the dts contents be merged
separately, such that the drivers just work once they land?

Or are you redefining bindings in an incompatible manner?

> The following changes since commit ea08de16eb1ba2052ce2db4b58b62a2ec33357a3:
> 
>   ARM: dts: Add DISP1 power domain for exynos5420 (2015-01-29 08:52:23
> +0900)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-dt-4
> 
> for you to fetch changes up to 7808cae3e97140781eb3f712084caf4e44c126c9:
> 
>   ARM: dts: Add PPMU node for exynos4412-trats2 (2015-02-04 08:11:52 +0900)


Merged.


-Olof
