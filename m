Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39E92AE66;
	Sun, 31 Mar 2024 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711880398; cv=none; b=KuLRx6GPMJ7yIXdELa+WF4qdNagHXkaHG5nB47gGzaF5SMwWL8Yxj3264z2RdYVTi5Li9XdymkuHIoLAvonOIYUbDdLl8c5m2JgkpcLyf2vH9GeDcF8x6Ll5InGiHrquBsZUwVrC4Sg2N1/T6yxAz0TeXMOn0di/Qyg4mXqXyYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711880398; c=relaxed/simple;
	bh=PwbEoi4UwK9F4HKq6a7upZnV6eqHtWN+7WjlzHonK94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QYIItfjrdnDCZjZV5Ckg/hLqB6sMOshCiQbznc3THsgR6IelR6liGTQ8zskpqPcVOUpFlJGAyjapVCqOyMXT6Q7aWiUX30L4nX2lLh813yI5RwxUKsSs5Wsrrbm1ughreJ9pABa4m/bycv94DoFEl6e1GPN9828etmxvAe/1ErU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032F7C433F1;
	Sun, 31 Mar 2024 10:19:54 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jaewon Kim <jaewon02.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240328091000.17660-1-jaewon02.kim@samsung.com>
References: <CGME20240328091426epcas2p4f227abb6cd7e710f49f4e61aa022f74f@epcas2p4.samsung.com>
 <20240328091000.17660-1-jaewon02.kim@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynosautov9: fix wrong pll clock id
 value
Message-Id: <171188039458.21481.12012544033214893386.b4-ty@linaro.org>
Date: Sun, 31 Mar 2024 12:19:54 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 28 Mar 2024 18:10:00 +0900, Jaewon Kim wrote:
> All PLL id values of CMU_TOP were incorrectly set to FOUT_SHARED0_PLL.
> It modified to the correct PLL clock id value.
> 
> 

Applied, thanks!

[1/1] clk: samsung: exynosautov9: fix wrong pll clock id value
      https://git.kernel.org/krzk/linux/c/04ee3a0b44e3d18cf6b0c712d14b98624877fd26

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

