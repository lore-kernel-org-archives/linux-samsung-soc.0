From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND v2 5/7] mfd: cros_ec: Instantiate ChromeOS EC
 character device
Date: Tue, 20 Jan 2015 16:55:27 +0000
Message-ID: <20150120165527.GH30656@x1>
References: <1420205572-2640-1-git-send-email-javier.martinez@collabora.co.uk>
 <1420205572-2640-6-git-send-email-javier.martinez@collabora.co.uk>
 <20150120082013.GU21886@x1>
 <54BE7C53.8070605@collabora.co.uk>
 <20150120162952.GB30656@x1>
 <54BE83FF.7030709@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54BE83FF.7030709@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 20 Jan 2015, Javier Martinez Canillas wrote:

> Hello Lee,
>=20
> On 01/20/2015 05:29 PM, Lee Jones wrote:
> >=20
> > It's not a blocker, but it is a ridiculous name to use inside the
> > driver/ directory 'cos almost everything is a dev(ice) here.
> >=20
>=20
> Right, do you think that "cros-ec-chardev" will be a more suitable
> name? Sorry, I'm really bad at naming things...

But is it really a chardev?  Don't chardevs usually live in
drivers/char?  It probably uses a chardev node in /dev, but what does
it really do?  What information can/will userspace obtain from this
memory block?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
