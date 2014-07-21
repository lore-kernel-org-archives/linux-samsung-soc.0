From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND PATCH V5 08/12] drm/bridge: ptn3460: Support bridge
 chaining
Date: Mon, 21 Jul 2014 10:22:24 +0200
Message-ID: <20140721082223.GF8843@ulmo>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
 <1405629839-12086-9-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0585971197=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1405629839-12086-9-git-send-email-ajaykumar.rs@samsung.com>
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


--===============0585971197==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vKFfOv5t3oGVpiF+"
Content-Disposition: inline


--vKFfOv5t3oGVpiF+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 18, 2014 at 02:13:54AM +0530, Ajay Kumar wrote:
[...]
> Also, remove the drm_connector implementation from ptn3460,
> since the same is implemented using panel_binder.

I think that's a step backwards. In fact I think the panel-bridge binder
driver shouldn't be needed at all. At least not for now. We have a very
limited number of bridge drivers, so it shouldn't hurt at this stage to
implement the connector instantiation within each driver. Once we have
more bridge drivers, and therefore a better understanding of what they
need, we can always add something like the panel-binder (though I think
it should be library code, similar to the drm_encoder_helper_add() API,
rather than this kind of self-contained object).

Thierry

--vKFfOv5t3oGVpiF+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzM2/AAoJEN0jrNd/PrOhGyYP/RjQCcywTSU+9LgTVYqzSQst
P2soR4jo+g+sLpncB8HFxb42+RMcjzJaiXnIFCP2u+cC2SIsNNs6NjPK0HXE5B8q
pViUObuh0Vdvs/sDbNQV0RuEzCnZIt1hDt0E0G3iAbdzQ94aUWgiqkweiIHxY31B
F7/wqhxc/N5RfcsHVo7Yvoq7l3+tBForV5BgeBjlJc1QrOIanlgg1uGxZUH7mP9e
OyLltLs8NtRnireLMDVTGM71BrFEtvEgGXxOAfqA3KQAvHYsh1QdgqTqB/VK3gp6
B57BselXqbeSUWRyh8apx870E13MoXEutsKuxxzfj/gRJRMFV7vkBQGpFCxCx0Bk
ExWTY9nisLe9RlQXSCulGWon7GRPiM1bbGIvfdCefBo33+0puHWx3JjlW2HOPO9F
7HQUIiTvo7ARpnrKmAVRXR/QzN1WJSZMR7ULjZGrwS26IJ6SzUUdmf7HCn9/CkL6
QgNhoHeVfg5woyyiyLq2ZdnAmWhe54ihzhqz7RQXzoEL9ZHyRsza9+FBeLL74nOO
t1/hhFLIx0VNSAxJR7j9lentEEE/zpMUoqS1oh3CyD/jjBaWpPieChF5tFytZrQ9
zqmkaQDTVv+zMn+rFgAOaO4sgl1zd13t4mZGjaBM7lHWUOXReoA6vEaVFuYJ84wA
X3Zg1C3KcYDrbAYFO5mi
=8OmQ
-----END PGP SIGNATURE-----

--vKFfOv5t3oGVpiF+--

--===============0585971197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0585971197==--
