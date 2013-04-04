From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: Update MFC documentation for clock entries
Date: Thu, 04 Apr 2013 13:08:25 +0200
Message-ID: <515D5F29.8030709@samsung.com>
References: <1365056815-28000-1-git-send-email-sachin.kamat@linaro.org>
 <1365056815-28000-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:57632 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756984Ab3DDLI3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Apr 2013 07:08:29 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MKQ00KTO9E72H70@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Apr 2013 12:08:27 +0100 (BST)
In-reply-to: <1365056815-28000-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, rob.herring@calxeda.com, patches@linaro.org

On 04/04/2013 08:26 AM, Sachin Kamat wrote:
> Added clock entry definitions to MFC bindings document.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  .../devicetree/bindings/media/s5p-mfc.txt          |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
> index bf0182d..d7b991a 100644
> --- a/Documentation/devicetree/bindings/media/s5p-mfc.txt
> +++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
> @@ -15,6 +15,9 @@ Required properties:
>  	  mapped region.
>  
>    - interrupts : MFC interrupt number to the CPU.
> +  - clocks: from common clock binding: handle to mfc clocks.
> +  - clock-names: from common clock binding: Shall be "sclk_mfc" and "mfc"
> +		 for "samsung,mfc-v5".

Not sure if we shouldn't be more specific about the fact the entries in
the clocks property must be in same order as names in clock-names. Perhaps
it's sufficient you mentioned the common clock binding which defines that.

Also we should keep the clock names same, regardless which MFC IP version
those apply to. At least as far as same driver is used for them and the
number of clocks is same. Thus perhaps this could be:

- clock-names : from common clock binding: must contain "sclk_mfc" and "mfc",
	corresponding to entries in the clocks property.

Please note there is a white space before the first colon, that makes
it really an important improvement...

Please feel free to add my

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

with those issues addressed.

>    - samsung,mfc-r : Base address of the first memory bank used by MFC
>  		    for DMA contiguous memory allocation and its size.
> @@ -34,6 +37,8 @@ mfc: codec@13400000 {
>  	reg = <0x13400000 0x10000>;
>  	interrupts = <0 94 0>;
>  	samsung,power-domain = <&pd_mfc>;
> +	clocks = <&clock 170>, <&clock 273>;
> +	clock-names = "sclk_mfc", "mfc";
>  };
>  
>  Board specific DT entry:
