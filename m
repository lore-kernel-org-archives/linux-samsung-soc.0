From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 0/4] phy/mfd/soc: exynos: Header cleanup
Date: Mon, 30 Jan 2017 14:43:01 +0530
Message-ID: <588F039D.3090503@ti.com>
References: <20170127200510.4444-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170127200510.4444-1-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Lee Jones <lee.jones@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org



On Saturday 28 January 2017 01:35 AM, Krzysztof Kozlowski wrote:
> Hi,
> 
> Suggested by Marek, continuation of cleanup of PMU register defines
> in headers.
> 
> Let's keep all of them in include/linux/soc/samsung/exynos-regs-pmu.h.
> 
> This is based on:
> 1. Marek's recent work around pinctrl/power domains/lpass:
>    https://git.linaro.org/people/marek.szyprowski/linux-srpol.git
>    branch: v4.10-next-tm2-pd
> 
> 2. My two previous patches for cleanup:
>    https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git
>    branch: for-v4.11/drivers-soc-exynos-pmu-the-joy-never-ends
> 
> Affected subsystems/drivers:
> 1. phy - drivers,
> 2. mfd - headers,
> 3. soc/samsung - header.
> 
> However because of dependency on Marek's patchset, I do not have a clue
> how to merge it... it is not an urgent stuff, so it may wait till
> dependencies get in.

I'll defer merging this.

Thanks
Kishon
