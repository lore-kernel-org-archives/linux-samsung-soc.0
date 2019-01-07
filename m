From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/6] ARM: dts: s5pv210: galaxys: Remove hardcoded bootargs
Date: Mon, 7 Jan 2019 20:20:26 +0100
Message-ID: <20190107192026.GA3313@kozik-lap>
References: <20181228161819.18931-1-pawel.mikolaj.chmiel@gmail.com>
 <20181228161819.18931-3-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181228161819.18931-3-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, xc-racer2@live.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Dec 28, 2018 at 05:18:15PM +0100, Paweł Chmiel wrote:
> Since we have uboot (flashed in place of stock kernel),
> it's not needed anymore to hardcode bootargs.
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>  arch/arm/boot/dts/s5pv210-galaxys.dts | 7 -------

Thanks, applied.

Best regards,
Krzysztof
