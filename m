From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v2 5/7] regulator: max77802: Document regulator opmode
 DT properties
Date: Fri, 17 Oct 2014 14:39:15 +0200
Message-ID: <54410DF3.5020005@collabora.co.uk>
References: <1413478133-2577-1-git-send-email-javier.martinez@collabora.co.uk> <1413478133-2577-6-git-send-email-javier.martinez@collabora.co.uk> <20141017115701.GE1820@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141017115701.GE1820-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Mark,

On 10/17/2014 01:57 PM, Mark Brown wrote:
> On Thu, Oct 16, 2014 at 06:48:51PM +0200, Javier Martinez Canillas wrote:
> 
>> +- maxim,regulator-initial-mode: initial operating mode.
>> +  This property can only be used on regulators that support changing their mode
>> +  during normal operation. These regulators are LDO1, LDO3, LDO20 and LDO21.
>> +- maxim,regulator-disk-mode: operating mode for the regulator when the system
>> +  enters in the Suspend-to-Disk state.
>> +- maxim,regulator-mem-mode: operating mode for the regulator when the system
>> +  enters in the Suspend-to-RAM state.
> 
> This seems pretty ugly since it's not integrated with the suspend state
> binding at all - adding new suspend modes is going to involve changing
> the binding which seems icky.  Adding a standard property to set modes
> doesn't seem so bad, I think a translation function to parse device
> specific mode bindings in properties might be the way forwards.
> 

Just to be sure I understood correctly, are you suggesting something like this?

	ldo1_reg: LDO1 {
		regulator-name = "vdd_1v0";
		regulator-min-microvolt = <1000000>;
		regulator-max-microvolt = <1000000>;
		regulator-state-mem {
			regulator-on-in-suspend;
			regulator-mode = <MAX77802_OPMODE_LP>;
		};
	};

In other words, extending Chanwoo Choi's original suspend state binding to add
the regulator-mode property that was present in his v3 [0] but instead trying
to use the standard REGULATOR_MODE_*, say that each regulator driver should
define it's own device-specific set of modes and a do the translation to fill
standard modes in the struct regulation_constraints {initial,disk,mem} mode?

That way adding new suspend states, will only require changing the generic
regulator binding but not the regulator driver specific bindings.

Best regards,
Javier

[0]: https://lkml.org/lkml/2014/8/13/768
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
