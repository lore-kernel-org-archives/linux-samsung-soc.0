Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3483B348C7B;
	Sun, 31 May 2026 09:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780219799; cv=none; b=TmWkysjGp0EZtPINNXDiEIFoOr9gKrajde7NHH991+PCDrIFqgHVQheqcGaAWeDxUPcA+HohemO660iLbx/GrQI25Hq90PSk7TAu074rf0I/vdgwimNawKwTgA4EYUE0WzTP5MAE38wuuRuYR46Z/nCv7qspGSHtu2LnCV2tYug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780219799; c=relaxed/simple;
	bh=Mw0rh43xOAuISiAf/pF5q/1/WffFeCfnXIJl+eu1Xu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GEIYpO9siyU4bYqq8Dsmw1gRzS4RIyKdPn6klLs/W2f+cnAbPnOrgX/ZY3xLu/7gfMVsu6QJesMF7zjdwmkE09wyam05KSg9bul6pmszPlPtu1c9zU+DDwmPp75BC8Vmkhc6pCEVaVF7RwtzwOhJMBDftYVGUQVJVg31pEsHUAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=dYE3x9Nk; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="dYE3x9Nk"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=Mw0rh43xOAuI
	SiAf/pF5q/1/WffFeCfnXIJl+eu1Xu8=; h=in-reply-to:from:references:to:
	subject:date; d=al2klimov.de; b=dYE3x9NkAUO2HLL2sZmqCX+/i0AtdXexhHV8Fm
	qrO8TvrNCfhx6Ap0e/4+LXvrXOIsQ3ry9eWyO11Woq58bJpGJkBe1hU5MkUurni6diEZ3f
	jfZMZz4JUAG5yvD+L4Q4f68qFYmrUNk6oTv9GFuW7QEnWsfIhZf0iffeHirfQlrAJfjTlr
	07IP74Jnm0ucvHI2alJX9SVUoqXiiD+TcVwYQAVt50aO/DV92k3t6Y/vu9UntWbFDD2ZXM
	ceuvH4c1xUCMNYJEwNi7XKc7rDqcqIpGfR3WzCxp+uIlJCgZOSUwrhiUICWHxNMuMA3HGc
	uu6mqOvIkEtU8h/y/3p74IIA==
Received: from [192.168.0.101] (88.215.123.80.dyn.pyur.net [88.215.123.80])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 2f391762 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Sun, 31 May 2026 09:29:48 +0000 (UTC)
Message-ID: <ae9d7e2f-05df-497d-9547-ce4722f5e7db@al2klimov.de>
Date: Sun, 31 May 2026 11:27:47 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: samsung: exynos5410: fix refcount leak
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 "open list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260526061321.6123-1-grandmaster@al2klimov.de>
 <54284b18-e310-474e-9b64-63645804c1e0@kernel.org>
Content-Language: en-US
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
In-Reply-To: <54284b18-e310-474e-9b64-63645804c1e0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/30/26 18:26, Krzysztof Kozlowski wrote:
> On 26/05/2026 08:13, Alexander A. Klimov wrote:
>> Every value returned from of_clk_get() is supposed to be cleaned up
>> via clk_put() once not needed anymore.
>>
>> Fixes: be95d2c7d918 ("clk: samsung: Add support for EPLL on exynos5410")
>> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> 
> 
> Does not apply - you messed somehow sending these.

Strange... copy&paste from
https://lore.kernel.org/all/20260526061321.6123-1-grandmaster@al2klimov.de/
(From: ... 2.54.0) applies to Linus' master.

Wait... ! Don't say because I fired all my compiled patches
at once via git-send-email(1), they assembled to one thread?
🙈
