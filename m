From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 10/14] regulator: of: Add support for parsing initial
 and suspend modes
Date: Tue, 04 Nov 2014 11:41:17 +0100
Message-ID: <1415097677.7941.8.camel@AMDC1943>
References: <1415025649-8119-1-git-send-email-javier.martinez@collabora.co.uk>
 <1415025649-8119-11-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1415025649-8119-11-git-send-email-javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On pon, 2014-11-03 at 15:40 +0100, Javier Martinez Canillas wrote:
> Some regulators support their operating mode to be changed on startup
> or by consumers when the system is running while others only support
> their operating mode to be changed while the system has entered in a
> suspend state.
> 
> The regulator Device Tree binding documents a set of properties to
> configure the regulators operating modes from a FDT. This patch builds
> on (40e20d6 regulator: of: Add support for parsing regulator_state for
> suspend state) and adds support to parse those properties and fill the
> regulator constraints so the regulator core can call the right suspend
> handlers when the system enters into sleep.
> 
> The modes are defined in the Device Tree using the hardware specific
> modes supported by the regulators. Regulator drivers have to define a
> translation function that is used to map the hardware specific modes
> to the standard ones.
> 
> Signed-off-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> ---
> 
> Changes in v4:
>  - Parse the properties in the core and map using driver provided functions.
>    Suggested by Mark Brown
> 
> Changes in v3:
>  - Use the standard suspend states binding instead of custom properties.
>    Suggested by Mark Brown
> 
>  drivers/regulator/of_regulator.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
> index cbc1d71..cd65885 100644
> --- a/drivers/regulator/of_regulator.c
> +++ b/drivers/regulator/of_regulator.c
> @@ -25,7 +25,8 @@ static const char *const regulator_states[PM_SUSPEND_MAX + 1] = {
>  };
>  
>  static void of_get_regulation_constraints(struct device_node *np,
> -					struct regulator_init_data **init_data)
> +					struct regulator_init_data **init_data,
> +					const struct regulator_desc *desc)
>  {
>  	const __be32 *min_uV, *max_uV;
>  	struct regulation_constraints *constraints = &(*init_data)->constraints;
> @@ -81,6 +82,14 @@ static void of_get_regulation_constraints(struct device_node *np,
>  	if (!ret)
>  		constraints->enable_time = pval;
>  
> +	if (!of_property_read_u32(np, "regulator-initial-mode", &pval)) {
> +		if (desc && desc->map_modes)
> +			constraints->initial_mode = desc->map_modes(pval);
> +		else
> +			pr_warn("%s: failed to parse regulator-initial-mode\n",
> +				np->name);
> +	}
> +

Here's a hidden assumption that if driver does not provide map_modes
then any "regulator-initial-mode" property is not valid. Shouldn't this
be mentioned somewhere? Maybe in description of map_modes callback?

Best regards,
Krzysztof


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
