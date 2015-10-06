From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [GIT PULL] arm64: dts: Exynos ARMv8 improvements for 4.4
Date: Tue, 06 Oct 2015 10:47:41 +0900
Message-ID: <177701d0ffd8$fd19ce10$f74d6a30$@kernel.org>
References: <1443579766-15793-1-git-send-email-k.kozlowski@samsung.com>
 <1443579766-15793-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1443579766-15793-3-git-send-email-k.kozlowski@samsung.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 'Olof Johansson' <olof@lixom.net>, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Krzysztof Kozlowski wrote:
> 
> Dear Kukjin,
> 
> One ARMv8 DTS change for 4.4.
> 
> Best regards,
> Krzysztof
> 
> The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:
> 
>   Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/krzk/linux.git tags/samsung-dt64-4.4
> 
> for you to fetch changes up to 235c8e96f54a76bee201a7c86620c351a30b1ac6:
> 
>   arm64: dts: Add BUS1 instance pinctrl support for exynos7 (2015-09-16 09:03:09 +0900)
> 
> ----------------------------------------------------------------
> Device Tree improvements for Exynos ARMv8 based boards:
> 1. Add a BUS1 instance pinctrl for Exynos7 SoC.
> 
> ----------------------------------------------------------------
> Alim Akhtar (1):
>       arm64: dts: Add BUS1 instance pinctrl support for exynos7
> 
>  arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi | 103 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7.dtsi         |   7 ++
>  2 files changed, 110 insertions(+)

Looks good to me. Since just one patch in this pull-request if you don't mind,
let me take the patch directly with your signed-off.

- Kukjin
