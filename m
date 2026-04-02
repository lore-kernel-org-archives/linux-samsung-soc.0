Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D5321A453
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Apr 2026 02:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775096383; cv=none; b=Em1hqRrw+xcPZwZGd55ZhC3VfzudEBUuXsj9G7gdVaRmvP7PukaM+aWzFhUAWFqcvf00k0uRzKCvDYLvVcANEVBHc5FBYYNPWFf+HigdYwzeEY0o7piKqfrOF7aYeu3jVeo/jEorexwrDUkXY6uXJr/VFfgWkLLwmIkbTpFWeJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775096383; c=relaxed/simple;
	bh=HYGP2hISTZIOwm7KcS+DDptEEs44HrRNLaMy7aCvf7A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VQSafLLBiskhSgy6tUhpRM6v+lZ/Eo/x61CN0gkGYM4bzmSan/hyBvuHuulSzd0FCFbMbamqTfkZ3G5hvL47HohLY6KAzHKy745riRdtxf5b/kapna8yM4KB4aRJdpUkUmaUfjRudf+Iv82YpOSKi1ryisafxILUeIlZaG3wJvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GAPMwA4f; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GAPMwA4f"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so335920f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Apr 2026 19:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775096380; x=1775701180; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYGP2hISTZIOwm7KcS+DDptEEs44HrRNLaMy7aCvf7A=;
        b=GAPMwA4fGw5vhwXgL138EKOPqA9xLfPo3PLJuDSG1bMAgMWCsVP31Ky3rH6wM1UbaB
         bSlcPv3PQYr5bVLaeeA1vjLH1R7oIjnzIkBaXmzwnmSj1uXSpj3jcd7J2jdpKgpbnVmW
         TPi+6nF3Azh1UhCIBx2oOCLHZQke83U1+kNRa4pDgvPKHZlaMyTScpq9N0sLtpZ1NwW8
         3LpM8cGzxH0sK7dcfdbv/N1s1usnkPnAJR4fCppGYQJC8kz7SFUH+Nkkme5ciWpT7ICZ
         2T944cIwhqVlkmOAbBFEhlNgu1X9X6NdZ+ywfPNOcj1LAJ5OuwrwW7VSxeY9PnspOj/x
         luYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096380; x=1775701180;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYGP2hISTZIOwm7KcS+DDptEEs44HrRNLaMy7aCvf7A=;
        b=PxO5QmWhrqATVH664mmq7RI/ZADckux31YIe6bAkMOsJpkuPCFQ446Jk5LiccfwHPp
         eiYOpue8ZNHfGhICA7jmnr1JctCzQDgVmrVTfz4UN2NZnRTBz9DGZ72REJy7Ry8zMo4w
         bSjN26PsqoKPdnD3t9LQpwQHyq53rXq32NklE1bSOPDoAt1NYXIjG3c668nTcAas3TMa
         d549pqYZHigMUtZFgiX/HipztuNh/fMoLGNg1YfY2VETfYfrJAxWdDfCIfRSvFlYc7oE
         Iqpbz9xpnEFiARa6j99QPPM+Pc+z1uN1qv64lU25bHuy8Zl9VKhuGb8DZiBJQJh4xd/t
         aoFg==
X-Forwarded-Encrypted: i=1; AJvYcCVm8v11u1rPtMl+WLeZTbw44AwNr8fYvOQWB7NEM9HxYEulU0g8mibz5MJsN3j/+GgHZmxCr9VywTgFm6PMTv533g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyREB8B/XQ76QainfwgwEILioSdqtDJIES7fVQG7xPyop0Qm3YN
	xPaDKV/vgwoMxEpvQfjC8xOiLVfVTt2nH+pnbrntz8VU4C2gPXvYj4adHyu0uKAheoE=
X-Gm-Gg: ATEYQzyfFTHuN3MiGli0yVgANzqsIHldM5sub6VHRahvntTUjBj7WGyF1D2zDE6na9d
	dH8QQ0x1rJeJFGv5RKKhQfKEN3HI1xA3+H9qX4Zd6WTX938o3+Oe8a3dELR46ZhwoO9MBPTOtWF
	kHvbhcbZ8OUDvzA/pCjPV1nFEWB03cJnRZPf/tLcCvRCunoShiPtqrIl6NPtOiuAgZsLVGcdDjI
	V8Kj30pgz4zHfNuLctyGpYUztmAthZNIymXWB3kq8sxBhg24QtBnC2yUk6H8yTv35EM3gKGYd9n
	E697s3sRzA9qpp8P7msg5PqG7FjRO0iIpYwxxMp5f/PVsHlLdmVRS7lSh647y9MG1bW2xAJybGl
	TOU39MQovDWoNScNVJ/TkrMrVE5VhRihvYSHXJptHZq+lZrzjC/UXK9jdS2CQp2fk94k0DL6Ln1
	vxN6/i/aaq3tKouiF3nzH+7GnTJEQW1JTYz9vUxZ5NPagiv8f+jh7EUm0BYxUl2F06Y8dTZdNX6
	zltD1xNhOpl+A==
X-Received: by 2002:a05:6000:2303:b0:439:beb9:5a96 with SMTP id ffacd0b85a97d-43d150e8ba7mr11084985f8f.31.1775096380493;
        Wed, 01 Apr 2026 19:19:40 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm3815604f8f.12.2026.04.01.19.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 19:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 03:19:37 +0100
Message-Id: <DHIB5E66SP7A.110YA5R1OOQHS@linaro.org>
Cc: "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi"
 <cw00.choi@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sam
 Protsenko" <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/5] Exynos850 APM-to-AP mailbox support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
 <20260321-beautiful-garnet-magpie-de4fbd@quoll>
In-Reply-To: <20260321-beautiful-garnet-magpie-de4fbd@quoll>

On Sat Mar 21, 2026 at 10:44 AM GMT, Krzysztof Kozlowski wrote:
> On Fri, Mar 20, 2026 at 09:15:12PM +0000, Alexey Klimov wrote:
>> Hi all,
>>=20
>> This patch series introduces support for the APM-to-AP mailbox on the=20
>> Exynos850 SoC. This mailbox is required for communicating with the APM=
=20
>> co-processor using ACPM.
>>=20
>> The Exynos850 mailbox operates similarly to the existing gs101=20
>> implementation, but the register offsets and IRQ mask bits differ.=20
>> This series abstracts these differences into platform-specific data=20
>> structures matched via the device tree.
>>=20
>> Also, it requires APM-to-AP mailbox clock in CMU_APM block.
>>=20
>> In theory this can be split into two series with correct dependecies:
>> device tree node requires clock changes to be merged. The suggestion
>> is to let this go through Samsung SoC tree with corresponding acks
>> if it is okay.
>
> I don't understand why this cannot be split into two seris
> *practically*. What is exactly the dependency between mailbox and DTS,
> that it had to be combined here?

Do you suggest to send 3 single patches with proper dependencies
description? DT bindings change first, then mailbox change that specificall=
y
depends on dt-bindings change and then dts update (which will depend on bot=
h)?

I thought that mbox driver change depends implicitly on bindings update?

Best regards,
Alexey
