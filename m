From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 7/7] dt-bindings: samsung: Document binding for SGH-T959P board
Date: Fri, 22 Jun 2018 09:59:56 +0200
Message-ID: <CAJKOXPffUmnms72vLDU9pEQCtpUCHir=5ae-vTPpS0wfmNut4g@mail.gmail.com>
References: <1529608199-5583-1-git-send-email-pawel.mikolaj.chmiel@gmail.com> <1529608199-5583-8-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529608199-5583-8-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xc-racer2@live.ca
List-Id: linux-samsung-soc@vger.kernel.org

On 21 June 2018 at 21:09, Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com=
> wrote:
> From: Jonathan Bakker <xc-racer2@live.ca>
>

Commit msg.

Best regards,
Krzysztof

> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards=
.txt b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
> index edce6602de50..8a9358336aab 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
> @@ -3,6 +3,7 @@
>  Required root node properties:
>      - compatible =3D should be one or more of the following.
>         - "samsung,aries"       - for S5PV210-based Samsung Aries board.
> +       - "samsung,fascinate4g" - for S5PV210-based Samsung Galaxy S Fasc=
inate 4G (SGH-T959P) board.
>         - "samsung,galaxys"     - for S5PV210-based Samsung Galaxy S (i90=
00)  board.
>         - "samsung,artik5"      - for Exynos3250-based Samsung ARTIK5 mod=
ule.
>         - "samsung,artik5-eval" - for Exynos3250-based Samsung ARTIK5 eva=
l board.
> --
> 2.7.4
>
