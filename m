From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: s3c64xx: Fix init order of clock providers
Date: Tue, 8 Oct 2019 19:53:30 +0200
Message-ID: <20191008175330.GA28160@kozik-lap>
References: <CGME20191008165931epcas3p2dd2937d851ed06948dd7746e5a2674b4@epcas3p2.samsung.com>
 <20191008165917.23908-1-krzk@kernel.org>
 <ceede424-e4a2-03f1-3ce0-04f405688721@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <ceede424-e4a2-03f1-3ce0-04f405688721@samsung.com>
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
Cc: Lihua Yao <ylhuajnu@outlook.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Oct 08, 2019 at 07:30:50PM +0200, Sylwester Nawrocki wrote:
> On 10/8/19 18:59, Krzysztof Kozlowski wrote:
> > From: Lihua Yao <ylhuajnu@outlook.com>
> > 
> > fin_pll is the parent of clock-controller@7e00f000, specify
> > the dependency to ensure proper initialization order of clock
> > providers.
> 
> > Fixes: 3f6d439f2022 ("clk: reverse default clk provider initialization order in of_clk_init()")
> 
> The patch looks good but I'm not sure above tag points to the right commit.
> That commit is just a regression fix for
> 1771b10d605d26cc "clk: respect the clock dependencies in of_clk_init"
>  
> How about picking some commit touching the dts files itself, e.g.
> a43736deb47d21bd "ARM: dts: Add dts file for S3C6410-based Mini6410 board" ?

As I understood, the mentioned commit "reverse default clk provider"
caused issue to appear, because of reversed order (first version of this
patch played with the order).  Even though that commit was not strictly
the cause, but should come proably with proper DTS change.  Therefore
the fixes points to right moment of backports.

The DTS commit, at that time, was correct with bindings and with driver.

> 
> > Signed-off-by: Lihua Yao <ylhuajnu@outlook.com>
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Thanks!

Best regards,
Krzysztof
