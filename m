From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 04/17] drm/amdgpu: removed optional dummy encoder
 mode_fixup function.
Date: Fri, 12 Feb 2016 11:31:04 -0500
Message-ID: <CADnq5_N1smWVyhC68fwS4DO_E9NJ=ztSZMaSoZ3YKvSCtaM8Zg@mail.gmail.com>
References: <daniel.vetter@ffwll.ch,>
	<1455285069-2819-1-git-send-email-palminha@synopsys.com>
	<1455285069-2819-5-git-send-email-palminha@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f194.google.com ([209.85.160.194]:34458 "EHLO
	mail-yk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751652AbcBLQbE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 11:31:04 -0500
Received: by mail-yk0-f194.google.com with SMTP id z7so2529413yka.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Feb 2016 08:31:04 -0800 (PST)
In-Reply-To: <1455285069-2819-5-git-send-email-palminha@synopsys.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, jingoohan1@gmail.com, virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org, kgene@kernel.org, vincent.abriou@st.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Feb 12, 2016 at 8:50 AM, Carlos Palminha
<CARLOS.PALMINHA@synopsys.com> wrote:
> ---
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c | 8 --------
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c | 8 --------
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c  | 8 --------
>  3 files changed, 24 deletions(-)

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index 093599a..3483018 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -3624,16 +3624,8 @@ dce_v10_0_ext_dpms(struct drm_encoder *encoder, int mode)
>
>  }
>
> -static bool dce_v10_0_ext_mode_fixup(struct drm_encoder *encoder,
> -                                   const struct drm_display_mode *mode,
> -                                   struct drm_display_mode *adjusted_mode)
> -{
> -       return true;
> -}
> -
>  static const struct drm_encoder_helper_funcs dce_v10_0_ext_helper_funcs = {
>         .dpms = dce_v10_0_ext_dpms,
> -       .mode_fixup = dce_v10_0_ext_mode_fixup,
>         .prepare = dce_v10_0_ext_prepare,
>         .mode_set = dce_v10_0_ext_mode_set,
>         .commit = dce_v10_0_ext_commit,
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index 8e67249..36deea1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -3619,16 +3619,8 @@ dce_v11_0_ext_dpms(struct drm_encoder *encoder, int mode)
>
>  }
>
> -static bool dce_v11_0_ext_mode_fixup(struct drm_encoder *encoder,
> -                                   const struct drm_display_mode *mode,
> -                                   struct drm_display_mode *adjusted_mode)
> -{
> -       return true;
> -}
> -
>  static const struct drm_encoder_helper_funcs dce_v11_0_ext_helper_funcs = {
>         .dpms = dce_v11_0_ext_dpms,
> -       .mode_fixup = dce_v11_0_ext_mode_fixup,
>         .prepare = dce_v11_0_ext_prepare,
>         .mode_set = dce_v11_0_ext_mode_set,
>         .commit = dce_v11_0_ext_commit,
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index d0e128c..25dd8b6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -3554,16 +3554,8 @@ dce_v8_0_ext_dpms(struct drm_encoder *encoder, int mode)
>
>  }
>
> -static bool dce_v8_0_ext_mode_fixup(struct drm_encoder *encoder,
> -                                   const struct drm_display_mode *mode,
> -                                   struct drm_display_mode *adjusted_mode)
> -{
> -       return true;
> -}
> -
>  static const struct drm_encoder_helper_funcs dce_v8_0_ext_helper_funcs = {
>         .dpms = dce_v8_0_ext_dpms,
> -       .mode_fixup = dce_v8_0_ext_mode_fixup,
>         .prepare = dce_v8_0_ext_prepare,
>         .mode_set = dce_v8_0_ext_mode_set,
>         .commit = dce_v8_0_ext_commit,
> --
> 2.5.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
