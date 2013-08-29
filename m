From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v7 0/6] ARM: dts: add support for exynos hdmi subsystem
Date: Thu, 29 Aug 2013 15:35:49 +0200
Message-ID: <1620695.hYygFk0Iax@amdc1227>
References: <1377784377-28426-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53093 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753238Ab3H2Nfz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Aug 2013 09:35:55 -0400
In-reply-to: <1377784377-28426-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

Hi Rahul,

On Thursday 29 of August 2013 19:22:51 Rahul Sharma wrote:
> It adds Device tree nodes and clocks information for HDMI subsystem
> for exynos5420 and exynos5250 SoCs. It adds pinctrl node for hdmi
> hpd gpio and update binding documents.
> 
> This set is based on kukjin's for-next branch at
> http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.
> 
> v7:
> 1) Minor change in of-documentation.
> 2) Squash gpio pin-ctrl and ddc patch to one patch.
> 
> v6:
> 1) Update clock numbers as per change in mux and divider clocks.
> 2) Isolate board changes from SoC patch and add a different patch for
> ddc.
> 
> v5:
> 1) Merged Clock addition patch to DT nmde addition patch.
> 2) Add dout_pixel clock for hdmi in place of sclk_pixel.
> 3) Enable mixer node in soc dtsi file.
> 
> v4:
> 1) Remove the movement of common properties to Exynos5.dtsi for
> I2C and hdmi subsystem.
> 2) Change the title of the patches.
> 
> v3:
> 1) Rebase to kgene for-next based on 3.11-rc1.
> 2) Changes clock numbers as per updated clocks file for
> exyno5250 and exynos5420.
> 3) Dropped Sachin patch as already got merged.
> 
> v2:
> 1) Added patch for moving common i2c properties to exynos5.dtsi
> 2) Added patch for moving common hdmi, mixer properties to exynos5.dtsi
> 3) moved hpd pinctrl node to board file.
> 4) Added Sachin's patch to update binding document for hdmi with hpd
> information.
> 
> Andrew Bresticker (1):
>   ARM: dts: add i2c device nodes for Exynos5420
> 
> Rahul Sharma (4):
>   of/documentation: update with clock information for exynos hdmi
>     subsystem
>   ARM: dts: add clocks to hdmi dt node for exynos5250
>   ARM: dts: add dt nodes for hdmi subsystem for exynos5420
>   ARM: dts: enable hdmi subsystem for exynos5420 smdk board
> 
> Sean Paul (1):
>   ARM: dts: add mixer clocks to mixer node for Exynos5250
> 
>  .../devicetree/bindings/video/exynos_hdmi.txt      |   14 +++-
>  .../devicetree/bindings/video/exynos_mixer.txt     |    4 ++
>  arch/arm/boot/dts/exynos5250.dtsi                  |    8 ++-
>  arch/arm/boot/dts/exynos5420-smdk5420.dts          |   26 +++++++
>  arch/arm/boot/dts/exynos5420.dtsi                  |   75
> ++++++++++++++++++++ 5 files changed, 123 insertions(+), 4 deletions(-)

The whole series looks good to me now. Thanks for keeping up with all the 
comments.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
