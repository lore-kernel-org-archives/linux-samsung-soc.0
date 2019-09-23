From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 08/10] ASoC: samsung: Rename Arndale card driver
Date: Mon, 23 Sep 2019 11:17:46 +0200
Message-ID: <20190923091746.GD4577@pi3>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130323eucas1p218c6822eca3869eb0d3b7380497bbca4@eucas1p2.samsung.com>
 <20190920130218.32690-9-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190920130218.32690-9-s.nawrocki@samsung.com>
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

On Fri, Sep 20, 2019 at 03:02:17PM +0200, Sylwester Nawrocki wrote:
> Rename arndale_rt5631.c to just arnddale.c as we support other CODECs
> than RT5631.  While at it replace spaces in Kconfig with tabs.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - new patch.
> ---
>  sound/soc/samsung/Kconfig                         | 10 +++++-----
>  sound/soc/samsung/Makefile                        |  4 ++--
>  sound/soc/samsung/{arndale_rt5631.c => arndale.c} |  0
>  3 files changed, 7 insertions(+), 7 deletions(-)
>  rename sound/soc/samsung/{arndale_rt5631.c => arndale.c} (100%)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
