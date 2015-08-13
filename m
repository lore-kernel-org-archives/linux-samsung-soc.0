From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: dts: exynos4*: add iommu property to JPEG device
Date: Thu, 13 Aug 2015 14:27:17 +0900
Message-ID: <02e201d0d588$ba280d80$2e782880$@kernel.org>
References: <1439372399-20033-1-git-send-email-m.szyprowski@samsung.com>
 <55CBDD60.6010207@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43129 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750908AbbHMF1X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Aug 2015 01:27:23 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NT001W3F9TLX570@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Aug 2015 14:27:21 +0900 (KST)
In-reply-to: <55CBDD60.6010207@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kukjin Kim' <kgene@kernel.org>

Krzysztof Kozlowski wrote:
> 
> On 12.08.2015 18:39, Marek Szyprowski wrote:
> > JPEG codec node has been added in parallel to the patch, which added
> > support for IOMMU to Exynos platform, so JPEG device for Exynos4 series
> > lacked IOMMU property. This patch fixes this issue.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos4.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> > index b0d52b1..98c0a36 100644
> > --- a/arch/arm/boot/dts/exynos4.dtsi
> > +++ b/arch/arm/boot/dts/exynos4.dtsi
> > @@ -702,6 +702,7 @@
> >  		clocks = <&clock CLK_JPEG>;
> >  		clock-names = "jpeg";
> >  		power-domains = <&pd_cam>;
> > +		iommus = <&sysmmu_jpeg>;
> >  	};
> >
> >  	hdmi: hdmi@12D00000 {
> 
> 
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
Applied with Javier and Krzysztof's 'Reviewed-by'.

Thanks,
Kukjin
