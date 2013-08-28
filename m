From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: DT: Exynos: fix number of interrupt-cells in mct node
Date: Wed, 28 Aug 2013 12:31:12 +0200
Message-ID: <1525883.6gVrCoPa3t@amdc1227>
References: <1371220886-11616-1-git-send-email-chander.kashyap@linaro.org>
 <52112004.90202@samsung.com>
 <CANuQgHFP2n33neHbW90JZbPmcPkZ-X=NDwXDqQw1sfQUUT_zNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <CANuQgHFP2n33neHbW90JZbPmcPkZ-X=NDwXDqQw1sfQUUT_zNQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "thomas.ab@samsung.com" <thomas.ab@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chander,

On Wednesday 28 of August 2013 15:20:40 Chander Kashyap wrote:
> On 19 August 2013 00:57, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > On 08/12/13 15:23, Chander Kashyap wrote:
> >> ping
> >> 
> >> On 23 July 2013 15:17, Chander Kashyap<chander.kashyap@linaro.org>  
wrote:
> >>> ping.
> >>> 
> >>> On 14 June 2013 20:11, Chander Kashyap<chander.kashyap@linaro.org>
> >>> 
> >>> wrote:
> >>>> Two cells were used to specify interrupts in mct node, while second
> >>>> cell
> >>>> always remains unused. Hence use only one cell.
> >>>> Suggested by Tomasz Figa.
> >>>> 
> >>>> Signed-off-by: Chander Kashyap<chander.kashyap@linaro.org>
> >>>> ---
> >>>> 
> >>>>   arch/arm/boot/dts/exynos4210.dtsi |   19 +++++++++----------
> >>>>   arch/arm/boot/dts/exynos4212.dtsi |   19 +++++++++----------
> >>>>   arch/arm/boot/dts/exynos4412.dtsi |   23 +++++++++++------------
> >>>>   arch/arm/boot/dts/exynos5250.dtsi |   19 +++++++++----------
> >>>>   4 files changed, 38 insertions(+), 42 deletions(-)
> >>>> 
[snip]
> > 
> > Should be updated with regarding Doc.
> 
> Will update the document.

Apparently I missed your patch and did the same change for Exynos 4 SoCs in 
my patch series[1] cleaning up Exynos 4 device tree files a bit.

Since in my series it is a part of a more complex change, i.e. moving mct 
node to exynos4x12.dtsi and update of MCT bindings documentation, would you 
mind if we could keep with my patch doing this change for Exynos 4 and 
yours taking care for Exynos 5?

The documentation is already being updated in my series, so you could just 
drop the changes done to exynos4*.dtsi files in next version.

[1] http://thread.gmane.org/gmane.linux.kernel.samsung-soc/22207

Best regards,
Tomasz
