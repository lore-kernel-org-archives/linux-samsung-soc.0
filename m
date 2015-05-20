From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH 1/2] drm/exynos: calculate vrefresh instead of use a fixed value
Date: Wed, 20 May 2015 18:16:06 +0100
Message-ID: <CAPj87rOTp48jTi=67Zt3nyOyiqtiV7f-pueqNBrC6RVnB9r59Q@mail.gmail.com>
References: <1432132428-13519-1-git-send-email-gustavo@padovan.org>
	<1cc31b31acff58a75e86ceec3f5d1102@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:38112 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752344AbbETRQH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 May 2015 13:16:07 -0400
Received: by igcau1 with SMTP id au1so45042140igc.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 May 2015 10:16:07 -0700 (PDT)
In-Reply-To: <1cc31b31acff58a75e86ceec3f5d1102@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, InKi Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

On 20 May 2015 at 17:58, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> On 2015-05-20 16:33, Gustavo Padovan wrote:
>> When mode's vrefresh is zero we should ask DRM core to calculate vrefresh
>> for us so we can get the correct value instead of relying on fixed value
>> defined in a macro.
>>
>> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> index 9819fa6..08f7197 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> @@ -42,7 +42,6 @@
>>   * CPU Interface.
>>   */
>>
>> -#define FIMD_DEFAULT_FRAMERATE 60
>>  #define MIN_FB_WIDTH_FOR_16WORD_BURST 128
>>
>>  /* position control register for hardware window 0, 2 ~ 4.*/
>> @@ -329,7 +328,7 @@ static bool fimd_mode_fixup(struct exynos_drm_crtc
>> *crtc,
>>                 struct drm_display_mode *adjusted_mode)
>>  {
>>         if (adjusted_mode->vrefresh == 0)
>
> Well, I'm not completly sure how this all works, but shouldn't we check
> 'mode' here, and not 'adjusted_mode'?

adjusted_mode is fine; it is pre-populated with the value from mode.
'mode' itself _must not_ be modified.

Mind you, this is missing a hunk to reject entirely invalid modes, i.e.:
if (adjusted_mode->vrefresh == 0)
        adjusted_mode->vrefresh = drm_mode_vrefresh(adjusted_mode);
if (adjusted_mode->vrefresh == 0)
        return false;

Cheers,
Daniel
