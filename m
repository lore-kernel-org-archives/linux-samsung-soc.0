From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] ASoC: max98090: Add max98091 compatible string
Date: Fri, 20 Jun 2014 13:32:26 -0700
Message-ID: <CAD=FV=XX1XAX-jZTJaQYTHbeXkHu2uX_6==vHYbSnVpjJe6+tQ@mail.gmail.com>
References: <1403251396-17487-1-git-send-email-tushar.b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403251396-17487-1-git-send-email-tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tushar Behera <tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, tiwai-l3A5Bk7waGM@public.gmane.org, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tushar Behera <trblinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wonjoon Lee <woojoo.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Tushar,

On Fri, Jun 20, 2014 at 1:03 AM, Tushar Behera <tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> From: Wonjoon Lee <woojoo.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> The MAX98091 CODEC is the same as MAX98090 CODEC, but with an extra
> microphone. Existing driver for MAX98090 CODEC already has support
> for MAX98091 CODEC. Adding proper compatible string so that MAX98091
> CODEC can be specified from device tree.
>
> Signed-off-by: Wonjoon Lee <woojoo.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Tushar Behera <tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>
> Picked from https://chromium-review.googlesource.com/#/c/184091/
>
>  .../devicetree/bindings/sound/max98090.txt         |    2 +-
>  sound/soc/codecs/max98090.c                        |    2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/max98090.txt b/Documentation/devicetree/bindings/sound/max98090.txt
> index a5e63fa..c454e67 100644
> --- a/Documentation/devicetree/bindings/sound/max98090.txt
> +++ b/Documentation/devicetree/bindings/sound/max98090.txt
> @@ -4,7 +4,7 @@ This device supports I2C only.
>
>  Required properties:
>
> -- compatible : "maxim,max98090".
> +- compatible : "maxim,max98090" or "maxim,max98091".
>
>  - reg : The I2C address of the device.
>
> diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
> index f5fccc7..4f5534d 100644
> --- a/sound/soc/codecs/max98090.c
> +++ b/sound/soc/codecs/max98090.c
> @@ -2460,12 +2460,14 @@ static const struct dev_pm_ops max98090_pm = {
>
>  static const struct i2c_device_id max98090_i2c_id[] = {
>         { "max98090", MAX98090 },
> +       { "max98091", MAX98091 },

optional: This would allow you to add some extra error checking in
max98090_probe() to make sure that the device-tree specified device
matched the device that was detected.  That could be in a future
patch, though.

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
