From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 3/9] ASoC: wm8994: Add support for setting MCLKn clock
 rate
Date: Thu, 19 Sep 2019 10:00:21 +0200
Message-ID: <20190919080021.GC13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104658eucas1p2c1f07d3e8b915d8c3a448b80d2af5df0@eucas1p2.samsung.com>
 <20190918104634.15216-4-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-4-s.nawrocki@samsung.com>
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

On Wed, Sep 18, 2019 at 12:46:28PM +0200, Sylwester Nawrocki wrote:
> Extend the set_sysclk() handler so we also set frequency of the MCLK1,
> MCLK2 clocks through clk API when those clocks are specified in DT for
> the device.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/codecs/wm8994.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
