From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 8/9] drm/exynos/fimd: use polarization flags provided by
 drm_display_mode
Date: Thu, 20 Mar 2014 08:01:41 +0100
Message-ID: <532A9255.2030403@samsung.com>
References: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
 <1395052045-23848-9-git-send-email-a.hajda@samsung.com>
 <CAAQKjZOh-qFEn3ex7YwCRDwOjpV=s-8JGj68Yx7qOpS+oy2-ww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAAQKjZOh-qFEn3ex7YwCRDwOjpV=s-8JGj68Yx7qOpS+oy2-ww@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, DRI mailing list <dri-devel@lists.freedesktop.org>, Denis Carikli <denis@eukrea.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 03/20/2014 07:03 AM, Inki Dae wrote:
> Thanks for your contributions,
> 
> 
> 2014-03-17 19:27 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
>> The patch replaces fimd private bindings for signal polarization by
>> polarization flags provided by drm_display_mode.
>>
> 
> This patch needs below patch not merged yet,
>      drm: drm_display_mode: add signal polarity flags
> 
> So let me pick up all of your path series except for patch 7 and 8.
> And for these two patches, later.
> 
> Your opinion?

Yes, please do it.

Regards
Andrzej

> 
> Thanks,
> Inki Dae
> 
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 12 +++++-------
>>  1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> index 15d6b37..dbfad4e 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> @@ -115,7 +115,6 @@ struct fimd_context {
>>         unsigned int                    default_win;
>>         unsigned long                   irq_flags;
>>         u32                             vidcon0;
>> -       u32                             vidcon1;
>>         bool                            suspended;
>>         int                             pipe;
>>         wait_queue_head_t               wait_vsync_queue;
>> @@ -232,7 +231,11 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
>>                 return;
>>
>>         /* setup polarity values */
>> -       vidcon1 = ctx->vidcon1;
>> +       vidcon1 = 0;
>> +       if (mode->pol_flags & DRM_MODE_FLAG_POL_DE_NEGEDGE)
>> +               vidcon1 |= VIDCON1_INV_VDEN;
>> +       if (mode->pol_flags & DRM_MODE_FLAG_POL_PIXDATA_NEGEDGE)
>> +               vidcon1 |= VIDCON1_INV_VCLK;
>>         if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>>                 vidcon1 |= VIDCON1_INV_VSYNC;
>>         if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>> @@ -875,11 +878,6 @@ static int fimd_probe(struct platform_device *pdev)
>>         ctx->dev = dev;
>>         ctx->suspended = true;
>>
>> -       if (of_property_read_bool(dev->of_node, "samsung,invert-vden"))
>> -               ctx->vidcon1 |= VIDCON1_INV_VDEN;
>> -       if (of_property_read_bool(dev->of_node, "samsung,invert-vclk"))
>> -               ctx->vidcon1 |= VIDCON1_INV_VCLK;
>> -
>>         ctx->bus_clk = devm_clk_get(dev, "fimd");
>>         if (IS_ERR(ctx->bus_clk)) {
>>                 dev_err(dev, "failed to get bus clock\n");
>> --
>> 1.8.3.2
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
