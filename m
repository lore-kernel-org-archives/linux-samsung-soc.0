From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v2 3/4] ARM64: dts: exynos5433: use macros for pinctrl
 configuration on Exynos5433
Date: Fri, 06 Jan 2017 11:23:43 +0900
Message-ID: <20170106022343.5w4d7pkydrfh2n75@gangnam.samsung>
References: <CGME20161230041427epcas1p1151d6e28fac143c63efaf4f7c8ed432d@epcas1p1.samsung.com>
 <20161230041421.24448-1-andi.shyti@samsung.com>
 <20161230041421.24448-4-andi.shyti@samsung.com>
 <CACRpkdaz9AyFJs1Th_SVexqKaP-=iPF0G-1YXOCoSmrQH8ZHDA@mail.gmail.com>
 <20161230151724.5wlp4hbphasmw3rg@kozik-lap>
 <CACRpkdbX_MuLSCerq08-1VZV6VJfynjkv1QOr7ssOCGvM5aB_Q@mail.gmail.com>
 <20170105200807.54j2ebve6kqd5bob@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-disposition: inline
In-reply-to: <20170105200807.54j2ebve6kqd5bob@kozik-lap>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Andi Shyti <andi@etezian.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, stable <stable@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

> Andi,
> Please fix missing Signed-off-by and resend with Linus' tags for #1 and
> #2 and with other accumulated tags.

patch #1 has already been merged in mainline:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=1259feddd0f83649d5c48d730c140b4f7f3fa288

and patch #2 is in LinusW's -next branch.

does it still make sense to send them again? If you want I can
send again patch 3 and 4 as independent patches with Chanwoo's
review (the only tags).

Thanks,
Andi
