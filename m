From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/4] ARM: dts: exynos: Second pull for v5.3
Date: Wed, 26 Jun 2019 19:23:29 -0700
Message-ID: <20190627022329.cr3iungll7n3r2sp@localhost>
References: <20190625193451.7696-1-krzk@kernel.org>
 <20190625193451.7696-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190625193451.7696-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jun 25, 2019 at 09:34:49PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> On top of previous pull request.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit d2cac68e0d9b038da7207c0b63e1399c4f9f60c4:
> 
>   ARM: dts: exynos: Add ADC node to Exynos5410 and Odroid XU (2019-06-11 20:37:21 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.3-2
> 
> for you to fetch changes up to 13efd80acaa4cdb61fde52732178ff9eb4141104:
> 
>   ARM: dts: exynos: Add GPU/Mali 400 node to Exynos4 (2019-06-24 20:03:42 +0200)
> 
> ----------------------------------------------------------------
> Samsung DTS ARM changes for v5.3, second round
> 
> 1. Add camera flash to Galaxy S3 boards,
> 2. Fix PMU affinity interrupt warning on Exynos4,
> 3. Improve regulator configuration on Odroid XU3/XU4/HC1 family and
>    Arndale Octa by disabling unneeded regulators and adding suspend
>    configuration.  The suspend configuration brings significant reduce of
>    energy usage in Suspend to RAM (e.g. 120 -> ~7 mA on Odroid HC1).
> 4. Add Mali nodes to Exynos3 and Exynos4.


Merged, thanks!


-Olof
