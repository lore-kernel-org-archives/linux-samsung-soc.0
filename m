From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [RFC v2 1/2] drm/exynos: Add Picture Processor framework
Date: Mon, 8 May 2017 14:43:53 +0100
Message-ID: <CACvgo52aq--kby0stBjEyd4+8gcaQHBqzAxBzdV-jB6OgZfahw@mail.gmail.com>
References: <CGME20170508091206eucas1p182d473b7ec304bd71bd8e5c4d4938c53@eucas1p1.samsung.com>
 <1494234699-23843-1-git-send-email-m.szyprowski@samsung.com> <1494234699-23843-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33223 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751812AbdEHNnz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 May 2017 09:43:55 -0400
Received: by mail-wm0-f68.google.com with SMTP id y10so15605896wmh.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 May 2017 06:43:54 -0700 (PDT)
In-Reply-To: <1494234699-23843-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Sakari Ailus <sakari.ailus@iki.fi>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hi Marek,

A couple of small nitpicks from UAPI POV.

On 8 May 2017 at 10:11, Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> --- a/include/uapi/drm/exynos_drm.h
> +++ b/include/uapi/drm/exynos_drm.h

> +struct drm_exynos_pp_get_res {
> +       __u64 pp_id_ptr;
> +       __u32 count_pps;
Add __u32 pad - sizeof(struct ...) should be multiple of sizeof(__u64).


> +struct drm_exynos_pp_get {
> +       __u32 pp_id;
> +       __u32 capabilities;
> +
> +       __u32 src_format_count;
> +       __u32 dst_format_count;
> +       __u32 params_count;
> +       __u32 reserved1;
> +
Replace with __u32 flags; so that you can extend the struct as applicable.

> +       __u64 src_format_type_ptr;
> +       __u64 dst_format_type_ptr;
> +       __u64 params_ptr;
> +       __u64 reserved2;
And now you can drop this piece.


> +struct drm_exynos_pp_commit {
> +       __u32 id;
> +       __u32 flags;
> +       __u32 params_count;
> +       __u32 reserved;
Why the reserved here - flags should help you extend as needed.

> +       __u64 param_ids_ptr;
> +       __u64 param_values_ptr;
> +       __u64 user_data;
Unused user_data?


> +struct drm_exynos_pp_event {
> +       struct drm_event        base;
> +       __u64                   user_data;
Unused user_data?

> +       __u32                   tv_sec;
> +       __u32                   tv_usec;
> +       __u32                   pp_id;
> +       __u32                   sequence;
> +       __u64                   reserved;
Drop in favour of flags?

Regards,
Emil
