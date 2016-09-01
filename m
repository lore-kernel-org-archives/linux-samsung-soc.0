From: Ayaka <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Subject: Re: [PATCH RFC] ARM: dts: samsung: add rga-lvds panel in itop elite
Date: Thu, 1 Sep 2016 16:24:35 +0800
Message-ID: <20EC8D13-CF96-4869-B46F-93A89211367E@soulik.info>
References: <1472511002-9019-1-git-send-email-ayaka@soulik.info> <dee989f5-17b0-7445-514b-559e98d77acd@samsung.com> <790048d1-6533-2e43-5343-13782382bf84@soulik.info> <94dc2e0d-2521-a636-ee3d-90168f30fe28@samsung.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=big5
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <94dc2e0d-2521-a636-ee3d-90168f30fe28-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org



從我的 iPad 傳送
Thank you
> Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> 於 2016年9月1日 下午3:04 寫道：
> 
>> On 08/31/2016 07:55 PM, ayaka wrote:
>> 
>>> On 08/31/2016 08:30 PM, Andrzej Hajda wrote:
>>> Hi,
>>> 
>>> 
>>>> On 08/30/2016 12:50 AM, Randy Li wrote:
>>>> It is actually a lvds panel connected through a rga-lvds bridge.
>>>> But I really have no idea about what does a port mean in fimd node.
>>>> 
>>>> Also how should I configure this panel size? I think the i2c found
>>>> on the panel schematic, but it more likely to be used a touch screen
>>>> touth. Also the touch screen is not supported in currently driver.
>>>> 
>>>> Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
>>>> ---
>>>>  arch/arm/boot/dts/exynos4412-itop-elite.dts | 35 ++++++++++++++++++++++++++---
>>>>  1 file changed, 32 insertions(+), 3 deletions(-)
>>>> 
>>>> diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
>>>> index e1cda54..2d67385 100644
>>>> --- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
>>>> +++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
>>>> @@ -139,6 +139,20 @@
>>>>          assigned-clocks = <&clock CLK_MOUT_CAM0>;
>>>>          assigned-clock-parents = <&clock CLK_XUSBXTI>;
>>>>      };
>>>> +    
>>>> +    vcc_sys_lcd: sys-lcd {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "vcc_5v";
>>>> +        regulator-min-microvolt = <5000000>;
>>>> +        regulator-max-microvolt = <5000000>;
>>>> +        gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
>>>> +    };
>>>> +
>>>> +    panel: panel {
>>>> +        ddc-i2c-bus = <&i2c_3>;
>>>> +        power-supply = <&vcc_sys_lcd>;
>>>> +        enable-gpios = <&gpl0 2 GPIO_ACTIVE_HIGH>;
>>>> +    };
>>> Panel has no compatible string, which driver will handle this node?
>> The problem is that, it is panel not supported by kernel. 
> 
> For simple panel you can take a look at [1][2]. Ie. if the panel needs
> only power supply and enable gpio, you just need to add few lines to [2].
But I still don't know which compatible string I should use, "simple-dpi" ?
> 
> 
> [1]: Documentation/devicetree/bindings/display/panel/simple-panel.txt
> [2]: drivers/gpu/drm/panel/panel-simple.c
> 
>> Is it possible 
>> to support without adding a new driver for it ? I know there is a 
>> simple-dpi for MIPI, but what is for parallel video or lvds?
> 
> simple-dpi is just parallel output. LVDS is not supported by Exynos4412 but
> boards usually have RGB/LVDS bridge for such panels, I have no access to
> itop
> board schematics, but I suppose it has such bridge. LVDS bridges often
> do not
> need Linux driver, so from developer point of view LVDS panels with such
> bridge
Yes it is.
> are handled the same way as RGB panels. Example fimd bindings for RGB panels
> are in [3].
> 
> [3]: arch/arm/boot/dts/exynos4210-universal_c210.dts
> 
Would it appear as a frame buffer device in Linux ? Regard of display timings, I could solve it later. If the frame buffer node is created, I could know I have a way to test.
>>> Regards
>>> Andrzej
>> The other problem is that I don't how to configure the display-times, 
>> the datasheet for CLAA070WP03XG only talk about total time, active time 
>> and blank time for both Horizontal an Vertical time. Does it mean the 
>> front-porch and sync-len for horizontal and vertical are zero ?
> 
> You can look at vendor's code.
It is a very old kernel. But it seems that they didn't configure the fimd but the frame buffer.
> Or just experiment with different values.
> The equation is: total=active+back_porch+blank+front_porch.
> So if htotal=864, hactive=800, hblank=64, then hporches are 0.
> In case of vtotal=1288, vactive=1200, vblank=8 you have left 80 for porches,
> you can try to split them equally for front and back for starters.
But timings diagram in data sheet doesn't look like that, I have asked the vendor for some help, I hope I could get a reply from the vendor.
> 
> Regards
> Andrzej
> 
>> 
>> +       ports {
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               port@3 {
>> +                       reg = <3>;
>> +                       rga_lvds: endpoint {
>> +                               remote-endpoint = <&panel>;
>> +                       };
>> +               };
>> +       };
>> +
>> +       panel: panel@0 {
>> +               compatible = "panel-simple";
>> +
>> +               power-supply = <&vcc_sys_lcd>;
>> +               enable-gpios = <&gpl0 2 GPIO_ACTIVE_HIGH>;
>> +               display-timings {
>> +                       timing-0 {
>> +                               clock-frequency = <66770000>;
>> +                               hactive = <800>;
>> +                               vactive = <1280>;
>> +                               hfront-porch = <0>;
>> +                               hback-porch = <64>;
>> +                               hsync-len = <0>;
>> +                               vfront-porch = <0>;
>> +                               vback-porch = <8>;
>> +                               vsync-len = <0>;
>> +                       };
>> +      };
>> 
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> 
>> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
