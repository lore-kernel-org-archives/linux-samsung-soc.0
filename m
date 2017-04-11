From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v3] drm/exynos: mixer: document YCbCr magic numbers
Date: Tue, 11 Apr 2017 10:01:09 +0200
Message-ID: <f28ce9b0-5162-e433-fcf5-a1d8e3929c68@math.uni-bielefeld.de>
References: <1489155714-13066-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <85a64d59-63d6-54b0-756b-63c36dc85d2b@math.uni-bielefeld.de>
 <CAAQKjZMm3O+PZ9GUsksaTnApwm8n9q8VX0rCAYozT9hG7oNrzQ@mail.gmail.com>
 <CGME20170410102755epcas4p40e9072db5dde36aeecbcb0eebbacd82b@epcas4p4.samsung.com>
 <7ffdd11d-bbdf-321d-fc3c-2d40798e902f@math.uni-bielefeld.de>
 <58EC1048.1030303@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:35753 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751797AbdDKIBM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Apr 2017 04:01:12 -0400
In-Reply-To: <58EC1048.1030303@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Inki Dae <daeinki@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>

Inki Dae wrote:
> 
> 
> 2017년 04월 10일 19:27에 Tobias Jakobi 이(가) 쓴 글:
>> Inki Dae wrote:
>>> 2017-03-29 20:56 GMT+09:00 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:
>>>> Hello Daniel,
>>>>
>>>> same question here. Patch doesn't introduce any functional changes (just
>>>> adds code documentation), so can you merge it through drm-misc?
>>>>
>>>
>>> Sorry for late. Confirmed just now. I will check it on next Monday.
>> You have added the wrong patch (v2 instead of v3).
> 
> Tobias,
> 
> you had posted this patch with other one like below,
> [PATCH v2 1/2] drm/exynos: mixer: simplify mixer_cfg_rgb_fmt()
> [PATCH v2 2/2] drm/exynos: mixer: document YCbCr magic numbers
> 
> And than you have posted it without any comment again, v3,
> [PATCH v3] drm/exynos: mixer: document YCbCr magic numbers
> 
> Please use --cover-letter option to make patch series and keep the patch set to be consistent with previous version.
This is not necessary. There were only changes to 'drm/exynos: mixer:
document YCbCr magic numbers' and we're talking about _two_ patches here
(which can be applied independently).


> 
> I can merge the new one - really trivial - but I think it'd be better you to resend this patch series for other people.
> 
> This patch set has been removed from my tree. Please resend (not v4) this patch set like below,
> [PATCH v3 0/2] drm/exynos: clean up mixer driver??
> [PATCH v3 1/2] drm/exynos: mixer: simplify mixer_cfg_rgb_fmt()
> [PATCH v3 2/2] drm/exynos: mixer: document YCbCr magic numbers
Not necessary, just pick up the two patches which for which I already
pinged you. For you convenience, here are the two on dri-devel patchwork:
https://patchwork.kernel.org/patch/9617085/
https://patchwork.kernel.org/patch/9617493/

- Tobias



