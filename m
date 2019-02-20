From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 0/4] Devicetree updates for Exynos 5260
Date: Wed, 20 Feb 2019 14:59:34 +0100
Message-ID: <CAJKOXPediHZqN3MRMYUaQT_jKyvb_20fxZm8paV1AVysWHScsQ@mail.gmail.com>
References: <20190219130337.21353-1-stuart@menefy.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219130337.21353-1-stuart@menefy.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stuart Menefy <stuart.menefy@mathembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 19 Feb 2019 at 14:03, Stuart Menefy
<stuart.menefy@mathembedded.com> wrote:
>
> These four patches are stand alone updates for the Exynos 5260 device
> tree, which do not depend on any other code changes. They either
> fix issues or add functionality which is already available
> on other Exynos devices. They were previously posted as version 1
> of the larger patch series "Resuscitate Exynos 5260 support"
> https://www.spinics.net/lists/linux-samsung-soc/#65035
> which was only posted to the samsung-soc mailing list.
>
> Changes since v1:
> - Removed from larger patch set for easier review
> - Applied reviewer comments to patch 2/4 "Add high speed I2C ports
>   for exynos5260"
> - Expanded patch comments
>
> Stuart Menefy (4):
>   ARM: dts: exynos: Use bustop PLL as the source for MMC clocks on
>     Exynos5260
>   ARM: dts: exynos: Add high speed I2C ports for exynos5260
>   ARM: dts: exynos: Add interrupts for dedicated EINTs on Exynos5260
>   ARM: dts: exynos: Fix interrupt for shared EINTs on Exynos5260

Thanks for the changes. All look fine to me but it is too late to pick
them up in this cycle. I will take them after merge window.

Best regards,
Krzysztof
