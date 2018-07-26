From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/3] ARM: dts: exynos: Second round for v4.19
Date: Wed, 25 Jul 2018 23:57:41 -0700
Message-ID: <20180726065741.2j66wexoeehb3wcy@localhost>
References: <20180725162340.7488-1-krzk@kernel.org>
 <20180725162340.7488-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180725162340.7488-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jul 25, 2018 at 06:23:39PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> On top of previous pull request.
> 
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 57f4e8bc1c3ebbd06a278107edeb6af95b53e5bf:
> 
>   dt-bindings: samsung: Document bindings for SGH-T959P board (2018-07-07 12:28:07 +0200)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-4.19-2
> 
> for you to fetch changes up to 965228d33cd2b47adb493bb1864761420c632e41:
> 
>   ARM: dts: exynos: Configure Midas SD card CD pin (2018-07-23 19:12:01 +0200)
> 
> ----------------------------------------------------------------
> Samsung DTS ARM changes for v4.19, part 2
> 
> 1. Add missing interrupts to PWM nodes on Exynos5.
> 2. Add missing interrupt pin pull up/down configuration on Exynos4412
>    Midas boards.  The interrupts were mostly working thanks to initial
>    configuration by bootloader.

Merged, thanks!


-Olof
