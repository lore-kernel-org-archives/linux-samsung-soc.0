From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 3/3] ARM: samsung: Changes for v5.2
Date: Sun, 28 Apr 2019 23:05:22 -0700
Message-ID: <20190429060522.ijfpvz3c2bxa5xwi@localhost>
References: <20190414154805.10188-1-krzk@kernel.org>
 <20190414154805.10188-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190414154805.10188-3-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Apr 14, 2019 at 05:48:05PM +0200, Krzysztof Kozlowski wrote:
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.2
> 
> for you to fetch changes up to 7676e667c841375b41d9438b559756141aa93d0e:
> 
>   ARM: s3c64xx: Tidy up handling of regulator GPIO lookups (2019-04-14 12:53:03 +0200)
> 
> ----------------------------------------------------------------
> Samsung mach/soc changes for v5.2
> 
> 1. Cleanup in mach code.
> 2. Add necessary fixes for Suspend to RAM on Exynos5422 boards (tested
>    with Odroid XU3/XU4/HC1 family).  Finally this brings a working S2R
>    on these Odroid boards (still other drivers might have some issues
>    but mach code seems to be finished).
> 3. Require MCPM for Exynos542x boards because otherwise not all of cores
>    will come online.
> 4. GPIO regulator cleanup on S3C6410 Craig.

Merged, thanks.


-Olof
