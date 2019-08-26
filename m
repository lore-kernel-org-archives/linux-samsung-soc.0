From: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 2/2] ARM: exynos: Enable support for ARM architected
 timers
Date: Mon, 26 Aug 2019 11:49:42 +0100
Message-ID: <d286053b6f4b4783d0638dc2dbd5858e@www.loen.fr>
References: <20190826103142.3477-1-m.szyprowski@samsung.com>
 <CGME20190826103203eucas1p2d67b0ef44758eb06252b340f7751701a@eucas1p2.samsung.com>
 <20190826103142.3477-4-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190826103142.3477-4-m.szyprowski@samsung.com>
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
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 2019-08-26 11:31, Marek Szyprowski wrote:
> ARM architected timer can be used together with Exynos MultiCore 
> Timer
> driver, so enable support for it. Support for ARM architected timers 
> is
> essential for enabling proper KVM support.

How can you say that this is to "enable KVM support", while in the 
previous
patch, you set "arm,cpu-registers-not-fw-configured" which implies that 
you're
booting in secure mode with the timer's CP15 registers left to 
undefined values?

         M.
-- 
Jazz is not dead. It just smells funny...
