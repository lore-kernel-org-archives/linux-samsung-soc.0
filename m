From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer support
Date: Thu, 24 Jul 2014 12:23:36 +0200
Message-ID: <53D0DEA8.1090603@samsung.com>
References: <1405680964-6869-1-git-send-email-inki.dae@samsung.com>
 <1405680964-6869-2-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35595 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933095AbaGXKXn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jul 2014 06:23:43 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N9700J2YOVBB700@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Jul 2014 11:23:35 +0100 (BST)
In-reply-to: <1405680964-6869-2-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Thierry Reding <treding@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>

Hi Inki,

+CC: Thierry and Alexandre

On 07/18/2014 12:56 PM, Inki Dae wrote:
> This patch adds below two flags for LPM transfer, and it attaches LPM flags
> to a msg in accordance with master's mode_flags set by LCD Panel driver.
>
> MIPI_DSI_MODE_CMD_LPM: low power command transfer
> MIPI_DSI_MODE_VIDEO_LPM: low power video transfer
What is the difference between these two?
Why not just MIPI_DSI_MODE_LPM combined optionally with
MIPI_DSI_MODE_VIDEO ?
Anyway as I understand the only role of this flag is to always trigger
MIPI_DSI_MSG_USE_LPM flag in DSI message. Maybe better is to check both
flags in DSI host, using some helper function.

>
> MIPI DSI spec says,
>      "the host processor controls the desired mode of clock operation.
>       Host protocol and applications control Clock Lane operating mode
>       (High Speed or Low Power mode). System designers are responsible
>       for understanding the clock requirements for peripherals attached
>       to DSI and controlling clock behavior in accordance with those
>       requirements."
>
> Some LCD Panel devices, nt35502a, would need LPM transfer support
> because they should receive some initial commands with LPM by default
> hardware setting.

It would be good to see usage of this flag in the driver. Is it possible
to post it?

I have posted few months ago TC358764 driver[1] which also uses LPM for
initialization, have you look at it.

[1]:
http://lists.freedesktop.org/archives/dri-devel/2014-February/053713.html

Regards
Andrzej

>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c |    3 +++
>  include/drm/drm_mipi_dsi.h     |    4 ++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index e633df2..6b2bbda 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -232,6 +232,9 @@ int mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, unsigned int channel,
>  		break;
>  	}
>  
> +	if (dsi->mode_flags & MIPI_DSI_MODE_CMD_LPM)
> +		msg.flags = MIPI_DSI_MSG_USE_LPM;
> +
>  	return ops->transfer(dsi->host, &msg);
>  }
>  EXPORT_SYMBOL(mipi_dsi_dcs_write);
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 944f33f..1c41e49 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -94,6 +94,10 @@ void mipi_dsi_host_unregister(struct mipi_dsi_host *host);
>  #define MIPI_DSI_MODE_VSYNC_FLUSH	BIT(8)
>  /* disable EoT packets in HS mode */
>  #define MIPI_DSI_MODE_EOT_PACKET	BIT(9)
> +/* command low power mode */
> +#define MIPI_DSI_MODE_CMD_LPM		BIT(10)
> +/* video low power mode */
> +#define MIPI_DSI_MODE_VIDEO_LPM		BIT(11)
>  
>  enum mipi_dsi_pixel_format {
>  	MIPI_DSI_FMT_RGB888,
