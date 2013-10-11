From: 'Greg Kroah-Hartman' <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH V2 3/5] USB: ohci-exynos: Remove non-DT support
Date: Fri, 11 Oct 2013 16:55:11 -0700
Message-ID: <20131011235511.GA2571@kroah.com>
References: <000101cec58b$ee8bd2f0$cba378d0$%han@samsung.com>
 <000401cec58c$2dff1c30$89fd5490$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <000401cec58c$2dff1c30$89fd5490$%han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Kukjin Kim' <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Alan Stern' <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, 'Sylwester Nawrocki' <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Tomasz Figa' <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Sachin Kamat' <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Oct 10, 2013 at 04:41:49PM +0900, Jingoo Han wrote:
> The non-DT for EXYNOS SoCs is not supported from v3.11.
> Thus, there is no need to support non-DT for Exynos OHCI driver.
> 
> The 'include/linux/platform_data/usb-ohci-exynos.h' file has been
> used for non-DT support. Thus, the 'usb-ohci-exynos.h' file can
> be removed.
> 
> Signed-off-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

This patch fails to apply to my tree for some reason:
	checking file drivers/usb/host/ohci-exynos.c
	Hunk #5 FAILED at 91.
	1 out of 5 hunks FAILED
	checking file include/linux/platform_data/usb-ohci-exynos.h

Can you redo it against my usb-next usb.git tree and resend it?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
