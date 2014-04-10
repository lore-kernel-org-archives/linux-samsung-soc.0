From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/5] drm/exynos: remove unnecessary read for phy
 configuration values
Date: Thu, 10 Apr 2014 19:02:29 +0200
Message-ID: <5346CEA5.5010103@samsung.com>
References: <1396458826-3051-1-git-send-email-rahul.sharma@samsung.com>
 <1396458826-3051-4-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1396458826-3051-4-git-send-email-rahul.sharma@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rahul Sharma <rahul.sharma@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: joshi@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 02.04.2014 19:13, Rahul Sharma wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>
> Cleaning up unnecessary i2c read call after hdmiphy configuration.
> This check is redundant since check for hdmiphy pll lock status
> confirms the correct settings for phy.
>
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
> ---
>   drivers/gpu/drm/exynos/exynos_hdmi.c |   10 ----------
>   1 file changed, 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 47b8c06..5b2cfe7 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1518,7 +1518,6 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
>   	const u8 *hdmiphy_data;
>   	u8 buffer[32];
>   	u8 operation[2];
> -	u8 read_buffer[32] = {0, };
>   	int ret;
>   	int i;
>
> @@ -1558,15 +1557,6 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
>   		return;
>   	}
>
> -	ret = i2c_master_recv(hdata->hdmiphy_port, read_buffer, 32);
> -	if (ret < 0) {
> -		DRM_ERROR("failed to read hdmiphy config\n");
> -		return;
> -	}
> -
> -	for (i = 0; i < ret; i++)
> -		DRM_DEBUG_KMS("hdmiphy[0x%02x] write[0x%02x] - "
> -			"recv [0x%02x]\n", i, buffer[i], read_buffer[i]);
>   }
>
>   static void hdmi_conf_apply(struct hdmi_context *hdata)
>

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz
