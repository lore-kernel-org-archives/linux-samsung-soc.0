From: Philipp Zabel <pza@pengutronix.de>
Subject: Re: [PATCH 06/14] media: platform: fix several typos
Date: Tue, 19 Feb 2019 17:57:30 +0100
Message-ID: <20190219165730.krayjve6ychvlxqn@pengutronix.de>
References: <f235ba60b2b7e5fba09d3c6b0d5dbbd8a86ea9b9.1550518128.git.mchehab+samsung@kernel.org>
 <362e90167292e8d0c03a8d0753cc26b89549d854.1550518128.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <362e90167292e8d0c03a8d0753cc26b89549d854.1550518128.git.mchehab+samsung@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Patrice Chotard <patrice.chotard@st.com>, Andrzej Hajda <a.hajda@samsung.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Michal Simek <michal.simek@xilinx.com>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, linux-samsung-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 18, 2019 at 02:29:00PM -0500, Mauro Carvalho Chehab wrote:
> Use codespell to fix lots of typos over frontends.
> 
> Manually verified to avoid false-positives.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
[...]
> diff --git a/drivers/media/platform/coda/coda-jpeg.c b/drivers/media/platform/coda/coda-jpeg.c
> index 9f899a6cefed..39a2351c1e48 100644
> --- a/drivers/media/platform/coda/coda-jpeg.c
> +++ b/drivers/media/platform/coda/coda-jpeg.c
> @@ -103,7 +103,7 @@ static const unsigned char chroma_ac_value[162 + 2] = {
>  
>  /*
>   * Quantization tables for luminance and chrominance components in
> - * zig-zag scan order from the Freescale i.MX VPU libaries
> + * zig-zag scan order from the Freescale i.MX VPU libraries
>   */
>  
>  static unsigned char luma_q[64] = {

Thank you, for coda
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
