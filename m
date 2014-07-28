From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Mon, 28 Jul 2014 18:09:58 +0200
Message-ID: <53D675D6.2000309@samsung.com>
References: <1406512857-7213-1-git-send-email-inki.dae@samsung.com>
 <1406512857-7213-2-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1406512857-7213-2-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, treding@nvidia.com
List-Id: linux-samsung-soc@vger.kernel.org

On 07/28/2014 04:00 AM, Inki Dae wrote:
> This patch adds below two flags for LPM transfer, and it attaches LPM flags
> to a msg in accordance with master's mode_flags set by LCD Panel driver.
> 
> MIPI_DSI_MODE_CMD_LPM
> - If this flag is set by Panel driver, MIPI-DSI controller will tranfer
> command data to Panel device in Low Power Mode.

What do you mean by command data? It could be:
- all transfer in command mode of operations,
- transfer initialized by the driver by writing to DSIM registers.

> 
> MIPI_DSI_MODE_VIDEO_LPM
> - If this flag is set by Panel driver, MIPI-DSI controller will tranfer
> image data to Panel device in Low Power Mode.

What is the meaning of this flag in case of command mode of operation?

Maybe it would be better to create flags based on source of data/FIFOs:
- commands send by SFR registers,
- commands generated from data sent from Display Controller.


> 
> And above two flags can be combined together to transfer command and video
> data to Panel device.
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


Is this requirement for initial commands, or for all commands.
Btw what is the mode of operation of nt35502a? What flags do you need
for it?



> 
> Changelog v2: just add more descriptions.
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

Shouldn't this be also the same for dcs read?

Anyway I think check in the DSIM should be used instead, as panel driver
can issue other dsi transfers without MIPI_DSI_MSG_USE_LPM flag set.

Regards
Andrzej


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
> 
