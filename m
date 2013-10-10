From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] USB: ehci-exynos: Remove non-DT support
Date: Thu, 10 Oct 2013 12:18:55 +0530
Message-ID: <CAK9yfHx6+j7WfY077wP24_U5MAEoqySHHiWtsjjO7JtezOiz1A@mail.gmail.com>
References: <000001cec582$02a6cfb0$07f46f10$%han@samsung.com>
	<000901cec582$6ba1f6c0$42e5e440$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <000901cec582$6ba1f6c0$42e5e440$%han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Jingoo,

On 10 October 2013 12:01, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> The non-DT for EXYNOS SoCs is not supported from v3.11.
> Thus, there is no need to support non-DT for Exynos EHCI driver.
>
> The 'include/linux/platform_data/usb-ehci-exynos.h' file has been
> used for non-DT support. Thus, the 'usb-ehci-exynos.h' file can
> be removed.

Wouldn't it be better to do the non-DT cleanup first and then the renaming.
This would avoid unnecessary code churn. For e.g., since the header file is
deleted in this patch, it doesn't make sense to rename the file and
other variable/function
names in the previous patch.

-- 
With warm regards,
Sachin
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
