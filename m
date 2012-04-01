From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] video: s3c-fb: Add device tree support
Date: Sun, 1 Apr 2012 14:41:24 +0800
Message-ID: <20120401064121.GC2395@S2101-09.ap.freescale.net>
References: <1333086797-1625-1-git-send-email-thomas.abraham@linaro.org>
 <CAH+eYFCrdtYC+v3tgqsaCS9-Y61JCwA1MLkkPtH14p=JWBbzBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAH+eYFCrdtYC+v3tgqsaCS9-Y61JCwA1MLkkPtH14p=JWBbzBw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rabin Vincent <rabin-66gdRtMMWGc@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, FlorianSchandinat-Mmb7MZpHnFY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 30, 2012 at 09:25:14PM +0530, Rabin Vincent wrote:
> On Fri, Mar 30, 2012 at 11:23, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>=
 wrote:
> > + =A0 =A0- samsung,fimd-display: The fimd controller is interfaced with=
 the a
> > + =A0 =A0 =A0display device such as a lcd panel. This property should s=
pecify the
> > + =A0 =A0 =A0phandle of the display device node. For a display device n=
ode that
> > + =A0 =A0 =A0represents a RGB type display interface, it is expected to=
 specify the
> > + =A0 =A0 =A0video interface timing using the following properties.
> > +
> > + =A0 =A0 =A0- lcd-htiming: Specifies the horizontal timing for the ove=
rlay. The
> > + =A0 =A0 =A0 =A0horizontal timing includes four parameters in the foll=
owing order.
> > +
> > + =A0 =A0 =A0 =A0- horizontal back porch (in number of lcd clocks)
> > + =A0 =A0 =A0 =A0- horizontal front porch (in number of lcd clocks)
> > + =A0 =A0 =A0 =A0- hsync pulse width (in number of lcd clocks)
> > + =A0 =A0 =A0 =A0- Display panels X resolution.
> > +
> > + =A0 =A0 =A0- lcd-vtiming: Specifies the vertical timing for the overl=
ay. The
> > + =A0 =A0 =A0 =A0vertical timing includes four parameters in the follow=
ing order.
> > +
> > + =A0 =A0 =A0 =A0- vertical back porch (in number of lcd lines)
> > + =A0 =A0 =A0 =A0- vertical front porch (in number of lcd lines)
> > + =A0 =A0 =A0 =A0- vsync pulse width (in number of lcd clocks)
> > + =A0 =A0 =A0 =A0- Y resolution.
> =

> In this old thread, it was suggested to use a raw EDID block to supply
> timings, and since then a couple of drivers in mainline (sm501fb and
> fsl-diu) are doing it that way:
> =

> http://lists.ozlabs.org/pipermail/linuxppc-dev/2010-February/080683.html
> =

> Shouldn't this driver be doing the same thing?  If not, shouldn't
> whatever interface this is adding be provided in a common helper (like
> that old patch was trying to add) so it's standardized between drivers?

+1

We need a generic binding for the data defined in "struct fb_videomode"
and a generic helper function to retrieve the data from device tree,
so that individual display driver does not have to invent their owns.

-- =

Regards,
Shawn
