From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [RFC PATCH 03/11] devfreq: exynos-bus: Change goto-based logic to
 if-else logic
Date: Thu, 25 Jul 2019 21:56:48 +0900
Message-ID: <CAGTfZH09n9UOLMwNrCvcdeRCHYFO4TiB-YG2rMVuxA4bxuLCVw@mail.gmail.com>
References: <CGME20190723122024eucas1p1ff060d072132bfbc8a8a1d10fa1f90f8@eucas1p1.samsung.com>
 <20190723122016.30279-1-a.swigon@partner.samsung.com> <20190723122016.30279-4-a.swigon@partner.samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723122016.30279-4-a.swigon@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, inki.dae@samsung.com, Seung-Woo Kim <sw0312.kim@samsung.com>, georgi.djakov@linaro.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

2019=EB=85=84 7=EC=9B=94 24=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 8:08, A=
rtur =C5=9Awigo=C5=84 <a.swigon@partner.samsung.com>=EB=8B=98=EC=9D=B4 =EC=
=9E=91=EC=84=B1:
>
> This patch improves code readability by changing the following construct:
>
> >    if (cond)
> >        goto passive;
> >    foo();
> >    goto out;
> >passive:
> >    bar();
> >out:
>
> into this:
>
> >    if (cond)
> >        bar();
> >    else
> >        foo();
>
> Signed-off-by: Artur =C5=9Awigo=C5=84 <a.swigon@partner.samsung.com>
> ---
>  drivers/devfreq/exynos-bus.c | 24 +++++++++---------------
>  1 file changed, 9 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> index cf6f6cbd0f55..4bb83b945bf7 100644
> --- a/drivers/devfreq/exynos-bus.c
> +++ b/drivers/devfreq/exynos-bus.c
> @@ -505,25 +505,19 @@ static int exynos_bus_probe(struct platform_device =
*pdev)
>         node =3D of_parse_phandle(dev->of_node, "devfreq", 0);
>         if (node) {
>                 of_node_put(node);
> -               goto passive;
> +               ret =3D exynos_bus_profile_init_passive(bus, profile);
> +               if (ret < 0)
> +                       goto err;
>         } else {
>                 ret =3D exynos_bus_parent_parse_of(np, bus);
> +               if (ret < 0)
> +                       goto err;
> +
> +               ret =3D exynos_bus_profile_init(bus, profile);
> +               if (ret < 0)
> +                       goto err;
>         }
>
> -       if (ret < 0)
> -               goto err;
> -
> -       ret =3D exynos_bus_profile_init(bus, profile);
> -       if (ret < 0)
> -               goto err;
> -
> -       goto out;
> -passive:
> -       ret =3D exynos_bus_profile_init_passive(bus, profile);
> -       if (ret < 0)
> -               goto err;
> -
> -out:
>         max_state =3D bus->devfreq->profile->max_state;
>         min_freq =3D (bus->devfreq->profile->freq_table[0] / 1000);
>         max_freq =3D (bus->devfreq->profile->freq_table[max_state - 1] / =
1000);
> --
> 2.17.1
>

It seems more simple than before.
Instead, please merge patch1/2/3 to one patch. and drop the patch4.

--=20
Best Regards,
Chanwoo Choi
