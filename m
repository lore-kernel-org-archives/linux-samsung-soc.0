From: Olof Johansson <olofj@chromium.org>
Subject: Re: [PATCH] i2c: samsung: resume race fix
Date: Thu, 24 Jan 2013 08:41:20 -0800
Message-ID: <CALiw-2F7tG9ogDHj4Yf47T47rBn6mAiH2XvK8jpWB1a3OhNJBQ@mail.gmail.com>
References: <1352284106-24988-1-git-send-email-ch.naveen@samsung.com>
 <20121107114437.0a563c7e@endymion.delvare>
 <20130124132759.GH12933@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6149729957268440774=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130124132759.GH12933@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org, Jean Delvare <khali@linux-fr.org>, naveenkrishna.ch@gmail.com, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============6149729957268440774==
Content-Type: multipart/alternative; boundary=bcaec55551200acca204d40b7b96

--bcaec55551200acca204d40b7b96
Content-Type: text/plain; charset=ISO-8859-1

2013/1/24 Wolfram Sang <w.sang@pengutronix.de>

> On Wed, Nov 07, 2012 at 11:44:37AM +0100, Jean Delvare wrote:
> > On Wed, 07 Nov 2012 15:58:26 +0530, Naveen Krishna Chatradhi wrote:
> > > Don't unmark the device as suspended until after it's been re-setup.
> > >
> > > The main race would be w.r.t. an i2c driver that gets resumed at the
> same
> > > time (asyncronously), that is allowed to do a transfer since suspended
> > > is set to 0 before reinit, but really should have seen the -EIO return
> > > instead.
> >
> > I thought that the suspend order was children first and the resume
> > order was parent first?
>
> Same here, why does it not work this way?
>

Sorry for being quiet on this so far, I didn't notice the controversy until
now.

This is actually about half of what the original fix was (which I wrote,
thus my signed-off-by). The original one was related to us having the GPIO
handshake for a shared bus (see separate discussions on how that should be
upstreamed, and the work on that). For reference, that patch is at:
https://gerrit.chromium.org/gerrit/#/c/28126/1/drivers/i2c/busses/i2c-s3c2410.c
.

So, I'm not sure that this patch is really needed. The significant part of
the original one was the move of our internal s3c24xx_i2c_dt_gpio_free()
below setting suspended = 1. Upstream implementation of the same
functionality will be implemented differently, most likely.


-Olof

--bcaec55551200acca204d40b7b96
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">2013/1/24 Wolfram Sang <span dir=3D"ltr">&lt;<a =
href=3D"mailto:w.sang@pengutronix.de" target=3D"_blank">w.sang@pengutronix.=
de</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Wed, Nov 07, 2012 at 11:44:37AM +0100, Jean Delvare wr=
ote:<br>
&gt; On Wed, 07 Nov 2012 15:58:26 +0530, Naveen Krishna Chatradhi wrote:<br=
>
&gt; &gt; Don&#39;t unmark the device as suspended until after it&#39;s bee=
n re-setup.<br>
&gt; &gt;<br>
&gt; &gt; The main race would be w.r.t. an i2c driver that gets resumed at =
the same<br>
&gt; &gt; time (asyncronously), that is allowed to do a transfer since susp=
ended<br>
&gt; &gt; is set to 0 before reinit, but really should have seen the -EIO r=
eturn<br>
&gt; &gt; instead.<br>
&gt;<br>
&gt; I thought that the suspend order was children first and the resume<br>
&gt; order was parent first?<br>
<br>
</div>Same here, why does it not work this way?<br></blockquote><div></div>=
</div><br><div>Sorry for being quiet on this so far, I didn&#39;t notice th=
e controversy until now.</div><div><br></div><div>This is actually about ha=
lf of what the original fix was (which I wrote, thus my signed-off-by). The=
 original one was related to us having the GPIO handshake for a shared bus =
(see separate discussions on how that should be upstreamed, and the work on=
 that). For reference, that patch is at:=A0<a href=3D"https://gerrit.chromi=
um.org/gerrit/#/c/28126/1/drivers/i2c/busses/i2c-s3c2410.c">https://gerrit.=
chromium.org/gerrit/#/c/28126/1/drivers/i2c/busses/i2c-s3c2410.c</a>.</div>
<div><br></div><div>So, I&#39;m not sure that this patch is really needed. =
The significant part of the original one was the move of our internal=A0s3c=
24xx_i2c_dt_gpio_free() below setting suspended =3D 1. Upstream implementat=
ion of the same functionality will be implemented differently, most likely.=
</div>
<div><br></div><div><br></div><div>-Olof</div>

--bcaec55551200acca204d40b7b96--


--===============6149729957268440774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6149729957268440774==--
