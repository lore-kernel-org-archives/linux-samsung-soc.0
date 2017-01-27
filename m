From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/3] pinctrl: dt-bindings: samsung: Add Exynos7 specific
 pinctrl macro definitions
Date: Fri, 27 Jan 2017 13:25:42 +0100
Message-ID: <7a0d543f-37e8-98e9-15b4-7d3f808f8516@samsung.com>
References: <1484718141-28785-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170118054002epcas5p3b08e2f419976e17a3c584d64776810fd@epcas5p3.samsung.com>
 <1484718141-28785-3-git-send-email-pankaj.dubey@samsung.com>
 <20170118141935.eu7wmki7jnjdarkw@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20170118141935.eu7wmki7jnjdarkw@kozik-lap>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pankaj Dubey <pankaj.dubey@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, javier@osg.samsung.com, robh+dt@kernel.org, kgene@kernel.org, alim.akhtar@samsung.com, sanath@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 01/18/2017 03:19 PM, Krzysztof Kozlowski wrote:
> On Wed, Jan 18, 2017 at 11:12:20AM +0530, Pankaj Dubey wrote:
>> Exynos7 SoC pinctrl configurations are similar to existing Exynos4/5 except
>> for FSYS1 pinctrl drive strengths. So adding Exynos7 specific FSYS1 blocks
>> pinctrl driver strength related macros which will be used in Exynos7
>> DTSi files.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>  include/dt-bindings/pinctrl/samsung.h | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
> 
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> I will need this header, so Sylwester if it is okay with you, could you
> provide a tag with it (or ack it)?

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

I don't have pinctrl/samsung git tree, Linus applies patches directly.

-- 
Regards,
Sylwester

> diff --git a/include/dt-bindings/pinctrl/samsung.h
b/include/dt-bindings/pinctrl/samsung.h
> index 6276eb7..3f1d583 100644
> --- a/include/dt-bindings/pinctrl/samsung.h
> +++ b/include/dt-bindings/pinctrl/samsung.h
> @@ -54,4 +54,12 @@
>  #define EXYNOS_PIN_FUNC_6		6
>  #define EXYNOS_PIN_FUNC_F		0xf
>
> +/* Drive strengths for Exynos7 FSYS1 block */
> +#define EXYNOS7_FSYS1_PIN_DRV_LV1	0
> +#define EXYNOS7_FSYS1_PIN_DRV_LV2	4
> +#define EXYNOS7_FSYS1_PIN_DRV_LV3	2
> +#define EXYNOS7_FSYS1_PIN_DRV_LV4	6
> +#define EXYNOS7_FSYS1_PIN_DRV_LV5	1
> +#define EXYNOS7_FSYS1_PIN_DRV_LV6	5
> +
>  #endif /* __DT_BINDINGS_PINCTRL_SAMSUNG_H__ */
> -- 2.7.4
