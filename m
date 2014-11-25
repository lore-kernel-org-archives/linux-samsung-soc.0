From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: exynos-gsc: fix build warning
Date: Tue, 25 Nov 2014 15:18:34 +0000
Message-ID: <CA+V-a8sgWarzFQvoHhe2uxQDJ1bZ5PM4x03wss1k5vuuuvfT0Q@mail.gmail.com>
References: <1416308268-22957-1-git-send-email-prabhakar.csengg@gmail.com> <20141125130416.457e48b0@recife.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141125130416.457e48b0@recife.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, LMML <linux-media@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mauro,

On Tue, Nov 25, 2014 at 3:04 PM, Mauro Carvalho Chehab
<mchehab@osg.samsung.com> wrote:
> Em Tue, 18 Nov 2014 10:57:48 +0000
[Snip]
>
> -static u32 get_plane_info(struct gsc_frame *frm, u32 addr, u32 *index)
> +static int get_plane_info(struct gsc_frame *frm, u32 addr, u32 *index, u32 *ret_addr)
>  {
>         if (frm->addr.y == addr) {
>                 *index = 0;
> -               return frm->addr.y;
> +               *ret_addr = frm->addr.y;
>         } else if (frm->addr.cb == addr) {
>                 *index = 1;
> -               return frm->addr.cb;
> +               *ret_addr = frm->addr.cb;
>         } else if (frm->addr.cr == addr) {
>                 *index = 2;
> -               return frm->addr.cr;
> +               *ret_addr = frm->addr.cr;
>         } else {
>                 pr_err("Plane address is wrong");
>                 return -EINVAL;
>         }
> +       return 0;
the control wont reach here! may be you can remove the complete else
part outside ?

with that change,

Reported-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Thanks,
--Prabhakar Lad

>  }
>
>  void gsc_set_prefbuf(struct gsc_dev *gsc, struct gsc_frame *frm)
> @@ -352,9 +353,11 @@ void gsc_set_prefbuf(struct gsc_dev *gsc, struct gsc_frame *frm)
>                 u32 t_min, t_max;
>
>                 t_min = min3(frm->addr.y, frm->addr.cb, frm->addr.cr);
> -               low_addr = get_plane_info(frm, t_min, &low_plane);
> +               if (get_plane_info(frm, t_min, &low_plane, &low_addr))
> +                       return;
>                 t_max = max3(frm->addr.y, frm->addr.cb, frm->addr.cr);
> -               high_addr = get_plane_info(frm, t_max, &high_plane);
> +               if (get_plane_info(frm, t_max, &high_plane, &high_addr))
> +                       return;
>
>                 mid_plane = 3 - (low_plane + high_plane);
>                 if (mid_plane == 0)
