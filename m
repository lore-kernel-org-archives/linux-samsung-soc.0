From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 0/6] Exynos device tree clean-up for 3.14
Date: Mon, 16 Dec 2013 09:42:26 +0900
Message-ID: <0dba01cef9f7$b1379010$13a6b030$@samsung.com>
References: <1386864738-19829-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:61385 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752098Ab3LPAm2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 15 Dec 2013 19:42:28 -0500
In-reply-to: <1386864738-19829-1-git-send-email-t.figa@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Stephen Warren' <swarren@wwwdotorg.org>

Tomasz Figa wrote:
> 
> This series intends to fix small problems with Exynos device tree sources
> that I spotted during my work on other things. The fixes are mostly
> stylistic, without any funtional changes introduced.
> 
> Changes sinve v2:
>  - Moved MSHC patches to separate series.
>  - Rebased onto current linux-next.
> Changes since v1:
>  - Addressed Stephen Warren's comments about MCT binding documentation.
> 
> Tomasz Figa (6):
>   Documentation: devicetree: Update Exynos MCT bindings description
>   ARM: dts: exynos4: Drop interrupt controller properties from MCT nodes
>   ARM: dts: exynos4x12: Move MCT node to exynos4x12.dtsi
>   ARM: dts: exynos4: Simplify MCT interrupt map
>   ARM: dts: exynos: Fix missing spaces after labels
>   ARM: dts: exynos4: Add missing unit-address of sysreg node
> 
>  .../bindings/timer/samsung,exynos4210-mct.txt      | 54
+++++++++++++++---
> ----
>  arch/arm/boot/dts/exynos4.dtsi                     |  6 +--
>  arch/arm/boot/dts/exynos4210.dtsi                  | 23 ++++-----
>  arch/arm/boot/dts/exynos4212.dtsi                  | 24 +---------
>  arch/arm/boot/dts/exynos4412.dtsi                  | 28 +----------
>  arch/arm/boot/dts/exynos4x12.dtsi                  | 20 ++++++++
>  arch/arm/boot/dts/exynos5.dtsi                     |  4 +-
>  arch/arm/boot/dts/exynos5250-smdk5250.dts          |  6 +--
>  arch/arm/boot/dts/exynos5440.dtsi                  |  2 +-
>  9 files changed, 78 insertions(+), 89 deletions(-)
> 
> --
> 1.8.4.3

Nice cleanup series. Thanks and will apply.

- Kukjin
