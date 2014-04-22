From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 5/9] drm/exynos: dp: modify driver to support drm_panel
Date: Tue, 22 Apr 2014 10:37:46 +0200
Message-ID: <20140422083745.GD17275@ulmo>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-6-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1395650424=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1398119958-32005-6-git-send-email-ajaykumar.rs@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, seanpaul@google.com, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============1395650424==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cHMo6Wbp1wrKhbfi"
Content-Disposition: inline


--cHMo6Wbp1wrKhbfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2014 at 04:09:14AM +0530, Ajay Kumar wrote:
[...]
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/ex=
ynos/exynos_dp_core.c
[...]
> @@ -1299,6 +1308,15 @@ static int exynos_dp_bind(struct device *dev, stru=
ct device *master, void *data)
> =20
>  	INIT_WORK(&dp->hotplug_work, exynos_dp_hotplug);
> =20
> +	panel_node =3D of_find_compatible_node(NULL, NULL,
> +						"samsung,exynos-dp-panel");

No, please don't do this. It will break as soon as you have two panels
of the same type in one system.

Also the compatible value of a panel should describe the specific panel
in use (e.g. "samsung,s6e8aa0"), so you shouldn't rely on "magic" like
this. Use a phandle to find the panel's struct device_node.

[...]
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h b/drivers/gpu/drm/ex=
ynos/exynos_dp_core.h
> index 56fa43e..9dc7991 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.h
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.h
> @@ -148,6 +148,7 @@ struct exynos_dp_device {
>  	struct drm_device	*drm_dev;
>  	struct drm_connector	connector;
>  	struct drm_encoder	*encoder;
> +	struct drm_panel	*drm_panel;

I don't think you need the drm_ prefix here.

Thierry

--cHMo6Wbp1wrKhbfi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTVipZAAoJEN0jrNd/PrOhFXkQAJae30uX/829Vn6EFxT1xwGt
iR4/YuoWVFNUmnh6hJ87Sh3Upi9JqIumd9d8Q2NMSZih6CHNBYKBTeMg+ZYf1sOH
ZXz35qOE5iPOb9Ni3GHHGGgplQSMsGvn9RxhKugKqfH1rCZrai3bft1G0KcwEDLZ
eZXkQ+j5HoM01gdZAaO0S0pAljgbLznVUYmy9ePkRHt6YhBgCGMJFntiR5sn6fTG
5xKSbwxpdKpEO9pSC1sVul/tC6nUAxSMsX6vGemoTuWDMoc5MBhLsaCVbhKOKUMR
mku1wLZjecaEE6dgtESaoqQjQCvkHcyR3ue3PGlc2bWWtmz/TihakLUXuILx+k79
W1BO1wy9BgW0128e5cMsfmwQYufLME4hihtPGTXouCd5t+vEt06pXDa6Q5kuzPBX
TFnEdUjT3dOtDWaDb5Wo2IOXtBt5lKjVI6VIT9fpHDNaGBvVnFMdc+OhNkNFDYU6
WTvEwNC8oFrk4yTJRmH31bIP6a2jATBcfSoFviY7QdVdQe60e5JAekcde1/HYbIX
e6+hbv7kWufZZDvmkwP/Rt2inEaOdB0/mEWn+fHS6Eg45cDQB2t+60xNRAA8podF
Wi93sfJpI+MW2tN4wZDPbKSRF8aUj8lV9wqv8LX5O+PakMnYJ99x31En9MGBHS8Z
3JuCC3UJpQ9NtXBee+pl
=Yw1/
-----END PGP SIGNATURE-----

--cHMo6Wbp1wrKhbfi--

--===============1395650424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1395650424==--
