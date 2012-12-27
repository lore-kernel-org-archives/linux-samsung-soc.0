From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: exynos: Revise HDMI resource size
Date: Thu, 27 Dec 2012 10:34:08 -0800
Message-ID: <01a801cde460$c2eae620$48c0b260$@samsung.com>
References: <1356596541-20457-1-git-send-email-prathyush.k@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:38509 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751648Ab2L0SeQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Dec 2012 13:34:16 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFP008GCCX2V910@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Dec 2012 03:34:14 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFP00J60CX0UMC0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Dec 2012 03:34:14 +0900 (KST)
In-reply-to: <1356596541-20457-1-git-send-email-prathyush.k@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Prathyush K' <prathyush.k@samsung.com>, linux-samsung-soc@vger.kernel.org

Prathyush K wrote:
> 
> From: Sean Paul <seanpaul@chromium.org>
> 
> Reduce the HDMI resource size from 0x100000 to 0x70000 so it
> doesn't overlap the Displayport resource space.
> HDMI: (0x14530000 - 0x145A0000
> DP: (0x145B0000 - 0x145B1000)
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Prathyush K <prathyush.k@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> index 45799e8..30485de 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -580,7 +580,7 @@
> 
>  	hdmi {
>  		compatible = "samsung,exynos5-hdmi";
> -		reg = <0x14530000 0x100000>;
> +		reg = <0x14530000 0x70000>;
>  		interrupts = <0 95 0>;
>  	};
> 
> --
> 1.8.0

Yes, applied, thanks.

- Kukjin
