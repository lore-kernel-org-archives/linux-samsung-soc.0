From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 03/10] ASoC: wm8994: Add support for setting MCLK
 clock rate
Date: Mon, 23 Sep 2019 12:09:57 +0200
Message-ID: <20190923100957.GA4723@pi3>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130316eucas1p2de713006a13c62c0b895c2e33e0d14c7@eucas1p2.samsung.com>
 <20190920130218.32690-4-s.nawrocki@samsung.com>
 <7334ce45-f192-4421-aa3d-d142582153ef@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <7334ce45-f192-4421-aa3d-d142582153ef@samsung.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Sep 23, 2019 at 11:10:48AM +0200, Sylwester Nawrocki wrote:
> On 9/20/19 15:02, Sylwester Nawrocki wrote:
> > Extend the set_sysclk() handler so we also set frequency of the MCLK1,
> > MCLK2 clocks through clk API when those clocks are specified in DT.
> > 
> > Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Sorry, I squashed other patch to this one but forgot to remove above tags, 
> not sure if those still stand as there was rather significant change in 
> the patch. 

It's good. For the record:

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
