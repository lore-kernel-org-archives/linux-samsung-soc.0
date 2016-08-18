From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 7/7] arm64: dts: exynos: Add dts file for
 Exynos5433-based TM2E board
Date: Thu, 18 Aug 2016 14:10:08 -0500
Message-ID: <20160818191008.GA18429@rob-hp-laptop>
References: <1471328843-26653-1-git-send-email-cw00.choi@samsung.com>
 <1471329328-26842-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1471329328-26842-3-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: mark.rutland@arm.com, k.kozlowski@samsung.com, chanwoo@kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, a.hajda@samsung.com, s.nawrocki@samsung.com, beomho.seo@samsung.com, m.szyprowski@samsung.com, jonghwa3.lee@samsung.com, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, krzk@kernel.org, jh80.chung@samsung.com, kgene@kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com, ingi2.kim@samsung.com, linux-arm-kernel@lists.infradead.org, jaewon02.kim@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, human.hwang@samsung.com, ideal.song@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Aug 16, 2016 at 03:35:28PM +0900, Chanwoo Choi wrote:
> This patcha adds the Device Tree source for Exynos5433-based Samsung TM2E
> board. TM2E board is the most similiar with TM2 board. The exynos5433-tm2e.dts
> include the difference between TM2 and TM2E.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> Signed-off-by: Jonghwa Lee <jonghwa3.lee@samsung.com>
> Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
> Signed-off-by: Inha Song <ideal.song@samsung.com>
> Signed-off-by: Ingi kim <ingi2.kim@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  .../bindings/arm/samsung/samsung-boards.txt        |  1 +
>  arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts     | 41 ++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts

Acked-by: Rob Herring <robh@kernel.org>
