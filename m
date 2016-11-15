From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 02/16] ARM: EXYNOS: use generic API to enable SCU
Date: Tue, 15 Nov 2016 20:59:39 +0200
Message-ID: <20161115185939.GA14626@kozik-lap>
References: <1479099731-28108-1-git-send-email-pankaj.dubey@samsung.com>
 <1479099731-28108-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1479099731-28108-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, arnd@arndb.de, horms@verge.net.au, magnus.damm@gmail.com, geert+renesas@glider.be, vireshk@kernel.org, shiraz.linux.kernel@gmail.com, krzk@kernel.org, thomas.ab@samsung.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Nov 14, 2016 at 10:31:57AM +0530, Pankaj Dubey wrote:
> Now as we have of_scu_enable which takes care of mapping
> scu base from DT, lets use it.
> 
> This patch also fixes build failure in case !SMP caused
> by commit SHA ID: 94210b1abb2 which is already merged in
> krzk/for-next branch
> 
> CC: Krzysztof Kozlowski <krzk@kernel.org>
> CC: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/common.h  |  1 -
>  arch/arm/mach-exynos/platsmp.c | 30 ++++--------------------------
>  arch/arm/mach-exynos/pm.c      |  4 ++--
>  arch/arm/mach-exynos/suspend.c | 14 ++++----------
>  4 files changed, 10 insertions(+), 39 deletions(-)
> 

Looks correct, for reference:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

However this depends on changes in my next/soc branch (and these changes
were the trigger for this patchset). I can either provide a tag with
Exynos commits or accept one with common SCU code.

Best regards,
Krzysztof
