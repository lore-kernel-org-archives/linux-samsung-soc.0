From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v4 10/16] phy: Add driver for rockchip Display Port PHY
Date: Wed, 02 Sep 2015 09:46:28 +0800
Message-ID: <55E654F4.4000306@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com> <1441087455-25533-1-git-send-email-ykk@rock-chips.com> <5077044.NGUl9gjQon@phil> <3270549.qIHk1CAA0Y@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3270549.qIHk1CAA0Y@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, dianders-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, seanpaul-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel
List-Id: linux-samsung-soc@vger.kernel.org

Hi Heiko,

=E5=9C=A8 09/02/2015 04:58 AM, Heiko Stuebner =E5=86=99=E9=81=93:
> Hi Yakir,
>
> small nit more below
>
> Am Dienstag, 1. September 2015, 18:51:16 schrieb Heiko Stuebner:
>> Am Dienstag, 1. September 2015, 14:04:15 schrieb Yakir Yang:
>>> +- clocks: from common clock binding: handle to dp clock.
>>> +	of memory mapped region.
>>> +- clock-names: from common clock binding:
>>> +	Required elements: "sclk_dp" "sclk_dp_24m"
>>> +
>>> +- rockchip,grf: this soc should set GRF regs, so need get grf here=
=2E
>>> +- #phy-cells : from the generic PHY bindings, must be 0;
>>> +
>>> +Example:
>>> +
>>> +edp_phy: phy@ff770274 {
>> edp_phy: edp-phy {
>>
>>> +	compatilble =3D "rockchip,rk3288-dp-phy";
> typo: compatible

Aha, thanks.

- Yakir
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
