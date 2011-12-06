From: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: EXYNOS: Add USB OHCI device
Date: Tue, 06 Dec 2011 14:43:15 +0530
Message-ID: <4EDDDCAB.1000001@linaro.org>
References: <001101ccb3e0$7fe48270$7fad8750$%han@samsung.com> <001301ccb3e0$b5fec280$21fc4780$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <001301ccb3e0$b5fec280$21fc4780$%han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: 'Kukjin Kim' <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Greg Kroah-Hartman' <gregkh-l3A5Bk7waGM@public.gmane.org>, 'Alan Stern' <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, 'Yulgon Kim' <yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 06 December 2011 12:01 PM, Jingoo Han wrote:
> This patch adds USB ohci device definition for Exynos SoCs.
>
> Signed-off-by: Jingoo Han<jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>   arch/arm/mach-exynos/Kconfig              |    5 +++
>   arch/arm/mach-exynos/Makefile             |    1 +
>   arch/arm/mach-exynos/dev-ohci.c           |   52 +++++++++++++++++++++++++++++
>   arch/arm/mach-exynos/include/mach/map.h   |    1 +
>   arch/arm/mach-exynos/include/mach/ohci.h  |   21 +++++++++++

In the earlier patchset, platform_device struct for ohci was defined 
within plat-samsung, and ohci.h was located in 
plat-samsung/include/plat. These are still the locations where ehci 
related definitions are located.

What is the reason for movement of ohci related definitions to mach folder?

-- 
Tushar Behera
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
