From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usb: ohci-exynos: Change to use phy provided by the
 generic phy framework
Date: Sun, 8 Dec 2013 17:55:53 -0800
Message-ID: <20131209015553.GA27542@kroah.com>
References: <001401ceda8f$67f1ee50$37d5caf0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <001401ceda8f$67f1ee50$37d5caf0$%han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Kamil Debski' <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Kyungmin Park' <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Kishon Vijay Abraham I' <kishon-l0cyMroinI0@public.gmane.org>, 'Tomasz Figa' <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Sylwester Nawrocki' <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, 'Mateusz Krawczuk' <mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Yulgon Kim' <yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Praveen Paneri' <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Anton Tikhomirov' <av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Kumar Gala' <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Nov 06, 2013 at 10:27:49AM +0900, Jingoo Han wrote:
> Change the phy provider used from the old usb phy specific to a new one
> using the generic phy framework.
> 
> Signed-off-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Exynos OHCI driver also uses Exynos USB2.0 PHY. Thus, I make this
> patch based-on Kamil Debski's patchset for adding Exynos USB 2.0 PHY
> driver.
> (http://www.spinics.net/lists/linux-samsung-soc/msg24104.html)
> 
>  drivers/usb/host/ohci-exynos.c |   28 ++++++++--------------------
>  1 file changed, 8 insertions(+), 20 deletions(-)

This has some fuzz when applied to my tree, care to redo it against my
usb-next branch of the usb.git tree on git.kernel.org?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
