From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/3] ARM64: dts: exynos: DT for v4.10
Date: Thu, 17 Nov 2016 17:59:54 -0800
Message-ID: <20161118015954.GP8578@localhost>
References: <1478629589-7520-1-git-send-email-krzk@kernel.org>
 <1478629589-7520-4-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1478629589-7520-4-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Nov 08, 2016 at 08:26:29PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Exynos5433 + two boards using it. Mobile boards! :)
> 
> I am really happy to push it. I know that it has been a lot of effort
> in Samsung to mainline this.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:
> 
>   Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.10
> 
> for you to fetch changes up to 8ac46fc57df82efbc19194dddd335b6c7a960c31:
> 
>   arm64: dts: exynos: Add dts file for Exynos5433-based TM2E board (2016-11-03 22:19:57 +0200)
> 
> ----------------------------------------------------------------
> Finally, I am really pleased to announce adding support for Exynos5433 ARMv8
> SoC along with two boards.  A lot of Samsung people contributed into this
> but the final work and commits were done by Chanwoo Choi.
> 
> This means that for v4.10 we got:
> 1. Exynos5433 DTSI.
> 2. Two boards: TM2 and TM2E.  These are (almost fully) working mobile phones.

Awesome! Looks like TM2 is a Tizen reference board? Great to see the support,
even if it's taken a while.


-Olof
