From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v4 09/16] drm: rockchip: add bpc and color mode setting
Date: Wed, 2 Sep 2015 18:02:25 +0800
Message-ID: <55E6C931.9090306@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441087308-25455-1-git-send-email-ykk@rock-chips.com>
 <120097760.HO2inCimVA@phil> <55E659AC.9000402@rock-chips.com>
 <20150902083445.GA24654@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150902083445.GA24654-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, dianders-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, seanpaul-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel@vg
List-Id: linux-samsung-soc@vger.kernel.org

Thierry,

=E5=9C=A8 2015/9/2 16:34, Thierry Reding =E5=86=99=E9=81=93:
> On Wed, Sep 02, 2015 at 10:06:36AM +0800, Yakir Yang wrote:
>> =E5=9C=A8 09/02/2015 05:00 AM, Heiko Stuebner =E5=86=99=E9=81=93:
>>> Am Dienstag, 1. September 2015, 14:01:48 schrieb Yakir Yang:
> [...]
>>>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>>>> b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c index 34b78e7..5d7f9=
b6 100644
>>>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>>>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>>>> @@ -811,14 +811,41 @@ static const struct drm_plane_funcs vop_plan=
e_funcs =3D
>>>> {
>>>>
>>>>   int rockchip_drm_crtc_mode_config(struct drm_crtc *crtc,
>>>>   				  int connector_type,
>>>> -				  int out_mode)
>>>> +				  int bpc, int color)
>>>>   {
>>>>   	struct vop *vop =3D to_vop(crtc);
>>>> -
>>>>   	vop->connector_type =3D connector_type;
>>>>   	vop->connector_out_mode =3D out_mode;
>>> this line should probably go away, as the source var "out_mode" doe=
s not exist
>>> in the function params any more, making the compilation break, and =
is set
>>> below anyway.
>> Sorry for the failed, there are must be a problem when I backport th=
ose code
>> to chrome-3.14 to verify.
>>
>> Thanks a lot, I would update next version soon.
> *sigh*
>
> I get the feeling that you're going about upstreaming the wrong way. =
If
> you post patches to upstream mailing lists and you expect people to
> apply those patches, then your target is the upstream kernel. So you
> should be basing all of your work on top of a recent release candidat=
e
> directly from Linus or some recent version of linux-next.

Yeah, do feel I am in the wrong way now. I used to write my patch on
linux-next branch, then backport some head file to productor kernel,
so I can check compiled failed. After that, I backport the dp driver co=
de
to normal productor kernel, start to debug the function.

So I used to ensure no compiled failed on upstrean kernel, actually it'=
s
also hard to ensure, cause I just backport head file. Not even debug th=
e
function on upstream kernel.

> Your current approach is already making people waste time trying to
> build the patches and fail because you've been testing on something
> other than mainline or linux-next.
>
> At the very least your code must compile when applied against a recen=
t
> upstream tree. I would also expect you to make sure the code works at
> runtime, though, contrary to build testing, not everybody will be abl=
e
> to verify that you've actually done so. It is ultimately your platfor=
m
> maintainer's (i.e. Heiko's) responsibility to ensure that because the=
y
> will get to deal with user complaints if people can't run an upstream
> kernel on the devices.

Oh, first time to know this rule. So I should work on Heiko's github
kernel branch at the first time to start send upstream.

> I realize that the upstream kernel isn't what's going to end up in
> products later on, but that doesn't change the fact that you're
> submitting code for inclusion in the mainline tree. If you need to
> backport code to some ChromeOS tree, then that should be done after
> you've verified that things build and run upstream. Doing so makes li=
fe
> a lot easier for your upstream maintainers, and that in turn makes it
> more likely to get your code merged.

=46eel free now, I would correct those in bellow version. Thanks
for your remind (or maybe complain :-D ).

- Yakir
> Thierry


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
