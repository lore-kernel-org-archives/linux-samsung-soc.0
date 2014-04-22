From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC v2 PATCH v2 06/14] drm/exynos: support MIPI DSI command mode
Date: Tue, 22 Apr 2014 09:34:44 +0200
Message-ID: <20140422073442.GC11766@ulmo>
References: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
 <1398083321-8668-7-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0126362987=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1398083321-8668-7-git-send-email-yj44.cho@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com, sachin.kamat@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============0126362987==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Content-Disposition: inline


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2014 at 09:28:33PM +0900, YoungJun Cho wrote:
[...]
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 7209df1..244d197 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -49,6 +49,7 @@ struct mipi_dsi_msg {
>   * @detach: detach DSI device from DSI host
>   * @transfer: send and/or receive DSI packet, return number of received =
bytes,
>   * 	      or error
> + * @te_handler: call CRTC TE handler callback from DSI host

Perhaps you can explain some more what this means or why it would be
necessary.

> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index c2ab77a..0ad64ed 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -46,6 +46,13 @@ struct drm_panel {
>  	struct list_head list;
>  };
> =20
> +struct drm_panel_cpu_timings {
> +	unsigned int cs_setup;
> +	unsigned int wr_setup;
> +	unsigned int wr_act;
> +	unsigned int wr_hold;
> +};

Similarily here. What's this?

Thierry

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTVhuSAAoJEN0jrNd/PrOhVnEP/jTXnbpA27V1EegTsy7lapnK
3qn2B3sOooknTEkujeiqCKjrP6eXGUSwAjBa68I7usskj0A9FtkqcrVVusWmLheO
pu5eSZCV+56Otb1r/3vFS+tPMdVsmQl2TGlKRBgd0HwOg1F1SUD/z5GvD1Sa0vtf
6+Jai901+a9MyI7tPX8LH5TtAG9b66yoLQwJZHyEFk1R1Pht+V5WxCWqlZUJV8mQ
E//ukYMSCgyHO47oyi06neEYHNw6Hwa14u4PphQuJN5phfyO42A1tbbMzBZ3jydd
hZIzCEAAyuLYpkjQR7PgPQNvQNTA9tlaW4GecJX+TIdblbk7Vd7P89bBbaBhnu70
LcfsMW5HarapB8WXouP1iyLUUa5bNspkAkqUDj37dDjBujsyfwC3GTG0L0uZzPCz
wTdDXis/S65GUPjFxKFPhFa1KDtzoECJKspT7z4ysPZa5Q5NoUXGT3w1sdHezJmn
epswMuNw2asnQCdhP80nMpYIxPNSLjMNslv1h4nZyb1q4UdoUMciIRiJFGR5Sbof
TH6HT7tI17ZRphFvvuTEApkt2gCIAEwDFy3Y9lwPbBgJghzElD75HFCglncC0VV2
JyOU+pz7o1Ryj2ImhpWPTVknEN2Omj6Vrw4dsGDs5LvXYVF7DLw+obeeE4ua2AvE
v0pSbXIS7h1NghHYzbwY
=KfD9
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--

--===============0126362987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0126362987==--
