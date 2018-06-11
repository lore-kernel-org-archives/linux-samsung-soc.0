From: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: s5pv210: Add missing interrupt-controller property to gph2
Date: Mon, 11 Jun 2018 20:57:39 +0200
Message-ID: <4072275.4u7YMACK2s@acerlaptop>
References: <1528640149-2195-1-git-send-email-pawel.mikolaj.chmiel@gmail.com> <CAJKOXPcVqaeYoU=tht5GSyEunnboG-+Mxo96LCDewbqDjCfy-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPcVqaeYoU=tht5GSyEunnboG-+Mxo96LCDewbqDjCfy-A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Monday, June 11, 2018 2:43:59 PM CEST Krzysztof Kozlowski wrote:
> On Sun, Jun 10, 2018 at 4:15 PM, Pawe=C5=82 Chmiel
> <pawel.mikolaj.chmiel@gmail.com> wrote:
> > This commit adds missing interrupt-controller property to gph2 block,
>=20
> Just "Add missing". See:
> https://elixir.bootlin.com/linux/latest/source/Documentation/process/subm=
itting-patches.rst#L151
>=20
> > to silence following warnings during build
> >   /soc/pinctrl@e0200000/gph2: Missing interrupt-controller or interrupt=
=2Dmap property
> >
> > Observed on not yet mainlined, an S5PV210 based
> > Samsung Galaxy S (i9000) phone.
>=20
> The warning is not reproduceable (as you mentioned board is not
> present in mainline) thus please skip it. Instead, either describe
> existing reason for this change (e.g. because bindings require it for
> node of every bank of pins supporting GPIO interrupts) or include this
> in series mainlining new board (where the reason will be - it will be
> used by new board etc).
>=20
> Best regards,
> Krzysztof
>=20
Ok, I'll send this patch (fixed) with other patches adding new board.

Thanks
