From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 4/5] Samsung 2nd DT updates for v4.3
Date: Thu, 13 Aug 2015 11:18:14 +0200
Message-ID: <20150813091814.GA30160@localhost>
References: <55C069D5.1050409@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:34373 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751844AbbHMJbN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Aug 2015 05:31:13 -0400
Received: by lbbtg9 with SMTP id tg9so23924677lbb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Aug 2015 02:31:12 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55C069D5.1050409@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

On Tue, Aug 04, 2015 at 04:29:25PM +0900, Kukjin Kim wrote:
> Hi Arnd, Olof, Kevin
> 
> This 2nd DT update branch is based tags/samsung-dt-1 +
> v4.3-topic/clk-samsung branch because of dependency to support generic
> cpufreq driver. Please pull.
> 
> Thanks,
> Kukjin
> 
> 
> The following changes since commit e4a39d904c3c3e4855287b7325306289ff044b06:
> 
>   Merge branch 'v4.3-topic/clk-samsung' into v4.3-next/dt-samsung-2
> (2015-07-24 12:54:00 +0900)
> 
> are available in the git repository at:
> 
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-dt-2

"clk: exynos5250: add cpu clock configuration data and instantiate cpu
clock" is applied twice, once to your own branch, and once merged in
from Mike's branch. That doesn't look right.

Can you please respin? Thanks.


Thanks,

-Olof
