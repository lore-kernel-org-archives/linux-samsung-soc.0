From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH] video: s3c-fb: Add device tree support
Date: Wed, 11 Jan 2012 18:16:54 +0900
Message-ID: <004401ccd041$c2f66100$48e32300$%han@samsung.com>
References: <1326139307-25112-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:65043 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754816Ab2AKJQ5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jan 2012 04:16:57 -0500
In-reply-to: <1326139307-25112-1-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-fbdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: FlorianSchandinat@gmx.de, grant.likely@secretlab.ca, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, 'Jingoo Han' <jg1.han@samsung.com>

Hi, Thomas.

> -----Original Message-----
> From: Thomas Abraham [mailto:thomas.abraham@linaro.org]
> Sent: Tuesday, January 10, 2012 5:02 AM
> To: linux-fbdev@vger.kernel.org; devicetree-discuss@lists.ozlabs.org
> Cc: FlorianSchandinat@gmx.de; grant.likely@secretlab.ca; rob.herring@calxeda.com; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; kgene.kim@samsung.com;
> jg1.han@samsung.com; patches@linaro.org
> Subject: [PATCH] video: s3c-fb: Add device tree support
> 
> Add device tree based discovery support for Samsung's display controller.
> 
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  .../devicetree/bindings/fb/samsung-fb.txt          |  103 ++++++++++
>  drivers/video/s3c-fb.c                             |  209 +++++++++++++++++++-
>  2 files changed, 304 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/fb/samsung-fb.txt
> 
> [...]
>
> +- samsung,fimd-bpp: Specifies the bits per pixel. Two values should be
> +  specified in the following order.
> +    - max-bpp: maximum required bpp for the overlay.
> +    - default-bpp: bpp supported by the overlay.
> [...]
> +		fimd-overlay0 {
> +			samsung,fimd-htiming = <64 16 48 1024>;
> +			samsung,fimd-vtiming = <64 16 3 600>;
> +			samsung,fimd-bpp = <24 32>;
> +		};
> +
> +		fimd-overlay1 {
> +			samsung,fimd-htiming = <64 16 48 200>;
> +			samsung,fimd-vtiming = <64 16 3 100>;
> +			samsung,fimd-bpp = <16 32>;
> +		};
> +	};
In the above 'samsung-fb.txt', the order is defined as max-bpp and default-bpp.
However, <24 32> and <16 32> seems to be wrong.
It should be <32 24> and <32 16>, respectively.
Max bpp would be 32bpp in s3c-fb.

Best regards,
Jingoo Han
