From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Add PCIe driver support
Date: Wed, 6 Mar 2013 14:07:52 +0100
Message-ID: <20130306140752.7e5d68c8@skate>
References: <016b01ce18c2$2c366f10$84a34d30$%han@samsung.com>
	<CAJuYYwTKe6cC+eMmyAAskCJrDrbS3SmYRYhzL9iui5m1zvgbzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAJuYYwTKe6cC+eMmyAAskCJrDrbS3SmYRYhzL9iui5m1zvgbzw@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Surendranath Gurivireddy Balla <suren.reddy@samsung.com>, Siva Reddy Kallam <siva.kallam@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Dear Thomas Abraham,

On Mon, 4 Mar 2013 16:01:59 +0530, Thomas Abraham wrote:
> On 4 March 2013 15:52, Jingoo Han <jg1.han@samsung.com> wrote:
> > Exynos5440 has two PCIe controllers which can be used as Root Complex.
> > This driver supports the PCIe controllers as Root Complex mode.
> >
> > Signed-off-by: Surendranath Gurivireddy Balla <suren.reddy@samsung.com>
> > Signed-off-by: Siva Reddy Kallam <siva.kallam@samsung.com>
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > ---
> >  .../devicetree/bindings/pci/exynos-pcie.txt        |   58 ++
> >  arch/arm/Kconfig                                   |    2 +
> >  arch/arm/mach-exynos/Kconfig                       |    8 +
> >  arch/arm/mach-exynos/Makefile                      |    2 +
> >  arch/arm/mach-exynos/include/mach/pcie.h           |  146 +++
> >  arch/arm/mach-exynos/pcie.c                        | 1009 ++++++++++++++++++++
> 
> Is there any reason to place this code in arch/arm/...? As you know,
> there is a constant effort to relocate as much code as possible from
> arch/arm/mach-exynos. So there must be a strong justification for
> keeping this code in arch/arm/mach-exynos.

Indeed. Thierry Reding (doing the Tegra PCIe driver) and myself (doing
the Marvell PCIe driver) are putting our drivers in drivers/pci/host/,
in agreement with the PCI maintainers.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
