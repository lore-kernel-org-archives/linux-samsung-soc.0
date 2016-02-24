From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 1/7] ARM: EXYNOS: Non-critical fixes for v4.6
Date: Wed, 24 Feb 2016 14:18:29 -0800
Message-ID: <20160224221829.GS10126@localhost>
References: <1455496446-23779-1-git-send-email-k.kozlowski@samsung.com>
 <1455496446-23779-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f177.google.com ([209.85.192.177]:34960 "EHLO
	mail-pf0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753311AbcBXW6t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Feb 2016 17:58:49 -0500
Received: by mail-pf0-f177.google.com with SMTP id c10so21636324pfc.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Feb 2016 14:58:49 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1455496446-23779-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Pankaj Dubey <pankaj.dubey@samsung.com>, Pavel Fedin <p.fedin@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

On Mon, Feb 15, 2016 at 09:34:00AM +0900, Krzysztof Kozlowski wrote:
> Hi Arnd, Kevin and Olof,
> 
> Few fixes from Arnd.
> 
> BTW, I did not apply one fix from his set because I had few comments
> (not resolved yet).
> 
> Kind regards,
> Krzysztof
> 
> 
> The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:
> 
>   Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-non-critical-4.6
> 
> for you to fetch changes up to dc7eb9d589e595954792cc192bcbb92932e5c2ff:
> 
>   ARM: EXYNOS: select THERMAL_OF (2016-02-01 10:29:20 +0900)
> 
> ----------------------------------------------------------------
> Fixes from Arnd for harmless warnings for Exynos and S3C platforms.

Thanks, merged.


-Olof
