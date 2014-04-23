From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 2/9] drm/panel: add pre_enable and post_disable routines
Date: Wed, 23 Apr 2014 09:42:13 +0200
Message-ID: <20140423074212.GF31226@ulmo>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-3-git-send-email-ajaykumar.rs@samsung.com>
 <20140422081948.GA17275@ulmo>
 <CAEC9eQO8Kahh2YVO4nCjk2m+TzJNJ_iSkVRLe0NM_yqL9uPNaw@mail.gmail.com>
 <20140423072915.GV10722@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1628003912=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140423072915.GV10722@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1628003912==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bqc0IY4JZZt50bUr"
Content-Disposition: inline


--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2014 at 09:29:15AM +0200, Daniel Vetter wrote:
> On Tue, Apr 22, 2014 at 08:06:19PM +0530, Ajay kumar wrote:
> > Hi Thierry,
> >=20
> >=20
> > On Tue, Apr 22, 2014 at 1:49 PM, Thierry Reding <thierry.reding@gmail.c=
om>
> > wrote:
> > > On Tue, Apr 22, 2014 at 04:09:11AM +0530, Ajay Kumar wrote:
> > >> Most of the panels need an init sequence as mentioned below:
> > >>       -- poweron LCD unit/LCD_EN
> > >>       -- start video data
> > >>       -- poweron LED unit/BL_EN
> > >> And, a de-init sequence as mentioned below:
> > >>       -- poweroff LED unit/BL_EN
> > >>       -- stop video data
> > >>       -- poweroff LCD unit/LCD_EN
> > >> With existing callbacks for drm panel, we cannot accomodate such pan=
els,
> > >> since only two callbacks, i.e "panel_enable" and panel_disable are
> > supported.
> > >>
> > >> This patch adds:
> > >>       -- "pre_enable" callback which can be called before
> > >>       the actual video data is on, and then call the "enable"
> > >>       callback after the video data is available.
> > >>
> > >>       -- "post_disable" callback which can be called after
> > >>       the video data is off, and use "disable" callback
> > >>       to do something before switching off the video data.
> > >>
> > >> Now, we can easily map the above scenario as shown below:
> > >>       poweron LCD unit/LCD_EN =3D "pre_enable" callback
> > >>       poweron LED unit/BL_EN =3D "enable" callback
> > >>       poweroff LED unit/BL_EN =3D "disable" callback
> > >>       poweroff LCD unit/LCD_EN =3D "post_disable" callback
> > >
> > > I don't like this. What happens when the next panel comes around that
> > > has a yet slightly different requirement? Will we introduce a new
> > > pre_pre_enable() and post_post_disable() function then?
> > >
> > As I have already explained, these 2 callbacks are sufficient enough to
> > take care
> > the power up/down sequence for LVDS and eDP panels. And, definitely hav=
ing
> > just 2 callbacks "enable" and "disable" is not at all sufficient.
> >=20
> > I initially thought of using panel_simple_enable from panel-simple driv=
er.
> > But it doesn't go well with case wherein there are 2 regulators(one for=
 LCD
> > and one for LED)
> > a BL_EN signal etc. And, often(Believe me, I have referred to both eDP
> > panel datasheets
> > and LVDS panel datasheets) proper powerup sequence for such panels is as
> > mentioned below:
> >=20
> > powerup:
> > -- power up the supply (LCD_VCC).
> > -- start video data.
> > -- enable backlight.
> >=20
> > powerdown
> > -- disable backlight.
> > -- stop video data.
> > -- power off the supply (LCD VCC)
> >=20
> > For the above cases, if I have to somehow fit in all the required setti=
ngs,
> > it breaks the sequence and I end up getting glitches during bootup/DPMS.
> >=20
> > Also, when the drm_bridge can support pre_enable and post_disable, why =
not
> > drm_panel provide that both should work in tandem?
>=20
> Imo this makes sense, especially if we go through with the idea talked
> about yesterday of creating a drm_bridge to wrap-up a drm_panel with
> sufficient isolation between all components.

I'm not at all comfortable with these. The names are totally confusing.
Next somebody will need to do something after the panel has been enabled
and we'll have to introduce .post_enable() and .pre_disable() functions.
And worse, what if somebody needs something to be done between
=2Epre_enable() and .enable()? .post_pre_enable()? Where does it end?

According to the above description the only reason why we need this is
to avoid visible glitches when the panel is already on, but the video
stream hasn't started yet. If that's the only reason why we need this,
then perhaps adding a way for a panel to expose the associated backlight
would be better?

Thierry

--Bqc0IY4JZZt50bUr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTV27UAAoJEN0jrNd/PrOhhBYP/0BWh/MR3CBuQIUEgBRxC9uB
figZ/TrdGI6KKix2pdrD62chlnop+8SYD7EpOubuzs977zNtYEbbXuoDIva48v03
olhTJiIQzT/XAhSQuljWkDfh3r8touV7r0Stp5VSbcF+MeHQoNqYE3Nt3iWauFB3
T4aYYk7r/qVMZToxkzFTJirMnke+oR/x4RIrt0JY2NrHWaNa8gO2mQmeiiHSar7t
ZJ3SQkZDrxOcRdk6zqV8ZFP3YUpuBr6Vb3QSg7c7u6xb5p0DiBYPB76BfVnMQASI
ArdiFVpl33Hlfphb24EsvSPruOmZ+snpAwe7QZeN2m6WAA6yhMF4P8QnVL+bpfeQ
X1EshUSDG/4zQHg7iEW6D9hYOfslqCSuN+C4aqFCw6jMu4xwxEGA4zbtXzddP9Yu
Dq2/qAWnFCTYOopeHOfzC9hBh1Q5CmBJwzFqDPg1X5Mf+0eaQKPTeD7Tm4AQ4Con
A8j0JbFd++c2jY22/FbEKQCgR/nYeXJID+m6aQ8VZDIxuPX+10CdlQAXiqGgvsJM
gKKHt8LoNZOdoLT/n3B9V4vST+1APeKsfCHr/zvDV4r1j4YI6l6KOiIwWHVI/8o5
7abaPq+JtqP048BgisWe9Wg+9OhABZXjZ5hjq0gO5QAxJbPkbQXAi5lY7p0UU1v1
UnNLUkhE+ZqTe0G2SSOC
=Cq7c
-----END PGP SIGNATURE-----

--Bqc0IY4JZZt50bUr--

--===============1628003912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1628003912==--
