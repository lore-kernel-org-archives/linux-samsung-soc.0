From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/4] Documentation: devicetree: Fix s2mps11 example syntax
Date: Mon, 23 Jun 2014 09:15:53 +0100
Message-ID: <20140623081553.GB8847@lee--X1>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de>
 <1403486483-4063-3-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1403486483-4063-3-git-send-email-afaerber@suse.de>
Sender: linux-doc-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 23 Jun 2014, Andreas F=C3=A4rber wrote:

> It's <1>, not 1.
>=20
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  Documentation/devicetree/bindings/mfd/s2mps11.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Docu=
mentation/devicetree/bindings/mfd/s2mps11.txt
> index 55ab4f4..99a0c52 100644
> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> @@ -96,7 +96,7 @@ Example:
> =20
>  		s2m_osc: clocks {
>  			compatible =3D "samsung,s2mps11-clk";
> -			#clock-cells =3D 1;
> +			#clock-cells =3D <1>;
>  			clock-output-names =3D "xx", "yy", "zz";
>  		};
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
