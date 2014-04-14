From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH]  drm: exynos: hdmi: simplify extracting hpd-gpio from DT
Date: Mon, 14 Apr 2014 21:05:27 +0900
Message-ID: <534BCF07.9060703@samsung.com>
References: <534BB34F.7040308@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63429 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754482AbaDNMFW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 08:05:22 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4000HW5S8W3090@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Apr 2014 21:05:20 +0900 (KST)
In-reply-to: <534BB34F.7040308@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Stanislawski <t.stanislaws@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, =?UTF-8?B?6rmA7Iq57Jqw?= <sw0312.kim@samsung.com>, =?UTF-8?B?J+uwleqyveuvvCc=?= <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, =?UTF-8?B?6rmA6rWt7KeE?= <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Tomasz,

On 04/14/2014 07:07 PM, Tomasz Stanislawski wrote:
> This patch eliminates redundant checks while retrieving HPD gpio from DT during
> HDMI's probe().
>
> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
> ---
>   drivers/gpu/drm/exynos/exynos_hdmi.c |   13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index e1a2e88..300c2af 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -2011,23 +2011,18 @@ static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
>   {
>   	struct device_node *np = dev->of_node;
>   	struct s5p_hdmi_platform_data *pd;
> -	u32 value;
>
>   	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
>   	if (!pd)
> -		goto err_data;
> +		return NULL;
>
> -	if (!of_find_property(np, "hpd-gpio", &value)) {
> +	pd->hpd_gpio = of_get_named_gpio_flags(np, "hpd-gpio", 0, NULL);

This is same with
pd->hpd_gpio = of_get_named_gpio(np, "hpd-gpio", 0);

> +	if (pd->hpd_gpio < 0) {

How about use gpio_is_valid()?

>   		DRM_ERROR("no hpd gpio property found\n");
> -		goto err_data;
> +		return NULL;
>   	}
>
> -	pd->hpd_gpio = of_get_named_gpio(np, "hpd-gpio", 0);
> -
>   	return pd;
> -
> -err_data:
> -	return NULL;
>   }
>
>   static struct of_device_id hdmi_match_types[] = {
>
>

Thanks.
