From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND PATCH V5 03/12] drm/exynos: dp: modify driver to support
 drm_panel
Date: Mon, 21 Jul 2014 10:02:29 +0200
Message-ID: <20140721080216.GD8843@ulmo>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
 <1405629839-12086-4-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0799119945=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1405629839-12086-4-git-send-email-ajaykumar.rs@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, seanpaul@google.com, daniel.vetter@ffwll.ch, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, javier@dowhile0.org, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============0799119945==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Content-Disposition: inline


--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 18, 2014 at 02:13:49AM +0530, Ajay Kumar wrote:
[...]
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
[...]
>  	depends on DRM_EXYNOS_FIMD && ARCH_EXYNOS && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)

One of the reasons the current way of implementing bridges is that it
doesn't scale, as shown by this ridiculous dependency. In patch

	[RESEND PATCH V5 12/12] drm/exynos: Add ps8622 lvds bridge discovery to DP driver

you add support for another type of bridge but it doesn't update this
dependency. I suspect that in order for this to work properly you'll
need to extend the dependency like so (rewritten to make it somewhat
cleaner):

	depends on DRM_EXYNOS_FIMD && ARCH_EXYNOS
	depends on DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS
	depends on DRM_PS8622=n || DRM_PS8622=y || DRM_PS8622=DRM_EXYNOS

And you'll need one more of these lines for each new bridge chip that
you want to support.

Thierry

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzMkIAAoJEN0jrNd/PrOhstAP/jBN8i43OMBVFUwLpgB2s4Er
691ykX5nNTKq0lD6kOkfDvEYLLvvvT6e0LilqVjzawv4eQDzh6RJ0WIVWKIdjNiV
wW4REnuFdDf7DRTQZ65DK1shfXR7ijRYyhNO4vEPDKTETuCIsin1ZU3pgz+tm1HQ
K4ixyzv96eLdg6yKIu+Cq/faJtnQ92GIHyPUy5RCrTeqD+3xoeX3an+ElcqOgkZJ
Q5+53JZmF1RGZikI0rf/E1Dr5JCwzkxW4FXy2ognhI6bJ+kFGJd8rg5xIM7GfoD/
cXgs8x2yoDWdWP0WQQ8Xq67e5dCJcXp/zXu3XRntQbY2397uKo9Y6Dk2kqYLcFPH
LUZRlYIC8aG+IHMQeGCLzTTXb+rlBDJ6yVt815L1hVDl+iozBWwI+LjjlYKr43UR
ROm8lUGHgxagVDWKPmXBHOymk/5MDWYbw354b4gdqQrHPAGTFrqORRZvASGzN3mc
HwrTePyM8FM4UucZKlVPFT0DwudY+1HrOAMO8NfdVqLoZuFXFf24/+MCQAUXhbJT
6klJ58vr8XVsRwEZg3W6qNvee5JYK52V3J8Q5AuxoOF7fvRMe0mdhG1d0gXKYizn
8ClvD8Y55DFcuQljAjEbMXCSsTzO2vYlf7bh6r9hhSLGZpH6LVKbm9gp4y+jO3EH
zfxf3h+Tx5/bNGzjPzNY
=fBw5
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--

--===============0799119945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0799119945==--
