From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] media: Doc add missing documentation for
 samsung,exynos4212-jpeg
Date: Fri, 15 Jul 2016 09:28:58 +0200
Message-ID: <578890BA.8040101@samsung.com>
References: <1468526499-8840-1-git-send-email-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1468526499-8840-1-git-send-email-shuahkh@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, kgene@kernel.org, mchehab@osg.samsung.com, andrzej.p@samsung.com, j.anaszewski@samsung.com, hans.verkuil@cisco.com
Cc: javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 07/14/2016 10:01 PM, Shuah Khan wrote:
> Add add missing documentation for samsung,exynos4212-jpeg codec,
> reorder entries to improve readability and make it easier to add
> new entries.
> 
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt b/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
> index 38941db..093614c 100644
> --- a/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
> +++ b/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
> @@ -3,9 +3,9 @@ Samsung S5P/EXYNOS SoC series JPEG codec
>  Required properties:
>  
>  - compatible	: should be one of:
> -		  "samsung,s5pv210-jpeg", "samsung,exynos4210-jpeg",
> -		  "samsung,exynos3250-jpeg", "samsung,exynos5420-jpeg",
> -		  "samsung,exynos5433-jpeg";
> +		  "samsung,s5pv210-jpeg", "samsung,exynos3250-jpeg",
> +		  "samsung,exynos4210-jpeg", "samsung,exynos4212-jpeg",
> +		  "samsung,exynos5420-jpeg", "samsung,exynos5433-jpeg";

I am not convinced that this is needed because exynos4212-jpeg is equal
to exynos4210-jpeg... It is a little bit weird because Jacek's commit
3246fdaa0ac2d9 ("[media] s5p-jpeg: Add support for Exynos3250 SoC")
changed the driver data for Exynos4210 from S5P to Exynos4 without
explaining it... However if these compatibles are exactly equal then
only one should be preferred. It makes everything easier. Second can be
still documented e.g. as deprecated.

Best regards,
Krzysztof
