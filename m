From: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: exynos5422-odroidxu3: use cd-gpio method to
 detect sd-card
Date: Tue, 13 Oct 2015 09:37:08 +0530
Message-ID: <CANAwSgR3tR+rZk+3WMc7hd=pspQgvLSWdTJaNrQvQqqdj4DSmA@mail.gmail.com>
References: <1444578364-1384-1-git-send-email-linux.amoon@gmail.com>
 <561B3739.4040701@samsung.com> <561B3A83.6090607@samsung.com>
 <1111856990.2419183.1444661252893.JavaMail.yahoo@mail.yahoo.com>
 <561C4C88.2040004@samsung.com> <561C6713.1070508@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561C6713.1070508-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Anand Moon <moon.linux-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Lukasz Majewski <l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Jaehoon,

On 13 October 2015 at 07:36, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Dear, Anand.
>
>
> On 10/13/2015 09:12 AM, Krzysztof Kozlowski wrote:
>> On 12.10.2015 23:47, Anand Moon wrote:
>>>>
>>>> Anand,
>>>>
>>>> You essentially reverted here af6ad88acbd6 ("ARM: dts: Mux XMMCnDATA[0]
>>>> pad correctly for Exynos5420 boards"). Why? There is no explanation in
>>>> the commit message about this.
>>>
>>> I don't remember to send the patch relevant to this. Hmm...
>>> Well, Is this patch really signed-off by me?
>>>
>>> Best Regards,
>>>
>>> Jaehoon Chung
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>
>>>>
>>>
>>>
>>> Some how I don't receive these mail on my email id.
>>>
>>> I have picked up these changes from tizen repository for OdroidXU3.
>>> I have tested with this changes to detect UHS-I micro cd cards.
>>> That's the reason for this email.
>
> It seems to make manually, right?
> I have checked the tizen repository.
>
> The below is
>
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -335,7 +335,9 @@
>         samsung,dw-mshc-sdr-timing = <0 4>;
>         samsung,dw-mshc-ddr-timing = <0 2>;
>         pinctrl-names = "default";
> -       pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
> +       cd-gpios = <&gpc2 2 0>;
> +       cd-inverted;
> +       pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4>;
>         bus-width = <4>;
>         cap-sd-highspeed;
>  };
>
>
>
> Yours
>
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> @@ -352,8 +352,10 @@
>         samsung,dw-mshc-ciu-div = <3>;
>         samsung,dw-mshc-sdr-timing = <0 4>;
>         samsung,dw-mshc-ddr-timing = <0 2>;
> +       cd-gpios = <&gpc2 2 GPIO_ACTIVE_HIGH>;
> +       cd-inverted;
>         pinctrl-names = "default";
> -       pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
> +       pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
>
> Did you know what differ? :)
>
> Best Regards,
> Jaehoon Chung
>
>>
>> ... and you applied it blindly without looking at actual existing
>> contents and at previous commits.
>>
>> That is not how patches from different repositories should be cherry picked.
>>
>> Best regards,
>> Krzysztof
>>
>>
>

Looks like my changes have introduce another bug so please ignore this changes.

-Anand Moon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
