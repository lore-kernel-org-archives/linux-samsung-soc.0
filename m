Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E768A39525F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2026 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768388253; cv=none; b=q8KzXfvl9D7Yp8/OxQNJl4mneYjZA84PxhTCrsRl9r9TaErmCku2UerP4XxVqTupeu3ir48HlLX8Pf9Rruo9SKa2452uBaX55pZs6zcXgFtPvn8Cb331L01JzjHE8YP8qF9Z7ssUh7X9vd5aG1Pu9m1e5ka9DYXYCwKfN566Dhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768388253; c=relaxed/simple;
	bh=SLQWpSAl5g4iziudfBqu2+69O5MMdguWGtFvQeZxn1s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Fr6tPp6pBoirldfbj/FubZ7JdVnl9k4CUbijs7lO7G7R9+XXioRs00KNLMVobTi70JfY1UtMwlEA2V/1agYrV5LbITbEP51yW4bw1jHzhYbyxJFP3JAL0hDgcaj438LfYFA1b/o5seGQhdK96c+Qg2cYa60rX1Loh22u4JSMRVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9odwutN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9odwutN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05F7C4CEF7;
	Wed, 14 Jan 2026 10:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768388252;
	bh=SLQWpSAl5g4iziudfBqu2+69O5MMdguWGtFvQeZxn1s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=P9odwutNFGfCx5HcX10K4SmWcOVWkbgGJn5kp3wM1W0CNLeCHVtjmua+kNu+Rkycb
	 /vrOo6DyOfwdzhWR/6WouJPZWFewvjfsG82x++D4ryy6GXbdlWbc5Nq2cg1Kz/BDz1
	 YhLBGwqI+JNEGCBjRzR6ycxY2eekMzKRwB97dfT3uLzC3Kw23bbHw6rmuPL/iIjnTA
	 dtTdC0k3+BFg/8fJEKaKOWoOqtCnfd5/PIqVK9dLZE6Cl/q1OZZEqyI2XKrDNPx7LG
	 Mqa1PcvG/zwmnJaYzD1eSUPUeJuHCoPOG3tQvOjKrzjVB5Ljuv7jrYf2dhKDVSy8sn
	 mU6A2fH9jEkKg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260112211554.3755188-1-vz@mleia.com>
References: <20260112211554.3755188-1-vz@mleia.com>
Subject: Re: [PATCH] ARM: s3c: remove a leftover hwmon-s3c.h header file
Message-Id: <176838825137.154403.3766025208225807155.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 11:57:31 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 12 Jan 2026 23:15:54 +0200, Vladimir Zapolskiy wrote:
> The last user of defined structures s3c_hwmon_pdata and s3c_hwmon_chcfg
> was removed in commit 0d297df03890 ("ARM: s3c: simplify platform code"),
> thus the platform data header file itself can be removed also.
> 
> 

Applied, thanks!

[1/1] ARM: s3c: remove a leftover hwmon-s3c.h header file
      https://git.kernel.org/krzk/linux/c/900131320bc9a9ec1d84702b2694b813c11c91b7

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

