From: Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH v3 13/14] drm: bridge/analogix_dp: move hpd detect to connector detect function
Date: Thu, 20 Aug 2015 16:49:00 +0900
Message-ID: <6E5CEF9B-19D4-4AC4-B5B1-BC667979302D@gmail.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com> <1439995939-18770-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:35428 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751633AbbHTHtI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Aug 2015 03:49:08 -0400
In-Reply-To: <1439995939-18770-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Thierry Reding <treding@nvidia.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, "joe@perches.com" <joe@perches.com>, Russell King <rmk+kernel@arm.linux.org.uk>, "djkurtz@google.com" <djkurtz@google.com>, "dianders@google.com" <dianders@google.com>, "seanpaul@google.com" <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, "ajaynumb@gmail.com" <ajaynumb@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Vincent Palatin <vpalatin@chromium.org>, Mark Yao <mark.yao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel

On 2015. 8. 19., at PM 11:52, Yakir Yang <ykk@rock-chips.com> wrote:
> 


What is the reason to make this patch?

Please make commit message including the reason.

Best regards,
Jingoo Han

> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> ---
> Changes in v3:
> - move dp hpd detect to connector detect function.
> 
> Changes in v2: None
> 
> drivers/gpu/drm/bridge/analogix_dp_core.c | 12 ++++++------
> 1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix_dp_core.c
> index 75dd44a..052b9b3 100644
> --- a/drivers/gpu/drm/bridge/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix_dp_core.c
> @@ -915,12 +915,6 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
>            DRM_ERROR("failed to disable the panel\n");
>    }
> 
> -    ret = analogix_dp_detect_hpd(dp);
> -    if (ret) {
> -        /* Cable has been disconnected, we're done */
> -        return;
> -    }
> -
>    ret = analogix_dp_handle_edid(dp);
>    if (ret) {
>        dev_err(dp->dev, "unable to handle edid\n");
> @@ -953,6 +947,12 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
> static enum drm_connector_status analogix_dp_detect(
>                struct drm_connector *connector, bool force)
> {
> +    struct analogix_dp_device *dp = connector_to_dp(connector);
> +
> +    if (analogix_dp_detect_hpd(dp))
> +        /* Cable has been disconnected, we're done */
> +        return connector_status_disconnected;
> +
>    return connector_status_connected;
> }
> 
> -- 
> 1.9.1
> 
> 
