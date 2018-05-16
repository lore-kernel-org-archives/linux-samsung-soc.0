From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: add OF graph between USB-PHY and MUIC
Date: Wed, 16 May 2018 08:56:41 +0300
Message-ID: <87zi1087om.fsf@linux.intel.com>
References: <CGME20180515121251eucas1p160dd3dcff49f0dad845ed6be98f33bbe@eucas1p1.samsung.com> <20180515121239.18192-1-a.hajda@samsung.com> <20180515121239.18192-3-a.hajda@samsung.com> <CAJKOXPdxtek3yhr=LoHYwmqoLGPTZtpONR3iOseCi50ZiY=m_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPdxtek3yhr=LoHYwmqoLGPTZtpONR3iOseCi50ZiY=m_Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>
Cc: "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On Tue, May 15, 2018 at 2:12 PM, Andrzej Hajda <a.hajda@samsung.com> wrot=
e:
>> OF graph describes USB data lanes between USB-PHY and respective MUIC.
>> Since graph is present and DWC driver can use it to get extcon, obsolete
>> extcon property can be removed.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  .../dts/exynos/exynos5433-tm2-common.dtsi     | 19 ++++++++++++++++++-
>>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> As we discussed for v1 - since this was not split into two, I'll apply
> it once first patch hits mainline.

I just took patch 1 to my tree, fyi

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlr7yBkACgkQzL64meEa
mQbOAw//R5yzi1qgOOkIQB1LrTHCAj9wGOmzuacqhr1aWY4GngMRHsZIwpRDc/CH
8S9p5ecB48KXoQA6l1opteyhOMDan6yDnw4dhuc29ZkPNRFKZHWixvV7wq+jGpVb
0r0dEDVMmzoZwGN3Xg60UIGvwHyLjVnNZM7WqUI6F1Lq+RXriLz3iMFpHst9dgNG
O3cOzNkhQi70MlfIHkB7N5fFHjYS1puhShiKtjarZ5dnlWTjS9wIvsFXQJBc8zSE
Yxouqyb17E6En0hO2T8Lqj4vY6CxAxXEf14F78n6oKTJ+fwFSPc6NMFfGga6FPqg
2O2SlS0WwjU0XnYsbWfapi108In1BiNUxZBDFF2YweD47K8ipCRdG9eN1wF86wpA
n+45J+RLP8pAgj5W8eAeNRX3KfrQfp7aApitTzta2cFHEGcC42YMJhud4icBZ6YL
iqECFZxYjli/LnFAgI7yL7mCIwja7aT7a05Svb9klpoMsrxlNisqEOIXT4gS0SS+
vyuBiLMG1p077BvDInORzmTeDGw8v5pdfLxGX695dywZ2bBQ86CE94g0xVzM+dXD
Umk7dkcUxSOBhqVHfnJozNT2DiXFMKrd2dEspJ4dsQgsnPxjo20TcU9hsKCVlYQe
7EVEhfSKwDXASt3U4dkakter/dDKNh272+DfQDym+KnDMPhk8DE=
=/JVl
-----END PGP SIGNATURE-----
--=-=-=--
