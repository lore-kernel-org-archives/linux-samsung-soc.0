From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 6/6] ARM: dts: exynos: Enable HDMI audio support on
 exynos5800-peach-pi
Date: Sun, 11 Mar 2018 18:43:28 +0100
Message-ID: <20180311174328.zosfqmgqmkion3i7@kozik-lap>
References: <20180309172250.23019-1-s.nawrocki@samsung.com>
 <CGME20180309172450epcas1p2b845a521afbadc81da991330bdbc588c@epcas1p2.samsung.com>
 <20180309172250.23019-6-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180309172250.23019-6-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, devicetree@vger.kernel.org, javierm@redhat.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 09, 2018 at 06:22:50PM +0100, Sylwester Nawrocki wrote:
> This patch adds new cpu, codec subnodes according to the updated
> "google,snow-audio-max98091" DT bindings and the I2S clock tree
> configuration so sound on the HDMI interface can be also supported.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> NOTE:
> I couldn't test this patch as I have no access to Peach-pi Chromebook.
> I think it shouldn't be applied unless someone actually tests it.
> 
> Changes since v1:
>  - edited commit summary line.
> ---
>  arch/arm/boot/dts/exynos5800-peach-pi.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
