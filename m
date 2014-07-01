From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 04/14] clk: max77686: Improve Maxim 77686 PMIC clocks binding
Date: Tue, 01 Jul 2014 10:29:59 -0700
Message-ID: <20140701172959.32686.9863@quantum>
References: <1403806546-31122-1-git-send-email-javier.martinez@collabora.co.uk>
 <1403806546-31122-5-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403806546-31122-5-git-send-email-javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Daniel Stone <daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Yadwinder Singh Brar <yadi.brar01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Javier Martinez Canillas (2014-06-26 11:15:36)
> Like most clock drivers, the Maxim 77686 PMIC clock binding
> follows the convention that the "#clock-cells" property is
> used to specify the number of cells in a clock provider.
> 
> But the binding document is not clear enough that it shall
> be set to 1 since the PMIC support multiple clocks outputs.
> 
> Also, explain that the clocks identifiers are defined in a
> header file that can be included by Device Tree source with
> client nodes to avoid using magic numbers.
> 
> Signed-off-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Looks good to me.

Regards,
Mike

> ---
> 
> Changes since v4: None
> 
> Changes since v3:
>  - Don't change clock-names property to make clear that it's
>    the consumer clock name and should not match the producer clock.
>    Suggested by Doug Anderson.
> 
>  Documentation/devicetree/bindings/clock/maxim,max77686.txt | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/maxim,max77686.txt b/Documentation/devicetree/bindings/clock/maxim,max77686.txt
> index 96ce71b..48e00bb 100644
> --- a/Documentation/devicetree/bindings/clock/maxim,max77686.txt
> +++ b/Documentation/devicetree/bindings/clock/maxim,max77686.txt
> @@ -9,13 +9,18 @@ The MAX77686 contains three 32.768khz clock outputs that can be controlled
>  Following properties should be presend in main device node of the MFD chip.
>  
>  Required properties:
> -- #clock-cells: simple one-cell clock specifier format is used, where the
> -  only cell is used as an index of the clock inside the provider. Following
> -  indices are allowed:
> +
> +- #clock-cells: from common clock binding; shall be set to 1.
> +
> +Each clock is assigned an identifier and client nodes can use this identifier
> +to specify the clock which they consume. Following indices are allowed:
>      - 0: 32khz_ap clock,
>      - 1: 32khz_cp clock,
>      - 2: 32khz_pmic clock.
>  
> +Clocks are defined as preprocessor macros in dt-bindings/clock/maxim,max77686.h
> +header and can be used in device tree sources.
> +
>  Example: Node of the MFD chip
>  
>         max77686: max77686@09 {
> @@ -34,5 +39,5 @@ Example: Clock consumer node
>                 compatible = "bar,foo";
>                 /* ... */
>                 clock-names = "my-clock";
> -               clocks = <&max77686 2>;
> +               clocks = <&max77686 MAX77686_CLK_PMIC>;
>         };
> -- 
> 2.0.0.rc2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
