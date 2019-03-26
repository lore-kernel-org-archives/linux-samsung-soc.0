From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v5.1 RESEND] dt-bindings: hwrng: Add Samsung Exynos 5250+
 True RNG bindings
Date: Tue, 26 Mar 2019 12:42:08 +0100
Message-ID: <CAJKOXPfM+EUzBBBhrtSFw5-e7hiimsFT8okcd8J9gGyFdzd2+w@mail.gmail.com>
References: <CGME20190111132222eucas1p1d80caf8ba30422bc5fe1a1fac4cf48e8@eucas1p1.samsung.com>
 <CAL_JsqKt-ujsB-t9A=4dEAjqrvcquUG+qF3tFg1YCqmup_5wcw@mail.gmail.com> <20190111132139.12333-1-l.stelmach@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111132139.12333-1-l.stelmach@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, Joe Perches <joe@perches.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Otto Sabart <ottosabart@seberm.com>, Rob Herring <robh@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 11 Jan 2019 at 14:22, =C5=81ukasz Stelmach <l.stelmach@samsung.com>=
 wrote:
>
> Add binding documentation for the True Random Number Generator
> found on Samsung Exynos 5250+ SoCs.
>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
> ---

Rob,
Could you apply this directly? You acked this some time ago but it
never went through drivers tree. Lukasz resent this patch and it is
waiting since then.
The driver implementing compatible is already in mainline.

Best regards,
Krzysztof
