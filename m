From: Yadwinder Singh Brar <yadi.brar01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] regulator: s2mps11: Merge S2MPA01 driver
Date: Tue, 27 May 2014 12:00:57 +0530
Message-ID: <CAKew6eXdmif5-A+sb7-HEd3fP739RNy8SbzpCVRJ6uDgkyFvoQ@mail.gmail.com>
References: <1401110423-5647-1-git-send-email-k.kozlowski@samsung.com>
	<1401110423-5647-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401110423-5647-3-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, May 26, 2014 at 6:50 PM, Krzysztof Kozlowski
<k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Add S2MPA01 support to the s2mps11 regulator driver. This obsoletes the
> s2mpa01 regulator driver.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

> @@ -216,30 +250,20 @@ static int s2mps11_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
>                         ramp_delay = s2mps11->ramp_delay16;
>                 break;
>         case S2MPX_BUCK2:
> -               if (!ramp_delay) {
> -                       ramp_enable = 0;
> -                       break;
> -               }
> -

What if we want to disable ramp_delay from DT ?

> -               s2mps11->ramp_delay2 = ramp_delay;
> +               if (s2mps11->dev_type == S2MPS11X ||
> +                               ramp_delay > s2mps11->ramp_delay2)
> +                       s2mps11->ramp_delay2 = ramp_delay;
> +               else /* S2MPA01 && ramp_delay <= s2mpa01->ramp_delay24 */
> +                       ramp_delay = s2mps11->ramp_delay2;

Here ramp_delay = 0(ramp_disable case) is also getting over written,
if required to take care of it later.

>                 break;
>         case S2MPX_BUCK3:
> -               if (!ramp_delay) {
> -                       ramp_enable = 0;
> -                       break;
> -               }

[snip]

>
> -       if (!ramp_enable)
> -               goto ramp_disable;
> -
> -       /* Ramp delay can be enabled/disabled only for buck[2346] */
>         if (ramp_reg->enable_supported) {
> +               if (ramp_disable)

typo ?    if (!ramp_enable) / if (!ramp_delay) ?

> +                       goto ramp_disable;
> +


Also TBH, I can't get rationale behind this merge, As i can't see
considerable reduction in no of C code lines in comp of added
complexity.
 Is there considerable advantage in binary stats of single driver as
compare to independent drivers?


Regards,
Yadwinder
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
