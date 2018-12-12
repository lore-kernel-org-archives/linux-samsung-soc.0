From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 4/4] ARM: samsung: SoC/mach for 4.21
Date: Wed, 12 Dec 2018 13:52:29 -0800
Message-ID: <20181212215229.6x5bpkdfhbtzafgp@localhost>
References: <20181209114911.25194-1-krzk@kernel.org>
 <20181209114911.25194-5-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181209114911.25194-5-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Dec 09, 2018 at 12:49:11PM +0100, Krzysztof Kozlowski wrote:
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> 
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-4.21
> 
> for you to fetch changes up to cafbc79e327f44411b8bd8bdc101b9e6c65ab42a:
> 
>   ARM: exynos: Remove secondary startup initialization from smp_prepare_cpus (2018-11-18 15:12:50 +0100)
> 
> ----------------------------------------------------------------
> Samsung mach/soc changes for v4.21
> 
> Just cleanups of: legacy way of setting external wakeup interrupts, old
> power management debugging functions and duplicated secondary startup
> initialization.
> 
> ----------------------------------------------------------------
> Bartlomiej Zolnierkiewicz (2):
>       ARM: exynos: Remove no longer needed s3c_pm_check_*() calls
>       ARM: samsung: Limit SAMSUNG_PM_DEBUG config option to non-Exynos platforms
> 
> Krzysztof Kozlowski (2):
>       ARM: s5pv210: Remove legacy setting of external wakeup interrupts
>       ARM: exynos: Remove legacy setting of external wakeup interrupts
> 
> Pankaj Dubey (1):
>       ARM: exynos: Remove secondary startup initialization from smp_prepare_cpus

Merged, thanks!


-Olof
