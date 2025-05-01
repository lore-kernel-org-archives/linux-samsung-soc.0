Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDE817A2F5;
	Thu,  1 May 2025 11:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746097320; cv=none; b=qV639BS/6yAtlM+HnD0BT+Pq0jHfIo6zmNEkNhOFxS1rBd7X6a85FRZdFwuHk3oEQbLu0/+eP4gWhb1pkYvbCz2wGfq6eO5F3PBa4+jKh864gmus3nKnSrinyp3veUaaqIJkuGtdgv1qaWtrZYBwQES26gHQLSzTbeuYVfDVpEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746097320; c=relaxed/simple;
	bh=LWH9aQoEGKjvn+/B3c90aXr4V2lDUYHoaiBU/lVpSfQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=QxZ6ifbnJR1ykZPvaOtBF4Gca81uYSYPGGCF8AgqX7or5FPcPiKEiSSb0TjKXu/k8HAogfhDFgVk3/+GfQ0kYpUv3sGltUpkjy3qVvwRmO4nKcBThB3K3hEI+3bjUKADJiayl1Md88eAiXSngU39phplyyoKH6Ltwvc5dbMBZio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=DkHgLmPn; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="DkHgLmPn"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D0B07258E3;
	Thu,  1 May 2025 13:01:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VqxOrDQx-27; Thu,  1 May 2025 13:01:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746097314; bh=LWH9aQoEGKjvn+/B3c90aXr4V2lDUYHoaiBU/lVpSfQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DkHgLmPnYucvtXeETGabAofcZZEmBxKiTmR7RGcads/ZyhjGYsm5u0CWKnwLt0ivk
	 5Nyl0+BokmdyNdfth1pPMwj6OBUNNqTjcmoJcfLJgOsShpHfiUvBRfFkFmpYGKjKGO
	 BS5GPONOrnoYmg4VLfoUbNI+k0wJkY3ZqCrIWCoGZlBEojBXEpEWTFdh+fDe/RC7jz
	 Iyta2WBQ9sQFaCmWm/lR35TX8eWd9j61oLaHDqN2kvAzeAGPoAhUlbna8L99xcZWNp
	 9R29QJFgMl4bq3xUq3vuyp7GGGtEED3HsKEzOFUd4R5RVcD711JgWQxUUIfl2Mt39J
	 qrh/Jo+Vj3bNA==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 01 May 2025 11:01:53 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, Ivaylo Ivanov
 <ivo.ivanov.ivanov1@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6 3/5] arm64: dts: exynos: add initial support for
 Samsung Galaxy J7 Prime
In-Reply-To: <298d8c1f-40ca-4377-a7a5-69f81989d7ea@kernel.org>
References: <20250414-exynos7870-v6-0-039bd5385411@disroot.org>
 <20250414-exynos7870-v6-3-039bd5385411@disroot.org>
 <298d8c1f-40ca-4377-a7a5-69f81989d7ea@kernel.org>
Message-ID: <4fe07fef083daed35898e8a1d11b6d2d@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-05-01 10:13, Krzysztof Kozlowski wrote:
> On 13/04/2025 20:58, Kaustabh Chakraborty wrote:
>> +		key-volup {
>> +			label = "Volume Up Key";
>> +			gpios = <&gpa2 0 GPIO_ACTIVE_LOW>;
>> +			linux,code = <KEY_VOLUMEUP>;
>> +		};
>> +	};
>> +
>> +	memory@40000000 {
>> +		device_type = "memory";
>> +		reg = <0x0 0x40000000 0x3e400000>;
>> +	};
>> +
>> +	memory@80000000 {
> 
> Why are these two separate device nodes, instead of one for two ranges?
> Does device has somehow two independent memory controllers?

This is from Galaxy J6:

	memory@40000000 {
		device_type = "memory";
		reg = <0x0 0x40000000 0x3d800000>;
	};

	memory@80000000 {
		device_type = "memory";
		reg = <0x0 0x80000000 0x40000000>;
	};

changes to

	memory@40000000 {
		device_type = "memory";
		reg = <0x0 0x40000000 0x3d800000>,
		      <0x0 0x80000000 0x7d800000>;
	};

I assume I have changed it correctly? `free -h` displays the full
and correct memory capacity.

> 
> 
> Best regards,
> Krzysztof
