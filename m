From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung 1st fixes for v4.2
Date: Tue, 21 Jul 2015 14:05:42 -0700
Message-ID: <20150721210542.GA13353@localhost>
References: <55ADBF14.30304@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:34116 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754802AbbGUVKj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jul 2015 17:10:39 -0400
Received: by pacan13 with SMTP id an13so127466303pac.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jul 2015 14:10:39 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55ADBF14.30304@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hi Kukjin,

On Tue, Jul 21, 2015 at 12:40:04PM +0900, Kukjin Kim wrote:
> Hi,
> 
> Please pull samsung fixes for v4.2.
> 
> Thanks,
> Kukjin
> 
> The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:
> 
>   Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-fixes-1
> 
> for you to fetch changes up to 300bde79f3d86b1af6fcde7b7b2439ecffccbff4:
> 
>   ARM: dts: add CPU OPP and regulator supply property for exynos4210
> (2015-07-21 12:32:29 +0900)

Was there a reason you rebased Krzystztof's branch? The contents is identical.

In cases like those, feel free to just forward the pull request to us
and we can do it directly. If you have more patches you want to add into
the same fixes branch then you can just merge his in and apply yours on
top. That's for example how Tony Lindgren tends to handle OMAP -- he'll
forward a pull request from Paul Walmsley if that's the only contents
he has.

Anyway, merged.


-Olof
