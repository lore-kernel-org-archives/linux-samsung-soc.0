From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/6] ARM: dts: s5pv210: Use correct fimd variant
Date: Mon, 7 Jan 2019 21:28:48 +0100
Message-ID: <20190107202848.GA21920@kozik-lap>
References: <20181228161819.18931-1-pawel.mikolaj.chmiel@gmail.com>
 <20181228161819.18931-2-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181228161819.18931-2-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, xc-racer2@live.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Dec 28, 2018 at 05:18:14PM +0100, Paweł Chmiel wrote:
> Since we have separate compatible for our SOC,
> let's use it rather using one from exynos4210.
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>  arch/arm/boot/dts/s5pv210.dtsi | 2 +-

Thanks, applied.

Best regards,
Krzysztof
