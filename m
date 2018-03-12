From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 7/7] ASoC: samsung: Add HDMI audio
 support for Chromebook Snow
Date: Mon, 12 Mar 2018 08:39:11 +0100
Message-ID: <CAJKOXPddtARqmHAfYYp80pfnz8t_2ctT5bnf89bQw95LDUKQOw@mail.gmail.com>
References: <CGME20180309175019epcas2p34a7fd706117cb18d31109dbc9c8cf60b@epcas2p3.samsung.com>
 <20180309174858.24017-1-s.nawrocki@samsung.com>
 <20180309174858.24017-7-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180309174858.24017-7-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, sbkim73@samsung.com, lgirdwood@gmail.com, robh+dt@kernel.org, javierm@redhat.com, broonie@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 9, 2018 at 6:48 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> This patch updates the driver so, in addition to current DT bindings,
> the new DT bindings with cpu, codec subnodes can be used, in order to
> support sound on the HDMI interface.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - adjustments to changed order of codecs in codec/cpu-dai property,
>  - fixed errors in snow_remove().
> ---
>  sound/soc/samsung/snow.c | 226 +++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 178 insertions(+), 48 deletions(-)
>
> diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
> index fc62110f500f..f00ca1ca0171 100644
> --- a/sound/soc/samsung/snow.c
> +++ b/sound/soc/samsung/snow.c
> @@ -11,92 +11,207 @@
>   * General Public License for more details.
>   */
>
> +#include <linux/clk.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> -
> +#include <sound/pcm_params.h>
>  #include <sound/soc.h>
>
>  #include "i2s.h"
>
> -#define FIN_PLL_RATE           24000000
> +#define FIN_PLL_RATE           24000000UL

This change looks unrelated so how about making it separate patch?

For the rest:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
