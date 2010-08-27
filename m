From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [patch 1/1] i2c-s3c2410: Enable i2c clock only when doing some transfert
Date: Fri, 27 Aug 2010 22:33:00 +0300
Message-ID: <201008272233.00652.anarsoul@gmail.com>
References: <20100715130636.136905589@rtp-net.org> <201007231202.54301.anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_sLBeM8ssX80lSTi"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:60982 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752338Ab0H0TdU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Aug 2010 15:33:20 -0400
In-Reply-To: <201007231202.54301.anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>
Cc: ben-linux@fluff.org, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org

--Boundary-00=_sLBeM8ssX80lSTi
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
23 =D0=B8=D1=8E=D0=BB=D1=8F 2010 12:02:49 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Va=
sily Khoruzhick =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 15 =D0=B8=D1=8E=D0=BB=D1=8F 2010 16:06:14 =D0=B0=D0=B2=D1=82=D0=BE=D1=
=80 Arnaud Patard =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > This patch modify the s3c2410 i2c driver behaviour to enable the
> > i2c clock only when needed. I'm not sure if this has a big impact
> > on power usage but at least it's fixing a bug with the uda1380
> > codec which needs to be hard reset'ed if the i2c clock is enabled
> > before it's powered on (at least on h1940).
> >=20
> > Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
>=20
> Fixes same bug with uda1380 on rx1950 aswell.
>=20
> Tested-by: Vasily Khoruzhick <anarsoul@gmail.com>

This patch has problem with suspend/resume, clock needs to be enabled on i2=
c=20
re-init. Here's fixed version of patch in attachment.

--Boundary-00=_sLBeM8ssX80lSTi
Content-Type: text/x-patch;
  charset="us-ascii";
  name="0001-i2c-s3c2410-Enable-i2c-clock-only-when-doing-some-tr.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
	filename="0001-i2c-s3c2410-Enable-i2c-clock-only-when-doing-some-tr.patch"

=46rom a7b655bc82e21dcd8ae380efd39ec0455cd48779 Mon Sep 17 00:00:00 2001
=46rom: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Date: Thu, 15 Jul 2010 15:06:14 +0200
Subject: [PATCH v2 1/1] i2c-s3c2410: Enable i2c clock only when doing some =
transfert

This patch modify the s3c2410 i2c driver behaviour to enable the
i2c clock only when needed. I'm not sure if this has a big impact
on power usage but at least it's fixing a bug with the uda1380
codec which needs to be hard reset'ed if the i2c clock is enabled
before it's powered on (at least on h1940).

v2: enable clock on i2c init in resume handler

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
=2D--
 drivers/i2c/busses/i2c-s3c2410.c |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2=
410.c
index 72902e0..0e2a2c7 100644
=2D-- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -555,18 +555,23 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 	int retry;
 	int ret;
=20
+	clk_enable(i2c->clk);
+
 	for (retry =3D 0; retry < adap->retries; retry++) {
=20
 		ret =3D s3c24xx_i2c_doxfer(i2c, msgs, num);
=20
=2D		if (ret !=3D -EAGAIN)
+		if (ret !=3D -EAGAIN) {
+			clk_disable(i2c->clk);
 			return ret;
+		}
=20
 		dev_dbg(i2c->dev, "Retrying transmission (%d)\n", retry);
=20
 		udelay(100);
 	}
=20
+	clk_disable(i2c->clk);
 	return -EREMOTEIO;
 }
=20
@@ -911,6 +916,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pd=
ev)
 	platform_set_drvdata(pdev, i2c);
=20
 	dev_info(&pdev->dev, "%s: S3C I2C adapter\n", dev_name(&i2c->adap.dev));
+	clk_disable(i2c->clk);
 	return 0;
=20
  err_cpufreq:
@@ -978,7 +984,9 @@ static int s3c24xx_i2c_resume(struct device *dev)
 	struct s3c24xx_i2c *i2c =3D platform_get_drvdata(pdev);
=20
 	i2c->suspended =3D 0;
+	clk_enable(i2c->clk);
 	s3c24xx_i2c_init(i2c);
+	clk_disable(i2c->clk);
=20
 	return 0;
 }
=2D-=20
1.7.2


--Boundary-00=_sLBeM8ssX80lSTi--
