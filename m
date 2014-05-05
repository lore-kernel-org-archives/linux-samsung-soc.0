From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 2/2] ARM: dts: Add peach-pit board support
Date: Mon, 5 May 2014 08:11:16 -0700
Message-ID: <CAD=FV=VH_WMQ+bENDDHB1OEPs9WOTVz7MLqYS6b=43vP5KgPkA@mail.gmail.com>
References: <1399281933-31064-1-git-send-email-arun.kk@samsung.com>
	<1399281933-31064-3-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399281933-31064-3-git-send-email-arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arun Kumar K <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arun Kumar <arunkk.samsung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Arun,

On Mon, May 5, 2014 at 2:25 AM, Arun Kumar K <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Adds the google peach-pit board dts file which uses
> exynos5420 SoC.
>
> Signed-off-by: Arun Kumar K <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                 |    1 +
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |  147 ++++++++++++++++++++++++++++
>  2 files changed, 148 insertions(+)

Note that this has an implicit dependency upon
<https://patchwork.kernel.org/patch/4101881/> (ARM: dts: Add pwmX_out
pinctrl nodes to Exynos5420).  Once that has landed then I think we're
good to go.

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
