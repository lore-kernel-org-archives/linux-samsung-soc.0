From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Make MAX77802 regulator driver
 built-in
Date: Mon, 2 Sep 2019 17:54:23 +0200
Message-ID: <20190902155423.GC9289@kozik-lap>
References: <CGME20190830130425eucas1p1b6806fad77366797271e70ce8ef4d296@eucas1p1.samsung.com>
 <20190830130416.10420-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190830130416.10420-1-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Aug 30, 2019 at 03:04:16PM +0200, Marek Szyprowski wrote:
> Maxim 77802 PMIC is a main PMIC for the following Exynos5 based boards:
> Odroid XU, Chromebook Pit and Chromebook Pi. Driver for its voltage
> regulator is needed very early during boot to properly instantiate SD/MMC
> devices and mount rootfs, so change that driver to be compiled-in.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 2 +-

Thanks, applied.

Best regards,
Krzysztof
