From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/4] drm/exynos: dsim: fix to control mipi phy register
Date: Mon, 09 Feb 2015 11:57:17 +0100
Message-ID: <54D8928D.9000008@samsung.com>
References: <1423309988-11793-1-git-send-email-inki.dae@samsung.com>
 <1423309988-11793-2-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43896 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760016AbbBIK50 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Feb 2015 05:57:26 -0500
In-reply-to: <1423309988-11793-2-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, devicetree@vger.kernel.org
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, a.hajda@samsung.com

On 07/02/15 12:53, Inki Dae wrote:
> This patch fixes the issue that the try to get a phy object is failed
> to enable mipi phy.
> 
> System and power management unit registers should be controlled by
> syscon framework. So this patch removes existing phy framework based
> codes and adds syscon support instead. However, we should support
> legacy device tree binding so consider the legacy binding for compatibility.
> 
> In addition, we need to remove below device node and relevant properties,
> 	mipi_phy: video-phy@10020710 {
> 		compatible = "samsung,s5pv210-mipi-video-phy";
> 		reg = <0x10020710 8>;
> 		#phy-cells = <1>;
> 	};
> 
> Now camera device node uses mipi_phy node relevant properties like below,
> 	camera {
> 		...
> 		csis_0: csis@11880000 {
> 			...
> 			phys = <&mipi_phy 0>;
> 			phy-names = "csis";
> 			...
> 		};
> 		csis_1: csis@11890000 {
> 			...
> 			phys = <&mipi_phy 2>;
> 			phy-names = "csis";
> 			...
> 		};
> 		...
> 	};
> 
> With above, we will find below message while booting,
>      can't request region for resource [mem 0x10020710-0x10020717]

I'm afraid this approach won't work because MIPI DSI Master and MIPI CSI
Slave devices share a control bit in the register and it seems impossible
to ensure proper locking with current regmap/syscon API.

I have submitted patches to fix this issue [1] and they should be already
available in linux-next and can be found on linux-samsung-soc ML:

[PATCH 1/2] phy: exynos-video-mipi: Fix regression by adding support for PMU regmap
[PATCH 2/2] ARM: dts: Add syscon phandle to the video-phy node for Exynos4

The other issue with your approach is that we are moving the PMU details
to the MIPI DSIM driver and similar changes would need to be done in
the MIPI CSIS driver.

Instead I just added syscon support to the PHY layer, it's not perfect
but fixes the issue for both DSI and CSI and  doesn't strip the PHY layer
which could potentially be useful.

-- 
Thanks,
Sylwester

[1] https://patchwork.ozlabs.org/patch/429948/
    http://www.spinics.net/lists/linux-samsung-soc/msg41210.html
