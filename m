Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565336;
	b=cD5K+deYxeOmmlHQ5GtXesCLxJ5uoQ5hHGuLfg9uY8R6OYBV5Qp6Wn7HTzblsgl4tBHM
	 htqWB05gMrgZ755/CpkdmAX5R9biXSJf6XY63iCF7Hzpu3NT6E1U0LV8QJkFbFjPXuOr1
	 cK41oyjrkkMGEC0SyI4843+aDMONnvz+0EA4vbrQe1jkg1Oi5AHoeHrZSBRnMd/ca3w2Q
	 QuHW0wLADmlmMLqaSh2qqvKfT8DHbTSttAJpJ11yfrwT71qb9tAvCN8+4kcaoL7ACMhY7
	 XK6CpPWstWrvaAJTM+DiGk21hBILYq6gujt4OLBx1ZlRNLLhkVhcZqtKxlTlshH8xsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565336;
	h=DMARC-Filter:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JWO5eOPOWxAZPbt93E7PWjAf1XN4ASjz7QmgH9tcpEc=;
	b=IZJkiYlNmWjxXX5unI3ScnjQN0rfcmkS9+yXa/RdZQtevZYsiSuujG+5cNsQNexF66ES
	 IeFJaqRLZe9/vhHrcF1ZTbeNvZHgLAhF6WUjUB6h7+TBapEu4nE+CUHBYGNBitamxfaGl
	 d6MlgctsFgWdvwrYaKnKx5hjvh6J9F8LMH+T1JJSgedPLCkIzgvL8NWfRwjON8GpSaqtH
	 tCHVMRD0xrcojYcB1JvXRipNM442QiqZvaDA45tKE3RISL8x7juuuYr7t0PgBSFlIlVOz
	 a0J+gmTuQJul1hb4TqkHZHVLtSjtfVkDdr5GaUDWkTBpmpyPgpTeUA8pXIK2Iuzshew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mentallysanemainliners.org;
	spf=pass smtp.mailfrom=mentallysanemainliners.org;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=RN0C6Ro7;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502DA606A31E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 00:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 502DA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=RN0C6Ro7
DKIM-Signature: a=rsa-sha256; b=RN0C6Ro7mR3xUBlTXWHMW8JzTNvfK1fed5xacdf71IeJEJwD3NWiUDgYMAhQp03XnNzPUO8oIKZAE3DwICH3FqBFfIMReUZPT/8RlV/qw8UBDW+4p/6iu/cxDyMK/21KDinJKBDaXxUEnuRXbL2GJ/+pJ62PvN5j3+1am3bJJpyWnOSe7UsfUlGuEErYZE1gI2GIWP/9J9+nuC4PrwKgGO1UU0Cdoy1TjbCN/13uMwHsNfTwoauw+t4u1EQoxgZMYdH4l0IdFQ2kc+C0dL3rGcb3EvvMUq6lyN7gIne+5lSu5TDMAK5EpABZ3GfHW3KOk41jJKMu9AKT/SIdxqu4Pw==; s=purelymail2; d=purelymail.com; v=1; bh=Z5AUULqU4STKqrKUgodGKeg+HOQYh1gNqO/mS1n3Tic=; h=Feedback-ID:Received:Message-ID:Date:Subject:To:From;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1592599783;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 25 Nov 2026 00:06:31 +0000 (UTC)
Message-ID: <9bc95b2c-9b63-4b2a-b692-287e9cbe7d67@mentallysanemainliners.org>
Date: Wed, 25 Nov 2026 00:06:27 +0000
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Add USB support to Exynos7885
To: David Virag <virag.david003@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20261123092244.1792040-1-virag.david003@gmail.com>
Content-Language: en-US
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 23/11/2026 09:22, David Virag wrote:
> This set of patches adds support for USB on the Exynos7885 SoC.
>   
> The Exynos7885 has a DWC3 compatible USB controller and an Exynos USB
> PHY that theoretically supports USB3 SuperSpeed, but is not implemented
> in any known device. The vendor kernel also stubs out USB3 functions, so
> we do not support it.
>
> This is a v2 of a previous set [1], which was split into a clk patchset
> I did submit back in 2024 and eventually it got applied, and this set,
> which I never ended up submitting until now.
>
> This version fixes some things noted by Krzysztof Kozlowski, and also
> contains a change made by Umer Uddin, as he recently tried to resubmit
> my old patches from github [2], fixing some things up, but missing the
> previous remarks.
>
> [1] https://lore.kernel.org/linux-samsung-soc/20240804215458.404085-1-virag.david003@gmail.com/
> [2] https://lore.kernel.org/linux-samsung-soc/20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org/
>
> Changes in v2:
> - Clk changes not included as they are already applied
> - Add Reviewed-by: tags where appropriate
> - Use samsung,exynos850-dwusb3 fallback compatible for dwusb3
> - Use unsigned long for set_ref_clk_rate
> - (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
>    error.
> - Keep dt nodes ordered by unit address.
>
> David Virag (5):
>    dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
>    dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
>    phy: exynos5-usbdrd: support Exynos7885 USB PHY
>    arm64: dts: exynos: Enable USB in Exynos7885
>    arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support
>
>   .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 ++
>   .../bindings/usb/samsung,exynos-dwc3.yaml     |  3 ++
>   .../boot/dts/exynos/exynos7885-jackpotlte.dts | 20 +++++++++++
>   arch/arm64/boot/dts/exynos/exynos7885.dtsi    | 36 +++++++++++++++++++
>   drivers/phy/samsung/phy-exynos5-usbdrd.c      | 26 ++++++++++++++
>   include/linux/soc/samsung/exynos-regs-pmu.h   |  3 ++
>   6 files changed, 90 insertions(+)
>
>
> base-commit: 5d7b9f865597a74b323d512619c42f3e07ae043a

Thank you for submitting the fixed work. All works on gta3xllte.


Tested-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>


Best regards,

Umer

