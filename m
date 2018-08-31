From: Andi Shyti <andi@etezian.org>
Subject: Re: [PATCH v3] dt-bindings: arm: Explicitly mark Samsung Exynos SoC
 as unstable
Date: Fri, 31 Aug 2018 13:40:48 +0300
Message-ID: <20180831104048.GA6545@jack.zhora.eu>
References: <20180830180205.18121-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180830180205.18121-1-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Thu, Aug 30, 2018 at 08:02:05PM +0200, Krzysztof Kozlowski wrote:
> Samsung Exynos SoCs and boards related bindings evolved since the initial
> introduction, but initially the bindings were minimal and a bit incomplete
> (they never described all the hardware modules available in the SoCs).
> Since then some significant (not fully compatible) changes have been
> already committed a few times (like gpio replaced by pinctrl, display ddc,
> mfc reserved memory, some core clocks added to various hardware modules,
> added more required nodes).
> 
> On the other side there are no boards which have device tree embedded in
> the bootloader. Device tree blob is always compiled from the kernel tree
> and updated together with the kernel image.
> 
> Thus to avoid further adding a bunch of workarounds for old/missing
> bindings, make development of new platforms easier and allow to make
> cleanup of the existing code and device tree files, lets mark some
> Samsung Exynos SoC platform bindings as unstable. This means that
> bindings can may change at any time and users should use the dtb file
           ^^^^^^^
you have a typo here, other than that I agree with the patch:

Acked-by: Andi Shyti <andi@etezian.org>

Thanks,
Andi
