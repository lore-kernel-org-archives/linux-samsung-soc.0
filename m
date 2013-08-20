From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 0/8] Exynos device tree clean-up for 3.12
Date: Tue, 20 Aug 2013 16:20:02 +0200
Message-ID: <52137B12.2050708@samsung.com>
References: <1377006768-23174-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36905 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751013Ab3HTOUG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 10:20:06 -0400
In-reply-to: <1377006768-23174-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, ian.campbell@citrix.com, pawel.moll@arm.com, mark.rutland@arm.com, rob.herring@calxeda.com, swarren@wwwdotorg.org, galak@codeaurora.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

On 08/20/2013 03:52 PM, Tomasz Figa wrote:
> This series intends to fix small problems with Exynos device tree sources
> that I spotted during my work on other things. The fixes are mostly
> stylistic, without any funtional changes introduced, except patch 6/8,
> which makes the mshc node disabled by default, but for all affected
> boards it is enabled at board level.
> 
> Tomasz Figa (8):
>   Documentation: devicetree: Update Exynos MCT bindings description
>   ARM: dts: exynos4: Drop interrupt controller properties from MCT nodes
>   ARM: dts: exynos4x12: Move MCT node to exynos4x12.dtsi
>   ARM: dts: exynos4: Simplify MCT interrupt map
>   ARM: dts: exynos4x12: Move mshc node to exynos4x12.dtsi
>   ARM: dts: exynos4x12: Keep mshc node disabled by default
>   ARM: dts: exynos: Fix missing spaces after labels
>   ARM: dts: exynos4: Add missing unit-address of sysreg node
> 
>  .../bindings/timer/samsung,exynos4210-mct.txt      | 49 ++++++++++++++--------
>  arch/arm/boot/dts/exynos4.dtsi                     |  6 +--
>  arch/arm/boot/dts/exynos4210.dtsi                  | 23 +++++-----
>  arch/arm/boot/dts/exynos4212.dtsi                  | 24 +----------
>  arch/arm/boot/dts/exynos4412.dtsi                  | 36 +---------------
>  arch/arm/boot/dts/exynos4x12.dtsi                  | 29 +++++++++++++
>  arch/arm/boot/dts/exynos5.dtsi                     |  4 +-
>  arch/arm/boot/dts/exynos5250-smdk5250.dts          |  6 +--
>  arch/arm/boot/dts/exynos5440.dtsi                  |  2 +-
>  9 files changed, 82 insertions(+), 97 deletions(-)

Thanks Tomasz, for the whole series:

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>


Regards,
-- 
Sylwester Nawrocki
Samsung R&D Institute Poland
