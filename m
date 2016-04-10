From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/2] ARM: exynos_defconfig: Enable CPUFreq governors as
 modules
Date: Sun, 10 Apr 2016 10:13:13 +0200
Message-ID: <20160410081313.GA7137@kozik-lap>
References: <1460142130-31822-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460142130-31822-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Apr 08, 2016 at 03:02:09PM -0400, Javier Martinez Canillas wrote:
> Currently only the ondemand and performance CPUFreq policy governors are
> enabled in the Exynos defconfig. But the other governors are also useful
> for some cases, enable them to allow users change the default if needed.
> 
> The options are enabled as module to keep the kernel image size minimal.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
>  arch/arm/configs/exynos_defconfig | 4 ++++
>  1 file changed, 4 insertions(+)

Hi,

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
