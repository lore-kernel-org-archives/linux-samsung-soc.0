From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 3/6] ARM: dts: exynos: Update of the max98095 node in
 exynos5250-snow.dts
Date: Sun, 11 Mar 2018 18:44:09 +0100
Message-ID: <20180311174409.wx5zfskvh7zbnivz@kozik-lap>
References: <20180309172250.23019-1-s.nawrocki@samsung.com>
 <CGME20180309172414epcas1p36b0c39ad993afcad7f8cf8941cc6bf68@epcas1p3.samsung.com>
 <20180309172250.23019-3-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180309172250.23019-3-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, devicetree@vger.kernel.org, javierm@redhat.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 09, 2018 at 06:22:47PM +0100, Sylwester Nawrocki wrote:
> This patch adds missing clocks, clock-names properties so the CODEC can
> properly handle its master clock. Without this change sound on exynos5250-snow
> doesn't work.
> Missing #sound-dai-cells property is also added so it is possible to specify
> the DAI links properly for HDMI audio support.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - edited commit summary line.
> ---
>  arch/arm/boot/dts/exynos5250-snow.dts | 3 +++
>  1 file changed, 3 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
