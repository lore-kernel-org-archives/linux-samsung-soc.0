From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ARM: dts: Enable USB hub on Arndale
Date: Wed, 14 Aug 2013 11:34:03 +0100
Message-ID: <20130814103403.GO6427@sirena.org.uk>
References: <1376474314-32491-1-git-send-email-broonie@kernel.org>
 <CAHbNUh2WTiRtvvUnqa7NSvRgZ22XdaEMb57w2umF5Jfhf_yohg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6007817784590813363=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAHbNUh2WTiRtvvUnqa7NSvRgZ22XdaEMb57w2umF5Jfhf_yohg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, linaro-kernel@lists.linaro.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org


--===============6007817784590813363==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ydRx6L387ezzDMin"
Content-Disposition: inline


--ydRx6L387ezzDMin
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2013 at 04:00:16PM +0530, Tushar Behera wrote:
> On 14 August 2013 15:28, Mark Brown <broonie@kernel.org> wrote:

> > +       usb@12110000 {
> > +               usb-phy = <&usb2_phy>;
> > +       };

> ehci-s5p driver doesn't use 'usb-phy' property to find the PHY driver,
> hence this is not required.

I added that for documentation since it is actually what gets used - the
obvious way of handing this is for the hub to be treated like a PHY but
that doesn't work since we actually need the built in PHY to talk to the
hub.  Though I did mean it to be a separate patch.

--ydRx6L387ezzDMin
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSC10YAAoJELSic+t+oim9hMIP/jEstHQ4jKNnetIIoEvxvAyB
IFzTWLNRkGA6b/iyiIWpsw2BQOfa9nl0FwoKHzP20Q8h7ndaH2nXUAgUtYyn4hUD
Vxdt2qf2oNBMbHNMxM8Z3dDPXoStMbsKf+XzRWxL/mztJ19Vr/adjM4a2BDXyKvJ
OkfbLIMP4HgY8owlFOEum11JM23c30ptf6V/HnKeYX+6Xeckcey/2OaM0Xn4/PDP
4AoTenPmuIX/0TUEyxaGCR2UAXlmQ7Dp6EaPm8U8QH1nznsBORKkmQXge2u5DBJ9
SrgJjIXq3NCGUMBQDCBZ/QOpBeoppao+duPTgM5e7jCaCFJcF989fkeWhMUE4Trn
CtwBeZcM7DmRPEKzme46MUb7YDUjwUEvr/Uz/OL/eYaYsWTw++ug77+iwduN8D3y
kcffR0U4MC8woDjcSKAITOejeH57cN0ma2SN0aMtqzDx75Fpbct+fxv7SxiUw7Qc
SAGGkZy1eKEl56M2A8MtSelca3uLTQGvYQ1nRq9dKKuxmlYXCTJiBIKL8f3N9/KQ
o+7ud7WPklSi9kbWP3RMrZffO0KnS3NVVY3r4Wv2dJr/ExKAZwv4Q4kQxVyAb+Re
5FtHoIWE/i0s43mqxRNPf61+xPBoBsZ9t1Vz08g3DT3svwhwXGsxvJy/mIQlHUUo
8uAm62LDYpH8H/3w1/71
=bR3z
-----END PGP SIGNATURE-----

--ydRx6L387ezzDMin--


--===============6007817784590813363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6007817784590813363==--
