From: Sachin Kamat <sachin.kamat@samsung.com>
Subject: Re: [PATCH 2/4] Documentation: devicetree: Fix s2mps11 example syntax
Date: Mon, 23 Jun 2014 08:53:29 +0530
Message-ID: <CAK5sBcFg8t_e5LLHp3MGv8xJq6gC6Eb_KQqoPG2yq2ajejCU2w@mail.gmail.com>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de>
	<1403486483-4063-3-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1403486483-4063-3-git-send-email-afaerber@suse.de>
Sender: linux-doc-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jun 23, 2014 at 6:51 AM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> It's <1>, not 1.
>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  Documentation/devicetree/bindings/mfd/s2mps11.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Docu=
mentation/devicetree/bindings/mfd/s2mps11.txt
> index 55ab4f4..99a0c52 100644
> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> @@ -96,7 +96,7 @@ Example:
>
>                 s2m_osc: clocks {
>                         compatible =3D "samsung,s2mps11-clk";
> -                       #clock-cells =3D 1;
> +                       #clock-cells =3D <1>;
>                         clock-output-names =3D "xx", "yy", "zz";
>                 };
>
> --
> 1.9.3
>

Reviewed-by: Sachin Kamat <sachin.kamat@samsung.com>
