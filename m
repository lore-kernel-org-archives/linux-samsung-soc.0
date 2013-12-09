From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: Fix status property of mmc nodes for snow board
Date: Mon, 9 Dec 2013 08:16:12 -0800
Message-ID: <CAD=FV=WqgGPZaEz46JLJAPymLA5Wzehgre2Z7X4AFAWN9L_Lvg@mail.gmail.com>
References: <1386571118-17793-1-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386571118-17793-1-git-send-email-yuvaraj.cd-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuvaraj Kumar C D <yuvaraj.cd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Yuvaraj Kumar C D <yuvaraj.cd-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Yuvaraj,

On Sun, Dec 8, 2013 at 10:38 PM, Yuvaraj Kumar C D <yuvaraj.cd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Commit 0c3de788 ("ARM: dts: change status property of dwmmc nodes
> for exynos5250") missed out handling the exynos5250 snow dts file.
>
> Signed-off-by : Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/cros5250-common.dtsi |    4 ----
>  arch/arm/boot/dts/exynos5250-snow.dts  |    9 +++++++++
>  2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
> index 6470536..1ceb62e 100644
> --- a/arch/arm/boot/dts/cros5250-common.dtsi
> +++ b/arch/arm/boot/dts/cros5250-common.dtsi
> @@ -247,10 +247,6 @@
>                 };
>         };
>
> -       mmc@12210000 {
> -               status = "disabled";
> -       };
> -
>         mmc@12220000 {
>                 num-slots = <1>;
>                 supports-highspeed;
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index a9395c4..67484d1 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -171,11 +171,20 @@
>                 };
>         };
>
> +       mmc@12200000 {
> +               status = "okay";
> +       };
> +
> +       mmc@12220000 {
> +               status = "okay";
> +       };
> +

I probably would have put the 12200000 and 12220000 ones in
cros5250-common since that's where all of the other stuff relating to
those ports is.  Some of it may need to be moved around once we get
the HP Chromebook 11 (exynos5250-spring) in place, but until then it
seems best to keep it all together.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
