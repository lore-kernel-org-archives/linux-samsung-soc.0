From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v6 1/7] of/documentation: update with clock information for
 exynos hdmi subsystem
Date: Thu, 29 Aug 2013 14:59:51 +0200
Message-ID: <2408083.FgRSDHIkdl@amdc1227>
References: <1377754827-31786-1-git-send-email-rahul.sharma@samsung.com>
 <1377754827-31786-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:45741 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752393Ab3H2M75 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Aug 2013 08:59:57 -0400
In-reply-to: <1377754827-31786-2-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

On Thursday 29 of August 2013 11:10:21 Rahul Sharma wrote:
> Adding information about clocks to the binding documentation
> for exynos mixer and hdmi.
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  Documentation/devicetree/bindings/video/exynos_hdmi.txt |   15
> ++++++++++++++- .../devicetree/bindings/video/exynos_mixer.txt         
> |    4 ++++ 2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> b/Documentation/devicetree/bindings/video/exynos_hdmi.txt index
> 323983b..1878418 100644
> --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> @@ -12,7 +12,20 @@ Required properties:
>  	a) phandle of the gpio controller node.
>  	b) pin number within the gpio controller.
>  	c) optional flags and pull up/down.
> -
> +- clocks: list of clock IDs from SoC clock driver.
> +	a) hdmi: It is required for gate operation on aclk_200_disp1 clock
> +		which clocks the display1 block.

The "aclk_200_disp1" name is valid only on Exynos 5, but this binding is 
generic for all Exynos SoCs and probably also previous S5P SoCs. I believe 
that "Gate of HDMI IP bus clock." would be appropriate here.

Otherwise, this patch looks good to me.

Best regards,
Tomasz
