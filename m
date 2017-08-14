From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 4/7] drm/exynos: propagate info about command mode from
 panel
Date: Mon, 14 Aug 2017 09:14:35 +0200
Message-ID: <88a674ea-4477-2107-5e54-dedd9a23b995@samsung.com>
References: <1492519203-23537-1-git-send-email-a.hajda@samsung.com>
        <CGME20170418124013eucas1p15b1db76e79fb76f825be90793525c9b3@eucas1p1.samsung.com>
        <1492519203-23537-5-git-send-email-a.hajda@samsung.com>
        <59804EAD.5020009@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:49552 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751459AbdHNHOk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Aug 2017 03:14:40 -0400
In-reply-to: <59804EAD.5020009@samsung.com>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

On 01.08.2017 11:49, Inki Dae wrote:
>
> 2017년 04월 18일 21:40에 Andrzej Hajda 이(가) 쓴 글:
>> mipi_dsi framework provides information about panel's mode of work.
>> This info should be propagated upstream to configure all elements of
>> the pipeline. As CRTC is the common nominator of the pipeline we can put
>> such info into its structures.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h | 1 +
>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 ++
>>  2 files changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> index 527bf1d..96b9d49 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> @@ -165,6 +165,7 @@ struct exynos_drm_crtc {
>>  	const struct exynos_drm_crtc_ops	*ops;
>>  	void				*ctx;
>>  	struct exynos_drm_clk		*pipe_clk;
>> +	bool				i80_mode : 1;
>>  };
>>  
>>  static inline void exynos_drm_pipe_clk_enable(struct exynos_drm_crtc *crtc,
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> index 515090f..79df1c9 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> @@ -1545,6 +1545,8 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>>  		drm_panel_attach(dsi->panel, &dsi->connector);
>>  		dsi->connector.status = connector_status_connected;
>>  	}
>> +	exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
>> +			!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
> No place to use i80_mode in this patch. Seems this patch, patch 5 and portion of using i80_mode in patch 6 should become one patch. 

I have tried to separate propagation of panel mode of work (in DSI
driver) from using this info in upstream drivers (MIC, DECON).
But if you prefer I can combine it into one patch.

Regards
Andrzej

>
> Thanks,
> Inki Dae
>
>>  
>>  	mutex_unlock(&drm->mode_config.mutex);
>>  
>>
>
