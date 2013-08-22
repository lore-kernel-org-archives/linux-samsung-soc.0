From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V3] ARM: dts: Add dwmmc DT nodes for exynos5420 SOC
Date: Fri, 23 Aug 2013 00:57:06 +0200
Message-ID: <1626480.P3AF3x2yXx@flatron>
References: <1377172278-15161-1-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1377172278-15161-1-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, linux-mmc@vger.kernel.org, cjb@laptop.org, jh80.chung@samsung.com, tgih.jun@samsung.com, ks.giri@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Yuvaraj,

On Thursday 22 of August 2013 17:21:18 Yuvaraj Kumar C D wrote:
> This patch adds the device tree node entries for exynos5420 SOC.
> Exynos5420 has a different version of DWMMC controller,so a new
> compatible string is used to distinguish it from the prior SOC's.
> 
> changes since V2:
> 	1.dropped num-slots property from node as its not required
> 	  if number of card slots available is 1.
> 
> 	2.Move the below properties
> 		a.fifo-depth
> 		b.card-detect-delay
> 		c.samsung,dw-mshc-ciu-div
> 		d.samsung,dw-mshc-sdr-timing
> 		e.samsung,dw-mshc-ddr-timing
> 	from board dts to SOC dts,as these are not board specific 
properties.
> 
> 	3.Updated the binding document exynos-dw-mshc.txt.
> 
> changes since V1:
> 	1.disable node by status = disabled in SOC file
> 	2.enable node by status = okay in board specific file
> 
> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
> ---
>  .../devicetree/bindings/mmc/exynos-dw-mshc.txt     |    4 ++
>  arch/arm/boot/dts/exynos5420-smdk5420.dts          |   26 ++++++++++
>  arch/arm/boot/dts/exynos5420.dtsi                  |   51
> ++++++++++++++++++++ 3 files changed, 81 insertions(+)

Please resend this patch with devicetree mailing list and other recipients 
added, as listed in MAINTAINERS file for Documentation/devicetree/ and 
arch/*/boot/dts/ directories.

Best regards,
Tomasz

