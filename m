From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] arm: dts: Fix audio card detection on peach boards
Date: Mon, 12 Oct 2015 11:18:55 +0200
Message-ID: <561B7AFF.1080707@samsung.com>
References: <1444631169-19468-1-git-send-email-alim.akhtar@samsung.com>
 <561B578E.1050308@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <561B578E.1050308-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 12/10/15 08:47, Krzysztof Kozlowski wrote:
>> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> > index 8f4d76c..525a93a 100644
>> > --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> > +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> > @@ -1056,5 +1056,10 @@
>> >  	timeout-sec = <32>;
>> >  };
>> >  
>> > +&pmu_system_controller {
>
> Please put the node in alphabetical order.
> 
>> > +	assigned-clocks = <&pmu_system_controller 0>;
>> > +	assigned-clock-parents =  <&clock CLK_FIN_PLL>;
>
> I might be missing something here but isn't the first clock of
> pmu_system_controller already a CLK_FIN_PLL? So you are reparenting the
> FIN_PLL to FIN_PLL?

No, it's not, the first PMU consumer clock is indeed CLK_FIN_PLL,
but pmu_system_controller is also a clock provider.  The first output
clock of pmu_system_controller is CLKOUT, it's a composite mux and
gate clock (registered in drivers/clk/samsung /clk-exynos-clkout.c).
So  the above dts change is selecting an external oscillator input of
the CLKOUT mux, i.e. it will route 24 MHz clock signal from the external
oscillator to the CLKOUT output pin, to which audio CODEC is connected
on peach-pit AFAICS.

-- 
Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
