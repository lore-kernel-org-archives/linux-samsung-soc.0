From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4] ARM: EXYNOS: Add MFC device tree support
Date: Wed, 26 Sep 2012 08:54:59 +0200
Message-ID: <1504455.8j02SeYi2o@flatron>
References: <1348337237-15426-1-git-send-email-arun.kk@samsung.com> <1348337237-15426-2-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:54348 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752861Ab2IZGzF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Sep 2012 02:55:05 -0400
Received: by wgbdr13 with SMTP id dr13so229052wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Sep 2012 23:55:03 -0700 (PDT)
In-Reply-To: <1348337237-15426-2-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, k.debski@samsung.com, jtp.park@samsung.com, thomas.abraham@linaro.org, k.lewandowsk@samsung.com, s.nawrocki@samsung.com, ch.naveen@samsung.com, joshi@samsung.com

Hi Arun,

A little nitpick inline.

On Saturday 22 of September 2012 23:37:17 Arun Kumar K wrote:
> This patch adds device tree entry for MFC v6 in the Exynos5
> SoC. Makes the required changes in the clock files and adds
> MFC to the DT device list.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>  .../devicetree/bindings/media/s5p-mfc.txt          |   27 ++++++++++++++
> arch/arm/boot/dts/exynos5250-smdk5250.dts          |    7 ++++
> arch/arm/boot/dts/exynos5250.dtsi                  |    6 +++
>  arch/arm/mach-exynos/Kconfig                       |    1 +
>  arch/arm/mach-exynos/clock-exynos5.c               |    2 +-
>  arch/arm/mach-exynos/common.c                      |   37
> ++++++++++++++++++++ arch/arm/mach-exynos/common.h                     
> |   10 +++++ arch/arm/mach-exynos/mach-exynos5-dt.c             |   16
> ++++++++ 8 files changed, 105 insertions(+), 1 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/s5p-mfc.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt
> b/Documentation/devicetree/bindings/media/s5p-mfc.txt new file mode
> 100644
> index 0000000..f95e775
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
> @@ -0,0 +1,27 @@
> +* Samsung Multi Format Codec (MFC)
> +
> +Multi Format Codec (MFC) is the IP present in Samsung SoCs which
> +supports high resolution decoding and encoding functionalities.
> +The MFC device driver is a v4l2 driver which can encode/decode
> +video raw/elementary streams and has support for all popular
> +video codecs.
> +
> +Required properties:
> +  - compatible : value should be either one among the following
> +	(a) "samsung,mfc-v5" for MFC v5 present in Exynos4 SoCs
> +	(b) "samsung,mfc-v6" for MFC v6 present in Exynos5 SoCs
> +
> +  - reg : Physical base address of the IP registers and length of memory
> +	  mapped region.
> +
> +  - interrupts : MFC interrupt number to the CPU.
> +
> +  - samsung,mfc-r : Base address of the first memory bank used by MFC
> +		    for DMA contiguous memory allocation.
> +
> +  - samsung,mfc-r-size : Size of the first memory bank.
> +
> +  - samsung,mfc-l : Base address of the second memory bank used by MFC
> +		    for DMA contiguous memory allocation.
> +
> +  - samsung,mfc-l-size : Size of the second memory bank.

Maybe the base address and size could be merged into one property with two 
values, as it is done with the reg property? What do you think?

> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> b/arch/arm/boot/dts/exynos5250-smdk5250.dts index 8a5e348..99890ec
> 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -109,4 +109,11 @@
>  	spi_2: spi@12d40000 {
>  		status = "disabled";
>  	};
> +
> +	codec@11000000 {
> +		samsung,mfc-r = <0x43000000>;
> +		samsung,mfc-r-size = <8388608>;
> +		samsung,mfc-l = <0x51000000>;
> +		samsung,mfc-l-size = <8388608>;

It would look like this:

		samsung-mfc-r = <0x43000000 0x800000>;
		samsung-mfc-l = <0x51000000 0x800000>;

Best regards,
Tomasz Figa