> 
> Thanks,
> Inki Dae
> 
>>
>> - Tobias
>>
>>
>>> Thanks,
>>> Inki Dae
>>>
>>>> With best wishes,
>>>> Tobias
>>>>
>>>>
>>>> Tobias Jakobi wrote:
>>>>> The output stage of the mixer uses YCbCr for the internal
>>>>> computations, which is the reason that some registers take
>>>>> YCbCr related data as input. In particular this applies
>>>>> to MXR_BG_COLOR{0,1,2} and MXR_CM_COEFF_{Y,CB,CR}.
>>>>>
>>>>> Document the formatting of the data which we write to
>>>>> these registers.
>>>>>
>>>>> While at it, unify wording of comments in the register header.
>>>>>
>>>>> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
>>>>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>>>> ---
>>>>> Changes in v2:
>>>>> - use floating point values as input for the macros, as
>>>>>   suggested by Andrzej
>>>>> - the floating point values have been tuned to exactly match
>>>>>   the values that are currently used
>>>>>
>>>>> Changes in v3:
>>>>> - use only three digit values (pointed out by Andrzej)
>>>>>
>>>>>  drivers/gpu/drm/exynos/exynos_mixer.c | 33 +++++++++++++++++++++++++--------
>>>>>  drivers/gpu/drm/exynos/regs-mixer.h   |  7 +++++--
>>>>>  2 files changed, 30 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
>>>>> index 41d0c36..9648dd5 100644
>>>>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>>>>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>>>>> @@ -45,6 +45,22 @@
>>>>>  #define MIXER_WIN_NR         3
>>>>>  #define VP_DEFAULT_WIN               2
>>>>>
>>>>> +/*
>>>>> + * Mixer color space conversion coefficient triplet.
>>>>> + * Used for CSC from RGB to YCbCr.
>>>>> + * Each coefficient is a 10-bit fixed point number with
>>>>> + * sign and no integer part, i.e.
>>>>> + * [0:8] = fractional part (representing a value y = x / 2^9)
>>>>> + * [9] = sign
>>>>> + * Negative values are encoded with two's complement.
>>>>> + */
>>>>> +#define MXR_CSC_C(x) ((int)((x) * 512.0) & 0x3ff)
>>>>> +#define MXR_CSC_CT(a0, a1, a2) \
>>>>> +  ((MXR_CSC_C(a0) << 20) | (MXR_CSC_C(a1) << 10) | (MXR_CSC_C(a2) << 0))
>>>>> +
>>>>> +/* YCbCr value, used for mixer background color configuration. */
>>>>> +#define MXR_YCBCR_VAL(y, cb, cr) (((y) << 16) | ((cb) << 8) | ((cr) << 0))
>>>>> +
>>>>>  /* The pixelformats that are natively supported by the mixer. */
>>>>>  #define MXR_FORMAT_RGB565    4
>>>>>  #define MXR_FORMAT_ARGB1555  5
>>>>> @@ -391,13 +407,14 @@ static void mixer_cfg_rgb_fmt(struct mixer_context *ctx, unsigned int height)
>>>>>       case 1080:
>>>>>       default:
>>>>>               val = MXR_CFG_RGB709_16_235;
>>>>> +             /* Configure the BT.709 CSC matrix for full range RGB. */
>>>>>               mixer_reg_write(res, MXR_CM_COEFF_Y,
>>>>> -                             (1 << 30) | (94 << 20) | (314 << 10) |
>>>>> -                             (32 << 0));
>>>>> +                     MXR_CSC_CT( 0.184,  0.614,  0.063) |
>>>>> +                     MXR_CM_COEFF_RGB_FULL);
>>>>>               mixer_reg_write(res, MXR_CM_COEFF_CB,
>>>>> -                             (972 << 20) | (851 << 10) | (225 << 0));
>>>>> +                     MXR_CSC_CT(-0.102, -0.338,  0.440));
>>>>>               mixer_reg_write(res, MXR_CM_COEFF_CR,
>>>>> -                             (225 << 20) | (820 << 10) | (1004 << 0));
>>>>> +                     MXR_CSC_CT( 0.440, -0.399, -0.040));
>>>>>               break;
>>>>>       }
>>>>>
>>>>> @@ -715,10 +732,10 @@ static void mixer_win_reset(struct mixer_context *ctx)
>>>>>       /* reset default layer priority */
>>>>>       mixer_reg_write(res, MXR_LAYER_CFG, 0);
>>>>>
>>>>> -     /* setting background color */
>>>>> -     mixer_reg_write(res, MXR_BG_COLOR0, 0x008080);
>>>>> -     mixer_reg_write(res, MXR_BG_COLOR1, 0x008080);
>>>>> -     mixer_reg_write(res, MXR_BG_COLOR2, 0x008080);
>>>>> +     /* set all background colors to RGB (0,0,0) */
>>>>> +     mixer_reg_write(res, MXR_BG_COLOR0, MXR_YCBCR_VAL(0, 128, 128));
>>>>> +     mixer_reg_write(res, MXR_BG_COLOR1, MXR_YCBCR_VAL(0, 128, 128));
>>>>> +     mixer_reg_write(res, MXR_BG_COLOR2, MXR_YCBCR_VAL(0, 128, 128));
>>>>>
>>>>>       if (test_bit(MXR_BIT_VP_ENABLED, &ctx->flags)) {
>>>>>               /* configuration of Video Processor Registers */
>>>>> diff --git a/drivers/gpu/drm/exynos/regs-mixer.h b/drivers/gpu/drm/exynos/regs-mixer.h
>>>>> index 7f22df5..c311f57 100644
>>>>> --- a/drivers/gpu/drm/exynos/regs-mixer.h
>>>>> +++ b/drivers/gpu/drm/exynos/regs-mixer.h
>>>>> @@ -140,11 +140,11 @@
>>>>>  #define MXR_INT_EN_VSYNC             (1 << 11)
>>>>>  #define MXR_INT_EN_ALL                       (0x0f << 8)
>>>>>
>>>>> -/* bit for MXR_INT_STATUS */
>>>>> +/* bits for MXR_INT_STATUS */
>>>>>  #define MXR_INT_CLEAR_VSYNC          (1 << 11)
>>>>>  #define MXR_INT_STATUS_VSYNC         (1 << 0)
>>>>>
>>>>> -/* bit for MXR_LAYER_CFG */
>>>>> +/* bits for MXR_LAYER_CFG */
>>>>>  #define MXR_LAYER_CFG_GRP1_VAL(x)    MXR_MASK_VAL(x, 11, 8)
>>>>>  #define MXR_LAYER_CFG_GRP1_MASK              MXR_LAYER_CFG_GRP1_VAL(~0)
>>>>>  #define MXR_LAYER_CFG_GRP0_VAL(x)    MXR_MASK_VAL(x, 7, 4)
>>>>> @@ -152,5 +152,8 @@
>>>>>  #define MXR_LAYER_CFG_VP_VAL(x)              MXR_MASK_VAL(x, 3, 0)
>>>>>  #define MXR_LAYER_CFG_VP_MASK                MXR_LAYER_CFG_VP_VAL(~0)
>>>>>
>>>>> +/* bits for MXR_CM_COEFF_Y */
>>>>> +#define MXR_CM_COEFF_RGB_FULL                (1 << 30)
>>>>> +
>>>>>  #endif /* SAMSUNG_REGS_MIXER_H */
>>>>>
>>>>>
>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
