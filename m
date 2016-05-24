From: "Steinar H. Gunderson" <sgunderson-jG/AHqQBv7lBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] Re: Endless "supply vcc not found, using dummy regulator"
Date: Tue, 24 May 2016 21:24:24 +0200
Message-ID: <20160524192424.GA11690@sesse.net>
References: <20160521144308.GA13960@sesse.net>
 <20160523134737.GA21683@sesse.net>
 <20160523144047.GA36908@sesse.net>
 <20160523162455.GW8206@sirena.org.uk>
 <20160523170617.GA8997@sesse.net>
 <CAJKOXPds5PgVmcYLEOriyL-a6tp0jkg7x0GTjPZaN9YLL_gO_A@mail.gmail.com>
 <20160524152638.GA20341@sesse.net>
 <574478FE.4070800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <574478FE.4070800-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Brown <broonie-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 823552-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, May 24, 2016 at 05:53:34PM +0200, Krzysztof Kozlowski wrote:
>         exynos->clk =3D devm_clk_get(dev, "usbdrd30");
>         if (IS_ERR(exynos->clk)) {
> +		// On each error path since here we need to
> +		// revert work done by dwc3_exynos_register_phys()
>                 dev_err(dev, "couldn't get clock\n");
>                 return -EINVAL;
>         }
>         clk_prepare_enable(exynos->clk);

OK, so I took Mark's advice and moved the phy instantiation towards the=
 end
of the function (after the regulators have successfully come up). It re=
duced
the number of probes, even with the original initramfs, dramatically, s=
o
it seems to work quite well. It also reduces the text for each deferred=
 probe
by a lot, since we no longer have the dummy regulator message for each =
one
(only the message about =E2=80=9Cno suspend clk specified=E2=80=9D is l=
eft). Finally, this
arrangement reduced the need for extra error handling to a minimum.

Cc-ing Felipe and and linux-usb@, and adding the patch as a reply to th=
is
message.

/* Steinar */
--=20
Homepage: https://www.sesse.net/
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
