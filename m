From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Add #sound-dai-cells property to
 exynos5250 i2s nodes
Date: Wed, 14 Mar 2018 20:15:19 +0100
Message-ID: <20180314191519.53tror6r2cdgy5le@kozik-lap>
References: <CGME20180313171232epcas1p4425993ba6042b06051cc7590d3dbeab4@epcas1p4.samsung.com>
 <20180313171220.26333-1-s.nawrocki@samsung.com>
 <4258f14d-ee0e-48b5-9674-e8e93d2aff69@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <4258f14d-ee0e-48b5-9674-e8e93d2aff69@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Mar 14, 2018 at 11:10:48AM +0100, Sylwester Nawrocki wrote:
> On 03/13/2018 06:12 PM, Sylwester Nawrocki wrote:
> > The #sound-dai-cells property may be required to reference the CPU DAI
> > properly. This change is required for Snow HDMI audio.
> > 
> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> There is
> 
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> tag missing here.
> 

Thanks, applied with Marek's tag.

Best regards,
Krzysztof
