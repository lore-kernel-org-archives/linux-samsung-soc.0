From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 1/3] ARM: EXYNOS: initial board support for exynos5260
 SoC
Date: Tue, 18 Feb 2014 12:55:46 +0100
Message-ID: <3872362.HBjU7v1oSg@wuerfel>
References: <1392721076-26630-1-git-send-email-rahul.sharma@samsung.com>
 <2203874.7pS2uKgoKp@wuerfel>
 <CAK9yfHwcteO78JG4OhRZtMcpAd-aN85sxqELJ3ZLW0D0PXoZ7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK9yfHwcteO78JG4OhRZtMcpAd-aN85sxqELJ3ZLW0D0PXoZ7w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 18 February 2014 17:11:43 Sachin Kamat wrote:
> On 18 February 2014 16:33, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tuesday 18 February 2014 16:27:54 Rahul Sharma wrote:
> >>
> >> +static struct map_desc exynos5260_iodesc[] __initdata = {
> >> +     {
> >> +             .virtual        = (unsigned long)S5P_VA_SYSRAM_NS,
> >> +             .pfn            = __phys_to_pfn(EXYNOS5260_PA_SYSRAM_NS),
> >> +             .length         = SZ_4K,
> >> +             .type           = MT_DEVICE,
> >> +     },
> >> +};

> > As I commented before, I think we really shouldn't do this any more: There
> > is no excuse why you still need to add SoC specific code here. Please put
> > the SYSRAM into DT and make a proper abstraction for it so you don't have
> > to modify the kernel every time a new SoC variant comes out.
> 
> Do we have any bindings already defined for this kind of stuff or is
> this implemented in
> any other platform/architecture for reference?
> 


It depends on how the sram is used. There is a generic binding in
Documentation/devicetree/bindings/misc/sram.txt that may be appropriate here.

	Arnd
