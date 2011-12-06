From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v2 1/3] ARM: EXYNOS: Add USB OHCI device
Date: Tue, 06 Dec 2011 18:30:37 +0900
Message-ID: <000d01ccb3f9$b6bbc790$243356b0$%han@samsung.com>
References: <001101ccb3e0$7fe48270$7fad8750$%han@samsung.com>
 <001301ccb3e0$b5fec280$21fc4780$%han@samsung.com> <4EDDDCAB.1000001@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <4EDDDCAB.1000001-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-language: ko
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Tushar Behera' <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: 'Kukjin Kim' <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Greg Kroah-Hartman' <gregkh-l3A5Bk7waGM@public.gmane.org>, 'Alan Stern' <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, 'Yulgon Kim' <yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Tushar Behera wrote:
> Subject: Re: [PATCH v2 1/3] ARM: EXYNOS: Add USB OHCI device
> 
> On Tuesday 06 December 2011 12:01 PM, Jingoo Han wrote:
> > This patch adds USB ohci device definition for Exynos SoCs.
> >
> > Signed-off-by: Jingoo Han<jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >   arch/arm/mach-exynos/Kconfig              |    5 +++
> >   arch/arm/mach-exynos/Makefile             |    1 +
> >   arch/arm/mach-exynos/dev-ohci.c           |   52 +++++++++++++++++++++++++++++
> >   arch/arm/mach-exynos/include/mach/map.h   |    1 +
> >   arch/arm/mach-exynos/include/mach/ohci.h  |   21 +++++++++++
> 
> In the earlier patchset, platform_device struct for ohci was defined
> within plat-samsung, and ohci.h was located in
> plat-samsung/include/plat. These are still the locations where ehci
> related definitions are located.
> 
> What is the reason for movement of ohci related definitions to mach folder?
I changed the ohci name from ohci-s5p to ohci-exynos, because the ohci-exynos
is used for exynos series such as Exynos4210 & Exynos4x12.
Therefore, it should be located within mach-exynos/include/mach.

Also, If this patchset is accepted, I will move Samsung ehci definitions
to mach-exynos due to the same reason.

Thanks.
> 
> --
> Tushar Behera

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
