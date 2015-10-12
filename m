From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 08/10] drm/exynos: Enable DP clock directly from FIMD
Date: Mon, 12 Oct 2015 22:19:02 +0900
Message-ID: <561BB346.8080403@samsung.com>
References: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
 <1441397752-6672-9-git-send-email-gustavo@padovan.org>
 <55FCDBB6.40807@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34062 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751415AbbJLNTE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Oct 2015 09:19:04 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NW30169LZNQBQ30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Oct 2015 22:19:02 +0900 (KST)
In-reply-to: <55FCDBB6.40807@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Gustavo, please ping~~~

2015=EB=85=84 09=EC=9B=94 19=EC=9D=BC 12:51=EC=97=90 Inki Dae =EC=9D=B4=
(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> Hi Gustavo,
>
> On 2015=EB=85=84 09=EC=9B=94 05=EC=9D=BC 05:15, Gustavo Padovan wrote=
:
>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>
>> Instead of having a .clock_enable callback enable the dp clock direc=
tly
>> from FIMD.
>>
>> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>> ---
>>   drivers/gpu/drm/exynos/exynos_dp_core.c  | 13 -----------
>>   drivers/gpu/drm/exynos/exynos_drm_drv.h  |  5 ----
>>   drivers/gpu/drm/exynos/exynos_drm_fimd.c | 39 +++++++++++++++++---=
------------
>>   3 files changed, 21 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/d=
rm/exynos/exynos_dp_core.c
>> index 6794982..aa11d18 100644
>> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
>> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
>> @@ -37,11 +37,6 @@
>>   #define ctx_from_connector(c)	container_of(c, struct exynos_dp_dev=
ice, \
>>   					connector)
>>
>> -static inline struct exynos_drm_crtc *dp_to_crtc(struct exynos_dp_d=
evice *dp)
>> -{
>> -	return to_exynos_crtc(dp->encoder.crtc);
>> -}
>> -
>>   static inline struct exynos_dp_device *encoder_to_dp(
>>   						struct drm_encoder *e)
>>   {
>> @@ -1068,7 +1063,6 @@ static void exynos_dp_mode_set(struct drm_enco=
der *encoder,
>>   static void exynos_dp_enable(struct drm_encoder *encoder)
>>   {
>>   	struct exynos_dp_device *dp =3D encoder_to_dp(encoder);
>> -	struct exynos_drm_crtc *crtc =3D dp_to_crtc(dp);
>>
>>   	pm_runtime_get_sync(dp->dev);
>>
>> @@ -1079,9 +1073,6 @@ static void exynos_dp_enable(struct drm_encode=
r *encoder)
>>   		}
>>   	}
>>
>> -	if (crtc->ops->clock_enable)
>> -		crtc->ops->clock_enable(dp_to_crtc(dp), true);
>> -
>>   	phy_power_on(dp->phy);
>>   	exynos_dp_init_dp(dp);
>>   	enable_irq(dp->irq);
>> @@ -1091,7 +1082,6 @@ static void exynos_dp_enable(struct drm_encode=
r *encoder)
>>   static void exynos_dp_disable(struct drm_encoder *encoder)
>>   {
>>   	struct exynos_dp_device *dp =3D encoder_to_dp(encoder);
>> -	struct exynos_drm_crtc *crtc =3D dp_to_crtc(dp);
>>
>>   	if (dp->panel) {
>>   		if (drm_panel_disable(dp->panel)) {
>> @@ -1104,9 +1094,6 @@ static void exynos_dp_disable(struct drm_encod=
er *encoder)
>>   	flush_work(&dp->hotplug_work);
>>   	phy_power_off(dp->phy);
>>
>> -	if (crtc->ops->clock_enable)
>> -		crtc->ops->clock_enable(dp_to_crtc(dp), false);
>> -
>>   	if (dp->panel) {
>>   		if (drm_panel_unprepare(dp->panel))
>>   			DRM_ERROR("failed to turnoff the panel\n");
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/d=
rm/exynos/exynos_drm_drv.h
>> index 5f1a4d6..ee60619 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> @@ -96,10 +96,6 @@ struct exynos_drm_plane {
>>    * @disable_plane: disable hardware specific overlay.
>>    * @te_handler: trigger to transfer video image at the tearing eff=
ect
>>    *	synchronization signal if there is a page flip request.
>> - * @clock_enable: optional function enabling/disabling display doma=
in clock,
>> - *	called from exynos-dp driver before powering up (with
>> - *	'enable' argument as true) and after powering down (with
>> - *	'enable' as false).
>>    */
>>   struct exynos_drm_crtc;
>>   struct exynos_drm_crtc_ops {
>> @@ -120,7 +116,6 @@ struct exynos_drm_crtc_ops {
>>   	void (*atomic_flush)(struct exynos_drm_crtc *crtc,
>>   			      struct exynos_drm_plane *plane);
>>   	void (*te_handler)(struct exynos_drm_crtc *crtc);
>> -	void (*clock_enable)(struct exynos_drm_crtc *crtc, bool enable);
>>   };
>>
>>   /*
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/=
drm/exynos/exynos_drm_fimd.c
>> index 0f17ae0..3cf2b80 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> @@ -573,6 +573,23 @@ static void fimd_win_set_colkey(struct fimd_con=
text *ctx, unsigned int win)
>>   	writel(keycon1, ctx->regs + WKEYCON1_BASE(win));
>>   }
>>
>> +static void fimd_dp_clock_enable(struct exynos_drm_crtc *crtc, bool=
 enable)
>> +{
>> +	struct fimd_context *ctx =3D crtc->ctx;
>> +	u32 val;
>> +
>> +	/*
>> +	 * Only Exynos 5250, 5260, 5410 and 542x requires enabling DP/MIE
>> +	 * clock. On these SoCs the bootloader may enable it but any
>> +	 * power domain off/on will reset it to disable state.
>> +	 */
>> +	if (ctx->driver_data !=3D &exynos5_fimd_driver_data)
>> +		return;
>> +
>> +	val =3D enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
>> +	writel(DP_MIE_CLK_DP_ENABLE, ctx->regs + DP_MIE_CLKCON);
>> +}
>> +
>>   /**
>>    * shadow_protect_win() - disable updating values from shadow regi=
sters at vsync
>>    *
>> @@ -735,6 +752,8 @@ static void fimd_enable(struct exynos_drm_crtc *=
crtc)
>>   	if (test_and_clear_bit(0, &ctx->irq_flags))
>>   		fimd_enable_vblank(ctx->crtc);
>>
>> +	fimd_dp_clock_enable(crtc, true);
>
> You are forcing FIMD driver to enable DP clock every time FIMD is
> enabled. Please know that in Exynos Display pipeline, Encoder device
> could be used according to how Display path is configured.
>
> For example,
> FIMD ----- Panel
> FIMD ----- MIPI-DSI ----- Panel
> FIMD ----- DP ----- Panel
> ...
>
> In previous codes, DP clock will be enabled by DP driver even through
> enable callback of the DP clock is registered by FIMD driver to
> fimd_crtc_ops, which means that DP clock can be enabled only in case
> that DP driver is available.
>
> Thanks,
> Inki Dae
>
>> +
>>   	fimd_commit(ctx->crtc);
>>   }
>>
>> @@ -743,6 +762,8 @@ static void fimd_disable(struct exynos_drm_crtc =
*crtc)
>>   	struct fimd_context *ctx =3D crtc->ctx;
>>   	int i;
>>
>> +	fimd_dp_clock_enable(crtc, false);
>> +
>>   	/*
>>   	 * We need to make sure that all windows are disabled before we
>>   	 * suspend that connector. Otherwise we might try to scan from
>> @@ -814,23 +835,6 @@ static void fimd_te_handler(struct exynos_drm_c=
rtc *crtc)
>>   		drm_crtc_handle_vblank(&ctx->crtc->base);
>>   }
>>
>> -static void fimd_dp_clock_enable(struct exynos_drm_crtc *crtc, bool=
 enable)
>> -{
>> -	struct fimd_context *ctx =3D crtc->ctx;
>> -	u32 val;
>> -
>> -	/*
>> -	 * Only Exynos 5250, 5260, 5410 and 542x requires enabling DP/MIE
>> -	 * clock. On these SoCs the bootloader may enable it but any
>> -	 * power domain off/on will reset it to disable state.
>> -	 */
>> -	if (ctx->driver_data !=3D &exynos5_fimd_driver_data)
>> -		return;
>> -
>> -	val =3D enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
>> -	writel(DP_MIE_CLK_DP_ENABLE, ctx->regs + DP_MIE_CLKCON);
>> -}
>> -
>>   static const struct exynos_drm_crtc_ops fimd_crtc_ops =3D {
>>   	.enable =3D fimd_enable,
>>   	.disable =3D fimd_disable,
>> @@ -843,7 +847,6 @@ static const struct exynos_drm_crtc_ops fimd_crt=
c_ops =3D {
>>   	.disable_plane =3D fimd_disable_plane,
>>   	.atomic_flush =3D fimd_atomic_flush,
>>   	.te_handler =3D fimd_te_handler,
>> -	.clock_enable =3D fimd_dp_clock_enable,
>>   };
>>
>>   static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
>>
>
