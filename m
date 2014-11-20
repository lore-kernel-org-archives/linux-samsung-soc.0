From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration
 to module init
Date: Thu, 20 Nov 2014 17:44:14 +0100
Message-ID: <546E1A5E.3000004@collabora.co.uk>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk> <7hh9xwxsev.fsf@deeprootsystems.com> <546CCAB8.9050402@collabora.co.uk> <CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com> <CAFp+6iEgBYP3cgThss8U1wS=O-rapnQz_akD+y9zR7JtWhhKTg@mail.gmail.com> <546DAA23.9070204@collabora.co.uk> <CAFp+6iFCLfSECHZ21Ho8-+USie3pmtqZwh7x2ULqdNjGXGX1pw@mail.gmail.com> <20141120155751.GA5981@luxor.wired.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:33213 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754076AbaKTQoV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 11:44:21 -0500
In-Reply-To: <20141120155751.GA5981@luxor.wired.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautamvivek1987@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vivek Gautam <gautam.vivek@samsung.com>

Hello Paolo,

On 11/20/2014 04:57 PM, Paolo Pisati wrote:
> On Thu, Nov 20, 2014 at 03:22:23PM +0530, Vivek Gautam wrote:
>>
>> On linux-samsung tree the only patch that's missing apart from dptx-phy patches
>> is the syscon patch from Pankaj Dubey:
>> b784b98 mfd: syscon: Decouple syscon interface from platform devices
>> 
>> So with below git hash, linux-samsung/for-next display works fine along with
>> other devices that request PMU system controller :
>> 
>> 7bd219e drm/exynos: dp: Remove support for unused dptx-phy
>> e8f21fd arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
>> 7099bde Revert "Revert "ARM: exynos_defconfig: Enable options for
>> display panel support""
>> 713a994 mfd: syscon: Decouple syscon interface from platform devices
>> 7552917 Revert "ARM: exynos_defconfig: Enable options for display
>> panel support"             /* This is Kukjin's for-next today */
>> ff0391a Merge branch 'v3.19-samsung-defconfig' into for-next
>> 26c6283 Merge branch 'v3.18-samsung-fixes' into for-next
>> cf864fd Merge branch 'v3.18-samsung-defconfig' into for-next
>> 98b6380 ARM: exynos_defconfig: Enable max77802 rtc and clock drivers
>> 839275c ARM: exynos_defconfig: Use 16 minors per MMC block device
>> 0526f27 ARM: dts: Explicitly set dr_mode on exynos5250-snow
>> fc14f9c Linux 3.18-rc5
> 
> are you using a clean exynos_defconfig?
> don't you need Javier's "drm/exynos: Move platform drivers registration to
> module init" patch too?
> 

Since Kukjin's for-next is based on Linux 3.18-rc5, the OF patch that causes
the Exynos DRM deadlock is not there. That commit landed in next20141105.

> kgene/for-next at:
> 
> 7552917 Revert "ARM: exynos_defconfig: Enable options for display panel support"
> 
> plus:
> 
> 5e1e068 arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
> 36d908e drm/exynos: dp: Remove support for unused dptx-phy
> 624bff2 POSTED: mfd: syscon: Decouple syscon interface from syscon devices
> 68944e3 Revert "Revert "ARM: exynos_defconfig: Enable options for display panel support""
> 
> hangs with a black screen (albeit backlight seems to be on) on boot.
> I'm betting on Javier's patch at this point (i even tried disabling SND_SOC_SNOW
> but that didn't help).
> 

I only tested with next20141120 but Vivek tested with Kukjin for-next AFAIU.

What's your kernel command line and u-boot env vars?

Best regards,
Javier
