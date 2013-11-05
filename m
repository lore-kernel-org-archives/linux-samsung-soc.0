From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: Update Samsung sysreg binding document
Date: Tue, 05 Nov 2013 10:43:38 +0100
Message-ID: <5278BDCA.7080609@samsung.com>
References: <1383632302-23535-1-git-send-email-sachin.kamat@linaro.org>
 <1383632302-23535-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:35341 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752072Ab3KEJnq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Nov 2013 04:43:46 -0500
In-reply-to: <1383632302-23535-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com

On 05/11/13 07:18, Sachin Kamat wrote:
> Added a binding example for reference and updated the
> node name. While at it also removed the name description
> as it is not necessary.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

I'm not sure we need an example in each and every binding,
but anyway

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> ---
> Changes since v2:
> * Removed node name description as suggested by Tomasz Figa.
> ---
>  .../devicetree/bindings/arm/samsung/sysreg.txt     |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
> index 5039c0a12f55..0ab3251a6ec2 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
> @@ -1,7 +1,12 @@
>  SAMSUNG S5P/Exynos SoC series System Registers (SYSREG)
>  
>  Properties:
> - - name : should be 'sysreg';
>   - compatible : should contain "samsung,<chip name>-sysreg", "syscon";
>     For Exynos4 SoC series it should be "samsung,exynos4-sysreg", "syscon";
>   - reg : offset and length of the register set.
> +
> +Example:
> +	syscon@10010000 {
> +		compatible = "samsung,exynos4-sysreg", "syscon";
> +		reg = <0x10010000 0x400>;
> +	};

--
Thanks,
Sylwester
