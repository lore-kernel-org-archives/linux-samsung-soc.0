From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] rtc: s3c: Don't print an error on probe deferral
Date: Mon, 14 Mar 2016 12:11:15 -0700
Message-ID: <1457982675.11972.119.camel@perches.com>
References: <1457982308-29848-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457982308-29848-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 2016-03-14 at 16:05 -0300, Javier Martinez Canillas wrote:
> The clock and source clock looked up by the driver may not be availab=
le
> just because the clock controller driver was not probed yet so printi=
ng
> an error in this case is not correct and only adds confusion to users=
=2E
>=20
> However, knowing that a driver's probe was deferred may be useful so =
it
> can be printed as debug information.
[]
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
[]
> @@ -501,18 +501,27 @@ static int s3c_rtc_probe(struct platform_device=
 *pdev)
> =A0
> =A0	info->rtc_clk =3D devm_clk_get(&pdev->dev, "rtc");
> =A0	if (IS_ERR(info->rtc_clk)) {
> -		dev_err(&pdev->dev, "failed to find rtc clock\n");
> -		return PTR_ERR(info->rtc_clk);
> +		ret =3D PTR_ERR(info->rtc_clk);
> +		if (ret !=3D -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "failed to find rtc clock\n");
> +		else
> +			dev_dbg(&pdev->dev, "probe deferred due rtc clock\n");
> +		return ret;
> =A0	}
> =A0	clk_prepare_enable(info->rtc_clk);
> =A0
> =A0	if (info->data->needs_src_clk) {
> =A0		info->rtc_src_clk =3D devm_clk_get(&pdev->dev, "rtc_src");
> =A0		if (IS_ERR(info->rtc_src_clk)) {
> -			dev_err(&pdev->dev,
> -				"failed to find rtc source clock\n");
> +			ret =3D PTR_ERR(info->rtc_src_clk);
> +			if (ret !=3D -EPROBE_DEFER)
> +				dev_err(&pdev->dev,
> +					"failed to find rtc source clock\n");
> +			else
> +				dev_dbg(&pdev->dev,
> +					"probe deferred due rtc source clock\n");
> =A0			clk_disable_unprepare(info->rtc_clk);
> -			return PTR_ERR(info->rtc_src_clk);
> +			return ret;
> =A0		}
> =A0		clk_prepare_enable(info->rtc_src_clk);
> =A0	}

Maybe the debug logging messages could be object->action like:

	rtc clock probe deferred
	rtc source clock probe deferred
