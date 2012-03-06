From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v3 0/4] mmc: sdhci-s3c: use the sdhci-pltfm.c and move the header file
Date: Tue, 6 Mar 2012 14:15:18 +0100
Message-ID: <201203061415.18836.heiko@sntech.de>
References: <4F55ABF0.1060801@samsung.com> <20120306130054.GA9890@sirena.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <20120306130054.GA9890@sirena.org.uk>
Sender: linux-mmc-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, linux-mmc <linux-mmc@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Chris Ball <cjb@laptop.org>, Kyungmin Park <kyungmin.park@samsung.com>, 'kgene kim' <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Am Dienstag, 6. M=E4rz 2012, 14:00:54 schrieb Mark Brown:
> On Tue, Mar 06, 2012 at 03:17:20PM +0900, Jaehoon Chung wrote:
> > This patchset is the purpose for using sdhci-pltfm.c and
> > removing the arch dependency.
> > The sdhci-s3c has too heavy arch dependency.
> > For example, if work for sdhci-s3c.c at mmc-tree, sometime need to =
change
> > sdhci.h for Samsung-Soc.
>=20
> This series will break S3C64xx, you've not touched it at all in the
> update but it uses the same SDHCI controller.

This problem will probably also surface for the S3C2416 which also uses=
 the=20
same SDHCI controller.

Heiko
