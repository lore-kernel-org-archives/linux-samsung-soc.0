Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E656303CAF;
	Wed, 26 Nov 2025 09:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764148250; cv=none; b=GgL3l3ll1+LMfIO6+9hZquy0DJEYLN35mS2IOSjYtwP+8n4/m++OgbY2SLYp/5HKsXqIx4MBtzygYa28Ie+LrDBt1MI3VIWRBmOyH+ZvMZLVWZ6uRYUVHGxESmsF2HKgVy/PjDK+l4TJeO6Y8grUnJTYk2NfU/MjltmsibByWmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764148250; c=relaxed/simple;
	bh=igOYgUXsNlbmcIc0JQQrR/9RlC55FUM21fhSmCk3QKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJdo+fa7xR88LIc3NQTdF8WYJuA6O4n92xF+pGYfnSE+z2v34ryAN1mFyYzq+2QmgCS88/uEZbdUg97OO5LcsPNNwTvpWNv0orMxZrIXmWmS4ulckOUQsOQJy1joY/knCVJrOykDU9vxgv16UP36LLu8AVJTqN+DwAE4iB2gNGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvnlqgOq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvnlqgOq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14396C113D0;
	Wed, 26 Nov 2025 09:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764148248;
	bh=igOYgUXsNlbmcIc0JQQrR/9RlC55FUM21fhSmCk3QKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cvnlqgOq++b61luiEx3fhLuA3Gu7FC3TD4gvwOetg74DZ844ZvlwTs+6MYtrQL3sX
	 MYhfsLMSFVziGn9Bf9KvZjgjV8o7mZ1oPiGnG47ImI7iWrUMGIECqhr1v+I+5ltUKl
	 6K0AvroBEYCjqkUxp0Fva+m23E7SeIGr2QJ26vXWE5+313O/+gSx45Gipcd97aXngN
	 s0QSxFdYPDgUBPXXc/CzLRcD0ODzm7lzpvbY4V2ui4r6IIBWKDyTFkwpEnSMEfxXL4
	 LD9cFvJ2yw0K1V8tNpgXDySI1AQ5Nyquf81tr8Xl+ieVxvGPku8Tlt0zp+5sU/Qg8Q
	 OXF9eNwJXADJg==
Date: Wed, 26 Nov 2025 10:10:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH v2 2/3] ARM: dts: exynos: Add Google Manta (Nexus 10)
Message-ID: <20251126-cunning-locust-of-atheism-e1dd0d@kuoka>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
 <20251125-google-manta-v2-2-0f097cfff39c@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125-google-manta-v2-2-0f097cfff39c@timmermann.space>

On Tue, Nov 25, 2025 at 04:12:41PM +0100, Lukas Timmermann wrote:
> +/ {
> +	model = "Google Nexus 10";
> +	compatible = "google,manta", "samsung,exynos5250", "samsung,exynos5";
> +

Everything looks good in general, thanks for working on this. I have
few nits below. You can send next version whenever you are ready, but
just to let you know - my tree is already closed till RC1.

> +	aliases {
> +		mmc0 = &mmc_0; /* eMMC */
> +		mmc1 = &mmc_1; /* WiFi */
> +	};
> +
> +	memory@40000000 {

Please order the nodes in top level by node name (see DTS coding style).
I know that existing files do not follow that, but we try to have new
code conforming to the coding style.

> +		device_type = "memory";
> +		reg = <0x40000000 0x20000000

Separate <> for each entry.

> +		       0x60000000 0x20000000
> +		       0x80000000 0x20000000
> +		       0xa0000000 0x1ff00000>;
> +	};
> +
> +	chosen {
> +		stdout-path = &serial_2;
> +	};
> +
> +	firmware@204f000 {
> +		compatible = "samsung,secure-firmware";
> +		reg = <0x0204f000 0x1000>;
> +	};
> +
> +	fixed-rate-clocks {
> +		xxti {
> +			compatible = "samsung,clock-xxti";
> +			clock-frequency = <24000000>;
> +		};
> +
> +		xusbxti {
> +			compatible = "samsung,clock-xusbxti";

Are you sure you have this clock input? I think on Exynos5250 usually
only XXTI was provided, no?

> +			clock-frequency = <24000000>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys>;
> +
> +		key-down {
> +			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			label = "volume down";
> +			debounce-interval = <5>;
> +		};
> +
> +		key-up {
> +			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			label = "volume up";
> +			debounce-interval = <5>;
> +		};
> +
> +		key-power {
> +			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_POWER>;
> +			label = "power";
> +			debounce-interval = <5>;
> +			wakeup-source;
> +		};
> +
> +		lid-switch {
> +			label = "Lid";
> +			gpios = <&gpx1 3 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <5>; /* EV_SW */
> +			linux,code = <0>; /* SW_LID */
> +			debounce-interval = <10>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	multi-led {
> +		compatible = "leds-group-multicolor";
> +		color = <LED_COLOR_ID_RGB>;
> +		function = LED_FUNCTION_STATUS;
> +		leds = <&status_red>, <&status_green>, <&status_blue>, <&status_white>;
> +	};
> +
> +	wlan_pwrseq: mmc1-pwrseq {

Just "pwrseq"

Best regards,
Krzysztof

