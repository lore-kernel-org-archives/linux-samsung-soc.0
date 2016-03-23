From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Who is going to merge it [Was: Re: [PATCH v14 0/17] Add Analogix
 Core Display Port Driver]
Date: Wed, 23 Mar 2016 00:08:35 +0000
Message-ID: <20160323000835.GQ19428@n2100.arm.linux.org.uk>
References: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>
 <1919945.Y1tg0YzXlm@diego>
 <56F1CAEB.3080701@samsung.com>
 <8949624.HmxDpZAlt2@diego>
 <56F1D0AD.8030905@samsung.com>
 <20160322233906.GP19428@n2100.arm.linux.org.uk>
 <56F1DB27.4040001@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56F1DB27.4040001@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, David Airlie <airlied@linux.ie>, Mark Yao <mark.yao@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Doug Anderson <dianders@chromium.org>, Jingoo Han <jingoohan1@gmail.com>, Yakir Yang <ykk@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, emil.l.velikov@
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Mar 23, 2016 at 08:54:15AM +0900, Inki Dae wrote:
>=20

Please wrap your long lines.

>=20
> 2016=EB=85=84 03=EC=9B=94 23=EC=9D=BC 08:39=EC=97=90 Russell King - A=
RM Linux =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> > On Wed, Mar 23, 2016 at 08:09:33AM +0900, Inki Dae wrote:
> >> In this case, someone else may send an email again like you "who i=
s going to merge?"
> >> That would be why we need a maintainer.
> >>
> >> drm panel is already managed well by Thierry Reding without such c=
onfusion.=20
> >=20
> > You don't need a maintainer for every subdirectory just because it'=
s
> > a subdirectory...
> >=20
> > Sometimes, having too many maintainers adds beaurocracy which becom=
es
>=20
> Yes, but... if there is no someone who is responsible for maintainers=
hip,
> then we would receive such emails like Heiko sent "who is going to me=
rge"=20
> I don't also want adding many maintainers unnecessary but drm bridge =
-
> although the framework is a thin and small - is used *over the ARM So=
C*
> so that many confusions may happen for upstream.

Just because someone asks doesn't mean someone needs to be appointed.
Maybe the question that should be asked instead is whether the original
author is willing to maintain their driver.

> So although it's small framework or just subdirectory, we would need
> someone who can manage the framework to avoid further confusion if
> necessary.

So maybe it just doesn't need a maintainer, and maybe those the owner
of the bridge driver should be responsible for choosing the tree which
it's merged through along with updates.  That's how dw-hdmi has been
managed on the whole.

It also means that the bridge driver maintainer is able to test changes
to the bridge driver, rather than having some over-arching bridge
subdirectory maintainer who doesn't have a clue whether the changes
work on the hardware.

IMHO, having bridge driver authors/maintainers look after their own
code has many advantages.

--=20
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
=46TTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
