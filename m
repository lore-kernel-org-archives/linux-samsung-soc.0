From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [RESEND PATCH v9 0/2] usb: phy: samsung: Introducing usb phy
 driver for samsung SoCs
Date: Fri, 18 Jan 2013 20:46:19 +0200
Message-ID: <20130118184619.GA1991@arwen.pp.htv.fi>
References: <1358499623-13901-1-git-send-email-p.paneri@samsung.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1807024903245597147=="
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

--===============1807024903245597147==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline

--Nq2Wo0NMKNjxTN9z
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
>=20
> Changes from v7:
> Rebased to the latest usb-next branch.
> Separating arch patches from these driver patches.
>=20
> Changes from v6:
> Modified register definitions according to the existing ones.
> Changed default PHY clk selection for SoCs.
> Improved binding text and rebased to the latest usb-next.
>=20
> Changes from v5:
> Moved clk_get() to driver's probe function. Now reference clock frequency
> selection value is stored in samsung_usbphy structure for later use. Used
> IS_ENABLED() instead of #ifdef in samsung_usbphy_get_driver_data().
>=20
> Changes from v4:
> Moved header file contents to driver's source file
> Removed unnecessary print message from driver's probe function
> Dropped the Free Software Foundation address from the header
>=20
> Changes from v3:
> Replaced susbsys_initcall()/module_exit() by module_platform_driver().
> Accordingly in the hsotg driver returned -EPROBE_DEFER until phy driver
> is registered
> Removed unnecessary devm_usb_put_phy() call from the hsotg driver remove.
>=20
> Changes from v2:
> Changed the driver filenames to samsung-usbphy
> Rectified coding style related errors
>=20
> Changes from v1:
> Rebased patches to latest usb-next branch
> Changed the name 'sec_usbphy' to 'samsung_usbphy'
>=20
> This patch set introduces a phy driver for samsung SoCs. It uses the exis=
ting
> transceiver infrastructure to provide phy control functions. Use of this =
driver
> can be extended for usb host phy as well. Over the period of time all the=
 phy
> related code for most of the samsung SoCs can be integrated here.
> Removing the existing phy code from mach-s3c64xx. Same can be done for ot=
her SoCs
> when they start supporting this phy driver.=20
> This driver is tested with smdk6410 and Exynos4210(with DT).
>=20
> Praveen Paneri (2):
>   usb: phy: samsung: Introducing usb phy driver for hsotg
>   usb: s3c-hsotg: Adding phy driver support

Can you check on my xceiv branch if this is applied correctly ?

thanks

--=20
balbi

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ+Zh7AAoJEIaOsuA1yqREUBMQAJIGdqYIAJGx60mOrpaPLOKQ
8/DDp7eWYXmw/7q0Rc4ra33lzoAs697sVaMKc/2hKvJSJBO0v01wPE4gC48oMQm/
XqmpA6sTq6NAQK6zw4MWMqpnJ6GaoJSziGbQpuznTj/ihJoUMAXWCXKvBgi/QVNK
4XsnnsYtTkn//1b0tPAMMENQg5bOCaUnklw3ktCN88PKgjjwHtBoJ7Kz4O8kYMRd
DIPoUeFL+CGNyDLFXlV1XBQpfzCHw1jzWzL2Brg+WlZVsB0sJ3PnAjVLLN8xt1r1
0bJK9/DqdoIsZrme8OZjU4lMkJJ32OvQpU6NMDuPqExte2jTrd16wuiJpAfmXYmR
VJwDl4l0dfEpBGltwTcnxsTVZCfERu+xGe3gJPrV6lUjCd2ZZT5Jm8eEK+I56ibe
gGim3ECDkQdkec2IheNrbXiFRU4N10v6XNpR5EUzygdU2BQCbj1FZn9cu7d6D04X
MWGnUt9PmylKRyz4Od3d7ntkK8RQtvj1kNCofTLMMWt+N9GYuV3Ebsv5X5p6v2er
2op5ibAsa20k66mrckwUvykoMYUenFhAjlt3k1nJOo/VX2IaJQyyEaABbJV0qylZ
hBR7v40O9Eo+uHa0tCHg0L263PQhrP3L6Qmyy7EGu1IEPQTTG34f2t1z/gOWYOL8
yXMVdPrQZK9vTejOcjiW
=i3l7
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--

--===============1807024903245597147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1807024903245597147==--
