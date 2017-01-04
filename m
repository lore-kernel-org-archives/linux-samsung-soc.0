From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v5 0/3] Add support for the S6E3HA2 panel on TM2 board
Date: Wed, 04 Jan 2017 18:58:35 +0900
Message-ID: <20170104095835.etmu26rb5xeudqq2@gangnam.samsung>
References: <CGME20170104081520epcas1p42dd46f1d13adfde20a2559bd5c1cbd3d@epcas1p4.samsung.com>
 <1483517711-23849-1-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33071 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967450AbdADJ6l (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 04:58:41 -0500
Content-disposition: inline
In-reply-to: <1483517711-23849-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: robh@kernel.org, thierry.reding@gmail.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, inki.dae@samsung.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.hajda@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com

Hi Hoegeun,

On Wed, Jan 04, 2017 at 05:15:08PM +0900, Hoegeun Kwon wrote:
> Purpose of this patch is add support for S6E3HA2 AMOLED panel on
> the TM2 board. The first patch adds support for S6E3HA2 panel
> device tree document and driver, the second patch add support for
> S6E3HA2 panel device tree.
> 
> Change for V5:
> - The V5 has only one fix in V4 below.
> - Removed the enable check of the mic driver in mode_set
>   callback, because mode_set should be performed every time.
> 
> Changes for V4:
> - Removed display-timings in devicetree, the display-timings has
>   been fixed to be provided by the device driver.
> - Added the mode_set callback function into exynos_drm_mic,
>   because the exynos_drm_mic driver can not parse a videomode
>   struct by removing the display-timings from the devicetree.

Next time, please add the full history, from "Changes for V1".
Moreover in this patchset you haven't added the
"Tested-by: Chanwoo..." in patch 2 and 3.

Andi

> 
> Hoegeun Kwon (2):
>   drm/exynos: mic: Add mode_set callback function
>   drm/panel: Add support for S6E3HA2 panel driver on TM2 board
> 
> Hyungwon Hwang (1):
>   arm64: dts: exynos: Add support for S6E3HA2 panel device on TM2 board
> 
>  .../bindings/display/panel/samsung,s6e3ha2.txt     |  40 ++
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      |  17 +
>  drivers/gpu/drm/exynos/exynos_drm_mic.c            |  30 +-
>  drivers/gpu/drm/panel/Kconfig                      |   6 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      | 741 +++++++++++++++++++++
>  6 files changed, 824 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
>  create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> 
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
