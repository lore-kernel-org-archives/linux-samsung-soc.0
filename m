From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Mon, 22 Sep 2014 13:35:15 +0200
Message-ID: <20140922113514.GS1470@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com>
 <CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>
 <20140922081036.GD1470@ulmo>
 <CAEC9eQPKqGaHdQXNu75LOno0RTePk4zbBuaf9WESaZfbcpCVmg@mail.gmail.com>
 <20140922104123.GP1470@ulmo>
 <CAEC9eQOSFj-NWVYCtdcQz0nFM+1rVxPeC76eBdj-X4w+HWujZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1937367982=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQOSFj-NWVYCtdcQz0nFM+1rVxPeC76eBdj-X4w+HWujZA@mail.gmail.com>
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


--===============1937367982==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hOmQO3H5Qmmwdmk8"
Content-Disposition: inline


--hOmQO3H5Qmmwdmk8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2014 at 04:53:22PM +0530, Ajay kumar wrote:
> On Mon, Sep 22, 2014 at 4:11 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Mon, Sep 22, 2014 at 02:01:38PM +0530, Ajay kumar wrote:
> >> Hi Thierry,
> >>
> >> On Mon, Sep 22, 2014 at 1:40 PM, Thierry Reding
> >> <thierry.reding@gmail.com> wrote:
> >> > On Thu, Sep 18, 2014 at 11:20:40AM +0530, Ajay kumar wrote:
> >> >> Hi Tomi,
> >> >>
> >> >> On Wed, Sep 17, 2014 at 9:52 PM, Tomi Valkeinen <tomi.valkeinen@ti.=
com> wrote:
> >> >> > On 17/09/14 17:29, Ajay kumar wrote:
> >> >> >> Hi Tomi,
> >> >> >>
> >> >> >> Thanks for your comments.
> >> >> >>
> >> >> >> On Wed, Sep 17, 2014 at 5:22 PM, Tomi Valkeinen <tomi.valkeinen@=
ti.com> wrote:
> >> >> >>> On 27/08/14 17:39, Ajay Kumar wrote:
> >> >> >>>> Add documentation for DT properties supported by ps8622/ps8625
> >> >> >>>> eDP-LVDS converter.
> >> >> >>>>
> >> >> >>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> >> >>>> ---
> >> >> >>>>  .../devicetree/bindings/video/bridge/ps8622.txt    |   20 +++=
+++++++++++++++++
> >> >> >>>>  1 file changed, 20 insertions(+)
> >> >> >>>>  create mode 100644 Documentation/devicetree/bindings/video/br=
idge/ps8622.txt
> >> >> >>>>
> >> >> >>>> diff --git a/Documentation/devicetree/bindings/video/bridge/ps=
8622.txt b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> >> >> >>>> new file mode 100644
> >> >> >>>> index 0000000..0ec8172
> >> >> >>>> --- /dev/null
> >> >> >>>> +++ b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
> >> >> >>>> @@ -0,0 +1,20 @@
> >> >> >>>> +ps8622-bridge bindings
> >> >> >>>> +
> >> >> >>>> +Required properties:
> >> >> >>>> +     - compatible: "parade,ps8622" or "parade,ps8625"
> >> >> >>>> +     - reg: first i2c address of the bridge
> >> >> >>>> +     - sleep-gpios: OF device-tree gpio specification for PD_=
 pin.
> >> >> >>>> +     - reset-gpios: OF device-tree gpio specification for RST=
_ pin.
> >> >> >>>> +
> >> >> >>>> +Optional properties:
> >> >> >>>> +     - lane-count: number of DP lanes to use
> >> >> >>>> +     - use-external-pwm: backlight will be controlled by an e=
xternal PWM
> >> >> >>>
> >> >> >>> What does this mean? That the backlight support from ps8625 is =
not used?
> >> >> >>> If so, maybe "disable-pwm" or something?
> >> >> >> "use-external-pwm" or "disable-bridge-pwm" would be better.
> >> >> >
> >> >> > Well, the properties are about the bridge. "use-external-pwm" mea=
ns that
> >> >> > the bridge uses an external PWM, which, if I understood correctly=
, is
> >> >> > not what the property is about.
> >> >> >
> >> >> > "disable-bridge-pwm" is ok, but the "bridge" there is extra. The
> >> >> > properties are about the bridge, so it's implicit.
> >> >> Ok. I will use "disable-pwm".
> >> >
> >> > Why is this even necessary? According to the datasheet this device h=
as
> >> > circuitry for backlight control. If so, I'd expect it to expose eith=
er a
> >> > backlight device or a PWM device. That way unless somebody is using =
the
> >> > backlight/PWM exposed by the bridge the bridge can simply disable PW=
M.
> >> The driver does expose a backlight device.
> >> And, the decision(whether to expose a backlight device or not) is made
> >> based on the DT flag "use-external-pwm".
> >> This was discussed before, and you suggested to use the boolean
> >> property, refer to this link:
> >> http://lists.freedesktop.org/archives/dri-devel/2014-July/065048.html
> >
> > I think you misunderstood what I said, or maybe I didn't explain clearly
> > what I meant. If the PS8622 provides a backlight there's nothing wrong
> > with always exposing it. The bridge itself isn't going to be using the
> > backlight anyway. Rather the panel itself should be using the backlight
> > device exposed by PS8622 or some separate backlight device.
> >
> > To illustrate by an example:
> >
> >         ps8622: ... {
> >                 compatible =3D "parade,ps8622";
> >                 ...
> >         };
> >
> >         panel {
> >                 ...
> >                 backlight =3D <&ps8622>;
> >                 ...
> >         };
> No, if ps8622 backlight control is used, we need not specify the backlight
> phandle for the panel driver. Somehow, ps8622 internal circuitry keeps
> the bootup glitch free :)
> Backlight control and panel controls can be separate then.

