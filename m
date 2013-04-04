From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V3 0/7] Update Arndale board support
Date: Thu, 04 Apr 2013 14:24:57 +0900
Message-ID: <276401ce30f4$beff29f0$3cfd7dd0$%kim@samsung.com>
References: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35467 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752414Ab3DDFY7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Apr 2013 01:24:59 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKP00MR8TPLY180@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Apr 2013 14:24:57 +0900 (KST)
In-reply-to: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: patches@linaro.org

Tushar Behera wrote:
> 
> Arndale board support has been updated using pin-control and
> common clock framework.
> 
> The patchset is based on Kukjin's for-next.
> commit d58f6a153f40 ("Merge branch 'next/clk-exynos-2' into for-next")
> 
> It depends on following patchset.
> 
> [PATCH 0/2] ARM: dts: Add default pin states for client nodes on Exynos4/5
> platforms
> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/16559
> 
> Following 2 patches have been newly added in this patchset because
> of changes during 3.9 merge window.
> 1/7: ARM: dts: Add pin-control related changes for Arndale board
> 2/7: ARM: dts: Add disable-wp for card slot on exynos5250-arndale
> 
> Amit Daniel Kachhap (1):
>   ARM: dts: Add PMIC node entry for Arndale board
> 
> Sachin Kamat (4):
>   ARM: dts: Add disable-wp for card slot on exynos5250-arndale
>   ARM: dts: Add vmmc regulator support for Arndale board
>   ARM: dts: Add MFC codec support for Arndale board
>   ARM: dts: Add HDMI HPD and regulator node for Arndale board
> 
> Tushar Behera (2):
>   ARM: dts: Add pin-control related changes for Arndale board
>   ARM: dts: Add gpio-button entries for Arndale board
> 
>  arch/arm/boot/dts/exynos5250-arndale.dts |  343
> +++++++++++++++++++++++++++++-
>  1 file changed, 333 insertions(+), 10 deletions(-)
> 
> --
> 1.7.9.5

Applied this whole series, thanks.

- Kukjin
