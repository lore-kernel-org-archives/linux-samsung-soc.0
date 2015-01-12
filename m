From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 2/2] pinctrl: exynos: Add BUS1 pin controller for exynos7
Date: Mon, 12 Jan 2015 10:14:53 +0100
Message-ID: <CACRpkdbtJZ4wKh=wF8t8-NAvi9P1OapP_x61VUdz1WRjSwcYEw@mail.gmail.com>
References: <1418200780-22363-1-git-send-email-gautam.vivek@samsung.com>
	<1418200780-22363-2-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418200780-22363-2-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, root <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Dec 10, 2014 at 9:39 AM, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:

> USB and Power regulator on Exynos7 require gpios available
> in BUS1 pin controller block.
> So adding the BUS1 pinctrl support.
>
> Signed-off-by: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>
> Changes since V2:
>  - Added documentation on alias for BUS1 pin controller block.

Patch applied with Tomasz ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
