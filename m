From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 6/8] usb: host: ohci-s3c2410 Use clk_prepare_enable/clk_disable_unprepare
Date: Tue, 23 Jul 2013 02:44:59 +0200
Message-ID: <1749259.aa65CrEVoR@flatron>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com> <1374536965-3545-7-git-send-email-tomasz.figa@gmail.com> <CAOMZO5D4X+GT+LdUOjorJ8xgBCwv9iAP4W-RzKrbnE-93kxmUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5D4X+GT+LdUOjorJ8xgBCwv9iAP4W-RzKrbnE-93kxmUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Monday 22 of July 2013 21:15:12 Fabio Estevam wrote:
> On Mon, Jul 22, 2013 at 8:49 PM, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 
wrote:
> >         dev_dbg(&dev->dev, "s3c2410_start_hc:\n");
> > 
> > -       clk_enable(usb_clk);
> > +       clk_prepare_enable(usb_clk);
> 
>  clk_prepare_enable may fail, so you would better check its return
> value.

Well, ideally yes, but since this driver doesn't have any error path here 
anyway and on Samsung platforms clk_prepare_enable() simply can't fail, 
I'd keep it this way until somebody fixes this driver, as it has more 
issues than just this one.

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
