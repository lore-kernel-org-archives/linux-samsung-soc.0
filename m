From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] phy: exynos5-usbdrd: Calibrate LOS levels for exynos5420/5800
Date: Mon, 18 Sep 2017 15:43:47 +0300
Message-ID: <87vakgmb24.fsf@linux.intel.com>
References: <1505728934-6200-1-git-send-email-andrzej.p@samsung.com> <CGME20170918100944eucas1p2735d3d6a6ee562b927fb9dfaeb0d4090@eucas1p2.samsung.com> <1505729371-6509-1-git-send-email-andrzej.p@samsung.com> <87y3pcmgv6.fsf@linux.intel.com> <e1e1b4e5-0678-faaf-e97b-b18095342af2@ti.com> <96001441-2a67-ac9c-a606-eac66138d09e@samsung.com> <5c90f022-5cb1-c746-6015-c93a58805cfe@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5c90f022-5cb1-c746-6015-c93a58805cfe-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> writes:
>>>>> +static int exynos5_usbdrd_phy_reset(struct phy *phy)
>>>>> +{
>>>>> +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
>>>>> +	struct exynos5_usbdrd_phy *phy_drd =3D to_usbdrd_phy(inst);
>>>>> +
>>>>> +	return exynos5420_usbdrd_phy_calibrate(phy_drd);
>>>>> +}
>>>>> +
>>>>>    static const struct phy_ops exynos5_usbdrd_phy_ops =3D {
>>>>>    	.init		=3D exynos5_usbdrd_phy_init,
>>>>>    	.exit		=3D exynos5_usbdrd_phy_exit,
>>>>>    	.power_on	=3D exynos5_usbdrd_phy_power_on,
>>>>>    	.power_off	=3D exynos5_usbdrd_phy_power_off,
>>>>> +	.reset		=3D exynos5_usbdrd_phy_reset,
>>>>>    	.owner		=3D THIS_MODULE,
>>>>>    };
>>>>>=20=20=20=20
>>>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>>>> index 03474d3..1d5836e 100644
>>>>> --- a/drivers/usb/dwc3/core.c
>>>>> +++ b/drivers/usb/dwc3/core.c
>>>>> @@ -156,9 +156,10 @@ static void __dwc3_set_mode(struct work_struct *=
work)
>>>>>    		} else {
>>>>>    			if (dwc->usb2_phy)
>>>>>    				otg_set_vbus(dwc->usb2_phy->otg, true);
>>>>> -			if (dwc->usb2_generic_phy)
>>>>> +			if (dwc->usb2_generic_phy) {
>>>>>    				phy_set_mode(dwc->usb2_generic_phy, PHY_MODE_USB_HOST);
>>>>> -
>>>>> +				phy_reset(dwc->usb2_generic_phy);
>>>>
>>>> it doesn't look like this is the best place to reset the phy. Also,
>>>
>>> right, phy_reset is done during initialization before phy_power_on/phy_=
init or
>>> in error cases.
>>>
>>>> ->reset() doesn't seem to match correctly with a calibration. That see=
ms
>>>> to be more fitting to a ->power_on() or ->init() implementation.
>>>
>>> yeah, the initial patch seems to calibrate in phy_init(). Not sure why =
it's
>>> modified.
>>=20
>> The original patch used a hack like below, in xhci_plat_probe():
>>=20
>> +       /* Initialize and power-on USB 3.0 PHY */
>> +       xhci->shared_hcd->phy->init_count =3D 0;
>> +       ret =3D phy_init(xhci->shared_hcd->phy);
>> +       if (ret)
>> +               goto dealloc_usb3_hcd;
>> +
>> +       xhci->shared_hcd->phy->power_count =3D 0;
>> +       ret =3D phy_power_on(xhci->shared_hcd->phy);
>> +       if (ret) {
>> +               phy_exit(xhci->shared_hcd->phy);
>> +               goto dealloc_usb3_hcd;
>> +       }
>> +
>>=20
>> Manually setting init_count to 0 in order for the subsequent phy_init() =
to
>> happen probably does not look good.
>>=20
>> The calibration is clearly needed. However, I don't have any strong opin=
ions
>> on from which place exactly to trigger the calibration process.
>> The original patch did not make it upstream, but if that patch is ok,
>> it is perfectly fine with me to drop my version and take that one instea=
d.
>
> Me bad, I did not write about an important issue.
> The calibration must happen after usb_add_hcd(), otherwise
> usb_add_hcd() indirectly triggers overwriting the effects of calibration.

in that case, you should do that from xhci-plat indeed. I think the
whole idea with init_count is just to make sure you don't initialize it
twice.

One thing's for sure, ->reset() doesn't seem to be the matching callback
for you to use and, given your explanation above, dwc3 doesn't seem to
be the right place to fiddle with that.

Seems like we need an extension of the generic PHY framework to cope
with your requirement.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlm/v4YACgkQzL64meEa
mQbLXw//dGmGwm0yRSNgWqzhfpWkmcIfuU1V+c2NHFDTNds4M2Jvh+5UgMPetEi/
N/Gzg88MVYpAz+eNlgmlm0wLm2uznsRv/acMOJP66vm7gqJWSwKy27cUIWDNvuZ9
Q6RmMqK0abYHRSGM0291iE+xUOIcxSUO4P2Kgw0F4SV3D4naBznSatv72TVIeTU7
a1LH4nlBgm2/dh+D0TTfN+l9fDhar8l5M4tu7HjA6mfVh8aTZY3tY/04ozTE0CHZ
s7gG5wANr3J9/3DeYB0y7Qgz+YHNlKfPqL/rf+xQU1RlhbkSB8q20W0yuZ+kIjxL
8mIqr5/OoZMaE9Bt7JtarNz0BGlO5CHbvlv3ckcvsq6b+B0tR/l2/wFN5U7mmSsx
FHluDN/JjwJMAVMuMM/pxSZ7Bn/g7N9Y87IJtT03rn/QbDk+ABBBaaVmeLJnKvwR
crooELwX1/fyRE1fInRVT3M1yeHB4bFscYnxaAuqoafrfRiB2gARkrRyHe3o6X1v
AO8txpwiGy9zZHrH9Sv/WAQxS+ZXQ+KUgBEp4PTE6QRzegCxh6OxsKRKDVqgAbjd
Fbv8wTLC8U1v/AjozJuK4Yeeq2NZSKV8pp+vnLnP/kGEBW17B97aWMZyMRChTjyu
KALdekGsDTDnN0bMhZta9dSGwnHHH549i7R+FJTFsWG7TLcXGZo=
=Khkh
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
