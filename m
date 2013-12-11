From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] phy: Add exynos-phy driver
Date: Wed, 11 Dec 2013 15:24:19 +0530
Message-ID: <52A8364B.5020204@ti.com>
References: <1385558788-10880-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385558788-10880-1-git-send-email-t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Wednesday 27 November 2013 06:56 PM, Tomasz Stanislawski wrote:
> Hello everyone,
> The Samsung SoCs from Exynos family are enhanced with a bunch of switches
> dedicated for IP blocks. Those switches are called PHYs in Exynos
> specification. They are usually controlled by a single bit in a single
> one-word-long register.

So only enabling this switch is enough for the controller or some other actual
PHY IP is needed along with this switch?

However I'm not sure if the switch should be modelled as PHY as it is not a PHY
in the real sense.

Thanks
Kishon

> 
> A IP driver has to control such a switch in an abstract manner.  Therefore,
> such 'enablers' were implemented as clocks in older versions of Linux kernel.
> With the dawn of PHY subsystems, PHYs become a natural way of exporting the
> 'enabler' functionality to drivers.  However, there is an unexpected
> consequence. Some of those 1-bit PHYs were implemented as separate drivers.
> This means that one has to create a struct device, struct phy, its phy provider
> and 100-150 lines of driver code to basically set one bit.
> 
> The DP phy driver is a good example:
> https://lkml.org/lkml/2013/7/18/53
> 
> And simple-phy RFC (shares only driver code but not other resources):
> https://lkml.org/lkml/2013/10/21/313
> 
> To avoid waste of resources I propose to create all such 1-bit phys from Exynos
> SoC using a single device, driver and phy provider.
> 
> This patchset contains a proposed solution.
> 
> All comment are welcome.
> 
> Hopefully in future the functionality introduced by this patch may be merged
> into a larger Power Management Unit (PMU) gluer driver.  On Samsusng SoC , the
> PMU part contains a number of register barely linked to power management (like
> clock gating, clock dividers, CPU resetting, etc.).  It may be tempting to
> create a hybrid driver that export clocks/phys/etc that are controlled by PMU
> unit.
> 
> Regards,
> Tomasz Stanislawski
> 
> Tomasz Stanislawski (1):
>   phy: Add exynos-phy driver
> 
>  drivers/phy/Kconfig      |    5 ++
>  drivers/phy/Makefile     |    1 +
>  drivers/phy/exynos-phy.c |  152 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 158 insertions(+)
>  create mode 100644 drivers/phy/exynos-phy.c
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
