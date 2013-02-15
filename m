From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 5/5] ARM: exynos: dts: Add FIMD DT binding Documentation
Date: Fri, 15 Feb 2013 11:38:00 +0100
Message-ID: <511E1008.6010308@samsung.com>
References: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org>
 <1360912200-26377-6-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39013 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760282Ab3BOKiE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Feb 2013 05:38:04 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI9007YCC460O40@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Feb 2013 10:38:01 +0000 (GMT)
Received: from [106.116.147.32] by eusync2.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0MI900MFFC7DE500@eusync2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Feb 2013 10:38:01 +0000 (GMT)
In-reply-to: <1360912200-26377-6-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Hi,

On 02/15/2013 08:10 AM, Vikas Sajjan wrote:
> Adds FIMD DT binding documentation both SoC and Board, with an example
> 
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  .../devicetree/bindings/drm/exynos/fimd.txt        |   37 ++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/drm/exynos/fimd.txt
> 
> diff --git a/Documentation/devicetree/bindings/drm/exynos/fimd.txt b/Documentation/devicetree/bindings/drm/exynos/fimd.txt
> new file mode 100644
> index 0000000..bec9d07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/exynos/fimd.txt
> @@ -0,0 +1,37 @@
> +Device-Tree bindings for fimd driver
> +
> +FIMD stands for Fully Interactive Mobile Display, is the Display Controller for
> +the Exynos series of SoCs which transfers the image data from a video buffer
> +located in the system memory to an external LCD interface.
> +
> +Required properties:
> +- compatible := value should be "samsung,exynos5-fimd" or "samsung,exynos4-fimd"

What about older SoCs like S5Pv210 ? There is the FIMD IP block in those SoCs
as well. There are also differences in the FIMD IP block across various SoC 
version, so either you need to list the quirks in the bindings or use an
appropriate compatible properties if there are significant differences across 
FIMDs that make them not really compatible.

> +- reg := physical base address of the fimd and length of memory mapped region
> +- interrupt-parent := reference to the interrupt combiner node with phandle
> +- interrupts := interrupt number from the combiner to the cpu

These are actually 3 interrupts. Can you please document what they are
and in what order should be listed in the interrupts property ?

> +- pinctrl := property defining the pinctrl configurations with a phandle
> +- pinctrl-names := name of the pinctrl
> +
> +Optional Properties:
> +- samsung,power-domain := power domain property defined with a phandle
> +- status := property defining the status of the node

I don't think this standard property needs to be documented here.

> +
> +Example:
> +
> +SoC specific DT Entry:
> +
> +	fimd@11c00000 {
> +		compatible = "samsung,exynos4-fimd";
> +		interrupt-parent = <&combiner>;
> +		reg = <0x11c00000 0x20000>;
> +		interrupts = <11 1>, <11 0>, <11 2>;

Why this order exactly ? Because currently the driver expects VSYNC 
interrupt specifier in the first entry and it won't work when you put
any other interrupt specifier there ?

The interrupts order really needs to be specified above, otherwise
you need to look at the bindings implementation in the driver to
figure out why it didn't work when you put the interrupt in different
order... see confused and angry faces of developers ? ... :)

If I'm not mistaken we have "Video Frame" (VSYNC), "I80 Interface" 
and "FIFO Level" interrupts here.

> +	};


Thanks,
-- 
Sylwester Nawrocki
Samsung Poland R&D Center