But they shouldn't. Your panel driver should always be the one to
control backlight. How else is the bridge supposed to know when to turn
backlight on or off?

> > What you did in v6 of this series was look up a backlight device and
> > then not use it. That seemed unnecessary. Looking at v6 again the reason
> > for getting a phandle to the backlight was so that the device itself did
> > not expose its own backlight controlling circuitry if an external one
> > was being used. But since the bridge has no business controlling the
> > backlight, having the backlight phandle in the bridge is not correct.
> >
> > So I think what you could do in the driver instead is always expose the
> > backlight device. If the panel used a different backlight, the PS8622's
> > internal on simply wouldn't be accessed. It would still be possible to
> > control the backlight in sysfs, but that shouldn't be a problem (only
> > root can access it)
> That would be like simple exposing a feature which cannot be used
> by the user, ideally which "should not be" used by the user.

And it won't be used unless they access the sysfs files directly. There
are a lot of cases where we expose functionality that cannot be
meaningfully used by the user. For example, a GPIO may not be routed to
anything on a board, yet we don't explicitly hide any specific GPIOs
=66rom users.

> > That said, I have no strong objections to the boolean property if you
> > feel like it's really necessary.
> Won't you think having a boolean property for an optional
> feature of the device, is better than all these?

Like I said, I'm indifferent on the matter. I don't think it's necessary
to hide the backlight device, but if you want to, please feel free to do
so.

Another alternative would be not to expose it at all and not have the
boolean property since you don't seem to have a way to test it in the
first place (or at least there's no device support upstream where it's
needed).

Thierry

--hOmQO3H5Qmmwdmk8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIAlyAAoJEN0jrNd/PrOh25kQALtvuNFcvvU3I4lm/9lvG2go
R2Lq62nUSWyeW1IQ4Hw/TVXP8TWYlKUWRl3UndhhbvHOpii4LiDq8YkyDEauSqUX
GJzm07jGNXLtkg4XlDZGoCjLwY5vCoKeL4ak2Ddw52xpFpQ2U3Q7yTC0CbjEM5M5
ZVTlczirj9aXkD10oyBAw86pjvPqrFkDG0YHP3d+fp+ZCLf0tm9dYErcu6YfcEv2
TEfchwzHB2LMhDRVQ6ukvSNMFZyanH9ajoIzlCihSQYmOKEox+C8slqtWlZq5u/x
yG7L9lLmfDHMkfbyaIZuXuM4gh1gR0KiK1ZY6fbp0c3uqTPJcIZRvMwALte8pr82
ytXV3hQPgc3xwTNgjwxD7Isi1OAufO/+4Wts3oxSMfIFHBxY3EiuMRmsGBi5Oh2U
8ENOEFU5CyggwAUIoRzeAQTPzqURy+9Jp25HeUg8Fh+9nwXEP+NXbrT+B4BPzw46
ZBqW0hioBewianbMYJ3ommiyqXmXl/8TnlXMotMIHoZOrnU98K25Au2elDYemIR0
mHPYdZH3VTPTZLNGkS0Z90ibaHKz+41QFN3DtqOICNGbvEemfQRFiYAE+ihsH14G
WHbhQy3nwlgWrujiBDHURTSb2Fdco5Mauvi2PhuFPbX+/q7iX6538siBonxCw7TD
goH5GCC4UR6wet2YyhWI
=eTeD
-----END PGP SIGNATURE-----

--hOmQO3H5Qmmwdmk8--

--===============1937367982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1937367982==--
