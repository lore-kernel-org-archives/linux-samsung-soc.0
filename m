From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 1/2] ARM: exynos: mach/soc for v4.20 (or 5.0)
Date: Sun, 23 Sep 2018 06:48:16 -0700
Message-ID: <20180923134816.3oskgg3up5dgotdr@localhost>
References: <20180921174520.9126-1-krzk@kernel.org>
 <20180921174520.9126-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180921174520.9126-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Sep 21, 2018 at 07:45:20PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Nothing special, description in tag.
> 
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:
> 
>   Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-4.20
> 
> for you to fetch changes up to f30858439e7db9ce9847eaedf440635fc6349c6e:
> 
>   ARM: s3c24xx: Restore proper usage of pr_info/pr_cont (2018-09-19 19:11:17 +0200)
> 
> ----------------------------------------------------------------
> Samsung mach/soc changes for v4.20
> 
> 1. Fix imprecise abort during Odroid XU3-family suspend to RAM (but it
>    is not end of work needed for suspend).
> 2. Cleanup and fix of SD card write protect on MINI2440.

Merged, thanks!

-Olof
