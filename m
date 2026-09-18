Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD2243499F;
	Fri, 18 Sep 2026 09:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725534; cv=none; b=inVJjgDTUZvM9D6GuXly7XQsZYjRhRmCNYKau5l5DSllVJqlLB+1yKkdonzykt8fa9J5kmc9V/Z5PgM5lJKZRq2O6YQMBUwI0zYXu9E2q7GrxPMuiSHEp6UFTVyhdWK591hqL4aACRtY+bxD0kU6ojuK5K0bnaC5V8jPoDmdA74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725534; c=relaxed/simple;
	bh=JsQggZigR/TcXmnx8/T+7z6r+BTFJnRQcEysKzuQRdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXB4D53XFU3V85o+QldPHc0b3Gq1kvVeOMv53pl3n6SS2CuNoTXFzk/ki5n3N6jV8nxffRuq7AT+hpFAgKGoLbw83N7zY1YJh5mmyaNLGdn0QRzQVwfMGs091nrE5ntZ4l3YkjMKbdKJcOKWsVp6bsM3DY4CHvymnc5jp2zAjtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzQGaa2w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzQGaa2w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB91C1F000FF;
	Fri, 18 Sep 2026 09:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789725532;
	bh=Ln1d4qHa7vdCKllJbzJ0Cgy2Evr00KW99XLnmyu9AZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lzQGaa2wc7pzdKv4ZpCrAfV29vqmfnYgdzyKRSmxaEI3AfqMIfSFutWS+AZPvkSF2
	 GdevVH2V8K7hWaHcSqJB0R8WJs5Xz5mW5ttf0/Id00JR1Y+uo2I6kHaw8Y2J7I2y1i
	 iapc6g9TCJqF+xSdzEicL/Hw13gqjY7TtT7pd5JqiM4rOIW7P0qrlFGm5eiLghqT4b
	 Ov3UNovPiZ9GJgafv3w0tWTH+TU0jwaLigTapVYn4gGe4Yv23+pqZQFo6ci5xQgJvQ
	 MUTb1pXh7zwXzsXY9YgTTr/+tqPq8nZBjFh5YelJfm4W9gKq8N5yRl1AF1ZdM5rzgP
	 rG2Hz2OWtvtxA==
Date: Fri, 18 Sep 2026 11:58:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org, Thinh.Nguyen@synopsys.com, 
	mani@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, h10.kim@samsung.com, 
	dh10.jung@samsung.com, akash.m5@samsung.com, hongpooh.kim@samsung.com, 
	eomji.oh@samsung.com, shijie.cai@samsung.com, muhammed.ali@samsung.com, 
	thiagu.r@samsung.com
Subject: Re: [PATCH v2 1/3] MAINTAINERS: add Samsung USB DT binding to
 ARM/SAMSUNG entry
Message-ID: <20260918-eminent-wooden-shark-97b8be@quoll>
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
 <CGME20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142@epcas5p3.samsung.com>
 <20260916122229.2604003-2-selvarasu.g@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916122229.2604003-2-selvarasu.g@samsung.com>

On Wed, Sep 16, 2026 at 05:52:27PM +0530, Selvarasu Ganesan wrote:
> Add the Samsung USB devicetree binding file path under the existing
> ARM/Samsung SoC maintainership.
> 
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a53620839407..87a1ab24a375 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3576,6 +3576,7 @@ F:	Documentation/devicetree/bindings/arm/samsung/
>  F:	Documentation/devicetree/bindings/hwinfo/samsung,*
>  F:	Documentation/devicetree/bindings/power/pd-samsung.yaml
>  F:	Documentation/devicetree/bindings/soc/samsung/
> +F:	Documentation/devicetree/bindings/usb/samsung,*

I think this is not really needed. First of all, files will be covered
by N: pattern further in the entry. Second, patches for these should go
via USB, but listing here the directory could create impression that
Samsung SoC is responsible.

This one entry is harmless, but if adding this, then next time we got 15
more updates for each of Documentation/devicetree/bindings/*/samsung*
files. Is it worth?

Interested people can add themselves to the bindings maintainers entry,
that's always welcomed.

Best regards,
Krzysztof

