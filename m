From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Mon, 22 Sep 2014 10:10:37 +0200
Message-ID: <20140922081036.GD1470@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com>
 <CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0584844786=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay kumar <ajaynumb@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0584844786==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Content-Disposition: inline


--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2014 at 11:20:40AM +0530, Ajay kumar wrote:
> Hi Tomi,
>=20
> On Wed, Sep 17, 2014 at 9:52 PM, Tomi Valkeinen <tomi.valkeinen@ti.com> w=
rote:
> > On 17/09/14 17:29, Ajay kumar wrote:
> >> Hi Tomi,
> >>
> >> Thanks for your comments.
> >>
> >> On Wed, Sep 17, 2014 at 5:22 PM, Tomi Valkeinen <tomi.valkeinen@ti.com=
> wrote:
> >>> On 27/08/14 17:39, Ajay Kumar wrote:
> >>>> Add documentation for DT properties supported by ps8622/ps8625
> >>>> eDP-LVDS converter.
> >>>>
> >>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >>>> ---
> >>>>  .../devicetree/bindings/video/bridge/ps8622.txt    |   20 +++++++++=
+++++++++++
> >>>>  1 file changed, 20 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/video/bridge/p=
s8622.txt
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/video/bridge/ps8622.t=
xt b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> >>>> new file mode 100644
> >>>> index 0000000..0ec8172
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> >>>> @@ -0,0 +1,20 @@
> >>>> +ps8622-bridge bindings
> >>>> +
> >>>> +Required properties:
> >>>> +     - compatible: "parade,ps8622" or "parade,ps8625"
> >>>> +     - reg: first i2c address of the bridge
> >>>> +     - sleep-gpios: OF device-tree gpio specification for PD_ pin.
> >>>> +     - reset-gpios: OF device-tree gpio specification for RST_ pin.
> >>>> +
> >>>> +Optional properties:
> >>>> +     - lane-count: number of DP lanes to use
> >>>> +     - use-external-pwm: backlight will be controlled by an externa=
l PWM
> >>>
> >>> What does this mean? That the backlight support from ps8625 is not us=
ed?
> >>> If so, maybe "disable-pwm" or something?
> >> "use-external-pwm" or "disable-bridge-pwm" would be better.
> >
> > Well, the properties are about the bridge. "use-external-pwm" means that
> > the bridge uses an external PWM, which, if I understood correctly, is
> > not what the property is about.
> >
> > "disable-bridge-pwm" is ok, but the "bridge" there is extra. The
> > properties are about the bridge, so it's implicit.
> Ok. I will use "disable-pwm".

Why is this even necessary? According to the datasheet this device has
circuitry for backlight control. If so, I'd expect it to expose either a
backlight device or a PWM device. That way unless somebody is using the
backlight/PWM exposed by the bridge the bridge can simply disable PWM.

Thierry

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUH9l8AAoJEN0jrNd/PrOhassP/iDjviWQVzUq3Lh5HTmf6D72
L2woOlMSNq1SuJAsD6ImHnkjve7ULes4TpDyOo0kKedPU2Dn5OtNzZoSXc6SVJwl
sOy1baZaJrdpaPGFz5OfR7pV0w+woAv/IoVUIsiYMeeQTqTNRXKe5xNKZHfbFsc1
i8UtJd6VRvGuStt9EGVvd2F2WOtykQc0U3El7gIhY/85RBa6qBzpXOpWpeyjDLVM
K93MghhGQEbaZ+0D6IfXWMEv9Myu35eIAuxLxWXUbP6E/FUjeGNoZrXkRUwZF662
AMWArnpg0YW34qJ+p1ViNi6L9w0NfXsogwa3hGAmAlTHmd0on3kr1/i83oiR2vKa
vzFSk+l6K821W4tw4lyFNEvHjOje6NrYeEvvkVzPcIP5bbpB9bxjuR1C1ROXGhHh
qjrG+0a1rajtb6fjIH+h8yu8w9rmH6yVrazOpHsojMoz8oYZDK4e+Fry0elTTyFi
ilkWN402aFT2nNTd0MMry0p+ceatbvTKJg6WH+e3WpbkIlKJ+HUrCOcmBKFoiFsJ
BsLKyDwxbId4q2GKeAifdxuW58DkUdXIW/MM4QTPTpjaNsJjvoevwIx/x+F4Cv6C
Qm5r4ZoUrUjIjCqPpjcl6P4JxvyHPKscAJOhfQeIK+E3+LqZWp/h4W0wu4w7Vpa+
utRz2TfhDnpjfxsJOZVS
=wEmt
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--

--===============0584844786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0584844786==--
