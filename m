From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [PATCH 02/18] drm/exynos: use wait_event_timeout() for safety
 usage
Date: Wed, 21 May 2014 11:18:41 +0900
Message-ID: <537C0D01.9030404@samsung.com>
References: <1400048825-6052-1-git-send-email-yj44.cho@samsung.com>
 <1400048825-6052-3-git-send-email-yj44.cho@samsung.com>
 <CAGS+omDx1zLBuE_J9CQW=65WkMKO51eCDzSfjazoQoC15_J=Cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAGS+omDx1zLBuE_J9CQW=65WkMKO51eCDzSfjazoQoC15_J=Cg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene.kim@samsung.com>, s.trumtrar@pengutronix.de
List-Id: linux-samsung-soc@vger.kernel.org

Hi Daniel

Thank you for comments.

On 05/20/2014 07:02 PM, Daniel Kurtz wrote:
> On Wed, May 14, 2014 at 2:26 PM, YoungJun Cho <yj44.cho@samsung.com> wrote:
>>
>> There could be the case that the page flip operation isn't finished correctly
>> with some abnormal condition such as panel reset. So this patch replaces
>> wait_event() with wait_event_timeout() to avoid waiting for page flip completion
>> infinitely.
>
>
> This solution looks like we aren't really handling some conditions
> completely (such as "panel reset"?). In cases where this timeout can
> occur, shouldn't we be clearing pending_flip when we detect that the
> flip will never complete?
>

Nice catch!.

The others except pending_flip issue are done in drm_vblank_off() 
instead of exynos_drm_crtc_finish_pageflip() at this case.

I'll do it for this routine and exynos_drm_crtc_page_flip() also.
There is a leak point in exynos_drm_crtc_page_flip() when 
exynos_drm_crtc_mode_set_commit() is failed.

Thank you.
Best regards YJ

> -Dan
>
>>
>>
>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>> Acked-by: Inki Dae <inki.dae@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_crtc.c |    5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>> index 95c9435..485fa26 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>> @@ -69,8 +69,9 @@ static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
>>
>>          if (mode > DRM_MODE_DPMS_ON) {
>>                  /* wait for the completion of page flip. */
>> -               wait_event(exynos_crtc->pending_flip_queue,
>> -                               atomic_read(&exynos_crtc->pending_flip) == 0);
>> +               wait_event_timeout(exynos_crtc->pending_flip_queue,
>> +                               !atomic_read(&exynos_crtc->pending_flip),
>> +                               HZ/20);
>>                  drm_vblank_off(crtc->dev, exynos_crtc->pipe);
>>          }
>>
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
