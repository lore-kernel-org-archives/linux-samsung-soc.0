From: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH 4/5] usb: ehci-s5p: Change to use phy provided by the
 generic phy framework
Date: Mon, 28 Oct 2013 14:52:50 +0100
Message-ID: <025e01ced3e4$fec0de60$fc429b20$%debski@samsung.com>
References: <1382710529-12082-1-git-send-email-k.debski@samsung.com>
 <1382710529-12082-5-git-send-email-k.debski@samsung.com>
 <003101ced1ea$85f7e010$91e7a030$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <003101ced1ea$85f7e010$91e7a030$%han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: pl
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Kyungmin Park' <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Kishon Vijay Abraham I' <kishon-l0cyMroinI0@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Vivek Gautam' <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Mateusz Krawczuk' <mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Jingoo,

> From: Jingoo Han [mailto:jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org]
> Sent: Saturday, October 26, 2013 3:27 AM
> 
> On Friday, October 25, 2013 11:15 PM, Kamil Debski wrote:
> >
> > Change the phy provider used from the old usb phy specific to a new
> > one using the generic phy framework.
> >
> > Signed-off-by: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  drivers/usb/host/ehci-s5p.c |   21 +++++++++++----------
> >  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> Hi Kamil Debski,
> It looks good. :-)

Thank you.
 
> However, could you re-basing against Greg's 'usb-next' branch?
> Now, the file name of 'ehci-s5p.c' is renamed to 'ehci-exynos.c'.
> Also, 'Generic PHY Framework' was already merged to Greg's 'usb-next'
> branch.

Thanks for pointing out this.

> 
> Thank you.
> 
> Best regards,
> Jingoo Han

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
