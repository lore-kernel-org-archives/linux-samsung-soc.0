From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 3/4] ARM: dts: exynos: for v4.11, 2nd round
Date: Sun, 29 Jan 2017 21:19:29 -0800
Message-ID: <20170130051929.GY18943@localhost>
References: <20170129200630.22083-1-krzk@kernel.org>
 <20170129200630.22083-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:33424 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752009AbdA3Ffh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 30 Jan 2017 00:35:37 -0500
Received: by mail-pg0-f65.google.com with SMTP id 194so30621609pgd.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jan 2017 21:35:04 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170129200630.22083-3-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

On Sun, Jan 29, 2017 at 10:06:28PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> On top of previous pull request.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit bca9085e0ae93253bc93ce218c85ac7d7e7f1831:
> 
>   ARM: dts: exynos: remove Exynos4212 support (dead code) (2017-01-11 18:28:43 +0200)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-4.11-2
> 
> for you to fetch changes up to dfaf06baad0c088a55570f7a324949c498f2106c:
> 
>   ARM: dts: exynos: Fix indentation of EHCI and OHCI ports (2017-01-29 21:03:46 +0200)
> 
> ----------------------------------------------------------------
> Samsung DeviceTree update for v4.11, second round:
> 1. Use bigger reserved memory region for Multi Format Codec on all Exynos
>    chipsets so it could decode FullHD easily.

Merged, thanks.


-Olof
