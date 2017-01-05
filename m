From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/4] ARM64: dts: exynos5433: use macros for pinctrl
 configuration on Exynos5433
Date: Thu, 5 Jan 2017 22:08:07 +0200
Message-ID: <20170105200807.54j2ebve6kqd5bob@kozik-lap>
References: <CGME20161230041427epcas1p1151d6e28fac143c63efaf4f7c8ed432d@epcas1p1.samsung.com>
 <20161230041421.24448-1-andi.shyti@samsung.com>
 <20161230041421.24448-4-andi.shyti@samsung.com>
 <CACRpkdaz9AyFJs1Th_SVexqKaP-=iPF0G-1YXOCoSmrQH8ZHDA@mail.gmail.com>
 <20161230151724.5wlp4hbphasmw3rg@kozik-lap>
 <CACRpkdbX_MuLSCerq08-1VZV6VJfynjkv1QOr7ssOCGvM5aB_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbX_MuLSCerq08-1VZV6VJfynjkv1QOr7ssOCGvM5aB_Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Andi Shyti <andi.shyti@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, stable <stable@vger.kernel.org>, Andi Shyti <andi@etezian.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jan 03, 2017 at 09:24:34AM +0100, Linus Walleij wrote:
> On Fri, Dec 30, 2016 at 4:17 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Fri, Dec 30, 2016 at 02:32:39PM +0100, Linus Walleij wrote:
> >> On Fri, Dec 30, 2016 at 5:14 AM, Andi Shyti <andi.shyti@samsung.com> wrote:
> >>
> >> > Use the macros defined in include/dt-bindings/pinctrl/samsung.h
> >> > instead of hardcoded values.
> >> >
> >> > Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> >>
> >> These look fine, but that this and the other DTS patch through ARM SoC.
> >>
> >> If you also need the headerfile patch (patch 2) to go through ARM SoC
> >> that is fine,
> >> I can take it out of pinctrl if you want.
> >
> > Yes, I need the header. It would be much appreciated if you could
> > provide a tag or stable branch with it.
> 
> Nah better just merge that patch into the ARM SoC tree only.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I'll remove it from the pinctrl tree.

Thanks, I see it being dropped.

Andi,
Please fix missing Signed-off-by and resend with Linus' tags for #1 and
#2 and with other accumulated tags.

Best regards,
Krzysztof
