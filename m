From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 14/17] drm/radeon: removed optional dummy encoder
 mode_fixup function.
Date: Fri, 12 Feb 2016 11:31:19 -0500
Message-ID: <CADnq5_PchtK9bYHSAYjf6mnJ77+O9VzvbNxsoSLcafqYrhBF3A@mail.gmail.com>
References: <1455285350-3403-1-git-send-email-palminha@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:34201 "EHLO
	mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751801AbcBLQbU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 11:31:20 -0500
Received: by mail-yw0-f194.google.com with SMTP id f6so527293ywa.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Feb 2016 08:31:20 -0800 (PST)
In-Reply-To: <1455285350-3403-1-git-send-email-palminha@synopsys.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, jingoohan1@gmail.com, virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org, kgene@kernel.org, vincent.abriou@st.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Feb 12, 2016 at 8:55 AM, Carlos Palminha
<CARLOS.PALMINHA@synopsys.com> wrote:
> ---
>  drivers/gpu/drm/radeon/atombios_encoders.c | 8 --------
>  1 file changed, 8 deletions(-)

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
> index 01b20e1..1603751 100644
> --- a/drivers/gpu/drm/radeon/atombios_encoders.c
> +++ b/drivers/gpu/drm/radeon/atombios_encoders.c
> @@ -2623,16 +2623,8 @@ radeon_atom_ext_dpms(struct drm_encoder *encoder, int mode)
>
>  }
>
> -static bool radeon_atom_ext_mode_fixup(struct drm_encoder *encoder,
> -                                      const struct drm_display_mode *mode,
> -                                      struct drm_display_mode *adjusted_mode)
> -{
> -       return true;
> -}
> -
>  static const struct drm_encoder_helper_funcs radeon_atom_ext_helper_funcs = {
>         .dpms = radeon_atom_ext_dpms,
> -       .mode_fixup = radeon_atom_ext_mode_fixup,
>         .prepare = radeon_atom_ext_prepare,
>         .mode_set = radeon_atom_ext_mode_set,
>         .commit = radeon_atom_ext_commit,
> --
> 2.5.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
