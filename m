From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [RESEND PATCH v9 0/2] usb: phy: samsung: Introducing usb phy
 driver for samsung SoCs
Date: Wed, 27 Feb 2013 10:15:21 +0200
Message-ID: <20130227081521.GG8016@arwen.pp.htv.fi>
References: <1358499623-13901-1-git-send-email-p.paneri@samsung.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0005576832858029460=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1358499623-13901-1-git-send-email-p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============0005576832858029460==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hcut4fGOf7Kh6EdG"
Content-Disposition: inline

--hcut4fGOf7Kh6EdG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 18, 2013 at 02:30:21PM +0530, Praveen Paneri wrote:
> Changes from v8:
> Resending this patch series after rebasing to the latest usb-next branch.
> Rewording inline comments for better readability.
> Removed IS_ENABLED(CONFIG_OF) as pdev->dev.of_node is enough to check for=
 dt support.
> Using of_match_ptr to add of_match_table to platform_driver structure.
> Removed unnecessary variables.

trying applying these but it doesn't apply unfortunately.

--=20
balbi

--hcut4fGOf7Kh6EdG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRLcCZAAoJEIaOsuA1yqRERyUQAKM96JXcyc3HSo9Fctfsvl/V
nPUm6BAmpb99XWdof9euQNobeGt0f5sgH1LhEr6NaQuLAvVjmPz12n+U8XjaYQkW
mQfSbEh3BZ1DmP9D/x2f6gja6OWHHE/61x9LJ8JwmvkfhNUpTuUFaEQf++us5Ljr
CVuQ5RQ7UIQWcVTvozbAk3/NO7mBlxUIZ4UGHYgcLYkKeglQ7x2JGObeLIGUWEto
pPLc+30qXBfLBdigVG5ezmqWmKqQZq6JL8IxU63n6YqI/z5G+87fzqz4PFs9jj4y
9S4JCfg+r4GnC930WqaHmibJKrPDdqjh65mJ+NU61D/Ar30xkeHYUavlUXYZgzwW
kfdwj0OwZb9225dR9VAAtYwkdVKw1S+No/zeRHdlEZ3cSH9jjs0OGwRvgj0ffXs1
OxUNwtQ5q5/rqAMQrhMFUlT2bCwwvV/67C/IYN8oFVwS0LmWlbf+CPRiPNoqhda+
dfQAX0YYma5aY8HgE4z7IN2j2/sbPVKyzcfqvrJ+34PZ4YRbHVz56LOa3a1cJBXx
pAktgRkOi3qmVUF5aMct4mY+J3wd5e2f6/rEHeNAq6y3+28f9Nnc3AOnN+ovWBMC
w4c+F7yIGTpuoWqyJdC9drZjktwhUxzA+CTO3HAoFeTLxXDDrN+fBaohkh6w6bVO
aROZhssoMIFDSnYFC2ot
=5cnV
-----END PGP SIGNATURE-----

--hcut4fGOf7Kh6EdG--

--===============0005576832858029460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0005576832858029460==--
