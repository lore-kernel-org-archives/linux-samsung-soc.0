From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] media: Doc add missing documentation for
 samsung,exynos4212-jpeg
Date: Sun, 17 Jul 2016 15:26:04 -0500
Message-ID: <20160717202522.GA8777@rob-hp-laptop>
References: <1468620627-9750-1-git-send-email-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1468620627-9750-1-git-send-email-shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jul 15, 2016 at 04:10:27PM -0600, Shuah Khan wrote:
> Add add missing documentation for samsung,exynos4212-jpeg codec,
> reorder entries to improve readability and make it easier to add
> new entries.
> 
> samsung,exynos4212-jpeg and samsung,exynos4210-jpeg are identical,
> hence add samsung,exynos4212-jpeg as deprecated in the documentation.
> 
> Signed-off-by: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> ---
> 
> Changes since v1:
> - Added samsung,exynos4212-jpeg as deprecated
> 
>  Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt b/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
> index 38941db..c5399e7 100644
> --- a/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
> +++ b/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
> @@ -3,9 +3,11 @@ Samsung S5P/EXYNOS SoC series JPEG codec
>  Required properties:
>  
>  - compatible	: should be one of:
> -		  "samsung,s5pv210-jpeg", "samsung,exynos4210-jpeg",
> -		  "samsung,exynos3250-jpeg", "samsung,exynos5420-jpeg",
> +		  "samsung,s5pv210-jpeg", "samsung,exynos3250-jpeg",
> +		  "samsung,exynos4210-jpeg", "samsung,exynos5420-jpeg",
>  		  "samsung,exynos5433-jpeg";
> +
> +		  (Deprecated: "samsung,exynos4212-jpeg").

Since you are reformatting, one compatible per line (unless multiple 
apply) is preferred.

>  - reg		: address and length of the JPEG codec IP register set;
>  - interrupts	: specifies the JPEG codec IP interrupt;
>  - clock-names   : should contain:
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
