From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v2 1/3] mfd: documentation: dt: Document grounded ACOKB pin
 on S2MPS11
Date: Fri, 14 Aug 2015 18:47:08 +0900
Message-ID: <02a201d0d676$2fbe73c0$8f3b5b40$@kernel.org>
References: <1439287746-14034-1-git-send-email-k.kozlowski.k@gmail.com>
 <1439287746-14034-2-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42590 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753742AbbHNJrM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Aug 2015 05:47:12 -0400
In-reply-to: <1439287746-14034-2-git-send-email-k.kozlowski.k@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski.k@gmail.com>, 'Sangbeom Kim' <sbkim73@samsung.com>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Samuel Ortiz' <sameo@linux.intel.com>, 'Lee Jones' <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Anand Moon' <linux.amoon@gmail.com>, 'Javier Martinez Canillas' <javier@osg.samsung.com>

Krzysztof Kozlowski wrote:
> 
> Document a new Device Tree property 'samsung,s2mps11-acokb-ground'
> indicating that ACOKB pin of S2MPS11 PMIC is connected to the ground so
> the PMIC must manually set PWRHOLD bit in CTRL1 register to turn off the
> power.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Split bindings documentation to separate patch (suggested by Lee).
> 2. Add Javier's reviewed-by and Lee's acked-by.
> ---
>  Documentation/devicetree/bindings/mfd/s2mps11.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> index 57a045016fca..90eaef393325 100644
> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> @@ -15,6 +15,10 @@ Optional properties:
>  - interrupt-parent: Specifies the phandle of the interrupt controller to which
>    the interrupts from s2mps11 are delivered to.
>  - interrupts: Interrupt specifiers for interrupt sources.
> +- samsung,s2mps11-acokb-ground: Indicates that ACOKB pin of S2MPS11 PMIC is
> +  connected to the ground so the PMIC must manually set PWRHOLD bit in CTRL1
> +  register to turn off the power. Usually the ACOKB is pulled up to VBATT so
> +  when PWRHOLD pin goes low, the rising ACOKB will trigger power off.
> 
>  Optional nodes:
>  - clocks: s2mps11, s2mps13 and s5m8767 provide three(AP/CP/BT) buffered 32.768
> --
> 2.1.4

Applied 1/3 and 3/3.

Thanks,
Kukjin
