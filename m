From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 3/3] Samsung CPUIdle updates for v3.20
Date: Fri, 6 Feb 2015 01:07:53 -0800
Message-ID: <20150206090753.GL23582@quad.lixom.net>
References: <54D22D4E.3080703@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:38830 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753338AbbBFJHz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Feb 2015 04:07:55 -0500
Received: by mail-pa0-f52.google.com with SMTP id kq14so8490853pab.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Feb 2015 01:07:54 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <54D22D4E.3080703@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>

On Wed, Feb 04, 2015 at 11:31:42PM +0900, Kukjin Kim wrote:
> Hi,
> 
> This is cpuidle update for v3.20.
> Please pull.
> 
> Thanks,
> Kukjin
> 
> The following changes since commit 97bf6af1f928216fd6c5a66e8a57bfa95a659672:
> 
>   Linux 3.19-rc1 (2014-12-20 17:08:50 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-cpuidle
> 
> for you to fetch changes up to 712eddf70225ab5ae65e946e22d2dfe6b93e8dd1:
> 
>   cpuidle: exynos: add coupled cpuidle support for exynos4210
> (2015-01-30 08:39:15 +0900)
> 
> ----------------------------------------------------------------
> Samsung CPUIdle updates for v3.20
> 
> - adds coupled cpuidle support for exynos4210
>   : fix for Exynos platform PM code preparing it for the coupled
>   cpuidle support and adds coupled cpuidle AFTR mode on exynos4210
> 
> Note this is mostrly based on earlier cpuidle-exynos4210 driver
> from Daniel Lezcano and Bart updated.

Merged, thanks.

-Olof
