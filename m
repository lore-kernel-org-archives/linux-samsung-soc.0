From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 05/10] dt-bindings: samsung: Add S5PV210 as possible
 soc in Samsung boards
Date: Thu, 28 Jun 2018 09:52:36 +0200
Message-ID: <CAJKOXPcZJWW49TL-eybV5486pnik0+-G9ByVg=b1iWbTJwAvAw@mail.gmail.com>
References: <1530119544-30023-1-git-send-email-pawel.mikolaj.chmiel@gmail.com> <1530119544-30023-6-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530119544-30023-6-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xc-racer2@live.ca
List-Id: linux-samsung-soc@vger.kernel.org

On 27 June 2018 at 19:12, Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com=
> wrote:
> There are Samsung devices, which are not Exynos-based boards,
> like it's in case of S5PV210. Document this information at beginning
> of file.
>
> Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards=
.txt b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
> index 14510b215480..175f669d9bb6 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
> @@ -1,4 +1,4 @@
> -* Samsung's Exynos SoC based boards
> +* Samsung's Exynos and S5P SoC based boards

At the point of this commit, there are no S5P boards mentioned. These
will be added with next commit so please just squash it with the next
one.

I saw that Rob reviewed your v1 after you sent v2, so don't forget to
include it in v3:
Reviewed-by: Rob Herring <robh@kernel.org>

Best regards,
Krzysztof
