From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/1] ARM: dts: s5pv210: Add missing interrupt-controller
 property to gph2
Date: Mon, 11 Jun 2018 14:43:59 +0200
Message-ID: <CAJKOXPcVqaeYoU=tht5GSyEunnboG-+Mxo96LCDewbqDjCfy-A@mail.gmail.com>
References: <1528640149-2195-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528640149-2195-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Jun 10, 2018 at 4:15 PM, Pawe=C5=82 Chmiel
<pawel.mikolaj.chmiel@gmail.com> wrote:
> This commit adds missing interrupt-controller property to gph2 block,

Just "Add missing". See:
https://elixir.bootlin.com/linux/latest/source/Documentation/process/submit=
ting-patches.rst#L151

> to silence following warnings during build
>   /soc/pinctrl@e0200000/gph2: Missing interrupt-controller or interrupt-m=
ap property
>
> Observed on not yet mainlined, an S5PV210 based
> Samsung Galaxy S (i9000) phone.

The warning is not reproduceable (as you mentioned board is not
present in mainline) thus please skip it. Instead, either describe
existing reason for this change (e.g. because bindings require it for
node of every bank of pins supporting GPIO interrupts) or include this
in series mainlining new board (where the reason will be - it will be
used by new board etc).

Best regards,
Krzysztof
