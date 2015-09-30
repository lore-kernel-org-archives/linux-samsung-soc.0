From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: Add Exynos5250 Snow Rev5+ support
Date: Wed, 30 Sep 2015 15:55:24 +0900
Message-ID: <560B875C.8080705@kernel.org>
References: <1443595455-12754-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:51574 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751185AbbI3Gzv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 02:55:51 -0400
In-Reply-To: <1443595455-12754-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org

On 09/30/15 15:44, Javier Martinez Canillas wrote:
> There are 2 revisions of the Exynos5250 Snow Chromebook that were shipped:
> Rev4 and Rev5. The only difference between these 2 revisions is the codec,
> Rev4 has a max98095 codec while Rev5 has a max98090.
> 
> Mainline only supports Rev4 so this patch moves the common device nodes to
> a DTSI file and adds a DTS for the Exynos5250 Snow Rev5.
> 
> The Snow Rev5 DTS is based on the DTS found in the ChromiumOS 3.8 tree.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Tested-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> ---
> 
> Changes in v2:
> - Add Mauro Carvalho Chehab's Tested-by tag.
> - Add Doug Anderson's Reviewed-by tag.
> - Remove warning about adding a whitespace error. Suggested by Doug Anderson.
> - Make Rev{4,5} codec pinctrl properties to match. Suggested by Doug Anderson.
> - Add "google,snow-rev4" to compatible string. Suggested by Krzysztof Kozlowski.
> 
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/exynos5250-snow-common.dtsi | 684 ++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5250-snow-rev5.dts    |  47 ++
>  arch/arm/boot/dts/exynos5250-snow.dts         | 671 +------------------------
>  4 files changed, 736 insertions(+), 667 deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos5250-snow-common.dtsi
>  create mode 100644 arch/arm/boot/dts/exynos5250-snow-rev5.dts
> 
Applied, thanks.

- Kukjin
