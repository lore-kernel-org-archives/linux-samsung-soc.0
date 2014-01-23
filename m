From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [RFC PATCH 1/9] drm/exynos: correct timing porch conversion
Date: Thu, 23 Jan 2014 11:01:56 +0800
Message-ID: <CAGS+omBgp5SZAcnkELWw3n_rStHY9tgoBR_yQwdZAH_0WWg_0Q@mail.gmail.com>
References: <1390401336-22915-1-git-send-email-a.hajda@samsung.com>
	<1390401336-22915-2-git-send-email-a.hajda@samsung.com>
	<52DFDF10.20100@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <52DFDF10.20100@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dri-devel <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 22, 2014 at 11:09 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:
> Hi,
>
> It seems I have not added description to this patch.
> In this patch porch is calculated in compatible way to
> drm_display_mode_from_videomode core function.
> The way it was seems to me incorrect and it did not work on my hw.
>
> Anyway this patch could be merged with Sean's patches, if he agrees.
>
> Regards
> Andrzej
>
> On 01/22/2014 03:35 PM, Andrzej Hajda wrote:
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Yes, it does make more sense than just arbitrarily assigning half of
the non-sync blank period to the back porch, and the remainder to the
front porch.
With your follow-on commit message added, this is:

Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>

>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 11 ++++-------
>>  1 file changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> index 8caaac2..b611f33 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> @@ -538,21 +538,18 @@ static void fimd_mode_set(struct exynos_drm_manager *mgr,
>>  {
>>       struct fimd_context *ctx = mgr->ctx;
>>       struct fimd_mode_data *mode = &ctx->mode;
>> -     int hblank, vblank;
>>
>> -     vblank = in_mode->crtc_vblank_end - in_mode->crtc_vblank_start;
>>       mode->vtotal = in_mode->crtc_vtotal;
>>       mode->vdisplay = in_mode->crtc_vdisplay;
>>       mode->vsync_len = in_mode->crtc_vsync_end - in_mode->crtc_vsync_start;
>> -     mode->vbpd = (vblank - mode->vsync_len) / 2;
>> -     mode->vfpd = vblank - mode->vsync_len - mode->vbpd;
>> +     mode->vbpd = in_mode->crtc_vtotal - in_mode->crtc_vsync_end;
>> +     mode->vfpd = in_mode->crtc_vsync_start - in_mode->crtc_vdisplay;
>>
>> -     hblank = in_mode->crtc_hblank_end - in_mode->crtc_hblank_start;
>>       mode->htotal = in_mode->crtc_htotal;
>>       mode->hdisplay = in_mode->crtc_hdisplay;
>>       mode->hsync_len = in_mode->crtc_hsync_end - in_mode->crtc_hsync_start;
>> -     mode->hbpd = (hblank - mode->hsync_len) / 2;
>> -     mode->hfpd = hblank - mode->hsync_len - mode->hbpd;
>> +     mode->hbpd = in_mode->crtc_htotal - in_mode->crtc_hsync_end;
>> +     mode->hfpd = in_mode->crtc_hsync_start - in_mode->crtc_hdisplay;
>>
>>       mode->clkdiv = fimd_calc_clkdiv(ctx, in_mode);
>>
>>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
