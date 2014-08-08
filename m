From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RFC 3/5] pinctrl: exynos: add exynos5410 SoC specific data
Date: Fri, 08 Aug 2014 15:20:19 +0200
Message-ID: <53E4CE93.9000504@gmail.com>
References: <1406549892-5558-1-git-send-email-afaerber@suse.de> <1406549892-5558-4-git-send-email-afaerber@suse.de> <CACRpkdazZTUS50_mrXd+sNVAdf2m7meT1_LX5r6BKg3U-tC3Kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdazZTUS50_mrXd+sNVAdf2m7meT1_LX5r6BKg3U-tC3Kw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?QW5kcmVhcyBGw6RyYg==?= =?UTF-8?B?ZXI=?= <afaerber@suse.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Tarek Dakhran <t.dakhran@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Tomasz Figa <t.figa@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Kumar Gala <galak@codeaurora.org>, Hakjoo Kim <ruppi.kim@hardkernel.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Linus, Andreas,

On 08.08.2014 14:55, Linus Walleij wrote:
> On Mon, Jul 28, 2014 at 2:18 PM, Andreas F=C3=A4rber <afaerber@suse.d=
e> wrote:
>=20
>> From: Hakjoo Kim <ruppi.kim@hardkernel.com>
>>
>> Add Samsung EXYNOS5410 SoC specific data to enable pinctrl
>> support for all platforms based on EXYNOS5410.
>>
>> Cc: Hakjoo Kim <ruppi.kim@hardkernel.com>
>> [AF: Rebased onto Exynos5260]
>=20
> I'm waiting for Tomasz to review this before applying.

Thanks for the reminder. I'm currently on holidays and I'm not followin=
g
the lists too closely, so sorry if I happen to miss some patches.

In general the changes look good, although I can't verify whether the
data being added really match the hardware, as I don't have access to
detailed information about Exynos5410. Also I believe this patch needs
to be rebased onto current pinctrl tree as several (conflicting)
improvements to the pinctrl-samsung driver hit it before this patch was
posted.

Best regards,
Tomasz
