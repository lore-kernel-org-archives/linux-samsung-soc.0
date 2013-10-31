From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: Update Samsung sysreg binding document
Date: Thu, 31 Oct 2013 15:11:05 +0100
Message-ID: <1984328.2sa8SvBFda@amdc1227>
References: <1383194814-18897-1-git-send-email-sachin.kamat@linaro.org>
 <1383194814-18897-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:28357 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754427Ab3JaOLJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Oct 2013 10:11:09 -0400
In-reply-to: <1383194814-18897-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com

Hi Sachin,

On Thursday 31 of October 2013 10:16:54 Sachin Kamat wrote:
> Added a binding example for reference and updated the
> node name.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  .../devicetree/bindings/arm/samsung/sysreg.txt     |    8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
> index 5039c0a12f55..f165567a9df0 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
> @@ -1,7 +1,13 @@
>  SAMSUNG S5P/Exynos SoC series System Registers (SYSREG)
>  
>  Properties:
> - - name : should be 'sysreg';
> + - name : should be 'syscon';

I didn't notice this before, but a device binding should not rather
require any specific name of its top level node, so I'd simply remove this
line.

Otherwise the patch looks fine.

Best regards,
Tomasz
