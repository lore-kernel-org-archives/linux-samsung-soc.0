Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08182C08C0;
	Thu, 27 Nov 2025 20:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764273723; cv=none; b=LewzKzOoxECeO6IiK5+o9c1+EQOflY7w3MJoB618tKpNziFYVhIjdl/uv+ZYDKaQC8/GXxOwBidlTL4BMX0d2OwDWv0Qu28fN0/KUDNb6wwJAwNMxxjzaerCdAWljz4hw9Li3n8LtMiZll7ysdvlWYN1R50nERNgReUHfn9yqHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764273723; c=relaxed/simple;
	bh=7fkbbGZVuKpixVFx5wr4neYuL3j3VNOm+JKFbBlg9g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwzQ4hM+ZDsQc6dMoMPH5bBqZwts40Fl9Tw7q8TlQccsjppH5l3q/iNazjHbGXwVeIiZxGJpi0UTtIRKAyD4w4tImkgN7aZWAX3tTlJ/XgxpTo0G9R/im9q/Y6D6qrbxbkumwQhA6gvvDPANxBa3VwNNoQSDZ5iwYxSJw0gZOns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dHS4h05Nhz9tSr;
	Thu, 27 Nov 2025 21:01:56 +0100 (CET)
Date: Thu, 27 Nov 2025 21:01:51 +0100
From: Lukas Timmermann <linux@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH v2 2/3] ARM: dts: exynos: Add Google Manta (Nexus 10)
Message-ID: <jqfu76ojoznc7xgyevuzmj7fg3necrr5cp645ye5zk652ytx5w@s4yaxzcq7jzt>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
 <20251125-google-manta-v2-2-0f097cfff39c@timmermann.space>
 <20251126-cunning-locust-of-atheism-e1dd0d@kuoka>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-cunning-locust-of-atheism-e1dd0d@kuoka>

On Wed, Nov 26, 2025 at 10:10:46AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 25, 2025 at 04:12:41PM +0100, Lukas Timmermann wrote:
> > +/ {
> > +	model = "Google Nexus 10";
> > +	compatible = "google,manta", "samsung,exynos5250", "samsung,exynos5";
> > +
> 
> Everything looks good in general, thanks for working on this. I have
> few nits below. You can send next version whenever you are ready, but
> just to let you know - my tree is already closed till RC1.
> 
First of all, thank you!
The as3668 bindings are yet to be applied, no need to rush here.
> > +	aliases {
> > +		mmc0 = &mmc_0; /* eMMC */
> > +		mmc1 = &mmc_1; /* WiFi */
> > +	};
> > +
> > +	memory@40000000 {
> 
> Please order the nodes in top level by node name (see DTS coding style).
> I know that existing files do not follow that, but we try to have new
> code conforming to the coding style.
> 
We ordered them as seen in other devices. I've checked out the coding style 
guideline and will make modifications accordingly.
> > +		device_type = "memory";
> > +		reg = <0x40000000 0x20000000
> 
> Separate <> for each entry.
> 
Acknowledged.
> > +		       0x60000000 0x20000000
> > +		       0x80000000 0x20000000
> > +		       0xa0000000 0x1ff00000>;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = &serial_2;
> > +	};
> > +
> > +	firmware@204f000 {
> > +		compatible = "samsung,secure-firmware";
> > +		reg = <0x0204f000 0x1000>;
> > +	};
> > +
> > +	fixed-rate-clocks {
> > +		xxti {
> > +			compatible = "samsung,clock-xxti";
> > +			clock-frequency = <24000000>;
> > +		};
> > +
> > +		xusbxti {
> > +			compatible = "samsung,clock-xusbxti";
> 
> Are you sure you have this clock input? I think on Exynos5250 usually
> only XXTI was provided, no?
> 
We checked with the downstream code and found this clock input. We
recognize, that downstream kernels aren't 100% correct at times.
I tested the device without this clock input as you suggested.
It seems that this is in fact not needed. So I will remove it in v3.
> > +			clock-frequency = <24000000>;
> > +		};
> > +	};
> > +
> > +	gpio-keys {
> > +		compatible = "gpio-keys";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&gpio_keys>;
> > +
> > +		key-down {
> > +			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
> > +			linux,code = <KEY_VOLUMEDOWN>;
> > +			label = "volume down";
> > +			debounce-interval = <5>;
> > +		};
> > +
> > +		key-up {
> > +			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
> > +			linux,code = <KEY_VOLUMEUP>;
> > +			label = "volume up";
> > +			debounce-interval = <5>;
> > +		};
> > +
> > +		key-power {
> > +			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
> > +			linux,code = <KEY_POWER>;
> > +			label = "power";
> > +			debounce-interval = <5>;
> > +			wakeup-source;
> > +		};
> > +
> > +		lid-switch {
> > +			label = "Lid";
> > +			gpios = <&gpx1 3 GPIO_ACTIVE_LOW>;
> > +			linux,input-type = <5>; /* EV_SW */
> > +			linux,code = <0>; /* SW_LID */
> > +			debounce-interval = <10>;
> > +			wakeup-source;
> > +		};
> > +	};
> > +
> > +	multi-led {
> > +		compatible = "leds-group-multicolor";
> > +		color = <LED_COLOR_ID_RGB>;
> > +		function = LED_FUNCTION_STATUS;
> > +		leds = <&status_red>, <&status_green>, <&status_blue>, <&status_white>;
> > +	};
> > +
> > +	wlan_pwrseq: mmc1-pwrseq {
> 
> Just "pwrseq"
> 
Acknowledged.
Just out of curiosity. Why is that?
> Best regards,
> Krzysztof
> 
> 
Best regards,
Lukas Timmermann
