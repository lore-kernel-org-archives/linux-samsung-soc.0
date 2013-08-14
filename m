From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/7] Add DT nodes for FIMD and DP controller for
 Exynos5420 SoC
Date: Wed, 14 Aug 2013 14:58:51 +0900
Message-ID: <105d01ce98b3$5a395dc0$0eac1940$%kim@samsung.com>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50863 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752235Ab3HNF6x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 01:58:53 -0400
In-reply-to: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vikas Sajjan' <vikas.sajjan@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: t.figa@samsung.com, devicetree@vger.kernel.org, jg1.han@samsung.com, inki.dae@samsung.com, ajaynumb@gmail.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Vikas Sajjan wrote:
> 
> This patchset adds DT nodes for FIMD and DP controller for Exynos5420
> based SMDK.
> 
> It moves all common properties of FIMD and DP controller DT node specific
> to
> Exynos5 Socs like 5250 and 5420 to exynos5.dtsi file.
> 
> It also adds required PM domain DT nodes for exynos5420.
> 
> Is rebased on branch kgene's "for-next"
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-
> samsung.git/log/?h=for-next
> 
> The DP PHY DT Node is based on Jingoo Han's inflight patchset at
> http://comments.gmane.org/gmane.linux.drivers.video-input-
> infrastructure/66435
> 
> changes since v1:
> 	- Addressed comments given by Tomasz Figa <tomasz.figa@gmail.com>
> 	and Ajay kumar <ajaynumb@gmail.com>
> 
> Vikas Sajjan (6):
>   ARM: dts: Move display-timimg information inside FIMD DT node for
>     exynos5250
>   ARM: dts: Update FIMD DT node for Exynos5 SoCs
>   ARM: dts: Add FIMD DT node to exynos5420 DTS files
>   ARM: dts: Update DP controller DT Node for Exynos5 based SoCs
>   ARM: dts: Add DP controller DT node to exynos5420 SoC
>   ARM: dts: Add pin state information for DP HPD support to Exynos5420
> 
> Yadwinder Singh Brar (1):
>   ARM: dts: Add basic PM domains for EXYNOS5420
> 
>  arch/arm/boot/dts/exynos5.dtsi            |   21 +++++++++++
>  arch/arm/boot/dts/exynos5250-arndale.dts  |    4 ++-
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |   32 +++++++++--------
>  arch/arm/boot/dts/exynos5250.dtsi         |   28 ++++++---------
>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    7 ++++
>  arch/arm/boot/dts/exynos5420-smdk5420.dts |   31 ++++++++++++++++
>  arch/arm/boot/dts/exynos5420.dtsi         |   55
> +++++++++++++++++++++++++++++
>  7 files changed, 145 insertions(+), 33 deletions(-)
> 
> --
> 1.7.9.5

Looks good to me, will apply this whole series with fix typo, timimg? ;-)

- Kukjin
