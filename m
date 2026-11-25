Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605269;
	b=r5PxI24rC/HsNWpF7QChYGhrFlV9DBtNEEpbqQs7W3cPpPlawXr3vP6QdSEIiAlRDwam
	 cXfxdBLHN6ssY7jcfHFGv9tCp4xsBeRN3w2YkUkNs4X1Y3gIcZXVoKHHQg9WyAWlLavpY
	 6vi/MMFyzwPUmT6bngu1qkd4sNtH7TpxTgNToChVjWLyb3QwO+ZSSZm5ntcYcW97TftNQ
	 ZDUlK+DsWkJaBVZ7lGfuBZUfeE3OAkmSa/jWyXPJdo0PmzwJ2QfeqG35rFMjHqzgKjIy3
	 lDrCC4Im6WkS6qvQxTqcHPWHxEyEja4kOp3kV11HHAATd3VMotIMkkssjHQ8NHbew0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605269;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=cjBe359HqSEz4w8/rNbn0oUZ47UqdpgLO7eVWPxndKk=;
	b=m6EiX4Ti4aP+yZ4yycANifQhrFdKoOt3aY8b7GdxNlA8f2GZovwZ3E+r7PYesNOr76Mo
	 9H1sFjIjsIbSNRlCqeBbNepSXzzOmjLGOVqRI32zNQIyv+r4z7AmsNT0FcQHJiYsyA3D3
	 QIyiCRbSKYmPMVYPIqyDt0i3AAF9GTIWQ6dE/q4Kbxndat7xjMpEvaNPH4UauI5Uhy5Rb
	 gcqQxrp0V04pcZ8gmBDrLGfLSRAtt/4BiqFpt0S1PTkUC5IpSGvmlUAeynOc81LavhtzL
	 LcT8cWiEtkVis+AXfkdr6Sywn9bwebYuxKnjkaEq7xiLJ2ob06/zfh5bF+3olHpcTmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DN8eZqXz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CC5606A326;
	Wed, 25 Nov 2026 11:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DN8eZqXz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCFE1F000D4;
	Wed, 25 Nov 2026 11:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605269;
	bh=cjBe359HqSEz4w8/rNbn0oUZ47UqdpgLO7eVWPxndKk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=DN8eZqXzPMA01NssxeAXOu5HgxZaxhDtk9OELSLx5UKcn2i1UwuUdbObLG9voXgK7
	 TuBwNvwkwNo0EsdAB6Pdvz9GaWQYp4GUZoCX52WD/MjuOYvKDDUvhTPwc+Wb3kynvy
	 Pz1WZiZqovxoHsgfQIRDLQQlauODUl1JMhcdJQB87jpstPZN/Aa5jBjNxeU0oWL1Vt
	 AYgwv9xFvdGvNVrz+q/TPf1eBh9SPIIw8QXe0AdEIjzifRv4ZECPRSmdbMh1Ov01ev
	 NunQvH9D1G3W7+aNsDUJJadII1r5XZtOSSd+nKcv/S+j8WnMoKvpD8H2+49BMO3eIJ
	 X26mzSMI22J7Q==
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 4/5] arm64: dts: exynos: Enable USB in Exynos7885
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Virag <virag.david003@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261123092244.1792040-5-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
 <20261123092244.1792040-5-virag.david003@gmail.com>
Date: Wed, 25 Nov 2026 12:14:23 +0100
Message-Id: <179560526391.84329.15344546041339020444.b4-review@b4>
X-Mailer: b4 0.17-dev

> +			usbdrd_dwc3: usb@0 {
> +				compatible = "snps,dwc3";
> +				reg = <0x0 0x10000>;
> +				interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&usbdrd_phy 0>;
> +				phy-names = "usb2-phy";
> +				/*
> +				 * SoC in theory supports SS but no device has it.
> +				 * Actual capabilities unknown.
> +				 */
> +				maximum-speed = "high-speed";

Each device should narrow this, not the SoC.

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
