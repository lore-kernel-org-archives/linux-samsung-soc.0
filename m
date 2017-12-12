From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: exynos: Enable Mixer node for Exynos5800
 Peach Pi machine
Date: Tue, 12 Dec 2017 18:47:08 +0100
Message-ID: <20171212174708.miyqt2gtcanumgow@kozik-lap>
References: <20171212074208.30753-1-javierm@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171212074208.30753-1-javierm@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Shuah Khan <shuahkh@osg.samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Dec 12, 2017 at 08:42:08AM +0100, Javier Martinez Canillas wrote:
> Commit 1cb686c08d12 ("ARM: dts: exynos: Add status property to Exynos 542x
> Mixer nodes") disabled the Mixer node by default in the DTSI and enabled
> for each Exynos 542x DTS. But unfortunately it missed to enable it for the
> Exynos5800 Peach Pi machine, since the 5800 is also an 542x SoC variant.
> 
> Fixes: 1cb686c08d12 ("ARM: dts: exynos: Add status property to Exynos 542x Mixer nodes")
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> ---
> 
> Changes in v2:
> - Remove RFT tag.
> - Add Marek's Acked-by tag.
> - Add fixes tag.
> 
>  arch/arm/boot/dts/exynos5800-peach-pi.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Thanks, applied for current cycle (fixes).

Best regards,
Krzysztof
