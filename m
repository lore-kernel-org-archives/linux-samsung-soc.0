From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/6] ARM: dts: exynos: Add #sound-dai-cells property
 to hdmi node in exynos5250.dtsi
Date: Sun, 11 Mar 2018 18:43:17 +0100
Message-ID: <20180311174317.5cj5dnx64aylvgn6@kozik-lap>
References: <CGME20180309172349epcas2p120eb4533e672b52eb13ddba97f3e6833@epcas2p1.samsung.com>
 <20180309172250.23019-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180309172250.23019-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, devicetree@vger.kernel.org, javierm@redhat.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 09, 2018 at 06:22:45PM +0100, Sylwester Nawrocki wrote:
> This property is required for specifying link between the HDMI IP block
> and the SoC's audio subsystem.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - edited commit summary line.
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Thanks, applied.

Best regards,
Krzysztof
