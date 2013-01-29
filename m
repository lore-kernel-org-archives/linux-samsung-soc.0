From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/6] ARM: dts: Update MFC DT binding documentation
Date: Tue, 29 Jan 2013 14:33:17 +0100
Message-ID: <5107CF9D.6000200@samsung.com>
References: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
 <1359432822-23846-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:28619 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756338Ab3A2Nd0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 08:33:26 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHE00FX92Z04N20@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jan 2013 13:33:22 +0000 (GMT)
Received: from [106.116.147.32] by eusync4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MHE00IKR2ZLUC70@eusync4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jan 2013 13:33:21 +0000 (GMT)
In-reply-to: <1359432822-23846-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, patches@linaro.org, Arun Kumar K <arun.kk@samsung.com>

Hi Sachin,

On 01/29/2013 05:13 AM, Sachin Kamat wrote:
> Added an example for bindings for illustration and clarity.
> 
> Cc: devicetree-discuss@lists.ozlabs.org
> Cc: Arun Kumar K <arun.kk@samsung.com>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  .../devicetree/bindings/media/s5p-mfc.txt          |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
> index 67ec3d4..261c9dc 100644
> --- a/Documentation/devicetree/bindings/media/s5p-mfc.txt
> +++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
> @@ -21,3 +21,16 @@ Required properties:
>  
>    - samsung,mfc-l : Base address of the second memory bank used by MFC
>  		    for DMA contiguous memory allocation and its size.
> +
> +Example:

Maybe adding a comment that this is a SoC...

> +mfc: codec@13400000 {
> +	compatible = "samsung,mfc-v5";
> +	reg = <0x13400000 0x10000>;
> +	interrupts = <0 94 0>;
> +};

and the board specific part would make it more clear ?

> +codec@13400000 {
> +	samsung,mfc-r = <0x43000000 0x800000>;
> +	samsung,mfc-l = <0x51000000 0x800000>;
> +};

Also please note that in the first node above you need
status = "disabled"; line, so the MFC is disabled by default.
Then in dts files for boards that use the codec it can be
overridden to enable the device as needed.

--

Thanks,
Sylwester
