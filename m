From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH V9 10/14] Documentation: devicetree: Add vendor prefix for parade
Date: Wed, 4 Feb 2015 09:12:26 -0600
Message-ID: <CAL_Jsq+1uE6V5MvoBbvY=9WgCCoQR4WoZ64GNA-HtXi=xU04PA@mail.gmail.com>
References: <1421771935-31618-1-git-send-email-ajaykumar.rs@samsung.com> <1421771935-31618-11-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:34407 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755127AbbBDPMs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Feb 2015 10:12:48 -0500
In-Reply-To: <1421771935-31618-11-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: dri-devel@lists.freedesktop.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, seanpaul@google.com, daniel.vetter@ffwll.ch, Jingoo Han <jg1.han@samsung.com>, InKi Dae <inki.dae@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, ajaynumb@gmail.com, bhushan.r@samsung.com, prashanth.g@samsung.com

On Tue, Jan 20, 2015 at 10:38 AM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> ps8622 eDP-LVDS converter bridge chip is from parade technologies
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Tested-by: Rahul Sharma <rahul.sharma@samsung.com>
> Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Tested-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> Tested-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 4df1d78..eca48be 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -125,6 +125,7 @@ nxp NXP Semiconductors
>  onnn   ON Semiconductor Corp.
>  opencores      OpenCores.org
>  panasonic      Panasonic Corporation
> +parade Parade Technologies Inc.
>  pericom        Pericom Technology Inc.
>  phytec PHYTEC Messtechnik GmbH
>  picochip       Picochip Ltd
> --
> 1.7.9.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
