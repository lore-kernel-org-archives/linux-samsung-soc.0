From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as SAMSUNG SOC CLOCK DRIVERS
Date: Mon, 22 Aug 2016 12:01:58 +0200
Message-ID: <76aea8a8-cda7-ca9f-54ff-d614d834dde0@samsung.com>
References: <1471524439-8115-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1471524439-8115-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: tomasz.figa@gmail.com, k.kozlowski@samsung.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, chanwoo@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chanwoo,

On 08/18/2016 02:47 PM, Chanwoo Choi wrote:
> Add the myself to the entry of SAMSUNG SOC CLOCK DRIVERS to review
> and test the patches as supporter. I will help them. I can access the all
> datasheet of Exynos SoC and test it on Exynos-based board. I was implemented
> the exynos4415/5433 clock driver as author and handled the exynos3250 clock
> driver. Lastly, adding the missing information of the exynos clock drivers.
> 
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

I'm going to apply this patch with commit message rephrased as below.

"MAINTAINERS: Add myself as SAMSUNG SOC CLOCK DRIVERS co-maintainer

Add myself to the SAMSUNG SOC CLOCK DRIVERS entry, I'm going to review
and test related patches as supporter.  I can access all the datasheet
of Exynos SoC series and can do tests on Exynos based boards.  I have
implemented the exynos4415/5433 clock drivers and co-authored the
exynos3250 clock driver.  While at it, add missing paths of the exynos
clock driver files."

Please let me know if you see any issues with that.

> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 20bb1d00098c..442d6f5c65be 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10233,9 +10233,12 @@ F:	drivers/nfc/s3fwrn5
>  SAMSUNG SOC CLOCK DRIVERS
>  M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
>  M:	Tomasz Figa <tomasz.figa@gmail.com>
> +M:	Chanwoo Choi <cw00.choi@samsung.com>
>  S:	Supported
>  L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
>  F:	drivers/clk/samsung/
> +F:	include/dt-bindings/clock/exynos*.h
> +F:	Documentation/devicetree/bindings/clock/exynos*.txt
>  
>  SAMSUNG SXGBE DRIVERS
>  M:	Byungho An <bh74.an@samsung.com>

