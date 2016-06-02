From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 4/4] ARM: exynos_defconfig: Save defconfig on current
 linux-next
Date: Thu, 02 Jun 2016 10:47:49 +0200
Message-ID: <574FF2B5.9070404@samsung.com>
References: <1464846916-3110-1-git-send-email-k.kozlowski@samsung.com>
 <1464846916-3110-4-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1464846916-3110-4-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 06/02/2016 07:55 AM, Krzysztof Kozlowski wrote:
> Save defconfig on next-20160602. Most of changes are just re-ordering of
> symbols.  Removed symbols:
>  - FHANDLE (default y),
>  - THERMAL, EXYNOS_THERMAL (selected by ARCH_EXYNOS),
>  - CHROME_PLATFORMS (selected by MFD_CROS_EC),
>  - EXT4_FS (selected by EXT3_FS)
>  - SND_SOC_ODROIDX2 (obsolete since commit ee12a817bb4b ("ASoC: samsung:
>    Remove unused Odroid x2/u3 machine driver"), replaced with
>    SND_SIMPLE_CARD).
> 
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
