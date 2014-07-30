From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 3/8] drm/panel: simple: Add support for auo_b133htn01
 panel
Date: Wed, 30 Jul 2014 15:30:17 +0200
Message-ID: <20140730133015.GN29590@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-4-git-send-email-ajaykumar.rs@samsung.com>
 <20140730105132.GF29590@ulmo>
 <CAEC9eQN0mqhiEzn5mkVKu+cAqVkdQ90F73q9cNf76gMAZZ-LRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0660148508=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQN0mqhiEzn5mkVKu+cAqVkdQ90F73q9cNf76gMAZZ-LRg@mail.gmail.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0660148508==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hD6P3ib1XCFtz2ni"
Content-Disposition: inline


--hD6P3ib1XCFtz2ni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 30, 2014 at 05:02:11PM +0530, Ajay kumar wrote:
> On Wed, Jul 30, 2014 at 4:21 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Sat, Jul 26, 2014 at 12:52:05AM +0530, Ajay Kumar wrote:
> >> Add panel_desc structure for auo_b133htn01 eDP panel.
> >>
> >> Also, modify the panel_simple routines to support timing_parameter
> >> delays if mentioned in the panel_desc structure.
> >>
> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> ---
> >>  .../devicetree/bindings/panel/auo,b133htn01.txt    |    7 +++
> >>  drivers/gpu/drm/panel/panel-simple.c               |   47 ++++++++++++++++++++
> >>  2 files changed, 54 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/panel/auo,b133htn01.txt
> >
> > I think this should be two patches, one which adds the delay parameters
> > and another which adds support for the new panel.
> Ok. Will split it.

I was going to propose that I split this up myself so you no longer have
to worry about it. I can easily apply the changes we discussed. But if
you prefer to keep it in one series that works for me too.

> > In general I think it would be good to have a description of these in
> > the struct panel_desc structure, something like this perhaps:
> >
> >         /**
> >          * @prepare: the time (in milliseconds) that it takes for the panel
> >          *           to become ready and start receiving video data
> >          * @enable: the time (in milliseconds) that it takes for the panel
> >          *          to display the first valid frame after starting to
> >          *          receive video data
> >          * @disable: the time (in milliseconds) that it takes for the panel
> >          *           to turn the display off (no content is visible)
> >          * @unprepare: the time (in milliseconds) that it takes for the panel
>                         to power down itself completely.
> >          */
> >         struct {
> >                 unsigned int prepare;
> >                 unsigned int enable;
> >                 unsigned int disable;
> >                 unsigned int unprepare;
> >         } delay;
> >
> > For prepare and enable delays this would mean that they should take
> > effect at the very end of the .prepare() and .enable() functions,
> > respectively. For disable in means that it should be at the end (for
> > example to take into account the time it takes for backlight to
> > completely turn off). For unprepare I have no idea what we would need it
> > for. And the new panel that you're adding in this patch doesn't use it
> > either, so perhaps it can just be left out (for now)?
> Actually, there was a typo.
> That should have been .unprepare_stage_delay = 50.
> This is needed because panels need some delay before powering
> them on again.
> As in, assume you are doing a test to turn on/off display continuously,
> Then, the delay between
> (N - 1)th cycle poweroff to Nth cycle poweron should be at least 500ms.
> That's what the datasheet says! And, somehow 50ms works fine for me.

Okay, that makes sense then.

Thierry

--hD6P3ib1XCFtz2ni
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2PNnAAoJEN0jrNd/PrOhZ+YP/3jT10M5/2gcLFu+e/NrZPvY
zcAGAD3YSjJIqDMWr6rZS9joJ2U7s30sr2AUHhIhtS/xY1dYvOcRvqTe/yRvuEf/
3Kq6Z6QC+zXtz/Oab0DQFaxr6tmp6qRLZR4jeL0Akk8pj3HCxKlwOpwsYL6O6Jkk
vcowHWNqQ13q5kXKh/xMpsQ6xft4n9VGpqp9+HmbbNrjfLPjowXwa27EZchE047U
9LMthtl18jksDJI+qVmD5fYc4ahSeXly3llprxcgXuXlvp+HrT5/NLG85o6X2ppi
fvgy3krzFpPF+VlLWuxtArMUFWCQ4rCs7EjNcU5g0ZWaiaOi5i17nsOKnykuSjL1
qkIJHI3GI4GzunBMFwDoI8Wt7csH5TMq6hsNaDw2si07TkCb6IE8p3gxNCbJ3Gw/
mRJ3ylhfiYxggPqMAbZZrZSbFlxP4X8EeSYxcNiX812kVomr8haVmTEVz1hVqlIT
miIwzTVYvM8PXYpyGu7MtX71v85ZOLsIaGFUZqGeuheDsAtBpGH3eunkoYom/biL
Cd1PpVo74Oy0ZYUjZ6VBJmrQLeQ2bBAyQwW6f6qAOovjPXN1xgxF6z/T7ENb+xP4
TQ9PozpI0V9BQBfwBi+vlCdeIeUR8x2GichGE9IJiFhImA4V+GlPLqKULM0u3fpb
5b+hwRdz+tIRsYjNOhaC
=k5q0
-----END PGP SIGNATURE-----

--hD6P3ib1XCFtz2ni--

--===============0660148508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0660148508==--
