From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/4] ARM: dts: s5pv210: aries: Add reserved memory for mfc
Date: Fri, 11 Jan 2019 09:33:22 +0100
Message-ID: <CAJKOXPd6NpAoSKuBHCzV2U3Z_cOT9ctf=0nYbYhzRj9opJd9EA@mail.gmail.com>
References: <20190108165601.25708-1-pawel.mikolaj.chmiel@gmail.com> <20190108165601.25708-2-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108165601.25708-2-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, xc-racer2@live.ca, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 8 Jan 2019 at 17:56, Pawe=C5=82 Chmiel
<pawel.mikolaj.chmiel@gmail.com> wrote:
>
> THis commit adds memory reservation required by MFC to run.
> On S5PV210 both regions needs to be on separate memory banks.
> Size of both regions is taken from stock sources.
>
> Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
> Changes from v1:
>    - Fixed name of nodes to be more generic
> ---

Thanks, applied.

Best regards,
Krzysztof
