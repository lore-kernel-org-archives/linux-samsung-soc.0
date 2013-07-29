From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 0/7] Add DT nodes for FIMD and DP controller for Exynos5420 SoC
Date: Mon, 29 Jul 2013 23:51:39 +0200
Message-ID: <3811337.QlCFIFjRGN@thinkpad>
References: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f47.google.com ([209.85.214.47]:62243 "EHLO
	mail-bk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754613Ab3G2Vvh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jul 2013 17:51:37 -0400
Received: by mail-bk0-f47.google.com with SMTP id jg9so742873bkc.34
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2013 14:51:36 -0700 (PDT)
In-Reply-To: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>, jg1.han@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Hi Vikas,

Please use new address of device tree mailing list for next version of this 
series, which is:

devicetree@vger.kernel.org

Best regards,
Tomasz

On Monday 29 of July 2013 19:19:24 Vikas Sajjan wrote:
> This patchset adds DT nodes for FIMD and DP controller for Exynos5420
> based SMDK.
> 
> It moves all common properties of FIMD and DP controller DT node specific to
> Exynos5 Socs like 5250 and 5420 to exynos5.dtsi file.
> 
> It also adds required PM domain DT nodes for exynos5420.
> 
> Is rebased on branch kgene's "for-next"
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=
> for-next
> 
> The DP PHY DT Node is based on Jingoo Han's inflight patchset at
> http://comments.gmane.org/gmane.linux.drivers.video-input-infrastructure/664
> 35
> 
> Vikas Sajjan (6):
>   ARM: dts: move display-timimg information inside FIMD DT node for
>     exynos5250
>   ARM: dts: Update FIMD DT node for Exynos5 SoCs
>   ARM: dts: Add FIMD DT node to exynos5420 DTS files
>   ARM: dts: Update DP controller DT Node for Exynos5 based SoCs
>   ARM: dts: Add DP controller DT node to exynos5420 SoC
>   ARM: dts: add pin state information for DP HPD support to Exynos5420
> 
> Yadwinder Singh Brar (1):
>   ARM: dts: Add basic PM domains for EXYNOS5420
> 
>  arch/arm/boot/dts/exynos5.dtsi            |   39 +++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5250-arndale.dts  |    9 ------
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |   35 +++++++++------------
>  arch/arm/boot/dts/exynos5250.dtsi         |   18 ++---------
>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    7 +++++
>  arch/arm/boot/dts/exynos5420-smdk5420.dts |   23 ++++++++++++++
>  arch/arm/boot/dts/exynos5420.dtsi         |   49
> +++++++++++++++++++++++++++++ 7 files changed, 135 insertions(+), 45
> deletions(-)
