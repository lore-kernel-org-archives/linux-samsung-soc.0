Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E053EC683
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Sep 2026 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338208; cv=none; b=fis85ZF4Gwd1hZotiuh6enMxsaLRr+WIatc9t09v6nLlwh7c10/qhO4UTSzliAUbbUUX/0CXK9ardFnAhkZh5pKjfglhFJMK0YYW5LRUEJV9Zb+4tGwDmtzU8wPzDYzdW1CbQyO5Xas4ZG1Q7A8IHPiuu8/B979Bc1Nm6rP+GW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338208; c=relaxed/simple;
	bh=Kxz59BJ0hxJYWChLEvYY+8PUms5s5db/jIEzSv+icD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=TknqHIa98En056mplrmhaMbU1xsKWmuhJapf3USl9qIae9thQWTLhyMJNkwQwY/Lz+ufhEZBglKYZm5yPCPVwLEBFwAHb8k/AnnPh+oW74twDOiN2NXWyAPNe6EkHSPW33uRPqOcz2pTplyH7p/TXoHmm1c0sfAuD1Ex9UCx5fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LgPDbMm9; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LgPDbMm9"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260902083644euoutp0173479e2873501b5a17c19ec1ae7bfbab~RdB86MrQO0672906729euoutp01r
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Sep 2026 08:36:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260902083644euoutp0173479e2873501b5a17c19ec1ae7bfbab~RdB86MrQO0672906729euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788338204;
	bh=Sh2rMx7cK5+XuDK7V8W5ht1k2uQ0fYdr83rbG25d8TQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=LgPDbMm9Pidk3GVqcL7oJwvugm3ixmfXh5yFyggtxj0I3XKHQ9s8PAB5lx7axrgpQ
	 tuNdWUK2BIrWhZCqzlu2DHoXkV1O90sAPfeJLlUiyMOwPI+N6+f+qEVYWv0hXUreLW
	 18b6qBMfQn+MHwM0cJJtlYZePteZQacFlT2hS0Qg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260902083644eucas1p1fce4b2ee4029aef393c1ca7093a59136~RdB8rV5xn0650106501eucas1p1R;
	Wed,  2 Sep 2026 08:36:44 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260902083643eusmtip1a34544f9adf254c73b7d8f7d986b9998~RdB8DyUy50891008910eusmtip1s;
	Wed,  2 Sep 2026 08:36:43 +0000 (GMT)
Message-ID: <6e319291-72b8-4a43-b953-8a9f0a6049c8@samsung.com>
Date: Wed, 2 Sep 2026 10:36:43 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] ARM: dts: samsung: exynos4210-i9100: Enable RTS/CTS
 in Bluetooth node
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260829101509.138284-1-paul@crapouillou.net>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260902083644eucas1p1fce4b2ee4029aef393c1ca7093a59136
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260829101532eucas1p29f4e04d4dfd169377793c276221059a6
X-EPHeader: CA
X-CMS-RootMailID: 20260829101532eucas1p29f4e04d4dfd169377793c276221059a6
References: <CGME20260829101532eucas1p29f4e04d4dfd169377793c276221059a6@eucas1p2.samsung.com>
	<20260829101509.138284-1-paul@crapouillou.net>

On 29.08.2026 12:15, Paul Cercueil wrote:
> The BCM4330 is connected using CTS/RTS too, so add the 'uart-has-rtscts'
> property.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>


Indeed the CTS/RTS pins are used for BT on most of the ARM Exynos boards,
as the "<&uartX_fctl>" property is assigned for pinctl-0. This is not really
specific to i9100, so maybe this property should be added to other dts?


However I wonder if Samsung UART driver actually use this "uart-has-rtscts"
DT property? A quick "git grep uart-has-rtscts drivers/tty" shows nothing
related to Samsung Exynos...


> ---
>
> Notes:
>     Changes:
>     
>     V1 was: "ARM: dts: samsung: exynos4210-i9100: Fix Bluetooth node"
>     
>     -v2: Drop max-speed property. It's only supposed to be used in some
>          cases, which don't apply here. As this was the "fix" for getting
>          Bluetooth to work on my device, which will be applied to the
>          driver instead, the Fixes: tag was removed.
>
>  arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> index 8a635bee59fa..95964be7daa8 100644
> --- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> +++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> @@ -875,6 +875,7 @@ &serial_0 {
>  	status = "okay";
>  
>  	pinctrl-names = "default";
> +	uart-has-rtscts;
>  	pinctrl-0 = <&bt_en>, <&bt_res>, <&uart0_data>, <&uart0_fctl>;
>  
>  	bluetooth {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

