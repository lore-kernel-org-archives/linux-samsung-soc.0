From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 0/2] Move comon DMA nodes to exynos5.dtsi and
Date: Mon, 12 Aug 2013 15:48:41 +0530
Message-ID: <CAAgF-BfjqF-1TcWbZ_nw9Kqrg-xr0H6uMu+u=9N=gaOoq_G2Yw@mail.gmail.com>
References: <1373458449-19039-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1373458449-19039-1-git-send-email-padma.v@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Doug Anderson <dianders@chromium.org>, abrestic@chromium.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, Vinod Koul <vinod.koul@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin,

Any comment on this patch set?
If not can you take into your tree?

Thanks
Padma

On Wed, Jul 10, 2013 at 5:44 PM, Padmavathi Venna <padma.v@samsung.com> wrote:
> Exynos5250 and Exynos5420 has 4 DMA controllers in common. So this patch
> set moved the common nodes to exynos.dtsi keeping the clk info seperate
> for both the platforms. Exynos5420 has a separate DMA controller for audio
> IPs. So this patch set also adds the ADMA node on Exynos5420.
>
> Padmavathi Venna (2):
>   ARM: dts: Move the common DMA controller nodes to exynos5.dtsi
>   ARM: dts: Add DMA controller node info on Exynos5420.
>
>  arch/arm/boot/dts/exynos5.dtsi    |   44 +++++++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5250.dtsi |   30 -------------------------
>  arch/arm/boot/dts/exynos5420.dtsi |   33 +++++++++++++++++++++++++++
>  3 files changed, 77 insertions(+), 30 deletions(-)
>
> --
> 1.7.4.4
>
