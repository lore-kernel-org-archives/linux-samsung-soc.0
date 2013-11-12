From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v3 2/2] ARM: dts: Update Samsung sysreg binding document
Date: Tue, 12 Nov 2013 19:39:14 +0900
Message-ID: <086201cedf93$6e344930$4a9cdb90$@org>
References: <1383632302-23535-1-git-send-email-sachin.kamat@linaro.org>
 <1383632302-23535-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34465 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752027Ab3KLKjQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 05:39:16 -0500
In-reply-to: <1383632302-23535-2-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, t.figa@samsung.com

Sachin Kamat wrote:
> 
> Added a binding example for reference and updated the
> node name. While at it also removed the name description
> as it is not necessary.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> Changes since v2:
> * Removed node name description as suggested by Tomasz Figa.
> ---
>  .../devicetree/bindings/arm/samsung/sysreg.txt     |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
> b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
> index 5039c0a12f55..0ab3251a6ec2 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
> @@ -1,7 +1,12 @@
>  SAMSUNG S5P/Exynos SoC series System Registers (SYSREG)
> 
>  Properties:
> - - name : should be 'sysreg';
>   - compatible : should contain "samsung,<chip name>-sysreg", "syscon";
>     For Exynos4 SoC series it should be "samsung,exynos4-sysreg",
"syscon";
>   - reg : offset and length of the register set.
> +
> +Example:
> +	syscon@10010000 {
> +		compatible = "samsung,exynos4-sysreg", "syscon";
> +		reg = <0x10010000 0x400>;
> +	};
> --
> 1.7.9.5

Looks OK to me.

DT guys, shall I pick this into Samsung tree or not?

Thanks,
Kukjin
