Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9C734A3DF;
	Thu, 14 May 2026 16:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778777806; cv=none; b=VaktOVVDxShdFGBGl+CuEv/VXOD9NKn4UzjbDRDVXBavGmm9O+tCUhHyLqTdV0FwxtrSbRSXcdFTSPpO8pCi8e+ClsCiGjUlDI3hYOzmqHP0E8aqFZUB2PQnPdQtT6z7pIMNb0oSUUdW/Zkva7+0S2IJj0lGA/NxcibA5OORk3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778777806; c=relaxed/simple;
	bh=aHxKi2z0EW5CeMWkd1EKJ7WBIHw0c7wEEhodM5zgoL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DCKjGLNks1WDlgqYRWxsdemoYXPaTciW6hMDdQ8wql2THvwAb9/rvi3NBntGRY5J29LXT2sslw1g22VCea8qryOQLmHkE2gl9906csqUPeeBFugpmDyRDk7DAjiAyMOd3k1NxO4mMwYPOe1DqPDpE6K+Tx4rywa6U1WpY64pr/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EyCbU6X7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EyCbU6X7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD4CC4AF09;
	Thu, 14 May 2026 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778777805;
	bh=aHxKi2z0EW5CeMWkd1EKJ7WBIHw0c7wEEhodM5zgoL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EyCbU6X731gxwAhjmHkdXO8MqMC7eC6peDbiICe1vXMIp/9S9HaAR/kBNhLRQHdmc
	 cDv5EacNhHrgc9pdVKIofJ4+UR+/tHWDxC9UMowLlzTd+ut2dehuqRHD5p+DfDDTaG
	 L6wZhaiw5/6vRbVJ61gRdxf9FAVQ+8ACHwRPcdN3sc4KsR2pvQOaZoyN41aK5s9lvS
	 vBka3YZKsHyiD81bsqILJYN9CBWplN5f2aT7iA0Dx+8EceXuxuTGbEc38Evy0F2mNE
	 mbh+5uzlHEKNTcfb6T3mHSJZEKvaqljMq5Rv6np7/Q/KFJ0qWp9CgNLfaBFxYlqG0+
	 5NkEtBFpGs9LA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 stable@vger.kernel.org, Titouan Ameline <titouan.ameline@gmail.com>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
Subject: Re: [PATCH v5 0/7] firmware: samsung: acpm: Various fixes for
 sashiko bug reports
Message-Id: <177877780331.167822.16476754238198495357.b4-ty@b4>
Date: Thu, 14 May 2026 18:56:43 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 05 May 2026 13:12:57 +0000, Tudor Ambarus wrote:
> Fixes for concurrency and memory ordering bugs that were identified by
> the Sashiko review tool when proposing the GS101 ACPM TMU addition.
> 
> While these bugs are genuine flaws, we haven't hit them yet, likely
> because we don't have enough ACPM clients upstreamed to trigger the
> race conditions.
> 
> [...]

Applied, thanks!

[1/7] firmware: samsung: acpm: Fix cross-thread RX length corruption
      https://git.kernel.org/krzk/linux/c/f133bd4b5daf71bccdde0ad1a4f47fac76a6bfb1
[2/7] firmware: samsung: acpm: Fix mailbox channel leak on probe error
      https://git.kernel.org/krzk/linux/c/b66829b17f6385cc9ffbcbe2476d532d2e3121ad
[3/7] firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
      https://git.kernel.org/krzk/linux/c/b4a38606991c0fad165f754db554961aadac247d
[4/7] firmware: samsung: acpm: Add memory barrier before advancing RX pointer
      https://git.kernel.org/krzk/linux/c/9dadf5a788164dc460a4f25e4e8798de510d63d5
[5/7] firmware: samsung: acpm: Fix false timeouts and Use-After-Free in polling
      https://git.kernel.org/krzk/linux/c/5ae6310453c7b1bc7848196a9acbd33584c4be75
[6/7] firmware: samsung: acpm: Fix missing LKMM barriers in sequence allocator
      https://git.kernel.org/krzk/linux/c/a7569019007a448826571f880d0010b7f1945e12
[7/7] firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion
      https://git.kernel.org/krzk/linux/c/10313b4cca783ef2e38b2a76dc42dda481d7ebf3

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

