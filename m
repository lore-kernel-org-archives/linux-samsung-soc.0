From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/3] iio: exynos-adc: use syscon instead of ioremap
Date: Sun, 21 Sep 2014 13:17:06 +0100
Message-ID: <541EC1C2.6090608@kernel.org>
References: <1410857931-4980-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410857931-4980-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 16/09/14 09:58, Naveen Krishna Chatradhi wrote:
> Changes since v1:
> 1. Rebased on top of togreg branch of IIO git.
> 
> This patch set does the following
> 1. Use the syscon and Regmap API instead of ioremappaing the
>    ADC_PHY register from PMU.
> 2. Updates the Documentation in exynos-adc.txt with syscon phandle
>    for the ADC nodes.
> 3. Updates the Dts files for Exynos3250, Exynos4x12, Exynos5250,
>    Exynos5420 with the syscon phandle.
> 
> Tested on Exynos5420 based Peach PIT and Exynos5800 based Peach PI
> by verifying sysfs entries provided by HWMON based NTC thermistors.
> 
> Tested-By for Exynos3250, Exynos4x12 would be appreciated.
Would definitely be good!

The main issue I have with this series is that it breaks backward
compatibility with old device trees and newer kernels.

Now I appreciate that sometimes there are reasons to do it but want this
to have deeper consideration (and acks to show it) from the Exynos side
of things and preferably from the device tree side of things as well.

cc'd Kukjin Kim for the Exynos side of things as the listed Maintainer.

Otherwise, the series looks fine to me.
> 
> Naveen Krishna Chatradhi (3):
>   iio: exyno-adc: use syscon for PMU register access
>   Documentation: dt-bindings: update exynos-adc.txt with syscon handle
>   ARM: dts: exynos: Add sysreg phandle to ADC node
> 
>  .../devicetree/bindings/arm/samsung/exynos-adc.txt |    9 ++++--
>  arch/arm/boot/dts/exynos3250.dtsi                  |    3 +-
>  arch/arm/boot/dts/exynos4x12.dtsi                  |    3 +-
>  arch/arm/boot/dts/exynos5250.dtsi                  |    3 +-
>  arch/arm/boot/dts/exynos5420.dtsi                  |    3 +-
>  drivers/iio/adc/exynos_adc.c                       |   30 ++++++++++++++------
>  6 files changed, 36 insertions(+), 15 deletions(-)
> 
