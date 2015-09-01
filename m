From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v4 08/16] drm: rockchip/dp: add rockchip platform dp
 driver
Date: Tue, 1 Sep 2015 22:48:17 +0800
Message-ID: <55E5BAB1.4000301@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441087288-25404-1-git-send-email-ykk@rock-chips.com>
 <2919897.nbhB5Cifed@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2919897.nbhB5Cifed@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Heiko,

=E5=9C=A8 2015/9/1 22:24, Heiko Stuebner =E5=86=99=E9=81=93:
> Am Dienstag, 1. September 2015, 14:01:28 schrieb Yakir Yang:
>> Rockchip have three clocks for dp controller, we leave pclk_edp
>> to analogix_dp driver control, and keep the sclk_edp_24m and
>> sclk_edp in platform driver.
>>
>> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>> Changes in v4:
>> - Remove some deprecated DT properties in rockchip dp document.
>>
>> Changes in v3:
>> - Take Thierry Reding and Heiko suggest, leave "sclk_edp_24m" to roc=
kchip
>>    dp phy driver which name to "24m", and leave "sclk_edp" to analog=
ix dp
>>    core driver which name to "dp", and leave "pclk_edp" to rockchip =
dp
>> platform driver which name to "pclk".
>> - Take Heiko suggest, add devicetree binding document.
>> - Take Heiko suggest, remove "rockchip,panel" DT property, take use =
of
>> remote point to get panel node.
>> - Add the new function point analogix_dp_platdata.get_modes init.
>>
>> Changes in v2:
>> - Take Heiko suggest, get panel node with remote-endpoint method,
>>    and create devicetree binding for driver.
>> - Remove the clock enable/disbale with "sclk_edp" & "sclk_edp_24m",
>>    leave those clock to rockchip dp phy driver.
>>
>>   .../bindings/video/analogix_dp-rockchip.txt        |  74 ++++
>>   drivers/gpu/drm/rockchip/Kconfig                   |   9 +
>>   drivers/gpu/drm/rockchip/Makefile                  |   1 +
>>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 389
>> +++++++++++++++++++++ 4 files changed, 473 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/video/analogix_dp-rockchip.txt cre=
ate
>> mode 100644 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>
>> diff --git
>> a/Documentation/devicetree/bindings/video/analogix_dp-rockchip.txt
>> b/Documentation/devicetree/bindings/video/analogix_dp-rockchip.txt n=
ew file
>> mode 100644
>> index 0000000..502483e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/video/analogix_dp-rockchip.t=
xt
>> @@ -0,0 +1,74 @@
>> +Rockchip RK3288 specific extensions to the Analogix Display Port
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Required properties:
>> +- compatible: "rockchip,rk3288-edp";
>> +
>> +- reg: physical base address of the controller and length
>> +
>> +- clocks: from common clock binding: handle to dp clock.
>> +	  of memory mapped region.
>> +
>> +- clock-names: from common clock binding:
>> +	       Required elements: "dp" "pclk"
>> +
>> +- resets: Must contain an entry for each entry in reset-names.
>> +	  See ../reset/reset.txt for details.
>> +
>> +- reset-names: Must include the name "dp"
>> +
>> +- rockchip,grf: this soc should set GRF regs, so need get grf here.
>> +
>> +- ports: contain a port node with endpoint definitions as defined i=
n
>> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
>> +
>> +
>> +For the below properties, please refer to Analogix DP binding docum=
ent:
>> + * Documentation/devicetree/bindings/drm/bridge/analogix_dp.txt
>> +- phys (required)
>> +- phy-names (required)
>> +- hpd-gpios (optional)
>> +-------------------------------------------------------------------=
--------
>> ---- +
>> +Example:
>> +	dp-controller: dp@ff970000 {
>> +		compatible =3D "rockchip,rk3288-dp";
>> +		reg =3D <0xff970000 0x4000>;
>> +		interrupts =3D <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks =3D <&cru SCLK_EDP>, <&cru PCLK_EDP_CTRL>;
>> +		clock-names =3D "dp", "pclk";
>> +		phys =3D <&dp_phy>;
>> +		phy-names =3D "dp";
>> +
>> +		rockchip,grf =3D <&grf>;
>> +		resets =3D <&cru 111>;
>> +		reset-names =3D "dp";
>> +
>> +		status =3D "disabled";
>> +
>> +		ports {
>> +			edp_in: port {
>> +				#address-cells =3D <1>;
>> +				#size-cells =3D <0>;
>> +				edp_in_vopb: endpoint@0 {
>> +					reg =3D <0>;
>> +					remote-endpoint =3D <&vopb_out_edp>;
>> +				};
>> +				edp_in_vopl: endpoint@1 {
>> +					reg =3D <1>;
>> +					remote-endpoint =3D <&vopl_out_edp>;
>> +				};
>> +			};
>> +
>> +			edp_out: port@1 {
>> +				reg =3D <1>;
>> +				#address-cells =3D <1>;
>> +				#size-cells =3D <0>;
>> +				edp_out_panel: endpoint {
>> +					reg =3D <0>;
>> +					remote-endpoint =3D <&panel_in_edp>
>> +				};
>> +			};
>> +		};
>> +	};
>> +
> just a nit right now, because "git am" mentioned it:
>
> git am \[PATCH\ v4\ 08_16\]\ drm_rockchip_dp_add\ rockchip\ platform\=
 dp\
> driver.mbox
> [...]/linux-rockchip/.git/rebase-apply/patch:108: new blank line at E=
OF.
> +
>
> meaning you're adding an empty line at the end :-)

Oh, thanks, I have saw this too when I apply this on linux-next
branch, but I haven't see the log very careful at that time, and
".git/rebase-apply/patch" just empty, so I just go ahead and
forget to fix this one.

Thanks for your remind,
  - Yakir

>
> Heiko
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
