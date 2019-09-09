From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/2] ARM: exynos: Enable support for ARM architected
 timers
Date: Mon, 9 Sep 2019 20:58:43 +0200
Message-ID: <20190909185843.GA9827@kozik-lap>
References: <20190828121005.29368-1-m.szyprowski@samsung.com>
 <CGME20190828121012eucas1p2fb78bfebe16d744dc28194bb224650e2@eucas1p2.samsung.com>
 <20190828121005.29368-3-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190828121005.29368-3-m.szyprowski@samsung.com>
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
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 28, 2019 at 02:10:05PM +0200, Marek Szyprowski wrote:
> ARM architected timer can be used together with Exynos MultiCore Timer
> driver, so enable support for it. Support for ARM architected timers is
> essential for enabling proper KVM support.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig | 1 +

Thanks, applied this one only from the set (I will have send another soc
pull request before merge window).

Best regards,
Krzysztof
