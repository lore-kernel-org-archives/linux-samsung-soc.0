From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC PATCH v2 05/14] ARM: dts: samsung-fimd: add I80 specific
 properties
Date: Fri, 18 Apr 2014 14:32:49 +0200
Message-ID: <53511B71.8090506@samsung.com>
References: <534F67B1.2020001@samsung.com>
 <1397735629-24028-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:17601 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751034AbaDRMc6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Apr 2014 08:32:58 -0400
In-reply-to: <1397735629-24028-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com

Hi again,

On 04/17/2014 01:53 PM, YoungJun Cho wrote:
> In case of using CPU interface panel, the relevant registers should be set.
> So this patch adds relevant dt bindings.
>
> Changelog v2:
> - Changes "samsung,sysreg-phandle" to "samsung,sysreg"
>
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  .../devicetree/bindings/video/samsung-fimd.txt     |    9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/video/samsung-fimd.txt
> index 2dad41b..6ea1adc 100644
> --- a/Documentation/devicetree/bindings/video/samsung-fimd.txt
> +++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
> @@ -44,6 +44,15 @@ Optional Properties:
>  - display-timings: timing settings for FIMD, as described in document [1].
>  		Can be used in case timings cannot be provided otherwise
>  		or to override timings provided by the panel.
> +- samsung,sysreg: handle to syscon used to control the system registers
> +- vidout-i80-ldi: boolean to support i80 interface instead of rgb one
> +- cs-setup: clock cycles for the active period of address signal enable until
> +	chip select is enable in i80 interface
> +- wr-setup: clock cycles for the active period of CS signal enable until
> +	write signal is enable in i80 interface
> +- wr-act: clock cycles for the active period of CS enable in i80 interface
> +- wr-hold: clock cycles for the active period of CS disable until write signal
> +	is disable in i80 interface

As Laurent wrote earlier it would be good to consider providing these
properties
by panel. Panel can pass it to DSI probably via mipi_dsi_device
structure. DSI to FIMD
can use exynos drm_framework probably.
Anyway if you add optional properties please add info about default
value, ie when property
is not present.

Regards
Andrzej

>  
>  The device node can contain 'port' child nodes according to the bindings defined
>  in [2]. The following are properties specific to those nodes:
