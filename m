Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D76744BCBA;
	Sat, 28 Feb 2026 14:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772290737; cv=none; b=UfhwtTn1gacp7GZfAZjawA1KO6oxrZlysEINYcHt3ls92jlok7mcQ/y7VzRA0L9K4Paa0QNgdUd2Zk1yXiaT1gPFjW+AmUh0cSTlrH7tPQlAlO+UNe8wySoP2CeODP4/sSALEvrBr2Glswit9VltKpVaiZI2AL3hWozKsjRR2TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772290737; c=relaxed/simple;
	bh=d6iFnyQbVgxrxtB4rzRtx5IRIwiZBC0IZg9Vsy+ctmg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dHHNnd4Ps+NVNk545TzTrxg71bo99RL/UmGZpztswYuhJPrBbebJwwnDjgwk7Z2p+GB+Zjw45oGAZairGWBJxoyy6rz6ut7tefYEe3bZzWyEW3UW8KZt+5Ny8zKuMqnHd7alECu6GreqKblibRMdD+DfA7V1fgIGmFzdRm6EOPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uD/2/SgO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uD/2/SgO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C494AC2BC86;
	Sat, 28 Feb 2026 14:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772290737;
	bh=d6iFnyQbVgxrxtB4rzRtx5IRIwiZBC0IZg9Vsy+ctmg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uD/2/SgO5kr1fwgvwdIDJhGI2A9LxSiRnVMgQd4xqddhEJ0h+xhE9uMYXx20eCUZ0
	 urZFK7cEoJvO/oYbvgSso0KtcnXuDYNkNoVdy/AtOtYuu4WtiHxe1/7OaJ4bGUypWr
	 cgY8xsKkewPxA6wbBW1ERP9oihka+pqzyWgtkeJn5HQNyV0lpPgahxQ+fp7vlK3uO7
	 P3JqdymI+M2POyg2wkCGdKLo9dCXB/LImFBhugooM/j1ANO6lNeI/viJ8wH8oQl8Y/
	 1B/nownGGT+odYMJuPbLWdDu42/C3cYgPbZvuC3P4OT0htbsZOEXBcNTBPcqKszmdA
	 G096hNZo6inAA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, GyoungBo Min <mingyoungbo@coasia.com>, 
 Kyunghwan Kim <kenkim@coasia.com>, Ravi Patel <ravi.patel@samsung.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: kernel test robot <lkp@intel.com>
In-Reply-To: <20260226205445.336839-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260226205445.336839-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] clk: samsung: pll: Fix possible truncation in
 a9fraco recalc rate
Message-Id: <177229073452.58647.7962287404150012481.b4-ty@kernel.org>
Date: Sat, 28 Feb 2026 15:58:54 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 26 Feb 2026 21:54:46 +0100, Krzysztof Kozlowski wrote:
> samsung_a9fraco_recalc_rate(), unlike other functions in the unit, is
> the first case dividing u64 by u64, thus it should rather use div64_u64
> to avoid possible truncation.  Note that the original code did not
> use remainder.
> 
> This fixes Coccinelle warning:
> 
> [...]

Applied, thanks!

[1/2] clk: samsung: pll: Fix possible truncation in a9fraco recalc rate
      https://git.kernel.org/krzk/linux/c/b8d1706ab3d99c1f96d0c9ed7d16d29b8a178d4c
[2/2] clk: samsung: Use %pe format to simplify
      https://git.kernel.org/krzk/linux/c/01df1dd3ebe0a16023138f0dc70f5decd513f32e

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

