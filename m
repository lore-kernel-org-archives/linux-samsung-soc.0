Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677659;
	b=MFIJmQNZnGJT2vddgzrm5mdzbbFP5O/9P1I1iy+REn6c22s3jLefGDvbkU1HaFgbCgKc
	 GnL/KrQ5UgBy5kj7fK/Ryv2eOVVHU63w0TTgdGyzObPBOnR90gfCVJf7cNN6mP+SerVF/
	 OMrVr21Qb47FHVDl2jg9LpCVuFAznQZQ7KW5AaLROLLj9X20s81PlxziHaYIczrFHTZ8q
	 SUw55cXdbP0QyGmEWl6UJwYiCvlS6o4kOPJWt8WdIA2EypZqQh9SyNX0SLPQK8PM6/jqf
	 U80TnqZ+b8xZFmCj2bH8cdXNmmBcodjB1DIls5FZA2mOq4x6lw3deUEdTXJ0MUZAM4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677659;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=otbopiCr4qtLePEipcetnofmMCVtZqbLSXMljjLeoEQ=;
	b=uggF6RtofOe4tdZ0x7ambMrMLnzHv63t/RK3gOOoqVnlIxkBq2Z/5OcsifISik0bA9Sm
	 A+7fU9QKvjyjULZQ6st477ITrGimFMcLkKy05uBUKZv1HJcetVsRyS332n7odB3+79mqN
	 pvoWBjTUzGpHvV7QF0HtBi4fHQXcnu6fsS7VDFrxLP/hPI4AZc4bag6KIureupsa/wRfv
	 YIGVytPnIbMAkK6Kkhkba7ovEwwk75FqkK6ChPd3AIHDPV5yrCKeOvJmviB72L4FvA/XF
	 3s7+WpDY/P8AiNcD2g7D+7w8aKAHRpDzGVrt1ZeoT3iJZzwX98U8GfGIM5L6br4cWog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JW1+LmUQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037B0606A31C;
	Thu, 26 Nov 2026 07:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JW1+LmUQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8214A1F000C6;
	Thu, 26 Nov 2026 07:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795677658;
	bh=otbopiCr4qtLePEipcetnofmMCVtZqbLSXMljjLeoEQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JW1+LmUQK3T9t2d8SScGessnBZIpyrCoGeATnPDOs1ObkEexj2jd5OI5WdQ7D4Eki
	 MZIaywD2gchjFH52/aFZLM8i1m+6vEDlOu1Cn+CptsiTMR8+S+jCeyR3edlvfvHM1V
	 XKxo6cJoYLYd2WUxWu6np/8DOqRo6tsblt9y22c5rclf5lcTT6uM/WA8hzT9xNZdt9
	 Z0KXBefr7AO+cNCWvLfRO4XcT0KH+zkP2IEhsZX4OyY3yn+ibwAR77YhNWnRCHQr6c
	 nElmHgWFBjDuat8P7uRHDXqezjvb8M3/ZRfv73IIXXlgQyJg45imlT/JhvkuJxL4P/
	 tWflmsul0DKZw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: tudor.ambarus@linaro.org, peter.griffin@linaro.org, 
 Suyuan Wang <shyckless@gmail.com>
Cc: alim.akhtar@samsung.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
References: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
Subject: Re: [PATCH] firmware: samsung: acpm: Don't use pdev after putting
 it in acpm_get_by_node()
Message-Id: <179567765269.9086.11795383324223700321.b4-ty@b4>
Date: Thu, 26 Nov 2026 08:20:52 +0100
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
X-Mailer: b4 0.17-dev


On Mon, 23 Nov 2026 00:46:28 +0000, Suyuan Wang wrote:
> firmware: samsung: acpm: Don't use pdev after putting it in acpm_get_by_node()

Applied, thanks!

[1/1] firmware: samsung: acpm: Don't use pdev after putting it in acpm_get_by_node()
      https://git.kernel.org/krzk/linux/c/45c8e9469b692b45920d2a238003a5f8362b05ac

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

