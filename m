From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 1/4] ARM: mach/soc: exynos for v4.11, 2nd round
Date: Sun, 29 Jan 2017 21:24:10 -0800
Message-ID: <20170130052410.GA18943@localhost>
References: <20170129200630.22083-1-krzk@kernel.org>
 <20170129200630.22083-5-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:34049 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752078AbdA3Ffh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 30 Jan 2017 00:35:37 -0500
Received: by mail-pf0-f194.google.com with SMTP id y143so22569123pfb.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jan 2017 21:35:08 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170129200630.22083-5-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

On Sun, Jan 29, 2017 at 10:06:30PM +0200, Krzysztof Kozlowski wrote:
> 
> On top of previous pull request.
> 
> 
> The following changes since commit cda1a52dab50340728e46601e6c9da9fc4beaf1f:
> 
>   ARM: s3c64xx: Constify wake_irqs (2016-12-29 15:41:44 +0200)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-4.11-2
> 
> for you to fetch changes up to 95ed41df129ca8f76eb190534d20f4a6dcd37213:
> 
>   dt-bindings: video: exynos7-decon: Remove obsolete samsung,power-domain property (2017-01-29 21:03:56 +0200)
> 
> ----------------------------------------------------------------
> Samsung mach/soc update for v4.11, second round:
> 1. Remove mach code for Exynos4415 as a continuation of removal
>    of this SoC.
> 2. Remove obsolete property from the bindings documentation.

Merged, thanks!


-Olof
