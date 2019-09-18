From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: exynos: fix too long line in memory
 device
Date: Wed, 18 Sep 2019 20:55:55 +0200
Message-ID: <20190918185555.GB8463@kozik-lap>
References: <20190916100704.26692-1-l.luba@partner.samsung.com>
 <CGME20190916100718eucas1p1efcbabdf9dbe17a062ae83b8c19ac256@eucas1p1.samsung.com>
 <20190916100704.26692-3-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190916100704.26692-3-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Sep 16, 2019 at 12:07:03PM +0200, Lukasz Luba wrote:
> Small fix moving the comment to line above making sure the lines do not
> exceed 80 characters.
> 
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 3 ++-

Thanks, applied (squashed with previous).

Best regards,
Krzysztof
