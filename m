From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH] drm/exynos: remove hardware overlays disable from fimd probe
Date: Mon, 2 Jun 2014 15:12:20 +0530
Message-ID: <CAPdUM4POJwfe_RyKV+ym=ENgVF+2To0qgS88UGp1ueBD3LH4ig@mail.gmail.com>
References: <1401257471-31994-1-git-send-email-rahul.sharma@samsung.com>
	<538C3FC4.6090509@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:35204 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752724AbaFBJmW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jun 2014 05:42:22 -0400
Received: by mail-we0-f175.google.com with SMTP id p10so4874904wes.34
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Jun 2014 02:42:20 -0700 (PDT)
In-Reply-To: <538C3FC4.6090509@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, "Szyprowski, Marek" <m.szyprowski@samsung.com>

On 2 June 2014 14:41, Andrzej Hajda <a.hajda@samsung.com> wrote:
> Hi Rahul,
>
> On 05/28/2014 08:11 AM, Rahul Sharma wrote:
>> System hangs when FIMD registers are accessed to disable
>> hardware overlays. This is because of the clocks which are
>> not enabled before register access.
>>
>> 'Hardware overlay disable' is cleaned from the FIMD probe.
>>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>
> This patch causes regression on some exynos4210-universal_c210 devices,
> everything works expect colors are incorrect - it seems blue component
> is very dark, almost black.
>

Oh.... Sorry for that. I did not see any problem on 5250/5420/5800. I do not
have setup for 4210. Better we should revert this patch.

Would you please help me by verifying the following patch on 4210? This
is an alternate solution to the same problem.

http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg31426.html

Thanks Andrej, for bringing it to notice.

Regards,
Rahul Sharma

> Regards
> Andrzej
>
>> ---
>> Based on exynos-drm-next branch.
>>
>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |   17 -----------------
>>  1 file changed, 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> index bd30d0c..2ec634f 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> @@ -703,19 +703,6 @@ static void fimd_win_disable(struct exynos_drm_manager *mgr, int zpos)
>>       win_data->enabled = false;
>>  }
>>
>> -static void fimd_clear_win(struct fimd_context *ctx, int win)
>> -{
>> -     writel(0, ctx->regs + WINCON(win));
>> -     writel(0, ctx->regs + VIDOSD_A(win));
>> -     writel(0, ctx->regs + VIDOSD_B(win));
>> -     writel(0, ctx->regs + VIDOSD_C(win));
>> -
>> -     if (win == 1 || win == 2)
>> -             writel(0, ctx->regs + VIDOSD_D(win));
>> -
>> -     fimd_shadow_protect_win(ctx, win, false);
>> -}
>> -
>>  static void fimd_window_suspend(struct exynos_drm_manager *mgr)
>>  {
>>       struct fimd_context *ctx = mgr->ctx;
>> @@ -898,16 +885,12 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
>>  {
>>       struct fimd_context *ctx = fimd_manager.ctx;
>>       struct drm_device *drm_dev = data;
>> -     int win;
>>
>>       fimd_mgr_initialize(&fimd_manager, drm_dev);
>>       exynos_drm_crtc_create(&fimd_manager);
>>       if (ctx->display)
>>               exynos_drm_create_enc_conn(drm_dev, ctx->display);
>>
>> -     for (win = 0; win < WINDOWS_NR; win++)
>> -             fimd_clear_win(ctx, win);
>> -
>>       return 0;
>>
>>  }
>>
>
